# This Python file uses the following encoding: utf-8
import socket
import tqdm
import os
import cups
from PySide2.QtCore import QObject, Signal


class FtpServerAndPrint(QObject):
    printerName = "HP-LaserJet-Professional-P1102"
    running = True
    # device's IP address
    SERVER_HOST = "0.0.0.0"
    SERVER_PORT = 5001
    # receive 4096 bytes each time
    BUFFER_SIZE = 4096
    SEPARATOR = "<SEPARATOR>"
    # create the server socket
    # TCP socket
    s = socket.socket()
    # bind the socket to our local address
    s.bind((SERVER_HOST, SERVER_PORT))

    # Signal
    newConnectionForPrintSignal = Signal()
    receivedFileToPrintSignal = Signal()

    def __init__(self):
        super(FtpServerAndPrint, self).__init__()

    def start(self):
        conn = cups.Connection()
        printers = conn.getPrinters()



        # enabling our server to accept connections
        # 5 here is the number of unaccepted connections that
        # the system will allow before refusing new connections
        self.s.listen(5)
        while FtpServerAndPrint.running:
            #print(f"[*] Listening as {self.SERVER_HOST}:{self.SERVER_PORT}")
            # accept connection if there is any
            client_socket, address = self.s.accept()
            self.newConnectionForPrintSignal.emit()
            # if below code is executed, that means the sender is connected
            #print(f"[+] {address} is connected.")
            # receive the file infos
            # receive using client socket, not server socket
            received = client_socket.recv(self.BUFFER_SIZE).decode()
            #print(received)
            filename, filesize = received[1:].split(self.SEPARATOR)
            #print(filename)
            #print(filesize)
            # remove absolute path if there is
            #filename = os.path.basename("./pdfFabricDelivery/" + filename)
            filename = "./pdfFabricDelivery/" + filename
            # convert to integer
            filesize = int(filesize)
            # start receiving the file from the socket
            # and writing to the file stream
            progress = tqdm.tqdm(range(filesize), f"Receiving {filename}", unit="B", unit_scale=True, unit_divisor=1024)
            with open(filename, "wb") as f:
                while True:
                    # read 1024 bytes from the socket (receive)
                    bytes_read = client_socket.recv(self.BUFFER_SIZE)
                    if not bytes_read:
                            # nothing is received
                            # file transmitting is done
                            break
                    # write to the file the bytes we just received
                    f.write(bytes_read)
                    # update the progress bar
                    progress.update(len(bytes_read))

            # close the client socket
            client_socket.close()
            self.receivedFileToPrintSignal.emit()
            conn.printFile(self.printerName, filename, "Công Minh Xuất Mộc", {})
            conn.printFile(self.printerName, filename, "Công Minh Xuất Mộc", {})
        # close the server socket
        self.s.close()

    def stopFtpAndPrint(self):
        FtpServerAndPrint.running = False
        FtpServerAndPrint.s.shutdown(socket.SHUT_RDWR)
        FtpServerAndPrint.s.close()

