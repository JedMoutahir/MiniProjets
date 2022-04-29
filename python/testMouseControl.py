import mouse
import pyautogui
import time
import keyboard

time.sleep(1)
print("Begin recording\n")
ListKeyPressed = []
init = time.time()
while True:  # making a loop
    try:  # used try so that if user pressed other than the given key error will not be shown
        key = keyboard.read_key()
        if key == 'm':  # if key 'q' is pressed
            print('Stop key recording\n')
            break  # finishing the loop
        ListKeyPressed.append(key)
        ListKeyPressed.append(time.time()-init)
        init = time.time()
        time.sleep(0.05)
    except:
        break  # if user pressed a key other than the given key the loop will break
print(ListKeyPressed[::2])

time.sleep(10)
print("Begin playing\n")
N = len(ListKeyPressed[::2])

for i in range(N):
    pyautogui.keyDown(ListKeyPressed[2*i])
    print(ListKeyPressed[2*i] + "\n")
    time.sleep(ListKeyPressed[2*i+1])
    pyautogui.keyUp(ListKeyPressed[2*i])

print("End of inputs\n")
