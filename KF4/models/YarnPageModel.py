# This Python file uses the following encoding: utf-8
import datetime
from datetime import timedelta
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from PySide2.QtCore import QObject, Slot, Signal, QTimer


class YarnPageModel(QObject):

    # yarnPage's Signal
    fill_lv_yarnType = Signal(list)
    fill_lv_producer = Signal(list)
    fill_lv_yarnLot = Signal(list)

    updateProducerAlreadyUsedVariable = Signal(bool)
    updateYarnAlreadyUsedVariable = Signal(bool)
    # ====== end

    # ====== yarnPage's Slot
    @Slot(str, str)
    def bt_searchByCbClicked(self, var1, var2):
        statementSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%" + var2+ "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL)
                data = cur.fetchall()
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        data_.sort(key=lambda kv: int(kv[0]), reverse = True)
        self.fill_lv_yarnLot.emit(data_)

    @Slot(str)
    def tf_editProducerChangedNeedToUpdateAlreadyUseVariable(self, var1):
        statementSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL)
                data = cur.fetchall()
        except Error as e:
            print(e)
        finally:
            conn.close()
        if len(data) == 0:
            self.updateProducerAlreadyUsedVariable.emit(False)
        else:
            self.updateProducerAlreadyUsedVariable.emit(True)

    @Slot(str)
    def tf_editYarnTypeChangedNeedToUpdateAlreadyUseVariable(self, var1):
        statementSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL)
                data = cur.fetchall()
        except Error as e:
            print(e)
        finally:
            conn.close()
        if len(data) == 0:
            self.updateYarnAlreadyUsedVariable.emit(False)
        else:
            self.updateYarnAlreadyUsedVariable.emit(True)

    @Slot(str)
    def tf_searchChanged(self, var1):
        statementSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL)
                data = cur.fetchall()
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        data_.sort(key=lambda kv: kv[0], reverse = True)
        self.fill_lv_yarnLot.emit(data_)

    @Slot(str, str)# ++++++++++++++++++++++++++++++++++++++++++++++ for fill list yarn lot
    def lv_yarnLotCompleted(self , var1, var2):
        statemenSQL = "SELECT * FROM YarnLot"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)

            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
        except Error as e:
            print(e)
        finally:
            conn.close()
        for var in data:
                data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        data_.sort(key=lambda kv: int(kv[0]), reverse = True) #key=lambda kv: kv[1])
        self.fill_lv_yarnLot.emit(data_)

    @Slot(str, str, str, str)                                             # for add new yarn lot
    def addYarnLot(self, var1, var2, var3, var4):
        query = "INSERT INTO YarnLot(YarnLotCode, YarnType_YarnTypeId, YarnProducer_YarnProducerId, LotCode) VALUES('%s','%s','%s','%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(query % (var1, var2, var3, var4))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_yarnLotCompleted("-1","-1")

    @Slot()# ++++++++++++++++++++++++++++++++++++++++++++++ for fill list producer
    def lv_producerCompleted(self):
        statemenSQL = "SELECT * FROM YarnProducer"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)

            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
        except Error as e:
            print(e)
        finally:
            conn.close()
        for var in data:
            if var[1] != "_":
                data_.append([str(var[0]), var[1]])
        data_.sort(key=lambda kv: kv[1])
        self.fill_lv_producer.emit(data_)

    @Slot(str, str, str)
    def editProducer(self, var1, var2, var3):
        query1 = "UPDATE YarnProducer SET YarnProducerName = %s WHERE YarnProducerId = %s"
#        query2 = "SELECT * FROM YarnLot WHERE YarnProducer_YarnProducerId = " + var1
#        data = []
#        queryList = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                cur.execute(query1, (var2.upper(), var1))
                conn.commit()
#                cur.execute(query2)
#                conn.commit()
#                data = cur.fetchall()
#                for row in data:
#                    queryList.append("UPDATE YarnLot SET YarnLotCode = '" + row[1].replace(var3, var2.upper()) + "' WHERE YarnLotId = " + str(row[0]))
#                for item in queryList:
#                    cur.execute(item)
#                    conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_producerCompleted()
#        self.lv_yarnLotCompleted("-1","-1")



    @Slot(str)
    def deleteProducer(self, id):
        query = "DELETE FROM YarnProducer WHERE YarnProducerId = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                cur.execute(query % id)
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_producerCompleted()

    @Slot(str)
    def addProducer(self, var1):        
        query = "INSERT INTO YarnProducer(YarnProducerName) VALUES('%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(query % var1)
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_producerCompleted()

    @Slot() # ++++++++++++++++++++++++++++++++++++++++++++++ for fill list yarn type
    def lv_yarnTypeCompleted(self):
        statemenSQL = "SELECT * FROM YarnType"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)

            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
        except Error as e:
            print(e)
        finally:
            conn.close()
        for var in data:
            if var[1] != "_":
                data_.append([str(var[0]), var[1], str(var[2])])
        data_.sort(key=lambda kv: kv[1])
        self.fill_lv_yarnType.emit(data_)

    @Slot(str, str, str, str)                                         # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> for edit specific yarn type
    def editYarnType(self, index, newName, newD, oldName):
        query1 = "UPDATE YarnType SET YarnTypeName = %s, D = %s WHERE YarnTypeId = %s"
        query2 = "SELECT * FROM YarnLot WHERE YarnType_YarnTypeId = " + index
        data = []
        queryList = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                cur.execute(query1, (newName.upper(), newD, index))
                conn.commit()
                if(newName != oldName):
                    cur.execute(query2)
                    conn.commit()
                    data = cur.fetchall()
                    for row in data:
                        queryList.append("UPDATE YarnLot SET YarnLotCode = '" + row[1].replace(oldName, newName.upper()) + "' WHERE YarnLotId = " + str(row[0]))
                    for item in queryList:
                        cur.execute(item)
                        conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_yarnTypeCompleted()
        self.lv_yarnLotCompleted("-1","-1")

    @Slot(str)
    def deleteYarnType(self, id):
        query = "DELETE FROM YarnType WHERE YarnTypeId = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                cur.execute(query % id)
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_yarnTypeCompleted()

    @Slot(str,str)                                             # for add new specific yarn type==========================================
    def addYarnType(self, var1, var2):
        query = "INSERT INTO YarnType(YarnTypeName, D) VALUES('%s','%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(query % (var1, var2))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_yarnTypeCompleted()
    # ============================================================== end
