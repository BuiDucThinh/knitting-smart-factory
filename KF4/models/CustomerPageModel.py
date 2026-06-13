# This Python file uses the following encoding: utf-8
import datetime
from datetime import timedelta
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from PySide2.QtCore import QObject, Slot, Signal


class CustomerPageModel(QObject):

    # customerPage's Signal
    fill_lv_customerInfo = Signal(list)
    fill_lv_fabricConfig = Signal(list)


    # customerPage's Slot
    @Slot(str, str, str, str)
    def updateCustomerInfo(self, id_, subject_, name_, abbreviation_):
        statementUpdateCustomerInfo = "UPDATE Customer SET Subject = '%s', Name = '%s', Abbreviation = '%s' WHERE ID = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementUpdateCustomerInfo % (subject_, name_, abbreviation_, id_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_customerInfoCompleted()


    @Slot(str, str)
    def tf_searchChanged(self, id, var1):
        #print(id, var1)
        statementSQL = "SELECT * FROM TB_FabricConfig WHERE Customer_ID = '" + id + "' AND Code LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL)
                data = cur.fetchall()
                for var in data:
                    data_.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20]), str(var[21]), str(var[22]), str(var[23]), str(var[24])])
        except Error as e:
            print(e)
        finally:
            conn.close()
        data_.sort(key=lambda kv: int(kv[0]), reverse = True)
        self.fill_lv_fabricConfig.emit(data_)

    @Slot(str)
    def update_lv_fabricConfig(self, var1):
        statementSQL = "SELECT * FROM TB_FabricConfig WHERE Customer_ID = '%s'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statementSQL % var1)
                data = cur.fetchall()
                for var in data:
                    data_.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20]), str(var[21]), str(var[22]), str(var[23]), str(var[24])])
        except Error as e:
            print(e)
        finally:
            conn.close()
        data_.sort(key=lambda kv: int(kv[0]), reverse = True)
        self.fill_lv_fabricConfig.emit(data_)



    @Slot()
    def lv_customerInfoCompleted(self):
        statemenSQL = "SELECT * FROM Customer ORDER BY ID DESC"
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
            data_.append([str(var[0]), var[1], var[2], var[3]])
        self.fill_lv_customerInfo.emit(data_)


    @Slot(str, str, str)                                             # for add new CUSTOMER
    def addCustomer(self, var1, var2, var3):
        query = "INSERT INTO Customer(Subject, Name, Abbreviation) VALUES('%s','%s','%s')"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(query % (var1, var2, var3))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_customerInfoCompleted()

