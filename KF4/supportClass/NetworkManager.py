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
    while NetworkManager.running:
        index = 0
        #print("checkStatusAllNetworkPipe==================================================================")
        #print("NetworkManager.listMch", NetworkManager.listMch)
        for var in NetworkManager.listMch:
            if var[3] is False:
                #print("Check is false")
                #print("Close connection")
                var[0].shutdown(socket.SHUT_RDWR)
                var[0].close()
                var[4] = True
#                SQL_updateMchOnlineEvent = "UPDATE MachineOnlineEvent SET OfflineTime = '%s' WHERE MachineNum = '%s' AND OfflineTime IS NULL ORDER BY ID DESC LIMIT 1"
#                try:
#                    db_config = read_db_config()
#                    conn = MySQLConnection(**db_config)
#                    if conn.is_connected():
#                        #NetworkManager.updateTimeVariables()
#                        cur = conn.cursor()
#                        cur.execute(SQL_updateMchOnlineEvent % (NetworkManager.timeValue.currentTime, var[2])) #(NetworkManager.currentTime, var[2]))
#                        conn.commit()
#                except Error as e:
#                    print("sql update machine offline event error: ", e)
#                finally:
#                    conn.close()
            else:
                #print("Check is true")
                var[3] = False
            index = index + 1
        #print("end checkStatusAllNetworkPipe==================================================================")
        time.sleep(60)


def handler(nwManager_, connection_, address_):
    #print("start handler ", connection_, " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    data = connection_.recv(1024)

    mchNumber = data.decode('utf-8')
    NetworkManager.listAddress[int(mchNumber)-1] = address_[1]
    onlineTime = ""
    flagPipeAlive = True
    connectionClosedFlag = False
    NetworkManager.listMch.append([connection_, address_, mchNumber, flagPipeAlive, connectionClosedFlag])
    #connection_.sendall(str.encode('KF software say hello to: M' + mchNumber)) -> some scenario make error with mchNumber have charracter 1, 2 ,3, 4. esp32 will misunderstand. -> don't run this command.



    # FIRST: CHECK STATUS IN DTB:  IF STATUS IS EMPTY (NO ROW IN DTB)-> CREATE NEW ROW OF THIS MCH WITH STATUS INIT IS 'NORMAL'
    #                               IF STATUS IS TECHNICIAN IS ADJUST -> SEND TO MCH MESSAGE WITH CONTENT '4' TO COMMAND MCH RUN FORERVER
    #                               IF STATUTS IS OTHER (NORMAL OR KNITSMALLROLL OR KINITWEAKYARN) ->
    #                                                                       IF NO ROW (AT REALTIME) AT WORKERPERFORMACE DTB -> NO WORKER ASIGNED -> SEND TO MCH MESSAGE WITH CONTENT '3' TO COMMAND MCH DISABLE
    #                                                                       IF HAVE ROW -> WORKER ASIGNED ->
    #                                                                                                       IF QUALITY CHECK COLUM OF ROW HAVE VALUE IS 1 (ASKING) -> SEND TO MCH MESSAGE WITH CONTENT '2' TO COMMAND MCH DISABLE

    # SECOND: INSERT NEW ROW FOR ONLINE EVENT DTB
    SQL_insertMchOnlineEvent = "INSERT INTO MachineOnlineEvent(MachineNum, OnlineTime, OfflineTime, User_ID, DayWork) VALUES ('%s', '%s', '%s', '%s', '%s')"

    SQL_selectMchStatus = "SELECT * FROM MachineStatus WHERE MachineNum = '%s'"
    SQL_insertMchSatus = "INSERT INTO MachineStatus(MachineNum, Status) VALUES ('%s','%s')"
    statemenSelectWorkerPerformanceSQL = "SELECT * FROM WorkerPerformance WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"

    try:
        db_config = read_db_config()
        conn = MySQLConnection(**db_config)
        if conn.is_connected():
            #NetworkManager.updateTimeVariables()
            onlineTime = NetworkManager.timeValue.currentTime #currentTime
            cur = conn.cursor()
            cur.execute(SQL_selectMchStatus % (str(mchNumber))) # just effect when MachineStatus Table in DTB is empty for first time install software
            data = cur.fetchall()
            if len(data) == 0:
                cur.execute(SQL_insertMchSatus % (str(mchNumber), "NORMAL"))
                #print("COMMAND TO MCH RUN AS NORMAL")
                connection_.sendall(str.encode("1"))
                conn.commit()
            else:
                if data[0][2] == "ADJUST":
                    #print("COMMAND TO MCH RUN FOREVER BECAUSE TECHNICIAN IS ADJUSTING")
                    connection_.sendall(str.encode("4"))
                else:
                    # CHECK WORKER IS ASIGNED
                    #print("CHECK WORKER IS ASIGNED")
                    #print(statemenSelectWorkerPerformanceSQL % (str(mchNumber), NetworkManager.timeValue.workDay_, NetworkManager.timeValue.workShift_))
                    cur.execute(statemenSelectWorkerPerformanceSQL % (str(mchNumber), NetworkManager.timeValue.workDay_, NetworkManager.timeValue.workShift_))#, NetworkManager.startTimeOfShiftWorking))
                    data = cur.fetchall()
                    if len(data) == 0:
                        #print("COMMAND TO MCH DISABLE BECAUSE NO WORKER IS ASIGNED")
                        connection_.sendall(str.encode("3"))
                        # Insert online event.
                        cur.execute(SQL_insertMchOnlineEvent % (str(mchNumber), NetworkManager.timeValue.currentTime, NetworkManager.timeValue.currentTime, 0, NetworkManager.timeValue.workDay_))
                        conn.commit()
                    else:
                        if data[0][5] == 1:
                            #print("COMMNAD TO MCH DISABLE BECAUSE NOT YET COMFIRM QUALITY TRANFER")
                            connection_.sendall(str.encode("2"))
                        # Insert online event.
                        cur.execute(SQL_insertMchOnlineEvent % (str(mchNumber), NetworkManager.timeValue.currentTime, NetworkManager.timeValue.currentTime, data[0][2], NetworkManager.timeValue.workDay_))
                        conn.commit()
    except Error as e:
        print("sql insert machine online event error: ",e)
    finally:
        conn.close()

    SQL_insertLampEvent = "INSERT INTO MachineLampEvent(MachineNum, EventType, StartTime) VALUES ('%s','%s','%s')"
    SQL_updateLampEvent = "UPDATE MachineLampEvent SET EndTime = '%s' WHERE MachineNum = '%s' AND EventType = '%s' AND StartTime > '%s' AND EndTime IS NULL ORDER BY idMachineEvent DESC LIMIT 1"
    SQL_updateRPS = "UPDATE RoundsPerShift SET RPS = RPS + 1 WHERE MachineNum = '%s' AND Day = '%s' AND Shift = '%s'"
    SQL_insertBtnPressed = "INSERT INTO ButtonPressdEvent(MachineNum, PressTime) VALUES ('%s','%s')"
    nwManager_.newConnectedSignal.emit()
    while NetworkManager.running:
        try:
            data = connection_.recv(1024)
            mes = data.decode('utf-8')
            print('Mess from M ' + mchNumber + ": " + mes + " " + str(address_[1]))
            #NetworkManager.updateTimeVariables()
            '''
              PROTOCOL:
              - mess = 11 -> yellow led on
              - mess = 10 -> yellow led off
              - mess = 21 -> red led on
              - mess = 20 -> red led off
              - mess = 31 -> green led on
              - mess = 30 -> green led off
              - mess = 41 -> quality Check on
              - mess = 40 -> quality Check off
              - mess = 7  -> new round
              - mess = 8  -> button clicked
              - mess = 9  -> connection still live
              ...
            '''
            # processing with Yellow Lamp
            if mes == "11":
                #print("received mess YELLOW LAMP ON")
                nwManager_.YellowLedOnSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_insertLampEvent % (str(mchNumber), "YELLOW", NetworkManager.timeValue.currentTime))
                        conn.commit()
                except Error as e:
                    print("sql insert yellow lamp on event error: ",e)
                finally:
                    conn.close()

            elif mes == "10":
                #print("received mess YELLOW LAMP OFF")
                nwManager_.YellowLedOffSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_updateLampEvent % (NetworkManager.timeValue.currentTime, str(mchNumber), "YELLOW", onlineTime))
                        conn.commit()
                except Error as e:
                    print("sql update yellow lamp off event error: ",e)
                finally:
                    conn.close()

            # processing with Red Lamp
            elif mes == "21":
                #print("received mess RED LAMP ON")
                nwManager_.RedLedOnSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_insertLampEvent % (str(mchNumber), "RED", NetworkManager.timeValue.currentTime))
                        conn.commit()
                except Error as e:
                    print("sql insert red lamp on event error: ",e)
                finally:
                    conn.close()

            elif mes == "20":
                #print("received mess RED LAMP OFF")
                nwManager_.RedLedOffSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_updateLampEvent % (NetworkManager.timeValue.currentTime, str(mchNumber), "RED", onlineTime))
                        conn.commit()
                except Error as e:
                    print("sql update red lamp off event error: ",e)
                finally:
                    conn.close()

            # processing with Green Lamp
            elif mes == "31":
                #print("received mess GREEN LAMP ON")
                nwManager_.GreenLedOnSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_insertLampEvent % (str(mchNumber), "GREEN", NetworkManager.timeValue.currentTime))
                        conn.commit()
                except Error as e:
                    print("sql insert green lamp on event error: ",e)
                finally:
                    conn.close()

            elif mes == "30":
                #print("received mess GREEN LAMP OFF")
                nwManager_.GreenLedOffSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_updateLampEvent % (NetworkManager.timeValue.currentTime, str(mchNumber), "GREEN", onlineTime))
                        conn.commit()
                except Error as e:
                    print("sql update green lamp off event error: ",e)
                finally:
                    conn.close()

            # processing with Quality Check
            elif mes == "41":
                #print("received mess Quality Check ON")
                nwManager_.QLTCheckOnSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_insertLampEvent % (str(mchNumber), "QLTC", NetworkManager.timeValue.currentTime))
                        conn.commit()
                except Error as e:
                    print("sql insert Quality Check on event error: ",e)
                finally:
                    conn.close()

            elif mes == "40":
                #print("received mess Quality Check OFF")
                nwManager_.QLTCheckOffSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_updateLampEvent % (NetworkManager.timeValue.currentTime, str(mchNumber), "QLTC", onlineTime))
                        conn.commit()
                except Error as e:
                    print("sql update Quality Check off event error: ",e)
                finally:
                    conn.close()

#-- THIS IS OLD CODE WITH IEAD: "ESP32 SEND JUST ACKNOWGLE COMPUTER IS NEW ROW.
#            elif mes == "7":
#                #print("received mess NEW ROUND")
#                nwManager_.NewRoundSignal.emit(mchNumber)
#                try:
#                    db_config = read_db_config()
#                    conn = MySQLConnection(**db_config)
#                    if conn.is_connected():
#                        cur = conn.cursor()
#                        cur.execute(SQL_updateRPS % (str(mchNumber), NetworkManager.Day, NetworkManager.Shift))
#                        conn.commit()
#                except Error as e:
#                    print("sql NEW ROUND error: ",e)
#                finally:
#                    conn.close()
#-- END

#-- THIS IS NEW CODE WITH IDEA:"ESP32 SEND SPEED ROUND OF MACHINE.
            elif len(mes) == 5:
                if mes[0] == "7":
                    nwManager_.NewRoundSignal.emit(mchNumber, mes[1:])
                    try:
                        db_config = read_db_config()
                        conn = MySQLConnection(**db_config)
                        if conn.is_connected():
                            cur = conn.cursor()
                            cur.execute(SQL_updateRPS % (str(mchNumber), NetworkManager.timeValue.workDay_, NetworkManager.timeValue.workShift_))#NetworkManager.Day, NetworkManager.Shift))
                            conn.commit()
                    except Error as e:
                        print("sql NEW ROUND error: ",e)
                    finally:
                        conn.close()


            elif mes == "8":
                #print("received mess BUTTON CLICKED")
                nwManager_.BtnClickedSignal.emit(mchNumber)
                try:
                    db_config = read_db_config()
                    conn = MySQLConnection(**db_config)
                    if conn.is_connected():
                        cur = conn.cursor()
                        cur.execute(SQL_insertBtnPressed % (str(mchNumber), NetworkManager.timeValue.currentTime))
                        conn.commit()
                except Error as e:
                    print("sql BUTTON CLICKED error: ",e)
                finally:
                    conn.close()

            elif mes == "9":
                #print("pipe's status is ok")
                for var in NetworkManager.listMch:
                    if var[2] == mchNumber and var[1][1] == address_[1]:
                        #print("rewrite to True", address_[1])
                        var[3] = True
            if not data:
                #print("Handler Mchine Connection's loop is break by no data")
                break
            # connection_.sendall(str.encode(response))
        except socket.error as e:
            print(address_[0] + ':' + str(address_[1]) + ":", e)
    #print("handler: connection " + address_[0] + ':' + str(address_[1]) + ":" + " to M" + mchNumber + ": is end job")
#    print("Close connection by command below")
#    connection_.close()
    # remove lost connection in mchList - START
    index = 0
    for varList in NetworkManager.listMch:
        if varList[1][1] == address_[1]:#varList[4] is True:  # connectionClosedFlag = True
            #print("Before Remove")
#            print(NetworkManager.listMch)
            NetworkManager.listMch.pop(index)
            #print("After Remove")
#            print(NetworkManager.listMch)
        else:
            index = index + 1
    # remove lost connection in mchList - END
    if NetworkManager.listAddress[int(mchNumber)-1] == address_[1]:
        nwManager_.lostConnectionSignal.emit()
    #print("end handler at address: ", address_[0], ":", address_[1], " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")


class NetworkManager(QObject):
    listMch = []
    listAddress = []
    serverSkt = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#    host = '192.168.1.96'
    host = ''
    port = 2003# right is: 2004 (2003 - just because go home - no one handle in night shift -> fake port)
    running = True
    currentTime = ""
    Day = ""
    Shift = ""
    startTimeOfShiftWorking = ""
    endTimeOfShiftWorking = ""

    timeValue = None

    # Signal
    newConnectedSignal = Signal()
    lostConnectionSignal = Signal()

    '''
      on running time signals:
      - mess = 11 -> yellow led on
      - mess = 10 -> yellow led off
      - mess = 21 -> red led on
      - mess = 20 -> red led off
      - mess = 31 -> green led on
      - mess = 30 -> green led off
      - mess = 41 -> quality Check on
      - mess = 40 -> quality Check off
      - mess = 7  -> new round
      - mess = 8  -> button clicked
      - mess = 9  -> connection still live
      ...
    '''
    YellowLedOnSignal = Signal(str)
    YellowLedOffSignal = Signal(str)
    RedLedOnSignal = Signal(str)
    RedLedOffSignal = Signal(str)
    GreenLedOnSignal = Signal(str)
    GreenLedOffSignal = Signal(str)
    QLTCheckOnSignal = Signal(str)
    QLTCheckOffSignal = Signal(str)

    NewRoundSignal = Signal(str, str) # 1st str: machine number, 2nd str: rotate speed
    BtnClickedSignal = Signal(str)

    def __init__(self, timeValue_):
        super(NetworkManager, self).__init__()
        NetworkManager.timeValue = timeValue_
        for i in range(1, 22):
            NetworkManager.listAddress.append(0)
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        s.connect(('<broadcast>', 0))
        #print("Your ip is:" + s.getsockname()[0])
        NetworkManager.host = s.getsockname()[0]

    def start(self):
        try:
            NetworkManager.serverSkt.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            NetworkManager.serverSkt.bind((NetworkManager.host, NetworkManager.port))
            print('Socket is listening..')
            NetworkManager.serverSkt.listen(5)
            _thread.start_new_thread(checkStatusAllNetworkPipe, ())
        except socket.error as e:
            print(str(e))
        while NetworkManager.running:
            connection, address = NetworkManager.serverSkt.accept()
            print('Connected to knitting machine: ' + address[0] + ':' + str(address[1]))
            _thread.start_new_thread(handler, (self, connection, address))
        NetworkManager.serverSkt.close()
        #print("sever closed")

    def stopNwMngTask(self):
        NetworkManager.running = False
        NetworkManager.serverSkt.shutdown(socket.SHUT_RDWR)
        NetworkManager.serverSkt.close()

#    @staticmethod
#    def updateTimeVariables():
#        now = datetime.datetime.now()
#        NetworkManager.currentTime = now.strftime("%Y-%m-%d %H:%M:%S")
#        if now.hour >= 6 and (now.hour <= 23 and now.minute <= 59 and now.second <= 59):
#            NetworkManager.Day = now.date().strftime("%Y-%m-%d")
#        else:
#            yesterday = now.date() - timedelta(days=1)
#            NetworkManager.Day = yesterday.strftime("%Y-%m-%d")

#        if now.hour >= 6 and (now.hour <= 15 and now.minute <= 59 and now.second <= 59):
#            NetworkManager.Shift = "Ngày"
#        else:
#            NetworkManager.Shift = "Đêm"

#        # update startTime and EndTime of Shift
#        today = now.date()
#        yesterday = today - timedelta(days=1)
#        tomorrow = today + timedelta(days=1)
#        if now.hour >= 0 and now.hour < 6:
#            NetworkManager.startTimeOfShiftWorking = yesterday.strftime("%Y-%m-%d") + " 16:00:01"
#            NetworkManager.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
#        elif now.hour >= 6 and now.hour < 16:
#            NetworkManager.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:01"
#            NetworkManager.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:00"
#        elif now.hour >= 16 and now.hour < 24:
#            NetworkManager.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:01"
#            NetworkManager.endTimeOfShiftWorking = tomorrow.strftime("%Y-%m-%d") + " 6:00:00"

    @Slot(int, int)
    def mchInfoRectSliderValueChange(self, mch_, sliderValue_):
        #print("on mchInfoRectSliderValueChange")
        #print("mch_", mch_)
        #print("sliderValue_", sliderValue_)
        if sliderValue_ == 1:
            NetworkManager.send(str(mch_), "2") # to say esp32 action: request worker confirm product is in good condition at the head shift working time.
        elif sliderValue_ == 2:
            NetworkManager.send(str(mch_), "1") # to say esp32 action: run as normal
        elif sliderValue_ == 3:
            NetworkManager.send(str(mch_), "1") # as above

    @staticmethod
    def send(mch_, mess):
        '''
        mess = "1" : run as normal
        mess = "2" : request worker confirm product's condition
        mess = "3" : disble machine because empty worker attendance
        mess = "4" : technician is adjusting machine
        '''
        #print("send to mch - mess:", mch_, mess)
        for mch in NetworkManager.listMch:
            #print(mch)
            if mch[2] == mch_:
                mch[0].sendall(str.encode(mess))
                #print("already send")

    @staticmethod
    def sendBroadCast(mess):
        for mch in NetworkManager.listMch:
            mch[0].sendall(str.encode(mess))


