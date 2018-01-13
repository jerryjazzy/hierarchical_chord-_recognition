# Import libraries
from timeit import default_timer as timer
import numpy as np
import pandas as pd
import matplotlib.pyplot as pt 
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score
from sklearn.metrics import classification_report

import pickle

start = timer()

# Params
from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()

# Load Data
print("Loading Data...")
training_set = pd.read_csv('train_3_19.csv').as_matrix()
# training_set = pd.read_csv('train_sklearn_majmin.csv').as_matrix()
# training_set = pd.read_csv('train_sklearn_7.csv').as_matrix()

print(training_set.shape)

X_train = training_set[:,1:]
y_train = training_set[:,0]

# X_train_scaled = scaler.fit_transform(X_train).astype('float32')

# Pre-process

# Initialize Classifier(s) 
clf_2_1 = RandomForestClassifier(n_estimators=20,n_jobs=-1,
	max_features='auto')
# clf = svm.SVC(kernel='rbf',C=1.0)
# clf = OneVsRestClassifier(LogisticRegression())
# clf = LogisticRegression(n_jobs=-1, solver='sag')
print(clf_2_1)


# Fit the models


# Predict


# Evaluate
print("Evaluating...")
scores = cross_val_score(clf_2_1, X_train, y_train, 
	cv=5, n_jobs=-1, verbose=True)
print(scores)

# Tuning
# k_range = list(range(20, 30))
# param_grid = dict(n_estimators=k_range)
# grid = GridSearchCV(clf, param_grid, cv=5, scoring='accuracy',n_jobs=-1)
# grid.fit(X_train, y_train)
# print grid.grid_scores_
# print(grid.best_score_)
# print(grid.best_params_)
# print(grid.best_estimator_)

# Display Results
print("----- Results -----")
# print 'Mean Score:', round(np.mean(scores), 4)*100,'%'
print("Accuracy: %0.3f (+/- %0.3f)" % (scores.mean(), scores.std() * 2))
print 'Run Time:', timer()-start,'s'


# EOF