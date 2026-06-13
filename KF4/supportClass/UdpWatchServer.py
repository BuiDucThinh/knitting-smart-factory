import socket
import socketserver
import _thread
import threading
import time
import datetime
from datetime import timedelta
from PySide2.QtCore import QObject, Signal, Slot
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error


class MyUDPHandler(socketserver.BaseRequestHandler):
    """
    This class works similar to the TCP handler class, except that
    self.request consists of a pair of data and client socket, and since
    there is no connection the client address must be given explicitly
    when sending data back via sendto().
    """

    def handle(self):
        data = self.request[0].strip()
        socket = self.request[1]
        print("{} wrote:".format(self.client_address[0]))
        print(data)
        #socket.sendto(data.upper(), self.client_address)
        message = "ack"
        socket.sendto(message.encode('utf-8'), self.client_address)
        UdpWatchServer.listAddress[int(data)-1] = self.client_address[0]
        #UdpWatchServer.send(1, data)


class UdpWatchServer(QObject):
    listWtch = []
    listAddress = []
    # Create a datagram socket
    UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
    localIP = '' # in virtual machine - ubuntu ip = '192.168.1.96'
    localPort = 9999 #2865
    running = True
    currentTime = ""
    Day = ""
    Shift = ""
    startTimeOfShiftWorking = ""
    endTimeOfShiftWorking = ""

    def __init__(self):
        super(UdpWatchServer, self).__init__()
        for i in range(1, 22):
            UdpWatchServer.listAddress.append('')
        # Get local ip
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        s.connect(('<broadcast>', 0))
        UdpWatchServer.localIP = s.getsockname()[0]

    def startListener(self):
        #HOST, PORT = "localhost", 9999
        HOST, PORT = "", UdpWatchServer.localPort #9999
        with socketserver.UDPServer((HOST, PORT), MyUDPHandler) as UdpWatchServer.UDPServerSocket:
            UdpWatchServer.UDPServerSocket.serve_forever()


    def stopUdpWtchMngTask(self):
        UdpWatchServer.running = False
        HOST, PORT = "", 9999
        UdpWatchServer.UDPServerSocket.shutdown()

    @staticmethod
    def send(wtch_, mess):
        print("send to watch - mess:", wtch_, mess)
        PORT = 8888 #2389
        # SOCK_DGRAM is the socket type to use for UDP sockets
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        mess2 = mess.strip()
        #sock.sendto(bytes(mess, "utf-8"), (UdpWatchServer.listAddress[int(wtch_)-1], PORT))
        sock.sendto(mess2.encode('utf-8'), (UdpWatchServer.listAddress[int(wtch_)-1], PORT))
        #sock.sendto(mess2.encode('utf-8'), ('192.168.1.113', PORT))
