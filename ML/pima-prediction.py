import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from utilities import plot_corr_data

pd.set_option('display.width',800)
df = pd.read_csv("./data/pima-data.csv")
# Data Moulding
diabatic_map = { True: 1, False: 0 }
df['diabetes'] = df['diabetes'].map(diabatic_map)
del df['skin']
print(df.shape);
X = df.corr()
print(X)
#Plotting
plot_corr_data(X)