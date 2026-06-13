# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error


class DefectProductBadCleaningPageModel(QObject):

    fillUsersListModel = Signal(list)
    fillTimeData = Signal(list)

    def __init__(self, timeValue_):
        QObject.__init__(self)
        self.timeValue = timeValue_

    @Slot()
    def initializingTime(self):
        timeData_ = []

        timeData_.append(self.timeValue.priorWorkShift_)
        timeData_.append(str(self.timeValue.priorWorkDayUI_))
        timeData_.append(self.timeValue.workShift_)
        timeData_.append(str(self.timeValue.workDayUI_))

        self.fillTimeData.emit(timeData_)


    @Slot()
    def initializingWorkerList(self):
        print("DefectProductBadCleaningPageModel: initializingWorkerList")
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


    @Slot(str, str, str)
    def comfirmKgDefectProduct(self, userId_, kg_, positionSignValue_):
        print("DefectProductBadCleaningPageModel: comfirmKgDefectProduct")
        SQL_insertDefectProductKg = "INSERT INTO DefectProductKg(User_ID, Kg, DayWork, ShiftWork) VALUES ('%s', '%s', '%s', '%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                if positionSignValue_ == "1":
                    cur.execute(SQL_insertDefectProductKg % (userId_, kg_, self.timeValue.priorWorkDay_, self.timeValue.priorWorkShift_))
                else:
                    cur.execute(SQL_insertDefectProductKg % (userId_, kg_, self.timeValue.workDay_, self.timeValue.workShift_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()

    @Slot(str, str, str)
    def comfirmBadCleaning(self, userId_, mch_, positionSignValue_):
        print("DefectProductBadCleaningPageModel: comfirmBadCleaning")
        SQL_insertDefectProductKg = "INSERT INTO BadClean(User_ID, WorkDay, WorkShift, MchNumber) VALUES ('%s', '%s', '%s', '%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                if positionSignValue_ == "1":
                    cur.execute(SQL_insertDefectProductKg % (userId_, self.timeValue.priorWorkDay_, self.timeValue.priorWorkShift_, mch_))
                else:
                    cur.execute(SQL_insertDefectProductKg % (userId_, self.timeValue.workDay_, self.timeValue.workShift_, mch_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()



