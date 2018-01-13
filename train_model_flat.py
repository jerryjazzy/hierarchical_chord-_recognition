from timeit import default_timer as timer
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
import pickle
from sklearn.externals import joblib

start = timer()

# Load Data
print("Loading Data...")
training_set_flat = pd.read_csv('train_1_flat.csv').as_matrix()
X_train_flat = training_set_flat[:,1:]
y_train_flat = training_set_flat[:,0]

# Initialize classifier(s)
print("Initializing classifiers")
clf_flat = RandomForestClassifier(n_estimators=20,n_jobs=-1,
	max_features='auto')

print(clf_flat)

# Fit the model(s)
print("Fitting models")
clf_flat.fit(X_train_flat,y_train_flat) 
print("clf_flat done")


# Save the models
print("Saving the models")
joblib.dump(clf_flat, 'clf_flat.pkl') 

# s1 = pickle.dumps(clf_root)
# clf2 = pickle.loads(s)
# y_pred = clf2.predict(X_test)
print 'Run Time:', timer()-start,'s'
