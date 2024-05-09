import tensorflow_hub as hub

# Load the SavedModel from TensorFlow Hub
model = hub.load("https://www.kaggle.com/models/rishitdagli/plant-disease/TensorFlow2/plant-disease/1")

# Now you can use the model for inference
