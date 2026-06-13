# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
import datetime
from datetime import timedelta


class AsignWorkerPageModel(QObject):

    fillUsersListModel = Signal(list)
    fillTimeData = Signal(list)
    fillNextWorkerRoster = Signal(list)
    fillCurrentWorkerRoster = Signal(list)

    def __init__(self, networkManager_, timeValue_):
        QObject.__init__(self)
        self.networkManager = networkManager_
        self.timeValue = timeValue_
#        self.currentTime = ""
#        self.workDay = ""
#        self.workShift = ""
#        self.nextWorkDay = ""
#        self.nextWorkShift = ""

#        self.workDayUI = ""
#        self.nextWorkDayUI = ""
#        self.startTimeOfShiftWorking = ""
#        self.endTimeOfShiftWorking = ""
#        self.startTimeOfPriorShiftWorking = ""
#        self.endTimeOfPriorShiftWorking = ""

#    def updateTimeVariables(self):
#        now = datetime.datetime.now()
#        self.currentTime = now.strftime("%Y-%m-%d %H:%M:%S")
#        # update value for workDay and workShift
#        if now.hour >= 6 and (now.hour <= 23 and now.minute <= 59 and now.second <=59):
#            self.workDay = now.strftime("%Y-%m-%d")
#            self.workDayUI = now.strftime("%d/%m/%Y")
#        else:
#            yesterday = now.date() - timedelta(days = 1)
#            self.workDay = yesterday.strftime("%Y-%m-%d")
#            self.workDayUI = yesterday.strftime("%d/%m/%Y")

#        if now.hour >= 6 and (now.hour <= 15 and now.minute <= 59 and now.second <=59):
#            self.workShift = "Ngày"
#            self.nextWorkShift = "Đêm"
#            self.nextWorkDay = self.workDay
#            self.nextWorkDayUI = self.workDayUI
#        else:
#            self.workShift = "Đêm"
#            self.nextWorkShift = "Ngày"
#            tomorrow = now.date() + timedelta(days = 1)
#            self.nextWorkDay = tomorrow.strftime("%Y-%m-%d")
#            self.nextWorkDayUI = tomorrow.strftime("%d/%m/%Y")

#        # update startTime and EndTime of Shift
#        # update startTime and EndTime of Prior Shift
#        today = now.date()
#        yesterday = today - timedelta(days=1)
#        tomorrow = today + timedelta(days=1)
#        if now.hour >= 0 and now.hour < 6:
#            self.startTimeOfShiftWorking = yesterday.strftime("%Y-%m-%d") + " 16:00:01"
#            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
#            self.startTimeOfPriorShiftWorking = yesterday.strftime("%Y-%m-%d") + " 6:00:00"
#            self.endTimeOfPriorShiftWorking = yesterday.strftime("%Y-%m-%d") + " 15:00:00"  #15:00:00 for suring some scenario worker come early.
#        elif now.hour >= 6 and now.hour < 16:
#            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:01"
#            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:00"
#            self.startTimeOfPriorShiftWorking = yesterday.strftime("%Y-%m-%d") + " 15:00:00"    #15:00:00 for suring  some scenario worker come early.
#            self.endTimeOfPriorShiftWorking = today.strftime("%Y-%m-%d") + " 5:59:59"
#        elif now.hour >= 16 and now.hour < 24:
#            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:01"
#            self.endTimeOfShiftWorking = tomorrow.strftime("%Y-%m-%d") + " 6:00:00"
#            self.startTimeOfPriorShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
#            self.endTimeOfPriorShiftWorking = today.strftime("%Y-%m-%d") + " 15:00:00"  #15:00:00 for suring some scenario worker come early.

    @Slot()
    def loadCurrentWorkerRoster(self):
        statementSelectSQL2 = "SELECT User_ID FROM WorkerPerformance WHERE WorkDay = '%s' AND WorkShift = '%s' AND MchNumber = '%s' AND EndTime IS NULL ORDER BY ID DESC LIMIT 1"
        workerRosterData = []
        #self.updateTimeVariables()
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                # get userId roster for each machine
                for i in range(1, 22):
                    cur.execute(statementSelectSQL2 % (self.timeValue.workDay_, self.timeValue.workShift_, str(i)))
                    data = cur.fetchall()
                    #print("data:", data)
                    if len(data) != 0:
                        workerRosterData.append(data[0][0])
                    else:
                        workerRosterData.append(0)
                    #print("workerRosterData", workerRosterData)
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillCurrentWorkerRoster.emit(workerRosterData)

    @Slot()
    def loadYesterdayRosterForNextShift(self):
        #task: get list userID from yesterday roster for next work shift
        statementSelectSQL = "SELECT User_ID FROM WorkerPerformance WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s') ORDER BY ID DESC LIMIT 1"
        dataResult = []
        #self.updateTimeVariables()
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                for i in range(1, 22):
                    cur.execute(statementSelectSQL % (str(i), self.timeValue.priorWorkDay_, self.timeValue.priorWorkShift_))
                    data = cur.fetchall()
                    if len(data) != 0:
                        dataResult.append(data[0][0])
                    else:
                        dataResult.append(0)
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillNextWorkerRoster.emit(dataResult)

    @Slot(list)
    def applyNewCurentShiftWorkerRoster(self, workerList_):
        print("workerList_", workerList_)
        #self.updateTimeVariables()
        # task 1: search row
        statementSelectSQL = "SELECT User_ID, ID, sliderValue FROM WorkerPerformance WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        # task 2: if row is avaible and User_ID == worker Id in workerList_ -> don't do anything. If not: update endtime to ALL ROW WITH ENDTIME IS NULL then insert new row
        SQL_updateEndTimeSQL = "UPDATE WorkerPerformance SET EndTime = '%s' WHERE (MchNumber = '%s' AND EndTime IS NULL)"
        statementInsertSQL = "INSERT INTO WorkerPerformance (MchNumber, User_ID, StartTime, sliderValue, Rounds, CaculatedRolls, RealRolls, PressTimeCounter, QLTCheckTimeMetterH, QLTCheckTimeMetterM, QLTCheckTimeMetterS, QLTCheckCounter, YellowRedTimeMetterH, YellowRedTimeMetterM, YellowRedTimeMetterS, YellowRedCounter, GreenTimeMetterH, GreenTimeMetterM, GreenTimeMetterS, GreenTimeConter, WorkDay, WorkShift) VALUES ('%s', '%s','%s', '%s', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '%s','%s')"
        SQL_updateMachineStatus = "UPDATE MachineStatus SET Status = 'NORMAL' WHERE ID = '%s'"
        SQL_insertMchOnlineEvent = "INSERT INTO MachineOnlineEvent(MachineNum, OnlineTime, OfflineTime, User_ID, DayWork) VALUES ('%s', '%s', '%s', '%s', '%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                for i in range(1, 22):
                    cur.execute(statementSelectSQL % (str(i), self.timeValue.workDay_, self.timeValue.workShift_))
                    data = cur.fetchall()
                    if len(data) != 0:
                        #print("data[0][0]: ", data[0][0])
                        #print("workerList_[i-1]: ", workerList_[i-1])
                        if str(data[0][0]) != workerList_[i-1]:
                            # update endtime for row with ID = data[0][1]
                            cur.execute(SQL_updateEndTimeSQL % (self.timeValue.currentTime, str(i)))
                            # insert new row
                            if workerList_[i-1] != "0":
                                cur.execute(statementInsertSQL % (str(i), workerList_[i-1], self.timeValue.currentTime, str(data[0][2]), self.timeValue.workDay_, self.timeValue.workShift_))
                                conn.commit()
                                # insert to onlineEvent DTB with new UserID
                                cur.execute(SQL_insertMchOnlineEvent % (str(i), self.timeValue.currentTime, self.timeValue.currentTime, workerList_[i-1], self.timeValue.workDay_))
                                conn.commit()
                                if data[0][2] != 1:
                                    #print("send enable knitting machine command 1")
                                    self.networkManager.send(str(i), "1") # for screnario: after admin set a worker to machine - which is empty worker before -> net to enable this machine
                    else:
                        #print("i:", i)
                        #print("workerID:", workerList_[i-1])
                        if workerList_[i-1] != "0":
                            cur.execute(statementInsertSQL % (str(i), workerList_[i-1], self.timeValue.currentTime, "2", self.timeValue.workDay_, self.timeValue.workShift_))
                            conn.commit()
                            # insert to onlineEvent DTB with new UserID
                            cur.execute(SQL_insertMchOnlineEvent % (str(i), self.timeValue.currentTime, self.timeValue.currentTime, workerList_[i-1], self.timeValue.workDay_))
                            conn.commit()
                            #print("send enable knitting machine command 2")
                            self.networkManager.send(str(i), "1") # for screnario: after admin set a worker to machine - which is empty worker before -> net to enable this machine
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.loadCurrentWorkerRoster()


#    @Slot(list)
#    def applyNewCurentShiftWorkerRoster(self, workerList_):
#        #print("workerList_", workerList_)
#        #self.updateTimeVariables()
#        # task 1: search row
#        statementSelectSQL = "SELECT User_ID, ID FROM WorkerPerformance WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
#        # task 2: if row is avaible and User_ID == worker Id in workerList_ -> don't do anything. If not: update endtime to current row then insert new row
#        SQL_updateEndTimeSQL = "UPDATE WorkerPerformance SET EndTime = '%s' WHERE ID = '%s'"
#        statementInsertSQL = "INSERT INTO WorkerPerformance (MchNumber, User_ID, StartTime, sliderValue, Rounds, CaculatedRolls, RealRolls, PressTimeCounter, QLTCheckTimeMetterH, QLTCheckTimeMetterM, QLTCheckTimeMetterS, QLTCheckCounter, YellowRedTimeMetterH, YellowRedTimeMetterM, YellowRedTimeMetterS, YellowRedCounter, GreenTimeMetterH, GreenTimeMetterM, GreenTimeMetterS, GreenTimeConter, WorkDay, WorkShift, WorkerCheckPeriodInMinuteVariable) VALUES ('%s', '%s','%s', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '%s','%s', '%s')"
#        SQL_updateMachineStatus = "UPDATE MachineStatus SET Status = 'NORMAL' WHERE ID = '%s'"
#        try:
#            db_config = read_db_config()
#            conn = MySQLConnection(**db_config)
#            if conn.is_connected():
#                cur = conn.cursor()
#                for i in range(1, 22):
#                    cur.execute(statementSelectSQL % (str(i), self.timeValue.workDay_, self.timeValue.workShift_))
#                    data = cur.fetchall()
#                    if len(data) != 0:
#                        if data[0][0] != workerList_[i-1]:
#                            # update endtime for row with ID = data[0][1]
#                            cur.execute(SQL_updateEndTimeSQL % (self.timeValue.currentTime, data[0][1]))
#                            # insert new row
#                            if workerList_[i-1] != '0':
#                                cur.execute(statementInsertSQL % (str(i), workerList_[i-1], self.timeValue.currentTime, self.timeValue.workDay_, self.timeValue.workShift_))
#                                #print("send enable knitting machine command 1")
#                                self.networkManager.send(str(i), "1") # for screnario: after admin set a worker to machine - which is empty worker before -> net to enable this machine
#                            conn.commit()
#                    else:
#                        #print("i:", i)
#                        #print("workerID:", workerList_[i-1])
#                        if workerList_[i-1] != '0':
#                            cur.execute(statementInsertSQL % (str(i), workerList_[i-1], self.timeValue.currentTime, self.timeValue.workDay_, self.timeValue.workShift_))
#                            #print("send enable knitting machine command 2")
#                            self.networkManager.send(str(i), "1") # for screnario: after admin set a worker to machine - which is empty worker before -> net to enable this machine
#                            conn.commit()
#        except Error as e:
#            print(e)
#        finally:
#            conn.close()
#        self.loadCurrentWorkerRoster()


    @Slot()
    def loadNextWorkerRoster(self):
        statementSelectSQL = "SELECT User_ID FROM AsignWorkerNextShift WHERE (MchNumber = '%s' AND Shift = '%s' AND Day = '%s')"
        #self.updateTimeVariables()
        listWorker = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                for i in range(1, 22):
                    cur.execute(statementSelectSQL % (str(i), self.timeValue.nextWorkShift_, self.timeValue.nextWorkDay_))
                    data = cur.fetchall()
                    if len(data) != 0:
                        listWorker.append(str(data[0][0]))
                    else:
                        listWorker.append("0")
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillNextWorkerRoster.emit(listWorker)

    @Slot(list)
    def createNextShiftWorkerRoster(self, workerList_):
        statementSelectSQL = "SELECT * FROM AsignWorkerNextShift"
        statementInsertSQL = "INSERT INTO AsignWorkerNextShift (MchNumber, User_ID, Shift, Day) VALUES ('%s', '%s', '%s', '%s')"
        statementUpdateSQL = "UPDATE AsignWorkerNextShift SET User_ID = '%s', Shift = '%s', Day = '%s' WHERE (MchNumber = '%s')"
        #self.updateTimeVariables()
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL)
                data = cur.fetchall()
                mchNum = 1
                if len(data) == 0:
                    for workerID in workerList_:
                        cur.execute(statementInsertSQL % (str(mchNum), str(workerID), self.timeValue.nextWorkShift_, self.timeValue.nextWorkDay_))
                        mchNum = mchNum + 1
                    conn.commit()
                else:
                    for workerID in workerList_:
                        cur.execute(statementUpdateSQL % (workerID, self.timeValue.nextWorkShift_, self.timeValue.nextWorkDay_,  str(mchNum)))
                        mchNum = mchNum + 1
                    conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.loadNextWorkerRoster()

    @Slot()
    def initializingWorkerList(self):
        statementSelectSQL = "SELECT ID, FirstName, FaceImgURL FROM User WHERE WorkInCompany = 'Đang Làm' AND CardUID != '' AND (Position = 'KỸ THUẬT' OR Position = 'NGHỆ NHÂN DỆT') ORDER BY ID DESC"
        statementSelectSQL2 = "SELECT User_ID FROM WorkerPerformance WHERE (WorkDay = '%s' AND WorkShift = '%s' AND MchNumber = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
        workerModeData_ = []
        workerRosterData = []
        timeData_ = []
        #self.updateTimeVariables()
        timeData_.append(self.timeValue.workShift_)
        timeData_.append(str(self.timeValue.workDayUI_))
        timeData_.append(self.timeValue.nextWorkShift_)
        timeData_.append(str(self.timeValue.nextWorkDayUI_))
        self.fillTimeData.emit(timeData_)
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL)
                data = cur.fetchall()
                for var in data:
                    workerModeData_.append([str(var[0]), var[1], var[2]])
            # get userId roster for each machine
            for i in range(1, 22):
                #print(i, " ", statementSelectSQL2 % (self.timeValue.workDay_, self.timeValue.workShift_, str(i)))
                cur.execute(statementSelectSQL2 % (self.timeValue.workDay_, self.timeValue.workShift_, str(i)))
                data.clear
                data = cur.fetchall()
                #print("data:", data)
                if len(data) != 0:
                    workerRosterData.append(data[0][0])
                else:
                    workerRosterData.append(0)
                #print("workerRosterData", workerRosterData)
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillUsersListModel.emit(workerModeData_)
        self.fillCurrentWorkerRoster.emit(workerRosterData)

#    @Slot()
#    def initializingWorkerList(self):
#        statementSelectSQL = "SELECT ID, FirstName, FaceImgURL FROM User WHERE WorkInCompany = 'Đang Làm' AND CardUID != '' AND (Position = 'KỸ THUẬT' OR Position = 'NGHỆ NHÂN DỆT') ORDER BY ID DESC"
#        statementSelectSQL2 = "SELECT User_ID FROM WorkerPerformance WHERE (StartTime >= '%s' AND MchNumber = '%s' AND EndTime IS NULL) ORDER BY ID DESC LIMIT 1"
#        workerModeData_ = []
#        workerRosterData = []
#        timeData_ = []
#        self.updateTimeVariables()
#        timeData_.append(self.workShift)
#        timeData_.append(str(self.workDayUI))
#        timeData_.append(self.nextWorkShift)
#        timeData_.append(str(self.nextWorkDayUI))
#        self.fillTimeData.emit(timeData_)
#        try:
#            db_config = read_db_config()
#            conn = MySQLConnection(**db_config)
#            if conn.is_connected():
#                cur = conn.cursor()
#                cur.execute(statementSelectSQL)
#                data = cur.fetchall()
#                for var in data:
#                    workerModeData_.append([str(var[0]), var[1], var[2]])
#            # get userId roster for each machine
#            for i in range(1, 22):
#                cur.execute(statementSelectSQL2 % (self.startTimeOfShiftWorking, str(i)))
#                data.clear
#                data = cur.fetchall()
#                #print("data:", data)
#                if len(data) != 0:
#                    workerRosterData.append(data[0][0])
#                else:
#                    workerRosterData.append(0)
#                #print("workerRosterData", workerRosterData)
#        except Error as e:
#            print(e)
#        finally:
#            conn.close()
#        self.fillUsersListModel.emit(workerModeData_)
#        self.fillCurrentWorkerRoster.emit(workerRosterData)



