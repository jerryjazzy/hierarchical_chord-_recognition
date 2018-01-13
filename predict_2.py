from timeit import default_timer as timer
import numpy as np
import pandas as pd
import matplotlib.pyplot as pt 
from sklearn.ensemble import RandomForestClassifier
import pickle
from sklearn.externals import joblib

start = timer()
# bt = np.append(bass,treb)
	# zeros = np.zeros(24)
	# return np.append([zeros],[bt],axis=0)

#----------------- Functions ----------------------

def rotate(chroma, k):
	bass = np.roll(chroma[:12],k)
	# print bass
	treb = np.roll(chroma[12:],k)
	# print treb
	return np.append(bass,treb)

def eval_majmin7(y_pred, y_ref):
	if len(y_pred)!=len(y_ref): 
		print("ERROR 1")
	i = 0
	num_correct = 0
	for label in y_ref:
		if i==len(y_pred): 
			break
		if y_pred[i] == label:
			num_correct += 1.0
		i+=1
	return num_correct/(len(y_pred))


def eval_majmin(y_pred, y_ref):
	i = 0
	num_correct = 0
	for label in y_ref:
		if i==len(y_pred): 
			break
		if (y_pred[i]<14 and (
			y_pred[i]==label or y_pred[i]==label-24 or y_pred[i]==label-36)):
			num_correct += 1.0
		elif (y_pred[i]>=14 and (
			y_pred[i]==label or y_pred[i]==label-36)):
			num_correct += 1.0
		i+=1
	return num_correct/(len(y_pred))

def eval_root(y_pred, y_ref):
	i = 0
	num_correct = 0
	for label in y_ref:
		# print 'pred:', y_pred[i], 'ref:', label
		if i==len(y_pred): 
			break
		if y_pred[i]<=1 :
			if y_pred[i] == label:
				num_correct += 1.0
		elif (y_pred[i]-2) == (label-2)%12:
				num_correct += 1.0 # To be fixed
		# print num_correct

		i+=1
	return num_correct/(len(y_pred))
	
#---------------- Program ---------------------

# Load testing sets
print("Loading testing data")
test_set = pd.read_csv('test_1188.csv').as_matrix();
X_test = test_set[:,1:]
y_ref = test_set[:,0]


# Load the models trained on the training set
print("Loading models")
clf_root = joblib.load('clf_root_2.pkl')
clf_majmin = joblib.load('clf_majmin_2.pkl')
clf_maj_7 = joblib.load('clf_maj_7_2.pkl')
clf_min_7 = joblib.load('clf_min_7_2.pkl')

pred_final = []
X_rotated = np.zeros([len(X_test),24])

# Level 1: Predict 12Roots+N+X
print "Predicting Roots"
pred_root = clf_root.predict(X_test);


# Level 2.1 Rotate the feature matrix
print "Rotating feature matrix"
idx = 0
for root in pred_root:	
	X_rotated[idx] = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
	idx+=1
	

# Level 2.2 Predict 3rds
print 'Predicting 3rds'
pred_majmin_temp = clf_majmin.predict(X_rotated)
pred_majmin = np.empty_like(pred_majmin_temp)

idx = 0
for root in pred_root:
	if root <= 1 :
		pred_majmin[idx] = root 			# N, X
		idx+=1
	elif pred_majmin_temp[idx] == 0:		# Major
		pred_majmin[idx] = root
		idx+=1
	elif pred_majmin_temp[idx] == 1:		# minor
		pred_majmin[idx] = root + 12
		idx+=1

# Level 3 Predict 7ths
print 'Predicting 7ths'
pred_maj_7 = clf_maj_7.predict(X_rotated)
pred_min_7 = clf_min_7.predict(X_rotated)
pred_majmin_7 = np.empty_like(pred_maj_7)

idx = 0
for root in pred_root:
	if root <= 1:							# N, X
		pred_majmin_7[idx] = root
	elif pred_majmin_temp[idx] == 0:		# Major
		if pred_maj_7[idx] == 0: 				# Maj
			pred_majmin_7[idx] = root
		elif pred_maj_7[idx] == 1:					# Maj7
			pred_majmin_7[idx] = root + 24
		elif pred_maj_7[idx] == 2:					# 7
			pred_majmin_7[idx] = root + 36
	elif pred_majmin_temp[idx] == 1:		# min
		if pred_maj_7[idx] == 0:					# min
			pred_majmin_7[idx] = root + 12
		elif pred_maj_7[idx] == 1:					# min7
			pred_majmin_7[idx] = root + 48
	idx+=1



df = pd.DataFrame(pred_majmin_7)
print 'Writing CSV...'
df.to_csv('pred_hc_1188.csv')
print 'Done'


print '-------------------'
print 'Finished Predicting'
print 'root:', eval_root(pred_root,y_ref)
print 'majmin:', eval_majmin(pred_majmin,y_ref)
print 'majmin7:', eval_majmin7(pred_majmin_7,y_ref)
print 'Run Time:', timer()-start,'s'

		



