# This Python file uses the following encoding: utf-8
import serial
from PySide2.QtCore import QObject, Signal


class Uart1Listener(QObject):
    cardUID = ""
    port = "/dev/ttyUSB0"
    bautRate = 9600
    running = True
    ser = serial.Serial(port, bautRate)

    NewCardInfoSignal = Signal(str)

    def __init__(self):
        super(Uart1Listener, self).__init__()

    def start(self):
        messStr = ""
        while Uart1Listener.running:
            if (Uart1Listener.ser.inWaiting() > 0):
                    data_str = Uart1Listener.ser.read(Uart1Listener.ser.inWaiting()).decode('ascii')
                    messStr = messStr + data_str
                    if messStr[-1] == '\n':
                        Uart1Listener.cardUID = messStr[:-1]
                        messStr = ""
                        print("RFID1 CARD READER:", Uart1Listener.cardUID)
                        self.NewCardInfoSignal.emit(self.cardUID)

    def stopUartListener(self):
        Uart1Listener.running = False
        Uart1Listener.ser.close()

