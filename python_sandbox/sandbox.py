# import Xlib
# import Xlib.display

# def main():
#     # display = Xlib.display.Display(':0')
#     display = Xlib.display.Display()
#     root = display.screen().root
#     root.change_attributes()

#     while True:
#         event = root.display.next_event()
#         print(event)

# if __name__ == "__main__":
#     main()


import PySimpleGUI as sg

sg.theme('DarkAmber')   # Add a touch of color
# All the stuff inside your window.
layout = [  [sg.Text('Some text on Row 1')],
            [sg.Text('Enter something on Row 2'), sg.InputText()],
            [sg.Button('Ok'), sg.Button('Cancel', size=(10, 10))] ]

# Create the Window
window = sg.Window('Window Title', layout)
# window.finalize()
# window.maximize()
# Event Loop to process "events" and get the "values" of the inputs
while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Cancel': # if user closes window or clicks cancel
        break
    print('You entered ', values[0])

window.close()