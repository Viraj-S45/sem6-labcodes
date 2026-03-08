import pickle
from sklearn.linear_model import LogisticRegression
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split

# Load dataset
data = load_iris()
X, y = data.data[:100], data.target[:100]

# Train test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Train model
model = LogisticRegression()
model.fit(X_train, y_train)

# Save model
with open("iris_model.pkl", "wb") as f:
    pickle.dump(model, f)

print("Model saved to ./iris_model.pkl")