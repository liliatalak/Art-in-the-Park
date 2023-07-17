#import relevant libaries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#create dataframe
art_in_the_park_df = pd.DataFrame(np.random.randn(1000,4),columns=list('ABCD'))

#data visualization
plt.hist(art_in_the_park_df.A)
plt.xlabel('Votes')
plt.title('Average Votes Per Piece')
plt.show()

#correlation between columns
art_in_the_park_df.corr()

#groupby
art_in_the_park_grouped = art_in_the_park_df.groupby('A').mean()

#plot group by
ax = art_in_the_park_grouped['B'].plot(kind='bar', color = 'orange', figsize = (10, 8), fontsize = 14)
ax.set_xlabel('Votes', fontsize = 14)
ax.set_ylabel('Average Votes Per Piece', fontsize = 14)
ax.set_title('Average Votes Per Piece', fontsize = 14)
plt.show()

#create a function 
def calculate_avg_value(group):
    return group.mean()

#apply calcualte_avg_value function
art_in_the_park_grouped = art_in_the_park_df.groupby('A').apply(calculate_avg_value)

#plot avg value
ax = art_in_the_park_grouped['B'].plot(kind='bar', color = 'orange', figsize = (10, 8), fontsize = 14)
ax.set_xlabel('Average Value', fontsize = 14)
ax.set_ylabel('Average Votes Per Piece', fontsize = 14)
ax.set_title('Average Value Per Piece', fontsize = 14)
plt.show()

#create a function to plot the data
def plot_art_in_the_park_data(dataframe):
    ax = dataframe.plot.scatter(x = 'A', y = 'B', color = 'red', figsize = (10, 8), fontsize = 14)
    ax.set_xlabel('Votes', fontsize = 14)
    ax.set_ylabel('Average Votes Per Piece', fontsize = 14)
    ax.set_title('Vote Distribution of Each Piece', fontsize = 14)
    plt.show()

#call plot_art_in_the_park_data
plot_art_in_the_park_data(art_in_the_park_df)

#create a function to get the best voted piece 
def best_voted_piece(dataframe):
    best_voted_piece = dataframe[dataframe.A == dataframe.A.max()]
    return best_voted_piece

#call best_voted_piece
best_voted_piece = best_voted_piece(art_in_the_park_df)

#print best voted piece 
print("The best voted piece is:", best_voted_piece)

#plot best voted piece data
ax = best_voted_piece.plot.scatter(x = 'A', y = 'B', color = 'green', figsize = (10, 8), fontsize = 14)
ax.set_xlabel('Votes', fontsize = 14)
ax.set_ylabel('Average Votes Per Piece', fontsize = 14)
ax.set_title('Vote Distribution of Best Voted Piece', fontsize = 14)
plt.show()

#create a function to get the worst voted piece 
def worst_voted_piece(dataframe):
    worst_voted_piece = dataframe[dataframe.A == dataframe.A.min()]
    return worst_voted_piece

#call worst_voted_piece
worst_voted_piece = worst_voted_piece(art_in_the_park_df)

#print worst voted piece 
print("The worst voted piece is:", best_voted_piece)

#plot worst voted piece data
ax = worst_voted_piece.plot.scatter(x = 'A', y = 'B', color = 'blue', figsize = (10, 8), fontsize = 14)
ax.set_xlabel('Votes', fontsize = 14)
ax.set_ylabel('Average Votes Per Piece', fontsize = 14)
ax.set_title('Vote Distribution of Worst Voted Piece', fontsize = 14)
plt.show()

#linear regession
from sklearn.linear_model import LinearRegression

#create data
x = art_in_the_park_df.A
y = art_in_the_park_df.B

#reshape data
x = x.values.reshape(-1,1)

#fit the model
model = LinearRegression()
model.fit(x,y)

#plot the data
ax = art_in_the_park_df.plot.scatter(x = 'A', y = 'B', color = 'red', figsize = (10, 8), fontsize = 14)
ax.set_xlabel('Votes', fontsize = 14)
ax.set_ylabel('Average Votes Per Piece', fontsize = 14)
ax.set_title('Vote Distribution of Each Piece', fontsize = 14)

#plot the regression line
plt.plot(x, model.predict(x), color='black')
plt.show()

#write a function to predict the average vote per piece
def predict_average_vote_per_piece(x):
    prediction = model.predict([[x]])
    return prediction

#call prediction
x = 6
prediction = predict_average_vote_per_piece(x)

#print prediction
print("The predicted average vote per piece for {} is {}".format(x, prediction))