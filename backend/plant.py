from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
from transformers import AutoImageProcessor, AutoModelForImageClassification
from PIL import Image
import torch
import os


app = Flask(__name__)

# Load model and processor
processor = AutoImageProcessor.from_pretrained("linkanjarad/mobilenet_v2_1.0_224-plant-disease-identification")
model = AutoModelForImageClassification.from_pretrained("linkanjarad/mobilenet_v2_1.0_224-plant-disease-identification")

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
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'})
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'})
    
    # Save uploaded file
    filename = secure_filename(file.filename)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(filepath)
    
    # Preprocess image
    inputs = preprocess_image(filepath)
    
    # Run inference
    probabilities = run_inference(inputs)
    
    return jsonify({'probabilities': probabilities})

if __name__ == '__main__':
    app.run(debug=True)
