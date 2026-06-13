import socket
import _thread
import threading
import time
import datetime
from datetime import timedelta
from PySide2.QtCore import QObject, Signal, Slot, QTimer
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error


def checkStatusAllNetworkPipe():
    while SpeakerNetworkManager.running:
        index = 0
        for var in SpeakerNetworkManager.listSpk:
            if var[3] is False:
                var[0].shutdown(socket.SHUT_RDWR)
                var[0].close()
                var[4] = True
            else:
                var[3] = False
            index = index + 1
        time.sleep(60)


def handler(speakerNwManager_, connection_, address_):
    data = connection_.recv(1024)

    spkNumber = data.decode('utf-8')
    SpeakerNetworkManager.listAddress[int(spkNumber)-1] = address_[1]
    flagPipeAlive = True
    connectionClosedFlag = False
    SpeakerNetworkManager.listSpk.append([connection_, address_, spkNumber, flagPipeAlive, connectionClosedFlag])

    speakerNwManager_.newSpeakerConnectedSignal.emit()
    while SpeakerNetworkManager.running:
        try:
            data = connection_.recv(1024)
            mes = data.decode('utf-8')
            print('Mess from speaker: ' + spkNumber + ": " + mes + " " + str(address_[1]))
            '''
              PROTOCOL:
              - mess = .... -> ......
              ...
            '''
            if mes == "9":
                #print("pipe's status is ok")
                for var in SpeakerNetworkManager.listSpk:
                    if var[2] == spkNumber and var[1][1] == address_[1]:
                        #print("rewrite to True", address_[1])
                        var[3] = True

            if not data:
                break
        except socket.error as e:
            print(address_[0] + ':' + str(address_[1]) + ":", e)

    # remove lost connection in spkList - START
    index = 0
    for varList in SpeakerNetworkManager.listSpk:
        if varList[1][1] == address_[1]:
            SpeakerNetworkManager.listSpk.pop(index)
        else:
            index = index + 1
    if SpeakerNetworkManager.listAddress[int(spkNumber)-1] == address_[1]:
        speakerNwManager_.lostSpeakerConnectionSignal.emit()

class audioPlayTimerRecord():

    def __init__(self, hour_, min_, numberAudioFile_, nextAudioNote_):
        self.hour = hour_
        self.min = min_
        self.numberAudioFile = numberAudioFile_
        self.nextAudioNote = nextAudioNote_

class SpeakerNetworkManager(QObject):
    listSpk = []
    listAddress = []
    serverSkt = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = ''
    port = 2005
    running = True
    count_temp = 0

    # Signal
    newSpeakerConnectedSignal = Signal()
    lostSpeakerConnectionSignal = Signal()
    updateNextAudioNoteSpeakerUISignal = Signal(str)

    def __init__(self):
        super(SpeakerNetworkManager, self).__init__()
        for i in range(1, 2): # just 1 speaker is acceptable
            SpeakerNetworkManager.listAddress.append(0)
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        s.connect(('<broadcast>', 0))
        SpeakerNetworkManager.host = s.getsockname()[0]

        self.audioPlayRecordList = []
        self.audioPlayRecordList.append(audioPlayTimerRecord(6, 30, 11, "6h30: Chào ngày mới. Chúc anh em 1 ngày làm việc vui vẻ."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(6, 30, 9, "6h30: Chào ngày mới. Chúc anh em 1 ngày làm việc vui vẻ."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(6, 31, 10, "6h40: Mời anh em xác nhận tình trạng máy dệt khi giao ca."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(6, 45, 0, "7h10: Anh em lưu ý kiểm tra tất cả các máy, xem mặt hàng.."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(7, 10, 14, "7h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(7, 40, 1, "8h20: Nhắc anh em luôn nhìn bảng hướng dẫn khi ghi đầu cây mộc."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(8, 20, 2, "8h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(8, 40, 1, "9h10: Thông báo sắp tới giờ giao mộc. Anh em kiểm tra lại các máy.."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(9, 10, 15, "9h20: Nhắc anh em kiểm tra dầu có đang được bơm lên hay không..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(9, 20, 3, "9h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(9, 40, 1, "10h20: Nhắc anh em chỉ hút thuốc khi có hũ đựng tàn thuốc..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(10, 20, 4, "10h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(10, 40, 1, "10h50: Chuẩn bị tới giờ cơm. Chúc anh em ăn ngon miệng."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(10, 50, 12, "11h20: Nhắc anh em luôn đè các lớp vải thấp xuống..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(11, 20, 5, "11h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(11, 40, 1, "12h20: Nhắc anh em kiểm tra can chứa dầu thải trong chân.."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(12, 20, 6, "12h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(12, 40, 1, "13h10: Lưu ý anh em giữ cảnh giác an toàn lao động."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(13, 10, 16, "13h20: Nhắc anh em: kiểm tra máy có đang bị nhỏ dầu..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(13, 20, 7, "13h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(13, 40, 1, "14h20: Nhắc anh em khi lấy sợi, giữ cho thùng Su được..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(14, 20, 8, "15h35: Mong anh em kiểm tra lên sợi đầy đủ. Thu dọn..."))
#        self.audioPlayRecordList.append(audioPlayTimerRecord(14, 30, 18, "14h35: Cơ chế tính điểm Chuyên Cần Kiểm Hàng là..."))
#        self.audioPlayRecordList.append(audioPlayTimerRecord(14, 35, 19, "14h40: Để giúp anh em tăng năng suất. Mỗi khi máy dệt..."))
#        self.audioPlayRecordList.append(audioPlayTimerRecord(14, 40, 20, "15h35: Mong anh em kiểm tra lên sợi đầy đủ. Thu dọn..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(15, 35, 17, "16h30: Chào ngày mới. Chúc anh em một ngày tốt lành."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(16, 10, 18, "16h15: Cơ chế tính điểm Chuyên Cần Kiểm Hàng là..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(16, 15, 19, "16h20: Để giúp anh em tăng năng suất. Mỗi khi máy dệt..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(16, 20, 20, "16h30: Chào ngày mới. Chúc anh em một ngày tốt lành."))

        self.audioPlayRecordList.append(audioPlayTimerRecord(16, 30, 11, "16h31: Chào ngày mới. Chúc anh em một ngày làm việc vui vẻ"))
        self.audioPlayRecordList.append(audioPlayTimerRecord(16, 31, 10, "17h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(16, 50, 18, "16h55: Cơ chế tính điểm Chuyên Cần Kiểm Hàng là..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(16, 55, 19, "17h05: Để giúp anh em tăng năng suất. Mỗi khi máy dệt..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(17, 5, 20, "17h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(17, 40, 1, "18h20: Nhắc anh em luôn nhìn bảng hướng dẫn khi ghi đầu cây mộc."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(18, 5, 19, "18h10: Để giúp anh em tăng năng suất. Mỗi khi máy dệt..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(18, 10, 20, "18h20: Nhắc anh em luôn nhìn bảng hướng dẫn khi ghi đầu cây mộc."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(18, 20, 2, "18h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(18, 40, 1, "19h20: Nhắc anh em kiểm tra dầu có đang được bơm lên hay không..."))
        #self.audioPlayRecordList.append(audioPlayTimerRecord(19, 10, 15, "19h20: Nhắc anh em kiểm tra dầu có đang được bơm lên hay không..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(19, 20, 3, "19h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(19, 40, 1, "19h20: Nhắc anh em chỉ hút thuốc khi có hũ đựng tàn thuốc..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(20, 20, 4, "20h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(20, 40, 1, "21h20: Nhắc anh em luôn đè các lớp vải thấp xuống..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(21, 20, 5, "21h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(21, 40, 1, "22h20: Nhắc anh em kiểm tra can chứa dầu thải trong chân.."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(22, 20, 6, "22h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(22, 40, 1, "23h10: Lưu ý anh em giữ cảnh giác an toàn lao động."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(23, 10, 16, "23h40: Nhắc anh em chuyên cần kiểm tra định kỳ..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(23, 40, 1, "0h20: Nhắc anh em khi lấy sợi, giữ cho thùng Su được..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(0, 20, 8, "1h05: Lưu ý anh em giữ cảnh giác an toàn lao động."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(1, 5, 16, "2h05: Nhắc anh em chỉ hút thuốc khi có hũ đựng tàn thuốc..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(2, 5, 4, "3h05: Lưu ý anh em giữ cảnh giác an toàn lao động."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(3, 5, 16, "4h05: Nhắc anh em chỉ hút thuốc khi có hũ đựng tàn thuốc..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(4, 5, 4, "5h35: Mong anh em kiểm tra lên sợi đầy đủ. Thu dọn..."))
        self.audioPlayRecordList.append(audioPlayTimerRecord(5, 35, 17, "6h30: Chào ngày mới. Chúc anh em 1 ngày làm việc vui vẻ."))

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.checkTimeToSendTaskToSpeaker())
        self.timer.start(60000)

    def checkTimeToSendTaskToSpeaker(self):
        now = datetime.datetime.now()
        for record in self.audioPlayRecordList:
            if now.hour == record.hour and now.minute == record.min:
                if record.numberAudioFile == 11: # audio number 11 just played in monday
                    if now.isoweekday() == 1:
                        SpeakerNetworkManager.send("1", "-11*")
                elif record.numberAudioFile == 9: # audio number 9 just played in the difference day compare to monday
                    if now.isoweekday() != 1:
                        SpeakerNetworkManager.send("1", "-9*")
                else:
                    SpeakerNetworkManager.send("1", "-" + str(record.numberAudioFile) + "*")
                self.updateNextAudioNoteSpeakerUISignal.emit(record.nextAudioNote)

        if now.hour == 0 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-23*")
        elif now.hour == 1 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-24*")
        elif now.hour == 2 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-25*")
        elif now.hour == 3 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-26*")
        elif now.hour == 4 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-27*")
        elif now.hour == 5 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-28*")
        elif now.hour == 6 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-29*")
        elif now.hour == 7 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-30*")
        elif now.hour == 8 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-31*")
        elif now.hour == 9 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-32*")
        elif now.hour == 10 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-33*")
        elif now.hour == 11 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-34*")
        elif now.hour == 12 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-35*")
        elif now.hour == 13 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-36*")
        elif now.hour == 14 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-37*")
        elif now.hour == 15 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-38*")
        elif now.hour == 16 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-39*")
        elif now.hour == 17 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-40*")
        elif now.hour == 18 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-41*")
        elif now.hour == 19 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-42*")
        elif now.hour == 20 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-43*")
        elif now.hour == 21 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-44*")
        elif now.hour == 22 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-45*")
        elif now.hour == 23 and now.minute == 0 :
            SpeakerNetworkManager.send("1", "-46*")


    def start(self):
        try:
            SpeakerNetworkManager.serverSkt.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            SpeakerNetworkManager.serverSkt.bind((SpeakerNetworkManager.host, SpeakerNetworkManager.port))
            print('Speaker Socket is listening..')
            SpeakerNetworkManager.serverSkt.listen(5)
            _thread.start_new_thread(checkStatusAllNetworkPipe, ())
        except socket.error as e:
            print(str(e))
        while SpeakerNetworkManager.running:
            connection, address = SpeakerNetworkManager.serverSkt.accept()
            print('Connected to speaker: ' + address[0] + ':' + str(address[1]))
            _thread.start_new_thread(handler, (self, connection, address))
        SpeakerNetworkManager.serverSkt.close()
        print("Speaker sever closed")

    def stopSpkNwMngTask(self):
        SpeakerNetworkManager.running = False
        SpeakerNetworkManager.serverSkt.shutdown(socket.SHUT_RDWR)
        SpeakerNetworkManager.serverSkt.close()

    @Slot()
    def playAudioToInformWorkerComfirmQLTAtTranferShiftTime(self):
        #print("playAudioToInformWorkerComfirmQLTAtTranferShiftTime")
        #SpeakerNetworkManager.send("1", "-48*") # need to update memory card: add audio file 48
        self.updateNextAudioNoteSpeakerUISignal.emit("Yêu cầu: Anh em thợ xác nhận tình trạng lỗi máy dệt khi giao ca!")

    @staticmethod
    def send(spk_, mess):
        for spk in SpeakerNetworkManager.listSpk:
            if spk[2] == spk_:
                print("send to speaker - mess:", spk_, mess)
                spk[0].sendall(str.encode(mess))



