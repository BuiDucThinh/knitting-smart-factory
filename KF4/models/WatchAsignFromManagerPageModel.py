# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
import datetime
from datetime import timedelta


class WatchAsignFromManagerPageModel(QObject):

    fillUsersListModel = Signal(list)
    fillWorkerWatchCouplesListModel = Signal(list)
#    fillTimeData = Signal(list)
#    fillNextWorkerRoster = Signal(list)
#    fillCurrentWorkerRoster = Signal(list)

    def __init__(self, ):
        QObject.__init__(self)
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

    @Slot()
    def initializingWorkerList(self):
        statementSelectSQL = "SELECT ID, FirstName, FaceImgURL FROM User WHERE WorkInCompany = 'Đang Làm' AND CardUID != '' AND (Position = 'KỸ THUẬT' OR Position = 'NGHỆ NHÂN DỆT') ORDER BY ID DESC"
        workerModeData_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL)
                data = cur.fetchall()
                for var in data:
                    if var[0] != 0:
                        workerModeData_.append([str(var[0]), var[1], var[2]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillUsersListModel.emit(workerModeData_)

    @Slot()
    def initializingWorkerWatchCouplesList(self):
        statementSelectSQL = "SELECT LastName, FirstName, WatchNumber FROM User WHERE WorkInCompany = 'Đang Làm' AND CardUID != '' AND (Position = 'KỸ THUẬT' OR Position = 'NGHỆ NHÂN DỆT') ORDER BY ID DESC"
        workerWatchCouplesData_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL)
                data = cur.fetchall()
                for var in data:
                    if var[1] != "Trống":
                        workerWatchCouplesData_.append([var[0], var[1], str(var[2])])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillWorkerWatchCouplesListModel.emit(workerWatchCouplesData_)

    @Slot(str, str)
    def updateWatchOfUser(self, userId_, watchNumber_):
        statementUpdateSQL = "UPDATE User SET WatchNumber = '%s' WHERE (ID = '%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementUpdateSQL % (watchNumber_, userId_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.initializingWorkerWatchCouplesList()

