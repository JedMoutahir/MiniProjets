from PIL import Image
import pytesseract

# If you don't have tesseract executable in your PATH, include the following:
pytesseract.pytesseract.tesseract_cmd = r'C:\Users\Jed\AppData\Local\Programs\Python\Python38-32\Lib\site-packages\pytesseract\pytesseract.py'
# Example tesseract_cmd = r'C:\Program Files (x86)\Tesseract-OCR\tesseract'

# Simple image to string
print(pytesseract.image_to_string(Image.open('img.jpg'), lang='fra'))
