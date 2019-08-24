from for_server import *
import cv2
import numpy as np
import 

class checkBmi:
    def check():
        model = get_full_model()

        img = cv2.cvtColor(cv2.imread("anuj.jpg"),cv2.COLOR_BGR2RGB)
        img1 = cv2.cvtColor(img,cv2.COLOR_RGB2GRAY)

        cas = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

        faces_rects = cas.detectMultiScale(img1, scaleFactor = 1.2, minNeighbors = 5)

        x,y,w,h = faces_rects[0]
        img_h, img_w = np.shape(img1)
        xw1 = max(int(x - 0.1 * w), 0)
        yw1 = max(int(y - 0.1 * h), 0)
        xw2 = min(int(x+w + 0.1 * w), img_w - 1)
        yw2 = min(int(y+h + 0.1 * h), img_h - 1)

        face = cv2.resize(img[yw1:yw2 + 1, xw1:xw2 + 1, :], (224,224)) / 255.00

        prediction = model.predict(face.reshape(1,224,224,3))

        print(prediction[0][0])