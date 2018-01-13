
import pandas as pd

def rotate(N, shift):	
    return N[shift:] + N[:shift]


print 'Loading data...'
training_set = pd.read_csv('train_set_10.csv').as_matrix()


X_train = training_set[:1000,1:]