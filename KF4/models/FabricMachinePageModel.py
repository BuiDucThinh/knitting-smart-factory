# This Python file uses the following encoding: utf-8
import datetime
from datetime import timedelta
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from PySide2.QtCore import QObject, Slot, Signal, QTimer
from copy import deepcopy


class FabricMachinePageModel(QObject):

    # fabricMachinePage's Signal
    fill_allCbModels = Signal(list, list)
    fill_allCbModelsViewMode = Signal(list, list)

    def __init__(self):
        QObject.__init__(self)

        self.currentTime = ""
        self.startTimeOfShiftWorking = ""
        self.endTimeOfShiftWorking = ""

        self.startTimeOfRetrieveShiftWorking = ""
        self.endTimeOfRetrieveShiftWorking = ""

        self.currentTime = ""
        self._time = None
        self._workDay = None
        self._workShift = None
        self.listFutureTaskOffsetTime = []
        self.checkTaskNotYetDone()

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.timeReaderAndAchieveTask())
        self.timer.start(1000)

    def updateTrioTimeSet(self):
        now = datetime.datetime.now()
        self.currentTime = now.strftime("%Y/%m/%d %H:%M:%S")
        today = now.date()
        yesterday = today - timedelta(days=1)
        tomorrow = today + timedelta(days=1)
        if now.hour >= 0 and now.hour < 6:
            self.startTimeOfShiftWorking = yesterday.strftime("%Y/%m/%d") + " 16:00:01"
            self.endTimeOfShiftWorking = today.strftime("%Y/%m/%d") + " 6:00:00"
        elif now.hour >= 6 and now.hour < 16:
            self.startTimeOfShiftWorking = today.strftime("%Y/%m/%d") + " 6:00:01"
            self.endTimeOfShiftWorking = today.strftime("%Y/%m/%d") + " 16:00:00"
        elif now.hour >= 16 and now.hour < 24:
            self.startTimeOfShiftWorking = today.strftime("%Y/%m/%d") + " 16:00:01"
            self.endTimeOfShiftWorking = tomorrow.strftime("%Y/%m/%d") + " 6:00:00"

    def updateBioRetrieveTimeSet(self, dayStr, shiftStr):
        day = datetime.datetime.strptime(dayStr, "%Y/%m/%d")
        tomorrow = day + timedelta(days=1)
        if shiftStr == "Ngày":
            self.startTimeOfRetrieveShiftWorking = day.strftime("%Y/%m/%d") + " 6:00:01"
            self.endTimeOfRetrieveShiftWorking = day.strftime("%Y/%m/%d") + " 16:00:00"
        else:
            self.startTimeOfRetrieveShiftWorking = day.strftime("%Y/%m/%d") + " 16:00:01"
            self.endTimeOfRetrieveShiftWorking = tomorrow.strftime("%Y/%m/%d") + " 6:00:00"

    def timeReaderAndAchieveTask(self):
        now = datetime.datetime.now()
        self.set_time(now.strftime("%Y/%m/%d %H:%M:%S")) #("%H:%M:%S %p | %d/%m/%Y"))

        # initing value for workDay and workShift
        if self.get_workDay() is None:
            if now.hour >= 6 and (now.hour <= 23 and now.minute <= 59 and now.second <=59):
                self.set_workDay(now.date())
            else:
                yesterday = now.date() - timedelta(days = 1)
                self.set_workDay(yesterday)
        if self.get_workShift() is None:
            if now.hour >= 6 and (now.hour <= 15 and now.minute <= 59 and now.second <=59):
                self.set_workShift("Ngày")
            else:
                self.set_workShift("Đêm")

        # check time to change workDay and workShift
        if now.hour == 6 and now.minute == 00 and now.second == 0:
            self.set_workDay(now.date())
            self.set_workShift("Ngày")

        elif now.hour == 16 and now.minute == 00 and now.second == 0:
            self.set_workShift("Ngày")

        # check task is time to action
        currentTime = self.getTime()
        if currentTime in self.listFutureTaskOffsetTime:
            self.actionTask(currentTime)
            self.listFutureTaskOffsetTime.remove(currentTime)


    def checkTaskNotYetDone(self):
        '''
        for some scenario Task isn't actioned in past. ex: power shutdown
        need: get timeAction and compare to current Time. If it is before: Action it.
        Otherwise: save actiontime to self.listFutureTaskOffsetTime with correct format
        '''
        SQL_getAllTask = "SELECT ActionTime FROM TB_UpdateMchFabricCofigTask"

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(SQL_getAllTask)
                data = cur.fetchall()
                now = datetime.datetime.now()
                for task in data:
                    #date_time_obj = datetime.datetime.strptime(task[0], "%Y/%m/%d %H:%M:%S")
                    if task[0] <= now:
                        self.actionTask(task[0])
                    else:
                        self.listFutureTaskOffsetTime.append(task[0].strftime("%Y/%m/%d %H:%M:%S"))
        except Error as e:
            print("sql error: ", e)
        finally:
            conn.close()



    def actionTask(self, currentTime):
        SQL_getValueOfTask = "SELECT * FROM TB_UpdateMchFabricCofigTask WHERE ActionTime = '%s'"
        SQL_updateEndTime = "UPDATE TB_MachineFabricConfig SET EndTime = '%s' WHERE MachineNum = '%s' AND EndTime IS NULL"
        SQL_insertNewRow = "INSERT INTO TB_MachineFabricConfig(MachineNum, TB_FabricConfig_FabricConfigId, StartTime, NumberOfRoundsRan, NumberOfRollsKintted) VALUES('%s','%s', '%s', 0, 0)"
        SQL_deleteTask = "DELETE FROM TB_UpdateMchFabricCofigTask WHERE ActionTime = '%s'"
        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(SQL_getValueOfTask % currentTime)
                data = cur.fetchall()
                for task in data:
                    cur.execute(SQL_updateEndTime % (currentTime, task[1]))
                    cur.execute(SQL_insertNewRow % (task[1], str(task[2]), currentTime))
                    conn.commit()
                cur.execute(SQL_deleteTask % currentTime)
                conn.commit()
        except Error as e:
            print("sql error: ", e)
        finally:
            conn.close()
        self.initialAllModelAndStateOfComboBoxInEditMode()


    def getOffsetTime(self, rollNums, roundPerRoll):
        now = datetime.datetime.now()
        offsetTime = now + timedelta(minutes=rollNums*roundPerRoll/20)
        return offsetTime.strftime("%Y/%m/%d %H:%M:%S")

    def getTime(self):
        now = datetime.datetime.now()
        return now.strftime("%Y/%m/%d %H:%M:%S")

    # _time =======================================
    def get_time(self):
        return self._time

    def set_time(self, value):
        self._time = value

    # _workDay ====================================
    def get_workDay(self):
        return self._workDay

    def set_workDay(self, value):
        self._workDay = value

    # _workShift ====================================
    def get_workShift(self):
        return self._workShift

    def set_workShift(self, value):
        self._workShift = value

    # ============= fabricMachinePage's Slot
#    @Slot(str, str)
#    def retrieveInfomation(self, Day, Shift):
#        # var1: Day
#        # var2: Shift

#        self.updateBioRetrieveTimeSet(Day, Shift)

#        statemenSQL1 = "SELECT * FROM TB_FabricConfig"
#        statemenSQL2 = "SELECT * FROM TB_MachineFabricConfig WHERE  MachineNum = %s AND ((EndTime >= '%s' AND EndTime <= '%s') OR ((EndTime >= '%s' OR EndTime IS NULL) AND StartTime <= '%s'))"

#        dataResult1 = []    # contains all rows of fabric config table
#        dataResult2 = []    # contains lastest id of "fabric config row" for specific machine and start time, end time when this config is applied
#        dataTemp1 = []

#        try:
#            db_config = read_db_config()
#            conn = MySQLConnection(**db_config)
#            if conn.is_connected():
#                cur = conn.cursor()
#                cur.execute(statemenSQL1)
#                dataSQL1 = cur.fetchall()
#                dataResult2.clear()
#                for i in range(1, 22):
#                    cur.execute(statemenSQL2 % (str(i), self.startTimeOfRetrieveShiftWorking, self.endTimeOfRetrieveShiftWorking, self.endTimeOfRetrieveShiftWorking, self.endTimeOfRetrieveShiftWorking))
#                    dataSQL2 = cur.fetchall()
#                    dataTemp1.clear()
#                    for var in dataSQL2:
#                        dataTemp1.append([str(var[2]), str(var[3]), str(var[4])])
#                    dataResult2.append(dataTemp1.copy())
#        except Error as e:
#            print("sql error: ", e)
#        finally:
#            conn.close()
#        for var in dataSQL1:
#                dataResult1.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20])])
#        dataResult1.sort(key=lambda kv: int(kv[0]), reverse = True)
#        self.fill_allCbModelsViewMode.emit(dataResult1, dataResult2)

    @Slot(str, str)
    def retrieveInfomation(self, Day, Shift):
        # var1: Day
        # var2: Shift

        self.updateBioRetrieveTimeSet(Day, Shift)

        statemenSQL1 = "SELECT * FROM TB_FabricConfig WHERE FabricConfigId = '%s'"
        statemenSQL2 = "SELECT * FROM TB_MachineFabricConfig WHERE  MachineNum = %s AND ((EndTime >= '%s' AND EndTime <= '%s') OR ((EndTime >= '%s' OR EndTime IS NULL) AND StartTime <= '%s'))"

        dataResult1 = []    # contains all rows of fabric config of 21 machines
        dataResult2 = []    # contains lastest id of "fabric config row" for specific machine and start time, end time when this config is applied
        dataTemp1 = []
        dataTemp1_2 = []
        dataSQL1_2 = []

        listAlreadySearch = []

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                dataResult2.clear()
                for i in range(1, 22):
                    cur.execute(statemenSQL2 % (str(i), self.startTimeOfRetrieveShiftWorking, self.endTimeOfRetrieveShiftWorking, self.endTimeOfRetrieveShiftWorking, self.endTimeOfRetrieveShiftWorking))
                    dataSQL2 = cur.fetchall()
                    dataTemp1.clear()
                    for var in dataSQL2:
                        dataTemp1.append([str(var[2]), str(var[3]), str(var[4])])
                        if var[2] not in listAlreadySearch:
                            cur.execute(statemenSQL1 % str(var[2]))
                            dataTemp1_2 = cur.fetchall()
                            dataSQL1_2.append(deepcopy(dataTemp1_2[0]))
                            listAlreadySearch.append(var[2])
                    dataResult2.append(dataTemp1.copy())
        except Error as e:
            print("sql error: ", e)
        finally:
            conn.close()
        for var in dataSQL1_2:
                dataResult1.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20])])
        dataResult1.sort(key=lambda kv: int(kv[0]), reverse = True)
        self.fill_allCbModelsViewMode.emit(dataResult1, dataResult2)

    @Slot(list, list)
    def updateNewMachineConfigFabric(self, listConfigFabricIdOfMchn, listOffset):
        '''
        - variables:
            + listConfigFabricIdOfMchn : have 21 elements direct to 21 Knitting Machine in reallife. Each element is id of fabricConfig row which will attach to Knitting Machine.
                    If value of element is zero, This mean no new fabricConfig row is attached to Knitting Machine (Ordinal number of Knitting Machine is position of element in list + 1)
            + listOffset: have 21 elements direct to 21 Kiniitng Machine in reallife. Each element is number of Roll will be knitting before new fabricMachineConfigRow is added. If element
                    of this list is zero and element have same position in listConfigFabricOfMchn no zero... Adding new fabricMachineRow is actioned immediately.
        - called: when fabricMachinePage's Ok Button is clicked.
        - action: travel throught listConfigFabricIdofMchn. If element is non-zero. This mean the Knitting Machine have ordinal-number is element's position + 1 need add new fabricMachineConfigRow.
                    this action is happend immediately or in furture depend on value of emlement of listOffset in same position.
        '''

        self.updateTrioTimeSet()

        SQL_updateEndTime = "UPDATE TB_MachineFabricConfig SET EndTime = '%s' WHERE MachineNum = '%s' AND EndTime IS NULL ORDER BY MachineFabricConfigId DESC LIMIT 1"
        SQL_insertNewRow = "INSERT INTO TB_MachineFabricConfig(MachineNum, TB_FabricConfig_FabricConfigId, StartTime, NumberOfRoundsRan, NumberOfRollsKintted) VALUES('%s', '%s', '%s', 0, 0)"
        SQL_selectRoundPerRollValue = "SELECT RoundsPerRoll FROM TB_FabricConfig WHERE FabricConfigId = '%s'"
        SQL_insertNewTask = "INSERT INTO TB_UpdateMchFabricCofigTask(MachineNum, TB_FabricConfig_FabricConfigId, ActionTime) VALUES('%s','%s','%s')"

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                mchNum = 1
                index = 0
                #print(listConfigFabricIdOfMchn)
                for temp in listConfigFabricIdOfMchn:
                    if temp != "0":
                        if listOffset[index] == 0: # effect to database immediately
                            #print("effect to database immediately")
                            cur.execute(SQL_updateEndTime % (self.currentTime, mchNum))
                            cur.execute(SQL_insertNewRow % (mchNum, temp, self.currentTime))
                            conn.commit()
                        else: # effect to database in future
                            #print("save jobs to memory to action in future")
                            cur.execute(SQL_selectRoundPerRollValue % temp)
                            data = cur.fetchall()
                            roundPerRoll = data[0][0]
                            actionTime = self.getOffsetTime(roundPerRoll, listOffset[index])
                            cur.execute(SQL_insertNewTask % (mchNum, temp, actionTime))
                            conn.commit()
                            self.listFutureTaskOffsetTime.append(actionTime)
                    mchNum = mchNum + 1
                    index = index + 1
        except Error as e:
            print("sql error on updateNewMachineConfigFabric(): ", e)
        finally:
            conn.close()
        self.initialAllModelAndStateOfComboBoxInEditMode()



    @Slot()
    def initialAllModelAndStateOfComboBoxInEditMode(self):#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        self.updateTrioTimeSet()

        statemenSQL1 = "SELECT * FROM TB_FabricConfig"
        statemenSQL2 = "SELECT * FROM TB_MachineFabricConfig WHERE MachineNum = %s ORDER BY MachineFabricConfigId DESC LIMIT 1"

        dataResult1 = []    # contains all data of fabric config table
        dataResult2 = []    # contains: lastest id of "fabric config row" for specific machine, start time and end time when this config is applied
        dataTemp1 = []

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                cur.execute(statemenSQL1)
                dataSQL1 = cur.fetchall()
                dataResult2.clear()
                for i in range(1, 22):
                    cur.execute(statemenSQL2 % str(i))
                    dataSQL2 = cur.fetchall()
                    dataTemp1.clear()
                    for var0 in dataSQL2:
                        dataTemp1.append([str(var0[2]), str(var0[3]), str(var0[4])])
                    dataResult2.append(dataTemp1.copy())
        except Error as e:
            print("sql error: ", e)
        finally:
            conn.close()
        for var in dataSQL1:
                dataResult1.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20])])
        dataResult1.sort(key=lambda kv: int(kv[0]), reverse = True)
        self.fill_allCbModels.emit(dataResult1, dataResult2)


#    @Slot(str, str)
#    def editModeLoadAllModels(self, var1, var2):
#        statemenSQL = "SELECT * FROM TB_FabricConfig"
#        statemenSQL2 = "SELECT * FROM TB_MachineFabricConfig WHERE MachineNum = %s AND Day = '%s' AND Shift = '%s'"
#        data_1 = []
#        data_2 = []
#        data_3 = []

#        try:
#            db_config = read_db_config()
#            conn = MySQLConnection(**db_config)
#            if conn.is_connected():
#                cur = conn.cursor()
#                cur.execute(statemenSQL)
#                data = cur.fetchall()

#                data_3.clear()
#                for i in range(1, 22):
#                    cur.execute(statemenSQL2 % (str(i), var1, var2))
#                    data2 = cur.fetchall()
#                    data_2.clear()
#                    for var0 in data2:
#                        data_2.append([str(var0[4]), var0[5], var0[6]])
#                    data_3.append(data_2.copy())
#        except Error as e:
#            print("sql error: ",e)
#        finally:
#            conn.close()
#        for var in data:
#                data_1.append([str(var[0]), var[1], var[2], str(var[3]), str(var[4]), str(var[5]), str(var[6]), str(var[7]), str(var[8]), str(var[9]), str(var[10]), str(var[11]), str(var[12]), str(var[13]), str(var[14]), str(var[15]), str(var[16]), str(var[17]), str(var[18]), str(var[19]), str(var[20])])
#        data_1.sort(key=lambda kv: int(kv[0]), reverse = True)

#        self.fill_allCbModels.emit(data_1, data_3)
