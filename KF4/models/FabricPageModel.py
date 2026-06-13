# This Python file uses the following encoding: utf-8
import datetime
from datetime import timedelta
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from PySide2.QtCore import QObject, Slot, Signal


class FabricPageModel(QObject):

    def takeFirst(self, elem):
        return elem[0]

    # fabricPage's Signal
    fill_lv_fabricConfig = Signal(list)
    fill_lv_fabricType = Signal(list)
    fill_cb_fabricType = Signal(list)
    fill_cb_customer = Signal(list)
    fill_cb_yarnType1 = Signal(list)
    fill_cb_yarnType3 = Signal(list)
    fill_cb_yarnLot1Model = Signal(list)
    fill_cb_yarnLot2Model = Signal(list)
    fill_cb_yarnLot3Model = Signal(list)
    fill_cb_yarnLot4Model = Signal(list)
    fill_cb_yarnLot5Model = Signal(list)

    fillYarnDetails = Signal(list)
    fillYarn1Details = Signal(list)
    fillYarn2Details = Signal(list)
    fillYarn3Details = Signal(list)
    fillYarn4Details = Signal(list)
    updateFabricTypeAlreadyUsedVariable = Signal(bool)

    # ============= fabricPage's Slot

    @Slot(str, str)
    def editPrintCode(self, fabricConfigID_, newPrintCode_):
        statementUpdateSQL = "UPDATE TB_FabricConfig SET PrintCode = %s WHERE FabricConfigId = %s"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                #cur.execute(statementUpdateSQL % (newPrintCode_, fabricConfigID_))
                cur.execute(statementUpdateSQL, (newPrintCode_, fabricConfigID_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_fabricConfigCompleted()

    @Slot(str, str)
    def editRoundsPerRoll(self, fabricConfigID_, newRoundsPerRoll_):
        statementUpdateSQL = "UPDATE TB_FabricConfig SET RoundsPerRoll = %s WHERE FabricConfigId = %s"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                cur.execute(statementUpdateSQL % (newRoundsPerRoll_, fabricConfigID_))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_fabricConfigCompleted()

    @Slot(str)
    def tf_editFabricTypeChangedNeedToUpdateAlreadyUseVariable(self, var1):
        statementSQL = "SELECT * FROM TB_FabricConfig WHERE Code LIKE '%" + var1 + "%'"
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
            self.updateFabricTypeAlreadyUsedVariable.emit(False)
        else:
            self.updateFabricTypeAlreadyUsedVariable.emit(True)

    @Slot(str, str, str, str, str)
    def yarnDetails(self, var1, var2, var3, var4, var5):
        '''
        var1: yarlotid 1
        var2: yarlotid 1
        var3: yarlotid 1
        var4: yarlotid 1
        var5: yarlotid 1
        '''
        statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotId  = %s"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL % var1)
                data = cur.fetchall()
                var = data[0]
                data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
                if var2 != "None":
                    cur.execute(statemenSQL % var2)
                    data = cur.fetchall()
                    var = data[0]
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
                else:
                    data_.append([""])

                if var3 != "None":
                    cur.execute(statemenSQL % var3)
                    data = cur.fetchall()
                    var = data[0]
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
                else:
                    data_.append([""])

                if var4 != "None":
                    cur.execute(statemenSQL % var4)
                    data = cur.fetchall()
                    var = data[0]
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
                else:
                    data_.append([""])

                if var5 != "None":
                    cur.execute(statemenSQL % var5)
                    data = cur.fetchall()
                    var = data[0]
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
                else:
                    data_.append([""])

        except Error as e:
            print("sql error: ",e)
        finally:
            conn.close()
        self.fillYarnDetails.emit(data_)

    # update yarn 1 - used when create variant Button in FabricMachinePage is clicked
    @Slot(str)
    def yarn1Details(self, var1):
        '''
        var1: yarlotid 1
        '''
        statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotId  = %s"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL % var1)
                data = cur.fetchall()
                var = data[0]
                data_.append(str(var[0]))
                data_.append(str(var[1]))
                data_.append(str(var[2]))
                data_.append(str(var[3]))
                data_.append(str(var[4]))
        except Error as e:
            print("sql error: ",e)
        finally:
            conn.close()
        self.fillYarn1Details.emit(data_)

    # update yarn 2 - used when create variant Button in FabricMachinePage is clicked
    @Slot(str)
    def yarn2Details(self, var1):
        '''
        var1: yarlotid 2
        '''
        statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotId  = %s"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL % var1)
                data = cur.fetchall()
                var = data[0]
                data_.append(str(var[0]))
                data_.append(str(var[1]))
                data_.append(str(var[2]))
                data_.append(str(var[3]))
                data_.append(str(var[4]))
        except Error as e:
            print("sql error: ",e)
        finally:
            conn.close()
        self.fillYarn2Details.emit(data_)

    # update yarn 3 - used when create variant Button in FabricMachinePage is clicked
    @Slot(str)
    def yarn3Details(self, var1):
        '''
        var1: yarlotid 3
        '''
        statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotId  = %s"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL % var1)
                data = cur.fetchall()
                var = data[0]
                data_.append(str(var[0]))
                data_.append(str(var[1]))
                data_.append(str(var[2]))
                data_.append(str(var[3]))
                data_.append(str(var[4]))
        except Error as e:
            print("sql error: ",e)
        finally:
            conn.close()
        self.fillYarn3Details.emit(data_)

    # update yarn 4 - used when create variant Button in FabricMachinePage is clicked
    @Slot(str)
    def yarn4Details(self, var1):
        '''
        var1: yarlotid 4
        '''
        statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotId  = %s"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL % var1)
                data = cur.fetchall()
                var = data[0]
                data_.append(str(var[0]))
                data_.append(str(var[1]))
                data_.append(str(var[2]))
                data_.append(str(var[3]))
                data_.append(str(var[4]))
        except Error as e:
            print("sql error: ",e)
        finally:
            conn.close()
        self.fillYarn4Details.emit(data_)

    #===========================================================================
    @Slot(str, str)
    def editFabricType(self, var1, var2):
        query1 = "UPDATE FabricType SET FabricTypeName = %s WHERE FabricTypeId = %s"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor(buffered=True)
                cur.execute(query1, (var2.upper(), var1))
                conn.commit()
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.lv_fabricTypeCompleted()
    #===========================================================================

    @Slot(str)
    def tf_searchChanged(self, var1):
        statementSQL = "SELECT * FROM TB_FabricConfig WHERE Code LIKE '%" + var1 + "%'"
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



    @Slot(str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str)                                             # for add new yarn lot
    def addFabricConfig(self, var1, var2, var3, var4, var5, var6, var7, var8,
                            var9, var10, var11,
                            var12, var13, var14,
                            var15, var16, var17,
                            var18, var19, var20,
                            var21, var22, var23, var24):

        #print("in function: addFabricConfig")

#        query = "INSERT INTO TB_FabricConfig(Code, PrintCode, FabricType_FabricTypeId, MPKg, Wide, YarnLot_YarnLotId1, Yarn1Speed, Yarn1ConeNum, \
#                                            YarnLot_YarnLotId2, Yarn2Speed, Yarn2ConeNum, \
#                                            YarnLot_YarnLotId3, Yarn3Speed, Yarn3ConeNum, \
#                                            YarnLot_YarnLotId4, Yarn4Speed, Yarn4ConeNum, \
#                                            YarnLot_YarnLotId5, Yarn5Speed, Yarn5ConeNum, \
#                                            RoundsPerRoll, MachineDia, Gauge, Customer_ID) VALUES(\
#                                            '%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"

        queryHead = "INSERT INTO TB_FabricConfig(Code, PrintCode, FabricType_FabricTypeId, MPKg, Wide, YarnLot_YarnLotId1, Yarn1Speed, Yarn1ConeNum"
        varList = [var1, var2, var3, var4, var5, var6, var7, var8]
        queryTail = "'{}','{}','{}','{}','{}','{}','{}','{}'"

        if var9 != "":
            queryHead = queryHead + ", YarnLot_YarnLotId2, Yarn2Speed, Yarn2ConeNum"
            queryTail = queryTail + ",'{}','{}','{}'"
            varList.extend([var9, var10, var11])
        if var12 != "":
            queryHead = queryHead + ", YarnLot_YarnLotId3, Yarn3Speed, Yarn3ConeNum"
            queryTail = queryTail + ",'{}','{}','{}'"
            varList.extend([var12, var13, var14])
        if var15 != "":
            queryHead = queryHead + ", YarnLot_YarnLotId4, Yarn4Speed, Yarn4ConeNum"
            queryTail = queryTail + ",'{}','{}','{}'"
            varList.extend([var15, var16, var17])
        if var18 != "":
            queryHead = queryHead + ", YarnLot_YarnLotId5, Yarn5Speed, Yarn5ConeNum"
            queryTail = queryTail + ",'{}','{}','{}'"
            varList.extend([var18, var19, var20])

        queryHead = queryHead + ", RoundsPerRoll, MachineDia, Gauge, Customer_ID) VALUES ("
        queryTail = queryTail + ",'{}','{}','{}','{}'"
        query = queryHead + queryTail
        varList.extend([var21, var22, var23, var24])
        query = query + ")"

        #print(query.format(*varList))

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                #print("before execute command")
                cur.execute(query.format(*varList))
                conn.commit()
        except Error as e:
            print("error:")
            print(e)
        finally:
            conn.close()
        self.lv_fabricConfigCompleted()

    @Slot(str)
    def addFabricType(self, var1):
        query = "INSERT INTO FabricType(FabricTypeName) VALUES('%s')"
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
        self.lv_fabricTypeCompleted()

    @Slot()
    def lv_fabricConfigCompleted(self):
        statemenSQL = "SELECT \
        FabricConfigId, \
        Code, \
        PrintCode, \
        FabricType_FabricTypeId, \
        MPKg, \
        Wide, \
        Yarn1.YarnTypeName, \
        Yarn2.YarnTypeName, \
        Yarn3.YarnTypeName, \
        Yarn4.YarnTypeName, \
        Yarn5.YarnTypeName, \
        Yarn1Speed, Yarn2Speed, Yarn3Speed, Yarn4Speed, Yarn5Speed, \
        Yarn1ConeNum, Yarn2ConeNum, Yarn3ConeNum, Yarn4ConeNum,  Yarn5ConeNum, \
        RoundsPerRoll \
        FROM TB_FabricConfig FCF\
        JOIN YarnLot YL1 ON YL1.YarnLotId = FCF.YarnLot_YarnLotId1 JOIN YarnType Yarn1 ON Yarn1.YarnTypeId = YL1.YarnType_YarnTypeId  \
        JOIN YarnLot YL2 ON YL2.YarnLotId = FCF.YarnLot_YarnLotId2 JOIN YarnType Yarn2 ON Yarn2.YarnTypeId = YL2.YarnType_YarnTypeId  \
        JOIN YarnLot YL3 ON YL3.YarnLotId = FCF.YarnLot_YarnLotId3 JOIN YarnType Yarn3 ON Yarn3.YarnTypeId = YL3.YarnType_YarnTypeId \
        JOIN YarnLot YL4 ON YL4.YarnLotId = FCF.YarnLot_YarnLotId4 JOIN YarnType Yarn4 ON Yarn4.YarnTypeId = YL4.YarnType_YarnTypeId  \
        JOIN YarnLot YL5 ON YL5.YarnLotId = FCF.YarnLot_YarnLotId5 JOIN YarnType Yarn5 ON Yarn5.YarnTypeId = YL5.YarnType_YarnTypeId  "

        statemenSQL2 = "SELECT * FROM TB_FabricConfig"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL2)
                data = cur.fetchall()
        except Error as e:
            print("sql error: ",e)
        finally:
            conn.close()
        for var in data:
            #print(var)
            data_.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20]), str(var[21]), str(var[22]), str(var[23]), str(var[24])])
        data_.sort(key=lambda kv: int(kv[0]), reverse = True)
        self.fill_lv_fabricConfig.emit(data_)

    @Slot()
    def lv_fabricTypeCompleted(self):
        statemenSQL = "SELECT * FROM FabricType"
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
            data_.append([str(var[0]), var[1]])
        self.fill_lv_fabricType.emit(data_)

    @Slot()
    def cb_customerCompleted(self):
        statemenSQL = "SELECT * FROM Customer"
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
        self.fill_cb_customer.emit(data_)

    @Slot()
    def cb_fabricTypeCompleted(self):
        statemenSQL = "SELECT * FROM FabricType"
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
            data_.append([str(var[0]), var[1]])
        self.fill_cb_fabricType.emit(data_)

    @Slot()
    def cb_yarnType1Completed(self):
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
            if (var[1] != "_") and (var[1].find("SU") == -1):
                data_.append([str(var[0]), var[1], str(var[2])])
        data_.sort(key=lambda kv: kv[1])
        self.fill_cb_yarnType1.emit(data_)

    @Slot()
    def cb_yarnType3Completed(self):
        statemenSQL = "SELECT * FROM YarnType WHERE YarnTypeName LIKE '%SU%'"
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
        self.fill_cb_yarnType3.emit(data_)

    @Slot(str)
    def updateYarnLot1Model(self, var1):
        statementSQL = statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
                data.sort(key=lambda kv: int(kv[0]), reverse = True)
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fill_cb_yarnLot1Model.emit(data_)

    @Slot(str)
    def updateYarnLot2Model(self, var1):
        statementSQL = statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
                data.sort(key=lambda kv: int(kv[0]), reverse = True)
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fill_cb_yarnLot2Model.emit(data_)

    @Slot(str)
    def updateYarnLot3Model(self, var1):
        statementSQL = statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
                data.sort(key=lambda kv: int(kv[0]), reverse = True)
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fill_cb_yarnLot3Model.emit(data_)

    @Slot(str)
    def updateYarnLot4Model(self, var1):
        statementSQL = statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
                data.sort(key=lambda kv: int(kv[0]), reverse = True)
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fill_cb_yarnLot4Model.emit(data_)

    @Slot(str)
    def updateYarnLot5Model(self, var1):
        statementSQL = statemenSQL = "SELECT * FROM YarnLot WHERE YarnLotCode LIKE '%" + var1 + "%'"
        data_ = []
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL)
                data = cur.fetchall()
                data.sort(key=lambda kv: int(kv[0]), reverse = True)
                for var in data:
                    data_.append([str(var[0]), var[1], str(var[2]), str(var[3]), var[4]])
        except Error as e:
            print(e)
        finally:
            conn.close()
        self.fill_cb_yarnLot5Model.emit(data_)
