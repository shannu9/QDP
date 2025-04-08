#!/bin/bash
apt-get update
apt-get install -y tesseract-ocr poppler-utils
# Export path to Tesseract binary for pytesseract
export TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata
export PATH="$PATH:/usr/bin"
streamlit run quickdraw_app.py --server.port $PORT --server.address 0.0.0.0
