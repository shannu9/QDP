#!/bin/bash
apt-get update
apt-get install -y tesseract-ocr poppler-utils
streamlit run quickdraw_app.py --server.port $PORT --server.address 0.0.0.0
