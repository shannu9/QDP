#!/bin/bash

# Update and install tesseract
apt-get update && apt-get install -y tesseract-ocr poppler-utils

# Let Python know where tesseract is
echo 'pytesseract.pytesseract.tesseract_cmd = "/usr/bin/tesseract"' >> tesseract_path.py

# Run the app with this path included
echo "from tesseract_path import *" > wrapper.py
cat quickdraw_app.py >> wrapper.py

# Run the Streamlit app
streamlit run wrapper.py --server.port $PORT --server.address 0.0.0.0
