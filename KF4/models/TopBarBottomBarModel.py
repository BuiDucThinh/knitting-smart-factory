# This Python file uses the following encoding: utf-8
import datetime
from datetime import timedelta
from PySide2.QtCore import QObject, Signal, Slot, QTimer
from supportClass.NetworkManager import NetworkManager
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error


class TopBarBottomBarModel(QObject):
    # Set mode: for testing software - firmware. for logic 'processing in some scenarios: comfirm quality at shift tranfer time; no worker is asigned; technician is adjust mch.
    mode = 2 # mode = 1: testing; mode = 2: run in real life.
    # Set time to request worker sign good or bad producing when shift tranfer
#    hourRequestDayShift = 6
#    minRequestDayShift = 30
#    hourRequestNightShift = 16
#    minRequestNightShift = 28

    # =================================================  MODEL'S SIGNALS
    timeChange = Signal(str)
    workDayChange = Signal(str)
    workShiftChange = Signal(str)
    workerNumChange = Signal(str)
    mchNumChange = Signal(str)
    rollNumChange = Signal(str)
    percentChange = Signal(str)

    refeshWorkerRoster = Signal()

    loadUserInformationWithNoBeepSound = Signal(list)
    loadUserInformationWithBeepSound = Signal(list)
    workerCheckAttendanceWithBeepSound = Signal(list, list)
    workerInformEndOfWorkDay = Signal(list)
    workerCheckAttendanceButInWrongTime = Signal()

    # =================================================  Send Signals to UI to inform Speaker Connect and Disconnect
    speakerConnected = Signal()
    speakerDisconnected = Signal()

    speakerConnected_WithNoSoundInform = Signal()
    speakerDisconnected_WithNoSoundInform = Signal()

    loadWorkerAttendanceList = Signal(str,list)

    newCNTForPrintSignal = Signal()
    rcvFileToPrintSignal = Signal()

    startTimerBackToHomePageSignal = Signal()

    workerEndWorkingShiftOnMch = Signal(str)

    reSetAllRectVisible = Signal()
    reSetAllRectUserLogin = Signal()

    updNextAudioNoteSpeakerUISignal = Signal(str)

    def __init__(self, networkManager_, ua0Listener_, homePageModel_, spkNwManager_, ftpPrint_, ua1Listener_, timeValue_):
        QObject.__init__(self)
        self.networkManager = networkManager_
        #NetworkManager.timeValue = timeValue_
        # for card sign in process
        self.ua0Listener = ua0Listener_
        self.ua0Listener.NewCardInfoSignal.connect(self.newCardInfoSlot)

        self.ua1Listener = ua1Listener_
        self.ua1Listener.NewCardInfoSignal.connect(self.workerCheckAttendance)

        self.ftpPrint = ftpPrint_
        self.ftpPrint.newConnectionForPrintSignal.connect(self.newCNTForPrintSignal)
        self.ftpPrint.receivedFileToPrintSignal.connect(self.rcvFileToPrintSignal)

        self.timeValue = timeValue_
        # Set time to request worker sign good or bad producing when shift tranfer
        self.hourRequestDayShift = self.timeValue.hourRequestDayShift_
        self.minRequestDayShift = self.timeValue.minRequestDayShift_
        self.hourRequestNightShift = self.timeValue.hourRequestNightShift_
        self.minRequestNightShift = self.timeValue.minRequestNightShift_

        self.currentTime = ""
        self.WorkInCompany = ""
        self.FirstName = ""
        self.LastName = ""
        self.Position = ""
        self.FaceImgURL = "../../userImages/noUser.svg"
        self.ID = 0
        # =====
        self.homePageModel = homePageModel_
        self.workerEndWorkingShiftOnMch.connect(self.homePageModel.workerCheckCardToInformEndWorkingShift)

        self.spkNwManager = spkNwManager_
        self.spkNwManager.newSpeakerConnectedSignal.connect(self.newSpeakerConnectedSlot)
        self.spkNwManager.lostSpeakerConnectionSignal.connect(self.speakerDisConnectedSlot)
        self.spkNwManager.updateNextAudioNoteSpeakerUISignal.connect(self.updNextAudioNoteSpeakerUISignal)
        self.timeValue.ControlSpeakerAtTranferTimeSignal.connect(self.spkNwManager.playAudioToInformWorkerComfirmQLTAtTranferShiftTime)


        self._time = None
        self._timeDTB = ""
        self.startTimeOfShiftWorking = ""
        self.endTimeOfShiftWorking = ""
        self._workDay = None
        self._workDayDTB = ""
        self._workShift = None
        self._workShiftDTB = ""
        self._workerNum = 0
        self._mchNum = 0
        self._rollNum = 0
        self._percent = 0

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTimeWork())
        self.timer.start(1000)

        self.justForWorkerAttendancePage_ImgUrl = ""
        self.justForWorkerAttendancePage_listMch = []


    @Slot()
    def startTimerBackToHomePage(self):
        self.startTimerBackToHomePageSignal.emit()


    @Slot()
    def userSignedOut(self):
        if self.Position != "":
            self.WorkInCompany = ""
            self.FirstName = ""
            self.LastName = ""
            self.Position = ""
            self.FaceImgURL = "../../userImages/noUser.svg"
            self.ID = 0
            self.fillUserInformation()
            self.reSetAllRectVisible.emit()
            self.reSetAllRectUserLogin.emit()

    @Slot()
    def fillUserInformation(self):
        data = []
        data.append(self.WorkInCompany)
        data.append(self.FirstName)
        data.append(self.LastName)
        data.append(self.Position)
        data.append(self.FaceImgURL)
        data.append(self.ID)
        self.loadUserInformationWithNoBeepSound.emit(data)

    @Slot()
    def fillSpeakerInformation(self):
        if len(self.spkNwManager.listSpk) == 0 :
            #print("doesn't have any speaker")
            self.speakerDisconnected_WithNoSoundInform.emit()
        else:
            #print("has some speaker")
            self.speakerConnected_WithNoSoundInform.emit()

    @Slot()
    def newSpeakerConnectedSlot(self):
        self.speakerConnected.emit()
        self.speakerConnected_WithNoSoundInform.emit()

    @Slot()
    def speakerDisConnectedSlot(self):
        self.speakerDisconnected.emit()
        self.speakerDisconnected_WithNoSoundInform.emit()

    @Slot(str)
    def newCardInfoSlot(self, cardUID_):
        statementSelectSQL = "SELECT WorkInCompany, FirstName, LastName, Position, FaceImgURL, ID FROM User WHERE CardUID = '%s'"
        statementUpdateSQL = "UPDATE UserLogin SET LogoutTime = '%s' WHERE LogoutTime IS NULL ORDER BY ID DESC LIMIT 1"
        statementInsertSQL = "INSERT INTO UserLogin(User_ID, LoginTime) VALUES ('%s', '%s')"
        data = []
        data_ = []
        self.currentTime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL % cardUID_)
                data = cur.fetchall()
                if len(data) != 0:
                    self.WorkInCompany = data[0][0]
                    self.FirstName = data[0][1]
                    self.LastName = data[0][2]
                    self.Position = data[0][3]
                    self.FaceImgURL = data[0][4]
                    self.ID = data[0][5]
                    for var in data[0]:
                        data_.append(var)
                    cur.execute(statementUpdateSQL % self.currentTime)
                    cur.execute(statementInsertSQL % (str(data_[5]), self.currentTime))
                    conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.loadUserInformationWithBeepSound.emit(data_)

    @Slot(str)
    def workerCheckAttendance(self, cardUID_):        
        '''
        algorithum: ??? ->
        scenarios: worker check card to card reader to "inform end shift work" or "get information about attendance"
        A/ get user information ( WorkInCompany, FirstName, LastName, Position, FaceImgURL, ID FROM User)
        B - inform end shift work
         1/ check in workerperformace where row has workerId, dayWork, workShift and Endtime is NULL... set endtime to currentime
        C - get information about attendance
         2/ if step B-1 has data of sql select statement returned is: 0 -> this worker will work in next shift
         3/ check time when card read cardid:
             -1: if time is before tranfer shift time 4 hours   : set shiftInSQLStatement = current shift
             -2: if time is after tranfer shift time 4 hours    : set shiftInSQLStatement = next shift
         4/ check to get list mch number in AsignWorkerNextShift where userid = id readed
        '''
        statementSelectSQL = "SELECT WorkInCompany, FirstName, LastName, Position, FaceImgURL, ID FROM User WHERE CardUID = '%s'"
        data = []
        userData_ = []
        statemenSelectWorkerPerformanceSQL = "SELECT ID, MchNumber, StartTime, PressTimeCounter FROM WorkerPerformance WHERE (User_ID = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL)"
        wPfmRows = []
        SQL_updateEndTimeSQL = "UPDATE WorkerPerformance SET EndTime = '%s' WHERE ID = '%s'"
        statementSelectMchAttendedToWorkerSQL = "SELECT MchNumber FROM AsignWorkerNextShift WHERE User_ID = '%s' AND Day = '%s' AND Shift = '%s'"
        listMchData_ = []
        listMch_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL % cardUID_)
                data = cur.fetchall()
                if len(data) != 0:
                    for var in data[0]:
                        userData_.append(var)
                    cur.execute(statemenSelectWorkerPerformanceSQL % (userData_[5], self.timeValue.workDay_, self.timeValue.workShift_))
                    wPfmRows = cur.fetchall()
                    for row in wPfmRows:
                        '''
                        Update endTime of shift working
                        '''
                        #print("end work shift -> action: end workerperformance row")
                        ID = row[0]
                        cur.execute(SQL_updateEndTimeSQL % (self.timeValue.currentTime, ID))
                        conn.commit()
                        '''
                        End working shift. Need to reduce machine's stop-time (stop by yarn breaking or fulling roll) by the longest time machine stop.
                        This is for get more precision reason. Because some scenario: When worker change Spandex or Yarn. This action is caculated to the time machine stop by software.
                        Need reduce this time.
                        '''
                        mchNumber = row[1]
                        getMaxTimeMchStop = "SELECT ID, HourStop, MinStop, SecondStop FROM MaxTimeStopWithLightNotify WHERE MachineNum = '%s'"
                        cur.execute(getMaxTimeMchStop % (mchNumber))
                        data = cur.fetchall()
                        if len(data) != 0:
                            maxH = data[0][1]
                            maxM = data[0][2]
                            maxS = data[0][3]
                        getTimeYellowRedTimeSQL = "SELECT YellowRedTimeMetterH, YellowRedTimeMetterM, YellowRedTimeMetterS, YellowRedCounter FROM WorkerPerformance WHERE ID = '%s'"
                        cur.execute(getTimeYellowRedTimeSQL % (ID))
                        dataTemp1 = cur.fetchall()
                        if len(dataTemp1) != 0:
                            oldH = dataTemp1[0][0]
                            oldM = dataTemp1[0][1]
                            oldS = dataTemp1[0][2]
                            oldCounter = dataTemp1[0][3]
                            newH = 0
                            newM = 0
                            newS = 0
                            newCounter = 0
                            if oldS >= maxS:
                                newS = oldS - maxS
                            else:
                                newS = oldS + 60 - maxS
                                oldM = oldM - 1
                                if oldM < 0:
                                    oldM = 0
                            if oldM >= maxM:
                                newM = oldM - maxM
                            else:
                                newM = oldM + 60 - maxM
                                oldH = oldH - 1
                                if oldH < 0:
                                    oldH = 0
                            newH = oldH - maxH
                            if newH < 0:
                                newH = 0
                            if oldCounter > 1:
                                newCounter = oldCounter - 1
                            updateTimeMachineStopSQL = "UPDATE WorkerPerformance SET YellowRedTimeMetterH = '%s', YellowRedTimeMetterM = '%s', YellowRedTimeMetterS = '%s', YellowRedCounter = '%s' WHERE ID = '%s'"
                            cur.execute(updateTimeMachineStopSQL % (newH, newM, newS, newCounter, ID))
                            conn.commit()

                        self.workerEndWorkingShiftOnMch.emit(str(row[1]))
                        if self.timeValue.disableMchPermit == True:
                            #print("end work shift -> action: disable machine")
                            self.networkManager.send(str(row[1]), "3")
                    if len(wPfmRows) != 0:
                        # end work shift -> computer say: thank you to worker
                        self.workerInformEndOfWorkDay.emit(userData_)
                    else:
                        # check attendace"
                        #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        now = datetime.datetime.now()
                        #ex: 6h20'01 -> 8h20'00
                        if self.checkTime1BeforeTime2(self.timeValue.checkAtdHour_lds,self.timeValue.checkAtdMin_lds,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.timeValue.checkAtdHour_rds,self.timeValue.checkAtdMin_rds,0):
                            #print("worker Check Attendance Day Shift")
                            cur.execute(statementSelectMchAttendedToWorkerSQL % (userData_[5], self.timeValue.workDay_, "Ngày"))
                            listMchData_ = cur.fetchall()
                            for dataRow in listMchData_:
                                listMch_.append(dataRow[0])
                                self.justForWorkerAttendancePage_listMch.append(dataRow[0])
                            self.justForWorkerAttendancePage_ImgUrl = userData_[4]
                            self.workerCheckAttendanceWithBeepSound.emit(userData_, listMch_)
                        elif self.checkTime1BeforeTime2(self.timeValue.checkAtdHour_lns,self.timeValue.checkAtdMin_lns,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.timeValue.checkAtdHour_rns,self.timeValue.checkAtdMin_rns,0):
                            #print("worker Check Attendance Night Shift")
                            cur.execute(statementSelectMchAttendedToWorkerSQL % (userData_[5], self.timeValue.workDay_, "Đêm"))
                            listMchData_ = cur.fetchall()
                            for dataRow in listMchData_:
                                listMch_.append(dataRow[0])
                                self.justForWorkerAttendancePage_listMch.append(dataRow[0])
                            self.justForWorkerAttendancePage_ImgUrl = userData_[4]
                            self.workerCheckAttendanceWithBeepSound.emit(userData_, listMch_)
                        else:
                            #print("workerCheckAttendanceButInWrongTime")
                            self.workerCheckAttendanceButInWrongTime.emit()
                        #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        # temp: just for testing. ======================================================================================================================================
                        #print(statementSelectMchAttendedToWorkerSQL % (userData_[5], self.timeValue.nextWorkDay_, "Ngày"))
#                        cur.execute(statementSelectMchAttendedToWorkerSQL % (userData_[5], self.timeValue.nextWorkDay_, "Ngày"))
#                        listMchData_ = cur.fetchall()
#                        #print(listMchData_)
#                        for dataRow in listMchData_:
#                            #print(dataRow)
#                            listMch_.append(dataRow[0])
#                            self.justForWorkerAttendancePage_listMch.append(dataRow[0])
#                        self.justForWorkerAttendancePage_ImgUrl = userData_[4]
#                        self.workerCheckAttendanceWithBeepSound.emit(userData_, listMch_)
                        # end temp ======================================================================================================================================================
        except Error as e:
            print(e)
        finally:
            conn.close()

    @Slot()
    def initializingMchAttendanceList(self):
        if self.justForWorkerAttendancePage_ImgUrl == "" and self.ID != 0:
            statementSelectMchAttendedToWorkerSQL = "SELECT MchNumber FROM AsignWorkerNextShift WHERE User_ID = '%s' AND Day = '%s' AND Shift = '%s'"
            listMchData_ = []
            listMch_ = []
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    #print("check attendace")
                    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        now = datetime.datetime.now()
#                        #ex: 6h20'01 -> 8h20'00
#                        if self.checkTime1BeforeTime2(self.timeValue.checkAtdHour_lds,self.timeValue.checkAtdMin_lds,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.timeValue.checkAtdHour_rds,self.timeValue.checkAtdMin_rds,0):
#                            #print("worker Check Attendance Day Shift")
#                            cur.execute(statementSelectMchAttendedToWorkerSQL % (self.ID, self.timeValue.workDay_, "Ngày"))
#                            listMchData_ = cur.fetchall()
#                            for dataRow in listMchData_:
#                                print(dataRow)
#                                listMch_.append(dataRow[0])
#                                self.justForWorkerAttendancePage_listMch.append(dataRow[0])
#                            self.justForWorkerAttendancePage_ImgUrl = self.FaceImgURL
#                        elif self.checkTime1BeforeTime2(self.timeValue.checkAtdHour_lns,self.timeValue.checkAtdMin_lns,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.timeValue.checkAtdHour_rns,self.timeValue.checkAtdMin_rns,0):
#                            #print("worker Check Attendance Night Shift")
#                            cur.execute(statementSelectMchAttendedToWorkerSQL % (self.ID, self.timeValue.workDay_, "Đêm"))
#                            listMchData_ = cur.fetchall()
#                            for dataRow in listMchData_:
#                                print(dataRow)
#                                listMch_.append(dataRow[0])
#                                self.justForWorkerAttendancePage_listMch.append(dataRow[0])
#                            self.justForWorkerAttendancePage_ImgUrl = self.FaceImgURL
#                        else:
#                            #print("workerCheckAttendanceButInWrongTime")
#                            self.workerCheckAttendanceButInWrongTime.emit()
                    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                    # temp: just for testing. ======================================================================================================================================
                    #print(statementSelectMchAttendedToWorkerSQL % (self.ID, self.timeValue.nextWorkDay_, "Ngày"))
                    cur.execute(statementSelectMchAttendedToWorkerSQL % (self.ID, self.timeValue.nextWorkDay_, "Ngày"))
                    listMchData_ = cur.fetchall()
                    #print(listMchData_)
                    for dataRow in listMchData_:
                        #print(dataRow)
                        listMch_.append(dataRow[0])
                        self.justForWorkerAttendancePage_listMch.append(dataRow[0])
                    self.justForWorkerAttendancePage_ImgUrl = self.FaceImgURL
                    # end temp ======================================================================================================================================================
            except Error as e:
                print(e)
            finally:
                conn.close()
        self.loadWorkerAttendanceList.emit(self.justForWorkerAttendancePage_ImgUrl, self.justForWorkerAttendancePage_listMch)
        self.justForWorkerAttendancePage_listMch.clear()
        self.justForWorkerAttendancePage_ImgUrl = ""

    def checkTime1BeforeTime2(self, hour1, min1, second1, hour2, min2, second2):
        if hour1 < hour2:
            return True
        elif hour1 == hour2:
            if min1 < min2:
                return True
            elif min1 == min2:
                if second1 < second2:
                    return True
                elif second1 == second2:
                    return False
                elif second1 > second2:
                    return False
            elif min1 > min2:
                return False
        elif hour1 > hour2:
            return False

    def setTimeWork(self):
        now = datetime.datetime.now()
        self.set_time(now.strftime("%H:%M:%S %p | %d/%m/%Y"))
        self.set_workDay(self.timeValue.workDayTimeLibVariable_)
        self.set_workShift(self.timeValue.workShift_)

    # update value of start and end time of working shift
    def updateFiveTimeSet(self):
        now = datetime.datetime.now()
        today = now.date()
        yesterday = today - timedelta(days=1)
        tomorrow = today + timedelta(days=1)
        self._timeDTB = now.strftime("%Y-%m-%d %H:%M:%S")
        if now.hour >= 0 and now.hour < 6:
            self.startTimeOfShiftWorking = yesterday.strftime("%Y-%m-%d") + " 16:00:01"
            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
            self._workDayDTB = yesterday.strftime("%Y-%m-%d")
            self._workShiftDTB = "Đêm"
        elif now.hour >= 6 and now.hour < 16:
            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:01"
            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:00"
            self._workDayDTB = today.strftime("%Y-%m-%d")
            self._workShiftDTB = "Ngày"
        elif now.hour >= 16 and now.hour < 24:
            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:01"
            self.endTimeOfShiftWorking = tomorrow.strftime("%Y-%m-%d") + " 6:00:00"
            self._workDayDTB = today.strftime("%Y-%m-%d")
            self._workShiftDTB = "Đêm"

    # _time =======================================
    def get_time(self):
        return self._time

    def set_time(self, value):
        self._time = value
        self.timeChange.emit(value)

    # _workDay ====================================
    def get_workDay(self):
        return self._workDay

    def set_workDay(self, value):
        self._workDay = value
        self.workDayChange.emit(value.strftime("- %d/%m/%Y"))

    # _workShift ====================================
    def get_workShift(self):
        return self._workShift

    def set_workShift(self, value):
        self._workShift = value
        self.workShiftChange.emit(str(value))

    # _workerNum ====================================
    def get_workerNum(self):
        return self._workerNum

    def set_workerNum(self, value):
        self._workerNum = value
        self.workerNumChange.emit(":" + str(value))

    # _mchNum ====================================
    def get_mchNum(self):
        return self._mchNum

    def set_mchNum(self, value):
        self._mchNum = value
        self.mchNumChange.emit(":" + str(value))

    # _rollNum ====================================
    def get_rollNum(self):
        return self._rollNum

    def set_rollNum(self, value):
        self._rollNum = value
        self.rollNumChange.emit(":" + str(value))

    # _percent ====================================
    def get_percent(self):
        return self._percent

    def set_percent(self, value):
        self._percent = value
        self.percentChange.emit(":" + str(value) + "%")

