import pandas as pd
from collections import deque
def rotate(N, shift):	
    return N[shift:] + N[:shift]

"""
"""

data_size = 3

print 'Loading data...'
training_set = pd.read_csv('train_set_10.csv').as_matrix()


X_train = training_set[:data_size,1:]
y_train = training_set[:data_size,0]
X_train_rotated = X_train

# pred_lv_1 = y_train
print X_train_rotated.shape
print X_train[39,:12]
print X_train[39,12:]
print rotate(X_train[39,:12], 6)
print rotate(X_train[39,12:], 5)
# for i in xrange(len(X_train)):
	
# 	if   pred_lv_1[i]==12:	shift = 1
# 	elif pred_lv_1[i]==13:  shift = 2
# 	else: shift = pred_lv_1[i]+1
# 	X_train[i] = rotate(X_train[i], shift)
	
print 'Rotating feature matrix...'
idx = 0
for i in xrange(len(X_train)):
	
	if y_train[i]==0 or y_train[i]==1: 
		continue
	else: 
		shift = 11 - int(y_train[i])
	print i
	X_train_rotated[idx] = rotate(X_train[i,:12], shift) + rotate(X_train[i,12:], shift)
	idx += 1

df = pd.DataFrame(X_train_rotated)
print 'Writing CSV...'
df.to_csv('train_rotated.csv')
print 'Done'