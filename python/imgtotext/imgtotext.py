import cv2
import pytesseract

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

print(pytesseract.image_to_string(r'C:\Users\Jed\Desktop\programmation\python\imgtotext\handwritten.jpg'))
