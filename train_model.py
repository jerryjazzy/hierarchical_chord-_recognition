from timeit import default_timer as timer
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
import pickle
from sklearn.externals import joblib

start = timer()

# Load Data
print("Loading Data...")
training_set_root = pd.read_csv('train_2_root.csv').as_matrix()
X_train_root = training_set_root[:,1:]
y_train_root = training_set_root[:,0]

training_set_majmin = pd.read_csv('train_2_majmin.csv').as_matrix()
X_train_majmin = training_set_majmin[:,1:]
y_train_majmin = training_set_majmin[:,0]

training_set_maj_7 = pd.read_csv('train_2_maj_7.csv').as_matrix()
X_train_maj_7 = training_set_maj_7[:,1:]
y_train_maj_7 = training_set_maj_7[:,0]

training_set_min_7 = pd.read_csv('train_2_min_7.csv').as_matrix()
X_train_min_7 = training_set_min_7[:,1:]
y_train_min_7 = training_set_min_7[:,0]

# Initialize classifier(s)
print("Initializing classifiers")
clf_root = RandomForestClassifier(n_estimators=20,n_jobs=-1,
	max_features='auto')
clf_majmin = RandomForestClassifier(n_estimators=20,n_jobs=-1,
	max_features='auto')
clf_maj_7 = RandomForestClassifier(n_estimators=20,n_jobs=-1,
	max_features='auto')
clf_min_7 = RandomForestClassifier(n_estimators=20,n_jobs=-1,
	max_features='auto')
print(clf_root)

# Fit the model(s)
print("Fitting models")
clf_root.fit(X_train_root,y_train_root) # X - all | y - 12R+N+X (14)
print("clf_root done")
clf_majmin.fit(X_train_majmin,y_train_majmin) # X - ROTATED | y - maj/min (2)
print("clf_majmin done")
clf_maj_7.fit(X_train_maj_7,y_train_maj_7) # X - only majors, ROTATED | y - maj/maj7/7 (3)
print("clf_maj_7 done")
clf_min_7.fit(X_train_min_7,y_train_min_7) # X - only minors, ROTATED | y - min/min7 (2)
print("clf_min_7 done")

# Save the models
print("Saving the models")
joblib.dump(clf_root, 'clf_root_2.pkl') 
joblib.dump(clf_majmin, 'clf_majmin_2.pkl') 
joblib.dump(clf_maj_7, 'clf_maj_7_2.pkl') 
joblib.dump(clf_min_7, 'clf_min_7_2.pkl') 

# s1 = pickle.dumps(clf_root)
# clf2 = pickle.loads(s)
# y_pred = clf2.predict(X_test)
print 'Run Time:', timer()-start,'s'


#EOF