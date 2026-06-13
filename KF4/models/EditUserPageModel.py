# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
import datetime


class EditUserPageModel(QObject):

    newCardInfo = Signal(str)
    answerCheckCardUsed = Signal(bool)
    fillUserListView = Signal(list)
    updateOutCompanyDayOfModelOfListView = Signal(str)

    def __init__(self, uaListener_):
        QObject.__init__(self)
        self.uaListener = uaListener_
        self.uaListener.NewCardInfoSignal.connect(self.newCardInfo)
        self.currentTime = ""

    def updateCurrentTime(self):
        now = datetime.datetime.now()
        self.currentTime = now.strftime("%Y-%m-%d %H:%M:%S") # STANDARD FORM DATETIME MYSQL .THINH KNOWS ON 1/12/21

    @Slot(str)
    def checkUsed(self, cardUID):
        #print("checking card")
        statementSelectSQL = "SELECT * FROM User WHERE CardUID = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL % cardUID)
                data = cur.fetchall()
        except Error as e:
            print(e)
        finally:
            conn.close()
        if len(data) != 0:
            print("uesed")
            self.answerCheckCardUsed.emit(True)

    @Slot()
    def requestFillUserListView(self):
        statementSelectSQL = "SELECT ID, CardUID, FirstName, LastName, Phone, Position, WorkInCompany, JoinCompanyDay, OutCompanyDay, FaceImgURL, CitizenIndentityCardFrontImgURL, CitizenIndentityCardBackImgURL FROM User ORDER BY WorkInCompany DESC"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQL)
                data = cur.fetchall()
                for var in data:
                    data_.append([str(var[0]), var[1], var[2], var[3], var[4], var[5], var[6], str(var[7]), str(var[8]), var[9], var[10], var[11]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillUserListView.emit(data_)

    @Slot(str)
    def tf_searchChanged(self, var1):
        statementSQL = "SELECT ID, CardUID, FirstName, LastName, Phone, Position, WorkInCompany, JoinCompanyDay, OutCompanyDay, FaceImgURL, CitizenIndentityCardFrontImgURL, CitizenIndentityCardBackImgURL FROM User WHERE FirstName LIKE '%" + var1 + "%' ORDER BY WorkInCompany DESC"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL)
                data = cur.fetchall()
                for var in data:
                    data_.append([str(var[0]), var[1], var[2], var[3], var[4], var[5], var[6], str(var[7]), str(var[8]), var[9], var[10], var[11]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillUserListView.emit(data_)

    @Slot(str)
    def userOutCompany(self, idRow_):
        self.updateCurrentTime()
        statementUpdateOutCompanyDaySQLWithID = "UPDATE User SET OutCompanyDay = '%s', WorkInCompany = '%s', CardUID = '' WHERE ID = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementUpdateOutCompanyDaySQLWithID % (self.currentTime, "ĐÃ NGHỈ", idRow_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.updateOutCompanyDayOfModelOfListView.emit(self.currentTime)

    @Slot(str, str)
    def overWriteCardUID(self, idRow_, newCardUid_):
        statementSelectSQLWithCardUID = "SELECT * FROM User WHERE CardUID = '%s'"
        statementUpdateCardUIDSQLWithCardUID = "UPDATE User SET CardUID = '%s' WHERE CardUID = '%s'"
        statementUpdateCardUIDSQLWithID = "UPDATE User SET CardUID = '%s' WHERE ID = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQLWithCardUID % newCardUid_)
                data = cur.fetchall()
                if len(data) != 0:
                    #print("uesed")
                    cur.execute(statementUpdateCardUIDSQLWithCardUID % ("", newCardUid_))
                cur.execute(statementUpdateCardUIDSQLWithID % (newCardUid_, idRow_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()



