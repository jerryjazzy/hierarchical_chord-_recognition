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
	# if len(y_pred)!=len(y_ref): 
	# 	print("ERROR 1")
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
		if i==len(y_pred): 
			break
		if y_pred[i]<=1 :
			if y_pred[i] == label:
				num_correct += 1.0
		elif (y_pred[i]-2)%12 == (label-2)%12:
			num_correct += 1.0
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
clf_flat = joblib.load('clf_flat.pkl')

# Predict
print "Predicting..."
pred_final = clf_flat.predict(X_test);

df = pd.DataFrame(pred_final)
print 'Writing CSV...'
df.to_csv('pred_1188_flat.csv')
print 'Done'


print '-------------------'
print 'Finished Predicting'
print 'root:', eval_root(pred_final, y_ref)
print 'majmin7:', eval_majmin7(pred_final,y_ref)
print 'Run Time:', timer()-start,'s'

		



