# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal, QTimer
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from copy import deepcopy
from supportClass.UdpWatchServer import UdpWatchServer
from supportClass.NetworkManager import NetworkManager
import datetime
import math

class WorkerPerformanceScore():
    def __init__(self, ID, faceImgUrl):
        self.ID_ = ID
        self.faceImgUrl_ = faceImgUrl

        self.checkedTimeCounter_ = 0

        self.workedShift_ = 0
        self.periodCheckTime_ = 999
        self.timeToEndYarnBreakFullRoll_ = 999
        self.numberDetectFaultAtTranferTime = 0
        self.numberOfKnitSMYOWY = 0
        self.numberBadClean = 0
        self.numberLetFaultAtTranferTime = 0
        self.kgDefectProduct = 0.0

        self.workedShiftScore_ = 0.0
        self.checkedTimeScore_ = 0.0
        self.timeToEndYarnBreakFullRollScore_ = 0.0
        self.numberOfKnitSMYOWYScore_ = 0.0
        self.numberDetectFaultAtTranferTimeScore_ = 0.0
        self.numberLetFaultAtTranferTimeScore_ = 0.0
        self.numberBadCleanScore_ = 0.0
        self.kgDefectProductScore_ = 0.0
        self.totalScore_ = 0.0

        '''
        9%
        1/ workedShift_
        2/ workedShiftScore_

        20%
        3/ periodCheckTime_
        4/ checkedTimeScore_

        4%
        5/ timeToEndYarnBreakFullRoll_
        6/ timeToEndYarnBreakFullRollScore_

        10%
        7/ numberDetectFaultAtTranferTime
        8/ numberDetectFaultAtTranferTimeScore_

        5%
        9/  numberOfKnitSMYOWY
        10/ numberOfKnitSMYOWYScore_

        6%
        11/ numberBadClean
        12/ numberBadCleanScore_

        6%
        13/ numberLetFaultAtTranferTime
        14/ numberLetFaultAtTranferTimeScore_

        40%
        15/ kgDefectProduct
        16/ kgDefectProductScore_
        '''

    def __repr__(self):
        return '{' + self.faceImgUrl_ + ', ' + str(self.workedShift_) + ', ' + str(self.workedShiftScore_) + ', ' + str(self.periodCheckTime_) + ', ' + str(self.checkedTimeScore_) + ', ' + str(self.timeToEndYarnBreakFullRoll_) + ', ' + str(self.timeToEndYarnBreakFullRollScore_) + ', ' + str(self.numberDetectFaultAtTranferTime) + ', ' + str(self.numberDetectFaultAtTranferTimeScore_) + ', ' + str(self.numberOfKnitSMYOWY) + ', ' + str(self.numberOfKnitSMYOWYScore_) + ', ' + str(self.numberBadClean) + ', ' + str(self.numberBadCleanScore_) + ', ' + str(self.numberLetFaultAtTranferTime) + ', ' + str(self.numberLetFaultAtTranferTimeScore_) + ', ' + str(self.kgDefectProductScore_) + ', ' + str(self.kgDefectProductScore_) + ', ' + str(self.totalScore_) + '}'

class RectData():
    def __init__(self, mchNumber_):
        self.mchNum = mchNumber_

        # worker performance indexs part.
        self.faceName_ = ""
        self.faceImgUrl_ = ""
        self.sliderValue_ = 2
        self.rounds = 0
        self.caculatedRolls = 0.0
        self.realRolls = 0
        self.pressTimeCounter = 0

        # time counter for 1 time machine stop
        self.machineStopH = 0
        self.machineStopM = 0
        self.machineStopS = 0

        # time meter and couter part
        self.qLTCheckTimeMetterH = 0
        self.qLTCheckTimeMetterM = 0
        self.qLTCheckTimeMetterS = 0
        self.qLTCheckCounter = 0

        self.yellowRedTimeMetterH = 0
        self.yellowRedTimeMetterM = 0
        self.yellowRedTimeMetterS = 0
        self.yellowRedCounter = 0

        self.greenTimeMetterH = 0
        self.greenTimeMetterM = 0
        self.greenTimeMetterS = 0
        self.greenTimeConter = 0

        # fabric specific info part.
        self.fabricPrintCode = ""
        self.fabricRoundsPerRoll = 1

        # for control
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.oneSecondTimerTask())

        # for blink control
        self.qualityCheckBlink = False
        self.yellowLampBlink = False
        self.redLampBlink = False
        self.greenBlink = False

        #for new idea - idea from 25-5-22
        self.watchNumber = 0

    # NEED TO UPDATE PROPERTIES
    def lostConnection(self):
        #print("HomePageModel.py - RectData Object: lostConnection function called")
        self.timer.stop()
        self.qualityCheckBlink = False
        self.yellowLampBlink = False
        self.redLampBlink = False
        self.greenBlink = False

    # NEED TO UPDATE PROPERTIES
    def roundIncrease(self):
        self.rounds = self.rounds + 1
        self.caculatedRolls = round(self.rounds/self.fabricRoundsPerRoll, 2)

    # NEED TO UPDATE PROPERTIES
    def pressTimeCounterIncrease(self):
        self.pressTimeCounter = self.pressTimeCounter + 1

    #================================================================================================================ QUALITY CHECK
    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    # quality check request
    def qltCheckOn(self):
        # print("HomePageModel.py - RectData Object: qtlCheckOn function called")
        # update properties
        self.qualityCheckBlink = True
        self.qLTCheckCounter = self.qLTCheckCounter + 1
        self.timer.start(1000)
        if (self.yellowLampBlink != True and self.redLampBlink != True and self.greenBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    UdpWatchServer.send(str(data[0][0]), "*N" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()

    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    def qltCheckOff(self):
        # print("HomePageModel.py - RectData Object: qtlCheckOff function called")
        self.qualityCheckBlink = False
        if self.qualityCheckBlink is False and self.yellowLampBlink is False and self.redLampBlink is False and self.greenBlink is False:
            self.timer.stop()
        if (self.yellowLampBlink != True and self.redLampBlink != True and self.greenBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        UdpWatchServer.send(str(data[0][0]), "*F" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()

    #================================================================================================================ YELLOW LAMP
    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    # yellow lamp blink
    def yellowLedBlinkOn(self):
        self.yellowLampBlink = True
        self.yellowRedCounter = self.yellowRedCounter + 1
        # reset timer counter for this machine stop event.
        self.machineStopH = 0
        self.machineStopM = 0
        self.machineStopS = 0
        self.timer.start(1000)
        if (self.qualityCheckBlink != True and self.redLampBlink != True and self.greenBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    UdpWatchServer.send(str(data[0][0]), "*N" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()


    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    def yellowLedBlinkOff(self):
        self.yellowLampBlink = False
        if self.qualityCheckBlink is False and self.yellowLampBlink is False and self.redLampBlink is False and self.greenBlink is False:
            self.timer.stop()
        if (self.qualityCheckBlink != True and self.redLampBlink != True and self.greenBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        UdpWatchServer.send(str(data[0][0]), "*F" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()

    #================================================================================================================ RED LAMP
    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    # red lamp blink
    def redLedBlinkOn(self):
        self.redLampBlink = True
        self.yellowRedCounter = self.yellowRedCounter + 1
        # reset timer counter for this machine stop event.
        self.machineStopH = 0
        self.machineStopM = 0
        self.machineStopS = 0
        self.timer.start(1000)
        if (self.qualityCheckBlink != True and self.yellowLampBlink != True and self.greenBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    UdpWatchServer.send(str(data[0][0]), "*N" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()

    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    def redLedBlinkOff(self):
        self.redLampBlink = False
        if self.qualityCheckBlink is False and self.yellowLampBlink is False and self.redLampBlink is False and self.greenBlink is False:
            self.timer.stop()
        if (self.qualityCheckBlink != True and self.yellowLampBlink != True and self.greenBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        UdpWatchServer.send(str(data[0][0]), "*F" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()
    #================================================================================================================ GREEN LAMP
    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    # green lamp blink
    def greenLedBlinkOn(self):
        self.greenBlink = True
        self.greenTimeConter = self.greenTimeConter + 1
        self.timer.start(1000)
        if (self.qualityCheckBlink != True and self.yellowLampBlink != True and self.redLampBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        UdpWatchServer.send(str(data[0][0]), "*N" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()

    # NEED TO UPDATE PROPERTIES + NEED TO SEND NOTIFY MESSAGE TO WATCH
    def greenLedBlinkOff(self):
        self.greenBlink = False
        if self.qualityCheckBlink is False and self.yellowLampBlink is False and self.redLampBlink is False and self.greenBlink is False:
            self.timer.stop()
        if (self.qualityCheckBlink != True and self.yellowLampBlink != True and self.redLampBlink != True):
            # send notify to watch
            statemenSQLSelectWatchNumber = "SELECT \
            WatchNumber \
            FROM WorkerPerformance WKPFM_ROW \
            JOIN User USER_ROW ON USER_ROW.ID = WKPFM_ROW.User_ID \
            WHERE MchNumber = '%s' ORDER BY WKPFM_ROW.ID DESC LIMIT 1"
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(statemenSQLSelectWatchNumber % (str(self.mchNum)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        UdpWatchServer.send(str(data[0][0]), "*F" + str(self.mchNum) + "-")
            except Error as e:
                print("sql get watch number error: ", e)
            finally:
                conn.close()

    def oneSecondTimerTask(self):
        if self.qualityCheckBlink is True:
            self.qLTCheckTimeMetterS = self.qLTCheckTimeMetterS + 1
            if(self.qLTCheckTimeMetterS == 60):
                self.qLTCheckTimeMetterS = 0
                self.qLTCheckTimeMetterM = self.qLTCheckTimeMetterM + 1
                if (self.qLTCheckTimeMetterM == 60):
                    self.qLTCheckTimeMetterM = 0
                    self.qLTCheckTimeMetterH = self.qLTCheckTimeMetterH + 1

        elif self.yellowLampBlink is True:
            self.yellowRedTimeMetterS = self.yellowRedTimeMetterS + 1
            if self.yellowRedTimeMetterS == 60:
                self.yellowRedTimeMetterS = 0
                self.yellowRedTimeMetterM = self.yellowRedTimeMetterM + 1
                if self.yellowRedTimeMetterM == 60:
                    self.yellowRedTimeMetterM = 0
                    self.yellowRedTimeMetterH = self.yellowRedTimeMetterH + 1
            # time counter for this machine stop event.
            self.machineStopS = self.machineStopS + 1
            if self.machineStopS == 60:
                self.machineStopS = 0
                self.machineStopM = self.machineStopM + 1
                if self.machineStopM == 60:
                    self.machineStopM = 0
                    self.machineStopH = self.machineStopH + 1

        elif self.redLampBlink is True:
            self.yellowRedTimeMetterS = self.yellowRedTimeMetterS + 1
            if self.yellowRedTimeMetterS == 60:
                self.yellowRedTimeMetterS = 0
                self.yellowRedTimeMetterM = self.yellowRedTimeMetterM + 1
                if self.yellowRedTimeMetterM == 60:
                    self.yellowRedTimeMetterM = 0
                    self.yellowRedTimeMetterH = self.yellowRedTimeMetterH + 1
            # time counter for this machine stop event.
            self.machineStopS = self.machineStopS + 1
            if self.machineStopS == 60:
                self.machineStopS = 0
                self.machineStopM = self.machineStopM + 1
                if self.machineStopM == 60:
                    self.machineStopM = 0
                    self.machineStopH = self.machineStopH + 1

        elif self.greenBlink is True:
            self.greenTimeMetterS = self.greenTimeMetterS + 1
            if self.greenTimeMetterS == 60:
                self.greenTimeMetterS = 0
                self.greenTimeMetterM = self.greenTimeMetterM + 1
                if self.greenTimeMetterM == 60:
                    self.greenTimeMetterM = 0
                    self.greenTimeMetterH = self.greenTimeMetterH + 1
            # time counter for this machine stop event.
            self.machineStopS = self.machineStopS + 1
            if self.machineStopS == 60:
                self.machineStopS = 0
                self.machineStopM = self.machineStopM + 1
                if self.machineStopM == 60:
                    self.machineStopM = 0
                    self.machineStopH = self.machineStopH + 1

    def applyWorkerPerformanceIndexsData(self, listData_):
        self.faceName_ = listData_[0]
        self.faceImgUrl_ = listData_[1]
        self.sliderValue_ = listData_[2]
        self.rounds = listData_[3]
        self.caculatedRolls = listData_[4]
        self.realRolls = listData_[5]
        self.pressTimeCounter = listData_[6]

        self.qLTCheckTimeMetterH = listData_[7]
        self.qLTCheckTimeMetterM = listData_[8]
        self.qLTCheckTimeMetterS = listData_[9]
        self.qLTCheckCounter = listData_[10]

        self.yellowRedTimeMetterH = listData_[11]
        self.yellowRedTimeMetterM = listData_[12]
        self.yellowRedTimeMetterS = listData_[13]
        self.yellowRedCounter = listData_[14]

        self.greenTimeMetterH = listData_[15]
        self.greenTimeMetterM = listData_[16]
        self.greenTimeMetterS = listData_[17]
        self.greenTimeConter = listData_[18]
        self.watchNumber = listData_[19]

    def applyFabricInfoSpec(self, listData_):
        self.fabricPrintCode = listData_[0]
        self.fabricRoundsPerRoll = listData_[1]



class HomePageModel(QObject):

    # homePage's Signal
    initializingOnlineState = Signal(list)
    newMchConnected = Signal(list)
    lostMchConnection = Signal(list)

    fill_fabricTypeAndRoundsNum = Signal(list)

    setRPS = Signal(list)

    yellowLedBlinkOn = Signal(str)
    yellowLedBlinkOff = Signal(str)
    redLedBlinkOn = Signal(str)
    redLedBlinkOff = Signal(str)
    greenLedBlinkOn = Signal(str)
    greenLedBlinkOff = Signal(str)
    qLTCheckOn = Signal(str)
    qLTCheckOff = Signal(str)

    newRound = Signal(str, str)
    btnClicked = Signal(str)

    setCountNum = Signal(list)
    setTimeMetter = Signal(list)

    setAllSliderToOne = Signal()

    fillWorkerPerformanceUI = Signal(list)
    fillFabricSpecsUI = Signal(list)
    fillBlinkStatesUI = Signal(list)

    fillNumberWorkerUI = Signal(str)

    refeshHomePageSignal = Signal()
    refeshScoreTableSignal = Signal(list)

    inTimeToRequestWorkerComfirmQLTFlag = False

    def __init__(self, networkManager_, timeValue_):
        QObject.__init__(self)
        self.networkManager = networkManager_
        self.networkManager.newConnectedSignal.connect(self.newConnectSlot)
        self.networkManager.lostConnectionSignal.connect(self.lostConnectionSlot)

        self.networkManager.YellowLedOnSignal.connect(self.yellowLedBlinkOn)
        self.networkManager.YellowLedOffSignal.connect(self.yellowLedBlinkOff)
        self.networkManager.YellowLedOnSignal.connect(self.yellowLedBlinkOnSlot)
        self.networkManager.YellowLedOffSignal.connect(self.yellowLedBlinkOffSlot)

        self.networkManager.RedLedOnSignal.connect(self.redLedBlinkOn)
        self.networkManager.RedLedOffSignal.connect(self.redLedBlinkOff)
        self.networkManager.RedLedOnSignal.connect(self.redLedBlinkOnSlot)
        self.networkManager.RedLedOffSignal.connect(self.redLedBlinkOffSlot)

        self.networkManager.GreenLedOnSignal.connect(self.greenLedBlinkOn)
        self.networkManager.GreenLedOnSignal.connect(self.greenLedBlinkOnSlot)
        self.networkManager.GreenLedOffSignal.connect(self.greenLedBlinkOff)
        self.networkManager.GreenLedOffSignal.connect(self.greenLedBlinkOffSlot)

        self.networkManager.QLTCheckOnSignal.connect(self.qLTCheckOn) # forward signal to UI to blink 'check quality' icon.
        self.networkManager.QLTCheckOnSignal.connect(self.qLTCheckOnSlot) # plug this signal to slot of Model to effect some data and DTB.
        self.networkManager.QLTCheckOffSignal.connect(self.qLTCheckOff)
        self.networkManager.QLTCheckOffSignal.connect(self.qLTCheckOffSlot)

        self.networkManager.NewRoundSignal.connect(self.newRound)
        self.networkManager.NewRoundSignal.connect(self.newRoundSlot)

        self.networkManager.BtnClickedSignal.connect(self.btnClicked)
        self.networkManager.BtnClickedSignal.connect(self.btnClickedSlot)

        self.timeValue = timeValue_
        self.timeValue.TimeToRequestWorkerSignQualityAtTranferTimeSignal.connect(self.TimeToRequestWorkerSignQualityAtTranferTimeSlot)
        self.timeValue.UpdateOfflineTimeSignal.connect(self.UpdateOfflineTimeSlot)

        # for scenario: at reatime 6h40 (16h40), computer isn't turned on. So change Worker Roster function isn't called. We need to check this problem and action if need
        now = datetime.datetime.now()
        if (now.hour >= self.timeValue.startHourDayShift and now.minute >= self.timeValue.startMinuteDayShift) or (now.hour >= self.timeValue.startHourNightShift and now.minute >= self.timeValue.startMinuteNightShift):
            self.checkNextWorkerRosterIsApplied()

        self.listOnlineMch = []

        # data performance for 21 machine
        self.rectDataList = []
        for i in range(1, 22):
            self.rectDataList.append(RectData(i))

        # data worker's performance scores
        self.workerPerformanceScoreList = []
        self.refreshWorkerPerformanceScoreTableUI()

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.refreshWorkerPerformanceScoreTableUI())
        self.timer.start(20000)

    @Slot()
    def UpdateOfflineTimeSlot(self):
        sqlUpdateOfflineTime = "UPDATE MachineOnlineEvent SET OfflineTime = '%s' WHERE MachineNum = '%s' ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                for mch in self.listOnlineMch:
                    cur.execute(sqlUpdateOfflineTime % (self.timeValue.currentTime ,mch))
                    conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()

    @Slot()
    def lv_scoreTableCompleted(self):
        self.refreshWorkerPerformanceScoreTableUI()

    # Re calculate worker performance score -> Re sort by total score -> update to UI
    def refreshWorkerPerformanceScoreTableUI(self):
        self.workerPerformanceScoreList.clear()

        selectWorkerSQL = "SELECT ID, FaceImgURL FROM User WHERE Position = '%s' AND WorkInCompany = '%s'"
        workerList = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(selectWorkerSQL % ("NGHỆ NHÂN DỆT", "Đang Làm"))
                workerList = cur.fetchall()
                # start to caculate all specs of worker
                if len(workerList) != 0:
                    index = 0
                    listDate = []
                    for worker in workerList:
                        listDate.clear()
                        if worker[0] != 0:
                            workerID = worker[0]
                            workerFaceImgUrl = worker[1]
                            self.workerPerformanceScoreList.append(WorkerPerformanceScore(workerID, workerFaceImgUrl))
                            # **** A Calculate period time check of all worker.
                            #   a. Calculate press time counter
                            selectWkPerformaceSQL = "SELECT PressTimeCounter, sliderValue, WorkDay, YellowRedTimeMetterH, YellowRedTimeMetterM, GreenTimeMetterH, GreenTimeMetterM, YellowRedCounter, GreenTimeConter, KnitSmallYarnRoll, KnitWeakYarn FROM WorkerPerformance WHERE (User_ID = '%s' AND month(WorkDay) = '%s' AND year(WorkDay) = '%s')"
                            cur.execute(selectWkPerformaceSQL % (workerID, self.timeValue.workingMonth, self.timeValue.workingYear))
                            workerPerformanceList = cur.fetchall()
                            pressTimeTotal = 0
                            if len(workerPerformanceList) != 0:
                                for wPR in workerPerformanceList:
                                    '''
                                    wPR[0] : PressTimeCounter
                                    '''
                                    pressTimeTotal = pressTimeTotal + wPR[0]
                            #   b. Calculate total time worker control knitting machine
                            selectTimeControlSQL = "SELECT OnlineTime, OfflineTime FROM MachineOnlineEvent WHERE (User_ID = '%s' AND month(DayWork) = '%s' AND year(DayWork) = '%s')"
                            cur.execute(selectTimeControlSQL % (workerID, self.timeValue.workingMonth, self.timeValue.workingYear))
                            workerControlTimeList = cur.fetchall()
                            timeWorkTotal = 0
                            if len(workerControlTimeList) != 0:
                                for wCT in workerControlTimeList:
                                    '''
                                    wCT[0] : OnlineTime
                                    wCT[1] : OfflineTime
                                    '''
                                    timeWorkTotal = timeWorkTotal + (wCT[1] - wCT[0]).total_seconds()/60

                            if pressTimeTotal != 0:
                                self.workerPerformanceScoreList[index].periodCheckTime_ = round(timeWorkTotal/pressTimeTotal, 1)
                                self.workerPerformanceScoreList[index].checkedTimeCounter_ = pressTimeTotal
                            else:
                                self.workerPerformanceScoreList[index].periodCheckTime_ = 999 # 999 it is meaning: plus infinity -> worker don't check any time.
                                self.workerPerformanceScoreList[index].checkedTimeCounter_ = 0

                            # **** B Calculate number of work day of worker.
                            totalWorkedDay = 0
                            if len(workerPerformanceList) != 0:
                                for wPR in workerPerformanceList:
                                    '''
                                    wPR[1] : sliderValue
                                    wPR[2] : WorkDay
                                    '''
                                    if wPR[1] != 1:
                                        if wPR[2].strftime("%Y/%m/%d") not in listDate:
                                            listDate.append(wPR[2].strftime("%Y/%m/%d"))
                                            totalWorkedDay = totalWorkedDay + 1
                            self.workerPerformanceScoreList[index].workedShift_ = totalWorkedDay

                            # **** C Calculate time to process for 1 machine stop event (by yarn break, full roll).
                            '''
                            YellowRedTimeMetterH = wPR[3]
                            YellowRedTimeMetterM = wPR[4]
                            GreenTimeMetterH = wPR[5]
                            GreenTimeMetterM = wPR[6]
                            YellowRedCounter = wPR[7]
                            GreenTimeConter = wPR[8]
                            '''
                            totalStopTime = 0
                            totalStopCounter = 0
                            if len(workerPerformanceList) != 0:
                                for wPR in workerPerformanceList:
                                    YellowRedTimeMetterH = wPR[3]
                                    YellowRedTimeMetterM = wPR[4]
                                    GreenTimeMetterH = wPR[5]
                                    GreenTimeMetterM = wPR[6]
                                    YellowRedCounter = wPR[7]
                                    GreenTimeConter = wPR[8]
                                    totalStopTime = YellowRedTimeMetterH*60 + YellowRedTimeMetterM + GreenTimeMetterH*60 + GreenTimeMetterM
                                    totalStopCounter = totalStopCounter + YellowRedCounter + GreenTimeConter
                                if totalStopCounter != 0:
                                    self.workerPerformanceScoreList[index].timeToEndYarnBreakFullRoll_ = round(totalStopTime/totalStopCounter, 1)
#                                    if self.workerPerformanceScoreList[index].timeToEndYarnBreakFullRoll_ == 0.0: # 0.0000...x equal 0.0
#                                        self.workerPerformanceScoreList[index].timeToEndYarnBreakFullRoll_ = 999
                                else:
                                    self.workerPerformanceScoreList[index].timeToEndYarnBreakFullRoll_ = 999

                            # **** D Calculate number of Shift, In Which Worker Knit Small Yarn Roll or Weak Yarn.
                            '''
                            KnitSmallYarnRoll = wPR[9]
                            KnitWeakYarn = wPR[10]
                            '''
                            numberOfShiftKnitSYROWY = 0
                            if len(workerPerformanceList) != 0:
                                for wPR in workerPerformanceList:
                                    KnitSmallYarnRoll = wPR[9]
                                    KnitWeakYarn = wPR[10]
                                if KnitSmallYarnRoll == 1 or KnitWeakYarn == 1:
                                    numberOfShiftKnitSYROWY = numberOfShiftKnitSYROWY + 1
                            self.workerPerformanceScoreList[index].numberOfKnitSMYOWY = numberOfShiftKnitSYROWY

                            # **** E Calculate number of time Detect Fault From Privious Shift.
                            detectEventList = []
                            selectDetectFaultTranferShiftSQL = "SELECT * FROM WorkerDetectErrorAtTranferTime WHERE (User_ID_WorkerDetect = '%s' AND month(WorkDayLetError) = '%s' AND year(WorkDayLetError) = '%s')"
                            cur.execute(selectDetectFaultTranferShiftSQL % (workerID, self.timeValue.workingMonth, self.timeValue.workingYear))
                            detectEventList = cur.fetchall()
                            self.numberDetectFaultAtTranferTime = len(detectEventList)

                            # **** F Calculate number of time Let Fault At Tranfer Time.
                            letFaultEventList = []
                            selectLetFaultTranferShiftSQL = "SELECT * FROM WorkerDetectErrorAtTranferTime WHERE (User_ID_WorkerLet = '%s' AND month(WorkDayLetError) = '%s' AND year(WorkDayLetError) = '%s')"
                            cur.execute(selectLetFaultTranferShiftSQL % (workerID, self.timeValue.workingMonth, self.timeValue.workingYear))
                            letFaultEventList = cur.fetchall()
                            self.workerPerformanceScoreList[index].numberLetFaultAtTranferTime = len(letFaultEventList)

                            # **** F Calculate number of time Bad Cleaning.
                            badCleanEventList = []
                            selectBadCleanSQL = "SELECT * FROM BadClean WHERE (User_ID = '%s' AND month(WorkDay) = '%s' AND year(WorkDay) = '%s')"
                            cur.execute(selectBadCleanSQL % (workerID, self.timeValue.workingMonth, self.timeValue.workingYear))
                            badCleanEventList = cur.fetchall()
                            self.workerPerformanceScoreList[index].numberBadClean = len(badCleanEventList)

                            # **** G Calculate number of Kg Defect Product.
                            kgDefectProductList = []
                            selectKgDefectProductSQL = "SELECT Kg FROM DefectProductKg WHERE (User_ID = '%s' AND month(DayWork) = '%s' AND year(DayWork) = '%s')"
                            cur.execute(selectKgDefectProductSQL % (workerID, self.timeValue.workingMonth, self.timeValue.workingYear))
                            kgDefectProductList = cur.fetchall()
                            totalKg_ = 0.0
                            if len(kgDefectProductList) != 0:
                                for kg in kgDefectProductList:
                                    totalKg_ = float(totalKg_) + float(kg[0])
                            self.workerPerformanceScoreList[index].kgDefectProduct = round(totalKg_, 1)

                            index = index + 1
                # end caculate all specs of worker
                # start to caculate score for all specs of worker
                '''
                9%
                1/ workedShift_
                2/ workedShiftScore_

                20%
                3/ periodCheckTime_
                4/ checkedTimeScore_

                4%
                5/ timeToEndYarnBreakFullRoll_
                6/ timeToEndYarnBreakFullRollScore_

                10%
                7/ numberDetectFaultAtTranferTime
                8/ numberDetectFaultAtTranferTimeScore_

                5%
                9/  numberOfKnitSMYOWY
                10/ numberOfKnitSMYOWYScore_

                4%
                11/ numberBadClean
                12/ numberBadCleanScore_

                8%
                13/ numberLetFaultAtTranferTime
                14/ numberLetFaultAtTranferTimeScore_

                40%
                15/ kgDefectProduct
                16/ kgDefectProductScore_
                '''
                maxWorkedShift_ = 0

                minPeriodCheckTime_ = 999

                minTimeToEndYarnBreakFullRoll_ = 999

                maxNumberDetectFaultAtTranferTime = 0

                maxNumberOfKnitSMYOWY = 0

                maxNumberBadClean = 0

                maxNumberLetFaultAtTranferTime = 0

                maxKgDefectProduct = 0.0

                for workerSpecs in self.workerPerformanceScoreList:
                    # 001
                    if workerSpecs.workedShift_ > maxWorkedShift_:
                        maxWorkedShift_ = workerSpecs.workedShift_

                    # 002
                    if workerSpecs.periodCheckTime_ < minPeriodCheckTime_:
                        minPeriodCheckTime_ = workerSpecs.periodCheckTime_

                    # 003
                    if workerSpecs.timeToEndYarnBreakFullRoll_ < minTimeToEndYarnBreakFullRoll_:
                        minTimeToEndYarnBreakFullRoll_ = workerSpecs.timeToEndYarnBreakFullRoll_
#                        if math.isclose(workerSpecs.timeToEndYarnBreakFullRoll_,0.0):
#                            print("939393")
#                            minTimeToEndYarnBreakFullRoll_ = workerSpecs.timeToEndYarnBreakFullRoll_
#                        print("1: ", workerSpecs.timeToEndYarnBreakFullRoll_)
#                        print("2: ", minTimeToEndYarnBreakFullRoll_)

                    # 004
                    if workerSpecs.numberDetectFaultAtTranferTime > maxNumberDetectFaultAtTranferTime:
                        maxNumberDetectFaultAtTranferTime = workerSpecs.numberDetectFaultAtTranferTime

                    # 005
                    if workerSpecs.numberOfKnitSMYOWY > maxNumberOfKnitSMYOWY:
                        maxNumberOfKnitSMYOWY = workerSpecs.numberOfKnitSMYOWY

                    # 006
                    if workerSpecs.numberBadClean > maxNumberBadClean:
                        maxNumberBadClean = workerSpecs.numberBadClean

                    # 007
                    if workerSpecs.numberLetFaultAtTranferTime > maxNumberLetFaultAtTranferTime:
                        maxNumberLetFaultAtTranferTime = workerSpecs.numberLetFaultAtTranferTime

                    # 008
                    if workerSpecs.kgDefectProduct > maxKgDefectProduct:
                        maxKgDefectProduct = workerSpecs.kgDefectProduct

                for workerSpecs in self.workerPerformanceScoreList:
                    # 001
                    if maxWorkedShift_ == 0: # all worker worked shift is all equal 0 shift -> all scores is equal 0
                        workerSpecs.workedShiftScore_ = 0.0
                    else:
                        if workerSpecs.workedShift_ == 0:
                            workerSpecs.workedShiftScore_ = 0.0
                        else:
                            workerSpecs.workedShiftScore_ = round(9.0/(maxWorkedShift_/workerSpecs.workedShift_),1)
                    # 002
                    if minPeriodCheckTime_ == 999: # all worker haven't yet checked -> all score is equal 0
                        workerSpecs.checkedTimeScore_ = 0.0
                    else:
                        if workerSpecs.periodCheckTime_ == 999:
                            workerSpecs.checkedTimeScore_ = 0.0
                        else:
                            workerSpecs.checkedTimeScore_ = round(20.0/(workerSpecs.periodCheckTime_/minPeriodCheckTime_), 1)
                    # 003
                    if minTimeToEndYarnBreakFullRoll_ == 999 or math.isclose(minTimeToEndYarnBreakFullRoll_, 0): #all worker haven't has yarn break or full roll -> all score is equal 0
                        workerSpecs.timeToEndYarnBreakFullRollScore_ = 0.0
                    else:
                        if workerSpecs.timeToEndYarnBreakFullRoll_ == 999:
                            workerSpecs.timeToEndYarnBreakFullRollScore_ = 0.0
                        else:
                            workerSpecs.timeToEndYarnBreakFullRollScore_ = round(4.0/(workerSpecs.timeToEndYarnBreakFullRoll_/minTimeToEndYarnBreakFullRoll_))
                    # 004
                    if maxNumberDetectFaultAtTranferTime == 0:
                        workerSpecs.numberDetectFaultAtTranferTimeScore_ = 10.0
                    else:
                        if workerSpecs.numberDetectFaultAtTranferTime == 0:
                            workerSpecs.numberDetectFaultAtTranferTimeScore_ = 0.0
                        else:
                            workerSpecs.numberDetectFaultAtTranferTimeScore_ = round(10.0/(maxNumberDetectFaultAtTranferTime/workerSpecs.numberDetectFaultAtTranferTime), 1)
                    # 005
                    if maxNumberOfKnitSMYOWY == 0:
                        workerSpecs.numberOfKnitSMYOWYScore_ = 5.0
                    else:
                        if workerSpecs.numberOfKnitSMYOWY == 0:
                            workerSpecs.numberOfKnitSMYOWYScore_ = 0.0
                        else:
                            workerSpecs.numberOfKnitSMYOWYScore_ = round(5.0/(maxNumberOfKnitSMYOWY/workerSpecs.numberOfKnitSMYOWY), 1)
                    # 006
                    if maxNumberBadClean == 0:
                        workerSpecs.numberBadCleanScore_ = 4.0
                    else:
                        if workerSpecs.numberBadClean == 0:
                            workerSpecs.numberBadCleanScore_ = 4.0
                        else:
                            workerSpecs.numberBadCleanScore_ = round(-4.0/(maxNumberBadClean/workerSpecs.numberBadClean), 1)
                    # 007
                    if maxNumberLetFaultAtTranferTime == 0:
                        workerSpecs.numberLetFaultAtTranferTimeScore_ = 8.0
                    else:
                        if workerSpecs.numberLetFaultAtTranferTime == 0:
                            workerSpecs.numberLetFaultAtTranferTimeScore_ = 8.0
                        else:
                            workerSpecs.numberLetFaultAtTranferTimeScore_ = round(-8.0/(maxNumberLetFaultAtTranferTime/workerSpecs.numberLetFaultAtTranferTime), 1)
                    # 008
                    if maxKgDefectProduct == 0.0:
                        workerSpecs.kgDefectProductScore_ = 40.0
                    else:
                        if workerSpecs.kgDefectProduct == 0.0:
                            workerSpecs.kgDefectProductScore_ = 40.0
                        else:
                            workerSpecs.kgDefectProductScore_ = round(-40.0/(maxKgDefectProduct/workerSpecs.kgDefectProduct), 1)
                # start to caculate total score of worker
                for workerSpecs in self.workerPerformanceScoreList:
                    workerSpecs.totalScore_ = workerSpecs.workedShiftScore_
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + float(workerSpecs.checkedTimeScore_)
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + workerSpecs.timeToEndYarnBreakFullRollScore_
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + workerSpecs.numberDetectFaultAtTranferTimeScore_
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + workerSpecs.numberOfKnitSMYOWYScore_
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + float(workerSpecs.numberBadCleanScore_)
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + workerSpecs.numberLetFaultAtTranferTimeScore_
                    workerSpecs.totalScore_ = workerSpecs.totalScore_ + workerSpecs.kgDefectProductScore_
                # sort self.workerPerformanceScoreList by totalScore value
                self.workerPerformanceScoreList.sort(key = lambda x: x.totalScore_, reverse=True)
        except Error as e:
            print(e)
        finally:
            conn.close()
#        for wokerPerformanceScore in self.workerPerformanceScoreList:
#            print(wokerPerformanceScore.ID_, " : ", wokerPerformanceScore.workedShift_, "|", wokerPerformanceScore.workedShiftScore_, " / ",
#                                                    wokerPerformanceScore.periodCheckTime_, "|", wokerPerformanceScore.checkedTimeScore_, " / ",
#                                                    wokerPerformanceScore.timeToEndYarnBreakFullRoll_, "|", wokerPerformanceScore.timeToEndYarnBreakFullRollScore_, " / ",
#                                                    wokerPerformanceScore.numberDetectFaultAtTranferTime, "|", wokerPerformanceScore.numberDetectFaultAtTranferTimeScore_, " / ",
#                                                    wokerPerformanceScore.numberOfKnitSMYOWY, "|", wokerPerformanceScore.numberOfKnitSMYOWYScore_, " / ",
#                                                    wokerPerformanceScore.numberBadClean, "|", wokerPerformanceScore.numberBadCleanScore_, " / ",
#                                                    wokerPerformanceScore.numberLetFaultAtTranferTime, "|", wokerPerformanceScore.numberLetFaultAtTranferTimeScore_, " / ",
#                                                    wokerPerformanceScore.kgDefectProduct, "|", wokerPerformanceScore.kgDefectProductScore_, " > ", wokerPerformanceScore.totalScore_)
#            print("??????????????????/")
        dataSendToUI = []
        for wokerPerformanceScore in self.workerPerformanceScoreList:
            dataSendToUI.append([wokerPerformanceScore.faceImgUrl_, str(wokerPerformanceScore.workedShift_), "{:.1f}".format(wokerPerformanceScore.workedShiftScore_),
            "{:.1f}".format(wokerPerformanceScore.periodCheckTime_), "{:.1f}".format(wokerPerformanceScore.checkedTimeScore_),
            "{:.1f}".format(wokerPerformanceScore.timeToEndYarnBreakFullRoll_), "{:.1f}".format(wokerPerformanceScore.timeToEndYarnBreakFullRollScore_),
            str(wokerPerformanceScore.numberDetectFaultAtTranferTime), "{:.1f}".format(wokerPerformanceScore.numberDetectFaultAtTranferTimeScore_),
            str(wokerPerformanceScore.numberOfKnitSMYOWY), "{:.1f}".format(wokerPerformanceScore.numberOfKnitSMYOWYScore_),
            str(wokerPerformanceScore.numberBadClean), "{:.1f}".format(wokerPerformanceScore.numberBadCleanScore_),
            str(wokerPerformanceScore.numberLetFaultAtTranferTime), "{:.1f}".format(wokerPerformanceScore.numberLetFaultAtTranferTimeScore_),
            "{:.1f}".format(wokerPerformanceScore.kgDefectProduct), "{:.1f}".format(wokerPerformanceScore.kgDefectProductScore_),
            "{:.1f}".format(wokerPerformanceScore.totalScore_)])
        self.refeshScoreTableSignal.emit(dataSendToUI)



    # for scenario: in the real life: when "time to request worker sign quality at tranfer time" came and went over, computer isn't turned on. So TimeToRequestWorkerSignQualityAtTranferTimeSlot function isn't called. We need to check this problem and action if need
    def checkNextWorkerRosterIsApplied(self):
        # checking: is next worker roster applied?
        print("checkNextWorkerRosterIsApplied")
        statementSelectSQL = "SELECT * FROM WorkerPerformance WHERE WorkShift = '%s' AND WorkDay = '%s'"
        data = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL % (self.timeValue.workShift_, self.timeValue.workDay_))
                data = cur.fetchall()
                if len(data) == 0:
                    # No worker is attendaced!
                    print("check Worker result: no worker attendaced -> need insert new row to WorkerPerformance DTB")
                    # Checking: 'asign worker table' for this shift-day work
                    selectNextUserSQL = "SELECT User_ID FROM AsignWorkerNextShift WHERE (MchNumber = '%s' AND Day = '%s' AND Shift = '%s')"
                    statementInsertSQL = "INSERT INTO WorkerPerformance (MchNumber, User_ID, StartTime, sliderValue, Rounds, CaculatedRolls, RealRolls, PressTimeCounter, QLTCheckTimeMetterH, QLTCheckTimeMetterM, QLTCheckTimeMetterS, QLTCheckCounter, YellowRedTimeMetterH, YellowRedTimeMetterM, YellowRedTimeMetterS, YellowRedCounter, GreenTimeMetterH, GreenTimeMetterM, GreenTimeMetterS, GreenTimeConter, WorkDay, WorkShift) VALUES ('%s', '%s','%s', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '%s', '%s')"
                    for i in range(1, 22):
                        #print(i, " ", selectNextUserSQL % (str(i), self.timeValue.workDay_, self.timeValue.workShift_))
                        cur.execute(selectNextUserSQL % (str(i), self.timeValue.workDay_, self.timeValue.workShift_))
                        data = cur.fetchall()
                        if len(data) != 0:
                            if str(data[0][0]) != "0":
                                cur.execute(statementInsertSQL % (str(i), str(data[0][0]), self.timeValue.currentTime, self.timeValue.workDay_, self.timeValue.workShift_))
                                conn.commit()
                                self.networkManager.send(str(i), "1") # for this screnario: after software is turned on: need to enable this machine
        except Error as e:
            print(e)
        finally:
            conn.close()

    @Slot(int, int)
    def mchInfoRectSliderValueChangeNeedToUpdateDTB(self, mch_, sliderValue_):
        # turn on Flag inTimeToRequestWorkerComfirmQLTFlag to record programe in to "Confirm QTL" process
        self.inTimeToRequestWorkerComfirmQLTFlag = True
        # update to DataRect
        for i in range(1, 22):
            if i == mch_:
                self.rectDataList[i-1].sliderValue_ = sliderValue_
        # update to DTB
        SQL_updateSliderValueSQL = "UPDATE WorkerPerformance SET sliderValue = '%s' WHERE MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                # update slider value for workerPerformanceRows of current Shift
                cur.execute(SQL_updateSliderValueSQL % (str(sliderValue_), str(mch_), self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()

    @Slot()
    def TimeToRequestWorkerSignQualityAtTranferTimeSlot(self):
        # Time To Request Worker Sign Quality At Tranfer
        SQL_updateEndTimeSQL = "UPDATE WorkerPerformance SET EndTime = '%s' WHERE WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL"
        statementSelectSQL = "SELECT User_ID FROM AsignWorkerNextShift WHERE (MchNumber = '%s' AND Day = '%s' AND Shift = '%s')"
        statementInsertSQL = "INSERT INTO WorkerPerformance (MchNumber, User_ID, StartTime, sliderValue, Rounds, CaculatedRolls, RealRolls, PressTimeCounter, QLTCheckTimeMetterH, QLTCheckTimeMetterM, QLTCheckTimeMetterS, QLTCheckCounter, YellowRedTimeMetterH, YellowRedTimeMetterM, YellowRedTimeMetterS, YellowRedCounter, GreenTimeMetterH, GreenTimeMetterM, GreenTimeMetterS, GreenTimeConter, WorkDay, WorkShift) VALUES ('%s', '%s','%s', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '%s', '%s')"
        SQL_insertMchOnlineEvent = "INSERT INTO MachineOnlineEvent(MachineNum, OnlineTime, OfflineTime, User_ID, DayWork) VALUES ('%s', '%s', '%s', '%s', '%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                # update endTime for all workerPerformanceRows of prior Shift
                cur.execute(SQL_updateEndTimeSQL % (self.timeValue.currentTime, self.timeValue.priorWorkDay_, self.timeValue.priorWorkShift_))
                conn.commit()
                for i in range(1, 22):
                    # get attendance worker for next shift information
                    cur.execute(statementSelectSQL % (str(i), self.timeValue.workDay_, self.timeValue.workShift_))
                    data = cur.fetchall()
                    # insert new worker performance row for next shift
                    if len(data) != 0:
                        if str(data[0][0]) != "0": # just insert worker don't have id equal 0
                            cur.execute(statementInsertSQL % (str(i), str(data[0][0]), self.timeValue.currentTime, self.timeValue.workDay_, self.timeValue.workShift_))
                            conn.commit()
                            # insert to onlineEvent DTB with new UserID
                            cur.execute(SQL_insertMchOnlineEvent % (str(i), self.timeValue.currentTime, self.timeValue.currentTime, str(data[0][0]), self.timeValue.workDay_))
                            conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.refeshHomePageSignal.emit()
        # broadCast to all Knitting Machine - to ask worker make electronic-sign: good or error
        NetworkManager.sendBroadCast("2") # 2: is code to control esp32 action: request worker confirm product in good condition at the head shift time.
        self.setAllSliderToOne.emit()
        # update all DataRect's sliderValue variable to 1
        for MchRectData in self.rectDataList:
            MchRectData.sliderValue_ = 1

    @Slot(str)
    def workerCheckCardToInformEndWorkingShift(self, mch_):
        for MchRectData in self.rectDataList:
            if str(MchRectData.mchNum) == str(mch_):
                MchRectData.faceName_ = ""
                MchRectData.faceImgUrl_ = ""

    @Slot()
    def fillNumberWorker(self):
        #print("fill Number Worker")
        # caculator depends on Customer's Name
        listUserImageUrl = []
        count = 0
        for MchRectData in self.rectDataList:
            if str(MchRectData.mchNum) in self.listOnlineMch:
                if MchRectData.faceImgUrl_ not in listUserImageUrl:
                    if MchRectData.faceName_ != "Trống" and MchRectData.faceName_ != "":
                        listUserImageUrl.append(MchRectData.faceImgUrl_)
                        count = count + 1
        self.fillNumberWorkerUI.emit(str(count))

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    @Slot(str)
    def btnClickedSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].pressTimeCounterIncrease()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET PressTimeCounter = PressTimeCounter + 1 WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - btnClickedSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    @Slot(str, str)
    def newRoundSlot(self, mchNumber, speed):
        self.rectDataList[int(mchNumber) - 1].roundIncrease()
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET Rounds = Rounds + 1 WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        statemenSelectRoundsRanDataSQL = "SELECT \
        RoundsPerRoll,\
        NumberOfRoundsRan \
        FROM TB_MachineFabricConfig MFC \
        JOIN TB_FabricConfig FC ON FC.FabricConfigId = MFC.TB_FabricConfig_FabricConfigId \
        WHERE MachineNum = %s ORDER BY MachineFabricConfigId DESC LIMIT 1"
        roundRan = 0
        roundPerRoll = 0
        statementUpdateRoundRanSQL = "UPDATE TB_MachineFabricConfig SET NumberOfRoundsRan = '%s'  WHERE MachineNum = %s ORDER BY MachineFabricConfigId DESC LIMIT 1"
        statementUpdateRollsKnittedSQL = "UPDATE TB_MachineFabricConfig SET NumberOfRollsKintted = NumberOfRollsKintted + 1 WHERE MachineNum = %s ORDER BY MachineFabricConfigId DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()

                cur.execute(statemenSelectRoundsRanDataSQL % (mchNumber))
                data = cur.fetchall()
                if len(data) != 0:
                    roundPerRoll = data[0][0]
                    roundRan = data[0][1] + 1
                    if roundRan >= roundPerRoll:
                        cur.execute(statementUpdateRollsKnittedSQL % (mchNumber))
                        roundRan = 0
                    cur.execute(statementUpdateRoundRanSQL % (str(roundRan), mchNumber))
                    conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - newRoundSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    # Quality check
    @Slot(str)
    def qLTCheckOnSlot(self, mchNumber):
        # print("Mch number:", mchNumber, " is quality check on")
        self.rectDataList[int(mchNumber) - 1].qltCheckOn()
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET QLTCheckCounter = QLTCheckCounter + 1 WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - qLTCheckOnSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    @Slot(str)
    def qLTCheckOffSlot(self, mchNumber):
        print("Mch number:", mchNumber, " is quality check off")
        self.btnClicked.emit(mchNumber)
        self.btnClickedSlot(mchNumber)
        self.rectDataList[int(mchNumber) - 1].qltCheckOff()
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET QLTCheckTimeMetterH = '%s', QLTCheckTimeMetterM = '%s', QLTCheckTimeMetterS = '%s' WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (str(self.rectDataList[int(mchNumber) - 1].qLTCheckTimeMetterH), str(self.rectDataList[int(mchNumber) - 1].qLTCheckTimeMetterM), str(self.rectDataList[int(mchNumber) - 1].qLTCheckTimeMetterS), mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - qLTCheckOffSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    # yellow
    @Slot(str)
    def yellowLedBlinkOnSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].yellowLedBlinkOn()
        # update DTB
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET YellowRedCounter = YellowRedCounter + 1 WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - yellowLedBlinkOnSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    @Slot(str)
    def yellowLedBlinkOffSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].yellowLedBlinkOff()
        # update DTB
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET YellowRedTimeMetterH = '%s', YellowRedTimeMetterM = '%s', YellowRedTimeMetterS = '%s' WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        getMaxTimeMchStop = "SELECT ID, HourStop, MinStop, SecondStop FROM MaxTimeStopWithLightNotify WHERE MachineNum = '%s'"
        updateMaxTimeMchStop = "UPDATE MaxTimeStopWithLightNotify SET HourStop = '%s', MinStop = '%s', SecondStop = '%s' WHERE MachineNum = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (str(self.rectDataList[int(mchNumber) - 1].yellowRedTimeMetterH), str(self.rectDataList[int(mchNumber) - 1].yellowRedTimeMetterM), str(self.rectDataList[int(mchNumber) - 1].yellowRedTimeMetterS), mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()

                #print("check time of this stop-time is bigger old ?. If yes -> update new value")
                if self.rectDataList[int(mchNumber) - 1].faceName_ != "Trống" and self.rectDataList[int(mchNumber) - 1].faceName_ != "":
                    cur.execute(getMaxTimeMchStop % (str(mchNumber)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        oldMaxH = data[0][1]
                        oldMaxM = data[0][2]
                        oldMaxS = data[0][3]
                        if self.rectDataList[int(mchNumber) - 1].machineStopH > oldMaxH:
                            cur.execute(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                            conn.commit()
                        elif self.rectDataList[int(mchNumber) - 1].machineStopH == oldMaxH:
                            if self.rectDataList[int(mchNumber) - 1].machineStopM > oldMaxM:
                                cur.execute(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                                conn.commit()
                            elif self.rectDataList[int(mchNumber) - 1].machineStopM == oldMaxM:
                                if self.rectDataList[int(mchNumber) - 1].machineStopS > oldMaxS:
                                    #print(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                                    cur.execute(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                                    conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - yellowLedBlinkOffSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    # red
    @Slot(str)
    def redLedBlinkOnSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].redLedBlinkOn()
        # update DTB
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET YellowRedCounter = YellowRedCounter + 1 WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - redLedBlinkOnSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    @Slot(str)
    def redLedBlinkOffSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].redLedBlinkOff()
        # update DTB
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET YellowRedTimeMetterH = '%s', YellowRedTimeMetterM = '%s', YellowRedTimeMetterS = '%s' WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        getMaxTimeMchStop = "SELECT ID, HourStop, MinStop, SecondStop FROM MaxTimeStopWithLightNotify WHERE MachineNum = '%s'"
        updateMaxTimeMchStop = "UPDATE MaxTimeStopWithLightNotify SET HourStop = '%s', MinStop = '%s', SecondStop = '%s' WHERE MachineNum = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (str(self.rectDataList[int(mchNumber) - 1].yellowRedTimeMetterH), str(self.rectDataList[int(mchNumber) - 1].yellowRedTimeMetterM), str(self.rectDataList[int(mchNumber) - 1].yellowRedTimeMetterS), mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()

                #print("check time of this stop-time is bigger old ?. If yes -> update new value")
                if self.rectDataList[int(mchNumber) - 1].faceName_ != "Trống" and self.rectDataList[int(mchNumber) - 1].faceName_ != "":
                    cur.execute(getMaxTimeMchStop % (str(mchNumber)))
                    data = cur.fetchall()
                    if len(data) != 0:
                        oldMaxH = data[0][1]
                        oldMaxM = data[0][2]
                        oldMaxS = data[0][3]
                        if self.rectDataList[int(mchNumber) - 1].machineStopH > oldMaxH:
                            cur.execute(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                            conn.commit()
                        elif self.rectDataList[int(mchNumber) - 1].machineStopH == oldMaxH:
                            if self.rectDataList[int(mchNumber) - 1].machineStopM > oldMaxM:
                                cur.execute(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                                conn.commit()
                            elif self.rectDataList[int(mchNumber) - 1].machineStopM == oldMaxM:
                                if self.rectDataList[int(mchNumber) - 1].machineStopS > oldMaxS:
                                    #print(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                                    cur.execute(updateMaxTimeMchStop % (str(self.rectDataList[int(mchNumber) - 1].machineStopH), str(self.rectDataList[int(mchNumber) - 1].machineStopM), str(self.rectDataList[int(mchNumber) - 1].machineStopS), mchNumber))
                                    conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - yellowLedBlinkOffSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    # green
    @Slot(str)
    def greenLedBlinkOnSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].greenLedBlinkOn()
        # update DTB
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET GreenTimeConter = GreenTimeConter + 1 WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - greenLedBlinkOnSlot is error: ", e)
        finally:
            conn.close()

    # NEED TO UPDATE DTB TO RECORD WORKER PERFORMANCE
    @Slot(str)
    def greenLedBlinkOffSlot(self, mchNumber):
        self.rectDataList[int(mchNumber) - 1].greenLedBlinkOff()
        # update DTB
        #self.updateTrioTimeSet()
        statemenUpdateSQL = "UPDATE WorkerPerformance SET GreenTimeMetterH = '%s', GreenTimeMetterM = '%s', GreenTimeMetterS = '%s' WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenUpdateSQL % (str(self.rectDataList[int(mchNumber) - 1].greenTimeMetterH), str(self.rectDataList[int(mchNumber) - 1].greenTimeMetterM), str(self.rectDataList[int(mchNumber) - 1].greenTimeMetterS), mchNumber, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print("sql: HomePageModel.py - greenLedBlinkOffSlot is error: ", e)
        finally:
            conn.close()

    @Slot()
    def fillAllRectsData(self):
        #print("HomePageModel.py - fillAllRectData function")
        #self.updateTrioTimeSet()
        statemenSelectWorkerPerformanceSQL = "SELECT \
        FirstName,\
        FaceImgURL,\
        sliderValue,\
        Rounds,\
        CaculatedRolls, \
        RealRolls, \
        PressTimeCounter, \
        QLTCheckTimeMetterH, \
        QLTCheckTimeMetterM, \
        QLTCheckTimeMetterS, \
        QLTCheckCounter, \
        YellowRedTimeMetterH, \
        YellowRedTimeMetterM, \
        YellowRedTimeMetterS, \
        YellowRedCounter, \
        GreenTimeMetterH, \
        GreenTimeMetterM, \
        GreenTimeMetterS, \
        GreenTimeConter, \
        WatchNumber \
        FROM WorkerPerformance WPFM \
        JOIN User USERROW ON USERROW.ID = WPFM.User_ID \
        WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY WPFM.ID DESC LIMIT 1"

#        self.faceName_ = ""            0
#        self.faceImgUrl_ = ""          1
#        self.sliderValue_ = 2          2
#        self.rounds = 0                3
#        self.caculatedRolls = 0.0      4
#        self.realRolls = 0             5
#        self.pressTimeCounter = 0      6

#        self.qLTCheckTimeMetterH = 0   7
#        self.qLTCheckTimeMetterM = 0   8
#        self.qLTCheckTimeMetterS = 0   9
#        self.qLTCheckCounter = 0       10

#        self.yellowRedTimeMetterH = 0  11
#        self.yellowRedTimeMetterM = 0  12
#        self.yellowRedTimeMetterS = 0  13
#        self.yellowRedCounter = 0      14

#        self.greenTimeMetterH = 0      15
#        self.greenTimeMetterM = 0      16
#        self.greenTimeMetterS = 0      17
#        self.greenTimeConter = 0       18
#            WatchNumber                19

#        self.fabricPrintCode = ""      0
#        self.fabricRoundsPerRoll = 1   1

        statemenSelectFabricSpecsSQL = "SELECT PrintCode, RoundsPerRoll\
        FROM KF4DB.TB_FabricConfig AS FCR\
        INNER JOIN KF4DB.TB_MachineFabricConfig AS MFCR\
        ON FCR.FabricConfigId = MFCR.TB_FabricConfig_FabricConfigId AND MFCR.MachineNum = '%s' ORDER BY MachineFabricConfigId DESC LIMIT 1;"

        resultFabricSpecs = [] # [["VC PE30 2M2","2150"], ["CSPE30 2M8","1820"], ............]
        resultWorkerPerformanceIndexs = []
        dataWorkerPerformanceIndexs = []
        dataFabricSpecs = []
        dataBlinkStates = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                tempList = []
                for i in range(1, 22):
                    # get worker performance indexs
                    cur.execute(statemenSelectWorkerPerformanceSQL % (str(i), self.timeValue.workDay_, self.timeValue.workShift_))
                    dataWorkerPerformanceIndexs.clear
                    dataWorkerPerformanceIndexs = cur.fetchall()

                    if len(dataWorkerPerformanceIndexs) != 0:
                        if self.rectDataList[i-1].faceImgUrl_ != dataWorkerPerformanceIndexs[0][1]: # this scenario is meaning: new worker is asigned or this is first time of initializing.
                            self.rectDataList[i-1].applyWorkerPerformanceIndexsData(dataWorkerPerformanceIndexs[0])
                            resultWorkerPerformanceIndexs.append([dataWorkerPerformanceIndexs[0][0], dataWorkerPerformanceIndexs[0][1], str(dataWorkerPerformanceIndexs[0][2]), str(dataWorkerPerformanceIndexs[0][3]), str(dataWorkerPerformanceIndexs[0][4]), str(dataWorkerPerformanceIndexs[0][5]), str(dataWorkerPerformanceIndexs[0][6]), str(dataWorkerPerformanceIndexs[0][7]), str(dataWorkerPerformanceIndexs[0][8]), str(dataWorkerPerformanceIndexs[0][9]), str(dataWorkerPerformanceIndexs[0][10]), str(dataWorkerPerformanceIndexs[0][11]), str(dataWorkerPerformanceIndexs[0][12]), str(dataWorkerPerformanceIndexs[0][13]), str(dataWorkerPerformanceIndexs[0][14]), str(dataWorkerPerformanceIndexs[0][15]), str(dataWorkerPerformanceIndexs[0][16]), str(dataWorkerPerformanceIndexs[0][17]), str(dataWorkerPerformanceIndexs[0][18]), str(dataWorkerPerformanceIndexs[0][19]), "0"]) # add "0" at tail of data for algorithm "make color border of worker's face image"
                        else:
                            #print(" RectData already init -> just get data from rectData")
                            tempList.clear()
                            tempList = [self.rectDataList[i-1].faceName_, self.rectDataList[i-1].faceImgUrl_, str(self.rectDataList[i-1].sliderValue_), str(self.rectDataList[i-1].rounds), str(self.rectDataList[i-1].caculatedRolls), str(self.rectDataList[i-1].realRolls), str(self.rectDataList[i-1].pressTimeCounter), str(self.rectDataList[i-1].qLTCheckTimeMetterH), str(self.rectDataList[i-1].qLTCheckTimeMetterM), str(self.rectDataList[i-1].qLTCheckTimeMetterS), str(self.rectDataList[i-1].qLTCheckCounter), str(self.rectDataList[i-1].yellowRedTimeMetterH), str(self.rectDataList[i-1].yellowRedTimeMetterM), str(self.rectDataList[i-1].yellowRedTimeMetterS), str(self.rectDataList[i-1].yellowRedCounter), str(self.rectDataList[i-1].greenTimeMetterH), str(self.rectDataList[i-1].greenTimeMetterM), str(self.rectDataList[i-1].greenTimeMetterS), str(self.rectDataList[i-1].greenTimeConter), str(self.rectDataList[i-1].watchNumber), "0"]  # add "0" at tail of data for algorithm "make color border of worker's face image"
                            #print("tempList:", tempList)
                            resultWorkerPerformanceIndexs.append(deepcopy(tempList))
                    else:
                        resultWorkerPerformanceIndexs.append([])

                    # get blink lamp State
                    dataBlinkStates.append([self.rectDataList[i-1].qualityCheckBlink, self.rectDataList[i-1].yellowLampBlink, self.rectDataList[i-1].redLampBlink, self.rectDataList[i-1].greenBlink])

                    # get fabric specific info
                    cur.execute(statemenSelectFabricSpecsSQL % (str(i)))
                    dataFabricSpecs.clear
                    dataFabricSpecs = cur.fetchall()

                    if len(dataFabricSpecs) != 0:
                        resultFabricSpecs.append([dataFabricSpecs[0][0], dataFabricSpecs[0][1]])
                        self.rectDataList[i-1].applyFabricInfoSpec(dataFabricSpecs[0])
                    else:
                        resultFabricSpecs.append([])

        except Error as e:
            print("sql fillWorkerPerformaceData and resultFabricSpecs and Blink State is error: ", e)
        finally:
            conn.close()

        # update color code value depends on Worker's Name
        my_dict = {}
        colorCodeNext = 1
        for i in range(0,21):
            if len(resultWorkerPerformanceIndexs[i]) != 0:
                if resultWorkerPerformanceIndexs[i][0] in my_dict.keys():
                    resultWorkerPerformanceIndexs[i][20] = my_dict[resultWorkerPerformanceIndexs[i][0]]
                else:
                    my_dict[resultWorkerPerformanceIndexs[i][0]] = str(colorCodeNext)
                    resultWorkerPerformanceIndexs[i][20] = str(colorCodeNext)
                    colorCodeNext = colorCodeNext + 1
        # end code - update color code value depends on Worker's Name

        self.fillWorkerPerformanceUI.emit(resultWorkerPerformanceIndexs)
        self.fillFabricSpecsUI.emit(resultFabricSpecs)
        self.fillBlinkStatesUI.emit(dataBlinkStates)

    @staticmethod
    @Slot()
    def setAllSliderToOneStaticFunction(self):
        self.setAllSliderToOne.emit()

    @Slot()
    def initializingOnline(self):
#        print("HomepageModel.py - initializingOnline Slot")
        mchOnline = []
        for varList in self.networkManager.listMch:
            mchOnline.append(varList[2])
        self.initializingOnlineState.emit(mchOnline)
        self.fillNumberWorker()

    @Slot()
    def newConnectSlot(self):
        print("HomePageModel.py - newConnectionSlot")
        data = []
        for var in self.networkManager.listMch:
            if var[2] not in self.listOnlineMch:
                data.append(var[2])
                self.listOnlineMch.append(deepcopy(var[2]))
        print("List connectied Mch:", data)
        self.newMchConnected.emit(data)
        self.fillNumberWorker()

    @Slot()
    def lostConnectionSlot(self):
#        print("HomePageModel.py - lostConnectionSlot")
        data = []
        flag = False
#        print(self.listOnlineMch)
#        print(self.networkManager.listMch)
        for mchNumber in self.listOnlineMch:
            flag = False
            for var in self.networkManager.listMch:
                if mchNumber == var[2]:
                    flag = True
            if flag is False:
                data.append(mchNumber)
                self.listOnlineMch.remove(mchNumber)
                self.rectDataList[int(mchNumber) - 1].lostConnection()
        #print("List Mch lost connection:", data)
        self.lostMchConnection.emit(data)
        self.fillNumberWorker()
