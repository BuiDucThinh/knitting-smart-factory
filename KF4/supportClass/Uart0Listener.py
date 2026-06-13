# This Python file uses the following encoding: utf-8
import serial
from PySide2.QtCore import QObject, Signal


class Uart0Listener(QObject):
    cardUID = ""
    port = "/dev/ttyUSB1"
    bautRate = 9600
    running = True
    ser = serial.Serial(port, bautRate)

    NewCardInfoSignal = Signal(str)

    def __init__(self):
        super(Uart0Listener, self).__init__()

    def start(self):
        messStr = ""
        while Uart0Listener.running:
            if (Uart0Listener.ser.inWaiting() > 0):
                    data_str = Uart0Listener.ser.read(Uart0Listener.ser.inWaiting()).decode('ascii')
                    messStr = messStr + data_str
                    if messStr[-1] == '\n':
                        Uart0Listener.cardUID = messStr[:-1]
                        messStr = ""
                        print("RFID0 CARD READER:", Uart0Listener.cardUID)
                        self.NewCardInfoSignal.emit(self.cardUID)

    def stopUartListener(self):
        Uart0Listener.running = False
        Uart0Listener.ser.close()

