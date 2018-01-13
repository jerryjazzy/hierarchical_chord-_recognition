from timeit import default_timer as timer
import numpy as np
import pandas as pd
import matplotlib.pyplot as pt 
from sklearn.ensemble import RandomForestClassifier
import pickle
from sklearn.externals import joblib

start = timer()

def rotate(chroma, k):
	bass = np.roll(chroma[:12],k)
	treb = np.roll(chroma[12:],k)
	bt = np.append(bass,treb)
	zeros = np.zeros(24)
	return np.append([zeros],[bt],axis=0)

def eval(y_pred, y_ref):
	# if len(y_pred)!=len(y_ref): 
	# 	print("ERROR 1")
	i = 0
	num_correct = 0
	for label in y_ref:
		# if (y_pred[i] == label or y_pred[i]+12 == label or
		# 	y_pred[i]+24 == label or y_pred[i]+36 == label or
		# 	y_pred[i]+48 == label):
		if i==len(y_pred): 
			break
		if (y_pred[i] == label):
			num_correct += 1.0
		i+=1
		
	return num_correct/(len(y_pred))

	

# Load testing sets
print("Loading testing data")
test_set = pd.read_csv('test_1.csv').as_matrix();
X_test = test_set[200300:200400,1:]
y_ref = test_set[:,0]


# Load the models trained on the training set
print("Loading models")
clf_root = joblib.load('clf_root.pkl')
clf_majmin = joblib.load('clf_majmin.pkl')
clf_maj_7 = joblib.load('clf_maj_7.pkl')
clf_min_7 = joblib.load('clf_min_7.pkl')

pred_final = []
# X_rotated = np.empty(24)

# Level 1: Predict 12Roots/N/X
print "predicting roots"
temp = timer()
pred_root = clf_root.predict(X_test);
print timer()-temp
# df_root = pd.DataFrame(pred_root)
# print 'Writing CSV...'
# df_root.to_csv('pred_root.csv')
# print 'Done'
# print len(pred_root), len(y_ref)
# print eval(pred_root, y_ref)

# Level 2->3: Rotate the feature matrix and predict 
print "predicting 3rds+7ths"
idx = 0
for root in pred_root:
	print idx
	if root <= 1:
		pred_final.append(root)
			
	elif root == 2:	
		t1 = timer()											# C (2)
		X_rotated[i_C] = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		t2=timer()
		print 'Rotate:',t2-t1
		pred_majmin = clf_majmin.predict(X_rotated)
		# pred_majmin = pred_majmin[1]
		t3=timer()
		print 'majmin.predict:',t3-t2
		if pred_majmin[1] == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin[1] == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7
		
		print 'majmin7.predict', timer()-t3

	elif root == 3:												# Db (3)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 4:												# D (4)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 5:												# Eb (5)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 6:												# E (6)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 7:												# F (7)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 8:												# Gb (8)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 9:												# G (9)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 10:											# Ab (10)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 11:											# A (11)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 12:											# Bb (12)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	elif root == 13:											# B (13)
		X_rotated = rotate(X_test[idx], 11-int(root)) #rotate(chroma, k)
		pred_majmin = clf_majmin.predict(X_rotated)
		pred_majmin = pred_majmin[1]
		if pred_majmin == 0:								# :maj
			pred_majmin7 = clf_maj_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root)						# :maj
			elif pred_majmin7 == 1:
				pred_final.append(root + 24 )				# :maj7
			elif pred_majmin7 == 2:
				pred_final.append(root + 36	)				# :7
		elif pred_majmin == 1:  						    # :min
			pred_majmin7 = clf_min_7.predict(X_rotated)
			pred_majmin7 = pred_majmin7[1]
			if pred_majmin7 == 0:
				pred_final.append(root + 12) 				# :min
			elif pred_majmin7 == 1:
				pred_final.append(root + 48)				# :min7

	idx+=1

print eval(pred_final, y_ref)			

# Save the predictions
# df = pd.DataFrame(pred_final)
# print 'Writing CSV...'
# df.to_csv('pred_final.csv')
# print 'Done'


print 'Finished Predicting'
print 'Run Time:', timer()-start,'s'
