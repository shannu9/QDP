#!/bin/bash

# Install system packages
apt-get update && apt-get install -y tesseract-ocr poppler-utils

# Create a file that defines the tesseract path
echo 'import pytesseract' > tesseract_path.py
echo 'pytesseract.pytesseract.tesseract_cmd = "/usr/bin/tesseract"' >> tesseract_path.py

# Prepend that into the main app so it always loads first
echo "from tesseract_path import *" > wrapper.py
cat quickdraw_app.py >> wrapper.py

# Run the Streamlit app
streamlit run wrapper.py --server.port $PORT --server.address 0.0.0.0
