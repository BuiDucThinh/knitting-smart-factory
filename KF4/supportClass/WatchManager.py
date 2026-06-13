import socket
import _thread
import threading
import time
import datetime
from datetime import timedelta
from PySide2.QtCore import QObject, Signal, Slot
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error


def checkStatusAllNetworkPipe():
    while WatchManager.running:
        index = 0
        for var in WatchManager.listWtch:
            if var[3] is False:
                var[0].shutdown(socket.SHUT_RDWR)
                var[0].close()
                var[4] = True
            else:
                var[3] = False
            index = index + 1
        time.sleep(60)

def handler(wtchManager_, connection_, address_):
    data = connection_.recv(1024)
    wtchNumber = data.decode('utf-8')
    WatchManager.listAddress[int(wtchNumber)-1] = address_[1]
    flagPipeAlive = True
    connectionClosedFlag = False
    WatchManager.listWtch.append([connection_, address_, wtchNumber, flagPipeAlive, connectionClosedFlag])

    while WatchManager.running:
        try:
            data = connection_.recv(1024)
            mes = data.decode('utf-8')
            print('Mess from Watch ' + wtchNumber + ": " + mes + " " + str(address_[1]))
            if mes == "9":
                for var in WatchManager.listWtch:
                    if var[2] == wtchNumber and var[1][1] == address_[1]:
                        var[3] = True
            if not data:
                print("break", str(address_[1]))
                break
        except socket.error as e:
            print(address_[0] + ':' + str(address_[1]) + ": watch connection error :", e)

    # remove lost connection in mchList - START
    index = 0
    for varList in WatchManager.listWtch:
        print("Before Remove")
        print(WatchManager.listWtch)
        if varList[1][1] == address_[1]:
            WatchManager.listWtch.pop(index)
        else:
            index = index + 1
        print("After Remove")
        print(WatchManager.listWtch)
    # remove lost connection in mchList - END

    # update watch connect or not connect icon in Machine Info Rect.
    #if WatchManager.listAddress[int(wtchNumber)-1] == address_[1]:
        #wtchManager_.lostConnectionSignal.emit()


class WatchManager(QObject):
    listWtch = []
    listAddress = []
    serverSkt = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = '' # in virtual machine - ubuntu ip = '192.168.1.96'
    port = 2005
    running = True
    currentTime = ""
    Day = ""
    Shift = ""
    startTimeOfShiftWorking = ""
    endTimeOfShiftWorking = ""

    def __init__(self):
        super(WatchManager, self).__init__()
        for i in range(1, 22):
            WatchManager.listAddress.append(0)
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        s.connect(('<broadcast>', 0))
        WatchManager.host = s.getsockname()[0]

    def start(self):
        try:
            WatchManager.serverSkt.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            WatchManager.serverSkt.bind((WatchManager.host, WatchManager.port))
            print('Watch watcher is listening..')
            WatchManager.serverSkt.listen(5)
            _thread.start_new_thread(checkStatusAllNetworkPipe, ())
        except socket.error as e:
            print(str(e))
        while WatchManager.running:
            connection, address = WatchManager.serverSkt.accept()
            print('Connected to watch: ' + address[0] + ':' + str(address[1]))
            _thread.start_new_thread(handler, (self, connection, address))
        WatchManager.serverSkt.close()

    def stopWtchMngTask(self):
        WatchManager.running = False
        WatchManager.serverSkt.shutdown(socket.SHUT_RDWR)
        WatchManager.serverSkt.close()

    @staticmethod
    def updateTimeVariables():
        now = datetime.datetime.now()
        WatchManager.currentTime = now.strftime("%Y-%m-%d %H:%M:%S")
        if now.hour >= 6 and (now.hour <= 23 and now.minute <= 59 and now.second <= 59):
            WatchManager.Day = now.date().strftime("%Y-%m-%d")
        else:
            yesterday = now.date() - timedelta(days=1)
            WatchManager.Day = yesterday.strftime("%Y-%m-%d")

        if now.hour >= 6 and (now.hour <= 15 and now.minute <= 59 and now.second <= 59):
            WatchManager.Shift = "Ngày"
        else:
            WatchManager.Shift = "Đêm"

        # update startTime and EndTime of Shift
        today = now.date()
        yesterday = today - timedelta(days=1)
        tomorrow = today + timedelta(days=1)
        if now.hour >= 0 and now.hour < 6:
            WatchManager.startTimeOfShiftWorking = yesterday.strftime("%Y-%m-%d") + " 16:00:01"
            WatchManager.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
        elif now.hour >= 6 and now.hour < 16:
            WatchManager.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:01"
            WatchManager.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:00"
        elif now.hour >= 16 and now.hour < 24:
            WatchManager.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:01"
            WatchManager.endTimeOfShiftWorking = tomorrow.strftime("%Y-%m-%d") + " 6:00:00"

    @staticmethod
    def send(wtch_, mess):
        print("send to watch - mess:", wtch_, mess)
        for wtch in WatchManager.listWtch:
            if wtch[2] == wtch_:
                print("sending:", mess)
                wtch[0].sendall(str.encode(mess))

    @staticmethod
    def sendBroadCast(mess):
        for wtch in WatchManager.listWtch:
            wtch[0].sendall(str.encode(mess))


