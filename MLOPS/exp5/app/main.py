from fastapi import FastAPI
from pydantic import BaseModel
import numpy as np
import pickle
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

# Load trained model
model_path = BASE_DIR / "models" / "iris_model.pkl"
with model_path.open("rb") as f:
    model = pickle.load(f)

app = FastAPI(
    title="Logistic Regression API",
    description="Simple API for predictions",
    version="1.0",
)

class InputData(BaseModel):
    feature1: float
    feature2: float
    feature3: float
    feature4: float


@app.post("/predict")
def predict(data: InputData):
    features = np.array([[data.feature1, data.feature2, data.feature3, data.feature4]])
    prediction = model.predict(features)
    return {"prediction": int(prediction[0])}


@app.get("/health")
def health_check():
    return {"status": "API is running"}