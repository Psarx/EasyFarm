from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
from transformers import AutoImageProcessor, AutoModelForImageClassification
from PIL import Image
import torch
import os
import json
from flask_cors import CORS  # Import CORS from flask_cors

app = Flask(__name__)
CORS(app)  # Add this line to enable CORS for your Flask app

# Define upload folder
assets_dir = 'frontend/assets/folder'
# Check if the assets directory exists, create it if it doesn't
if not os.path.exists(assets_dir):
    os.makedirs(assets_dir)
# Load model and processor
processor = AutoImageProcessor.from_pretrained("linkanjarad/mobilenet_v2_1.0_224-plant-disease-identification")
model = AutoModelForImageClassification.from_pretrained("linkanjarad/mobilenet_v2_1.0_224-plant-disease-identification")

# Load config file
# Load config file
config_path = 'C:/Users/HP/OneDrive/Desktop/bmc/frontend/assets/config.json'
with open(config_path, 'r') as f:
    config_data = json.load(f)


# Function to preprocess image
def preprocess_image(image_path):
    img = Image.open(image_path)
    inputs = processor(images=img, return_tensors="pt")
    return inputs

# Function to perform inference
def run_inference(inputs):
    outputs = model(**inputs)
    logits = outputs.logits
    probabilities = torch.softmax(logits, dim=1).tolist()[0]
    return probabilities

# Route to classify image
@app.route('/classify', methods=['POST'])
def classify_image():
    # Get the file from the request
    file = request.files['file']
    filename = file.filename

    # Save the file to the assets directory
    filepath = os.path.join(assets_dir, filename)
    file.save(filepath)
    
    print("Received file:", filename)
    
    # Preprocess image
    inputs = preprocess_image(filepath)
    
    # Run inference
    probabilities = run_inference(inputs)
    
    # Get the max probability index
    max_index = probabilities.index(max(probabilities))
    
    # Get the label corresponding to the max_index
    max_index_label = config_data['id2label'][str(max_index)]
    
    print("Probabilities:", probabilities)
    print("Predicted label:", max_index_label)
    
    return jsonify({'probabilities': probabilities, 'predicted_label': max_index_label})

if __name__ == '__main__':
    app.run(debug=True)
