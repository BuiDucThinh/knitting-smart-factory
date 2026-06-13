# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
import datetime
from datetime import timedelta
from supportClass.NetworkManager import NetworkManager


class SetMchStatusPageModel(QObject):

    fillStatusList = Signal(list)
    fillSmallYarnRollList = Signal(list)
    fillWeakYarnList = Signal(list)

    def __init__(self, networkManager_):
        QObject.__init__(self)
        self.networkManager = networkManager_
        self.currentTime = ""
        self.workDay = ""
        self.workShift = ""
        self.nextWorkDay = ""
        self.nextWorkShift = ""

        self.workDayUI = ""
        self.nextWorkDayUI = ""
        self.startTimeOfShiftWorking = ""
        self.endTimeOfShiftWorking = ""
        self.startTimeOfPriorShiftWorking = ""
        self.endTimeOfPriorShiftWorking = ""

    def updateTimeVariables(self):
        now = datetime.datetime.now()
        self.currentTime = now.strftime("%Y-%m-%d %H:%M:%S")
        # update value for workDay and workShift
        if now.hour >= 6 and (now.hour <= 23 and now.minute <= 59 and now.second <=59):
            self.workDay = now.strftime("%Y-%m-%d")
            self.workDayUI = now.strftime("%d/%m/%Y")
        else:
            yesterday = now.date() - timedelta(days = 1)
            self.workDay = yesterday.strftime("%Y-%m-%d")
            self.workDayUI = yesterday.strftime("%d/%m/%Y")

        if now.hour >= 6 and (now.hour <= 15 and now.minute <= 59 and now.second <=59):
            self.workShift = "Ngày"
            self.nextWorkShift = "Đêm"
            self.nextWorkDay = self.workDay
            self.nextWorkDayUI = self.workDayUI
        else:
            self.workShift = "Đêm"
            self.nextWorkShift = "Ngày"
            tomorrow = now.date() + timedelta(days = 1)
            self.nextWorkDay = tomorrow.strftime("%Y-%m-%d")
            self.nextWorkDayUI = tomorrow.strftime("%d/%m/%Y")

        # update startTime and EndTime of Shift
        # update startTime and EndTime of Prior Shift
        today = now.date()
        yesterday = today - timedelta(days=1)
        tomorrow = today + timedelta(days=1)
        if now.hour >= 0 and now.hour < 6:
            self.startTimeOfShiftWorking = yesterday.strftime("%Y-%m-%d") + " 16:00:01"
            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
            self.startTimeOfPriorShiftWorking = yesterday.strftime("%Y-%m-%d") + " 6:00:00"
            self.endTimeOfPriorShiftWorking = yesterday.strftime("%Y-%m-%d") + " 15:00:00"  #15:00:00 for suring some scenario worker come early.
        elif now.hour >= 6 and now.hour < 16:
            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:01"
            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:00"
            self.startTimeOfPriorShiftWorking = yesterday.strftime("%Y-%m-%d") + " 15:00:00"    #15:00:00 for suring  some scenario worker come early.
            self.endTimeOfPriorShiftWorking = today.strftime("%Y-%m-%d") + " 5:59:59"
        elif now.hour >= 16 and now.hour < 24:
            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " 16:00:01"
            self.endTimeOfShiftWorking = tomorrow.strftime("%Y-%m-%d") + " 6:00:00"
            self.startTimeOfPriorShiftWorking = today.strftime("%Y-%m-%d") + " 6:00:00"
            self.endTimeOfPriorShiftWorking = today.strftime("%Y-%m-%d") + " 15:00:00"  #15:00:00 for suring some scenario worker come early.

    @Slot(list, list, list, list)
    def saveStatusToDTB(self, changedList_, runModeList_, knitSmallYarnRollList_, knitWeakYarnList_):
        #print(changedList_)
        #print(runModeList_)
        statementUpdateRunStatusSQL = "UPDATE MachineStatus SET Status = '%s' WHERE MachineNum = %s"
        statementUpdateYarnStatusSQL = "UPDATE WorkerPerformance SET KnitSmallYarnRoll = '%s', KnitWeakYarn = '%s' WHERE StartTime >= '%s' AND MchNumber = '%s' ORDER BY ID DESC LIMIT 1"
        self.updateTimeVariables()
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                for i in range(0, 21):
                    if changedList_[i] == 1:
                        if runModeList_[i] == "NORMAL":
                            NetworkManager.send(str(i+1), "1")
                        elif runModeList_[i] == "ADJUST":
                            NetworkManager.send(str(i+1), "4")
                        cur.execute(statementUpdateRunStatusSQL % (runModeList_[i] , str(i+1)))
                        cur.execute(statementUpdateYarnStatusSQL % (str(knitSmallYarnRollList_[i]), str(knitWeakYarnList_[i]), self.startTimeOfShiftWorking , str(i+1)))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.initializingMchStatus()

    @Slot()
    def initializingMchStatus(self):
        statementSelectRunStatusSQL = "SELECT Status FROM MachineStatus"
        statementSelectSmallYarnRollFlagSQL = "SELECT KnitSmallYarnRoll, KnitWeakYarn FROM WorkerPerformance WHERE StartTime >= '%s' AND MchNumber = '%s' ORDER BY ID DESC LIMIT 1"

        statusListData = []
        smallYarnRollFlag = []
        weakYarnFlag = []
        self.updateTimeVariables()
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectRunStatusSQL)
                data = cur.fetchall()
                for var in data:
                    statusListData.append(var[0])

                for i in range(1, 22):
#                    print(statementSelectSmallYarnRollFlagSQL % (self.startTimeOfShiftWorking, str(i)))
                    cur.execute(statementSelectSmallYarnRollFlagSQL % (self.startTimeOfShiftWorking, str(i)))
                    data = cur.fetchall()
#                    print(data)
                    if len(data) != 0:
                        smallYarnRollFlag.append(data[0][0])
                        weakYarnFlag.append(data[0][1])
                    else:
                        smallYarnRollFlag.append(0)
                        weakYarnFlag.append(0)

        except Error as e:
            print(e)
        finally:
            conn.close()
        #print("statusListData", statusListData)
        self.fillStatusList.emit(statusListData)
        #print("smallYarnRollFlag", smallYarnRollFlag)
        self.fillSmallYarnRollList.emit(smallYarnRollFlag)
        #print("weakYarnFlag", weakYarnFlag)
        self.fillWeakYarnList.emit(weakYarnFlag)
