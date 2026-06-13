# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
import datetime
import os


class AddUserPageModel(QObject):
    userImgDirLocation = "/home/thinh/SmartKnitFactory/KF4/userImages/"

    catupeImg = Signal(str, str)
    newCardInfo = Signal(str)
    fillNewUserUI = Signal(list)
    answerCheckCardUsed = Signal(bool)

    def __init__(self, uaListener_):
        QObject.__init__(self)
        self.uaListener = uaListener_
        self.uaListener.NewCardInfoSignal.connect(self.newCardInfo)
        self.currentTime = ""

    def updateCurrentTime(self):
        now = datetime.datetime.now()
        self.currentTime = now.strftime("%Y-%m-%d %H:%M:%S")

    @Slot(str, str)
    def checkAndCreateFolderIfNotExists(self, folder_, imgName_):
        #print("check if ..", folder_)
        if not os.path.exists(AddUserPageModel.userImgDirLocation + folder_):
            #print("not exits")
            os.makedirs(AddUserPageModel.userImgDirLocation + folder_)
        self.catupeImg.emit(folder_, imgName_)

    @Slot(str, str, str, str, str, str, str, str)
    def addNewUser(self, firstName, lastName, phone, position, cardUID, faceImgUrl, idttCardFrontUrl, idttCardBackUrl):
        self.updateCurrentTime()
        statementSelectSQLWithCardUID = "SELECT * FROM User WHERE CardUID = '%s'"
        statementUpdateCardUIDSQLWithCardUID = "UPDATE User SET CardUID = '%s' WHERE CardUID = '%s'"
        statementInsertSQL = "INSERT INTO User(FirstName, LastName, Phone, Position, CardUID, WorkInCompany, JoinCompanyDay, FaceImgURL, CitizenIndentityCardFrontImgURL, CitizenIndentityCardBackImgURL, WatchNumber) VALUES ('%s', '%s','%s', '%s', '%s', 'Đang Làm', '%s', '%s', '%s', '%s', 0)"
        statementSelectSQL = "SELECT FirstName, LastName, Phone, Position, JoinCompanyDay, FaceImgURL, CitizenIndentityCardFrontImgURL, CitizenIndentityCardBackImgURL FROM User ORDER BY ID DESC LIMIT 1"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSelectSQLWithCardUID % cardUID)
                data = cur.fetchall()
                if len(data) != 0:
                    #print("uesed")
                    cur.execute(statementUpdateCardUIDSQLWithCardUID % ("", cardUID))

                cur.execute(statementInsertSQL % (firstName, lastName, phone, position, cardUID, self.currentTime, faceImgUrl, idttCardFrontUrl, idttCardBackUrl))
                conn.commit()

                cur.execute(statementSelectSQL)
                data = cur.fetchall()
                #print(data)
                for var in data:
                    data_.append([var[0], var[1], var[2], var[3], str(var[4]), var[5], var[6], var[7]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fillNewUserUI.emit(data_)

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
            #print("uesed")
            self.answerCheckCardUsed.emit(True)



