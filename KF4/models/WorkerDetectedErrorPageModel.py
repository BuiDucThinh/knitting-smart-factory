# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from fpdf import FPDF
import datetime
import cups


class WorkerDetectedErrorPageModel(QObject):

    fillCustomerFabricSpecsUI = Signal(list)
    fillWorkerDetectedErrorSpecsUI = Signal(list)
    fillWorkerDetectedErrorSpecsUI = Signal(list)
    fillWorkerLetErrorSpecsUI = Signal(list)
    fillFabricOfShiftWrokingWhenWorkerLetErrorSpecsUI = Signal(list)

    workerDetectedError_UserID = 0
    workerLetError_UserID = 0
    errorFabricConfigID = 0

    workDayLetError = ""
    shiftDayLetError = ""

    def __init__(self, timeValue_):
        QObject.__init__(self)
        self.timeValue = timeValue_


    @Slot()
    def initializingMchInfoAboutCustomerAndFabric(self):
        statemenSelectFabricSpecsSQL = "SELECT Subject, Name, PrintCode, RoundsPerRoll \
        FROM KF4DB.TB_FabricConfig AS FCR\
        JOIN Customer CTM_ROW ON CTM_ROW.ID = FCR.Customer_ID \
        INNER JOIN KF4DB.TB_MachineFabricConfig AS MFCR\
        ON FCR.FabricConfigId = MFCR.TB_FabricConfig_FabricConfigId AND MFCR.MachineNum = '%s' ORDER BY MachineFabricConfigId DESC LIMIT 1"

        dataCustomerFabricSpecs = []
        resultCustomerFabricSpecs = []

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            if conn.is_connected():
                cur = conn.cursor()
                for i in range(1, 22):
                    # get customer and fabric specific info
                    cur.execute(statemenSelectFabricSpecsSQL % (str(i)))
                    dataCustomerFabricSpecs.clear
                    dataCustomerFabricSpecs = cur.fetchall()
                    if len(dataCustomerFabricSpecs) != 0:
                        resultCustomerFabricSpecs.append([dataCustomerFabricSpecs[0][0], dataCustomerFabricSpecs[0][1], dataCustomerFabricSpecs[0][2], dataCustomerFabricSpecs[0][3], dataCustomerFabricSpecs[0][0] + " " + dataCustomerFabricSpecs[0][1]])
                    else:
                        resultCustomerFabricSpecs.append([])
        except Error as e:
            print("sql Filling Customer and FabricSpecs is error: ", e)
        finally:
            conn.close()

        # update color code value depends on Customer's Name
        my_dict = {}
        colorCodeNext = 1
        for i in range(0,21):
            print("o ", i)
            if len(resultCustomerFabricSpecs[i]) != 0:
                if resultCustomerFabricSpecs[i][4] in my_dict.keys():
                    resultCustomerFabricSpecs[i][4] = my_dict[resultCustomerFabricSpecs[i][4]]
                else:
                    my_dict[resultCustomerFabricSpecs[i][4]] = str(colorCodeNext)
                    resultCustomerFabricSpecs[i][4] = str(colorCodeNext)
                    colorCodeNext = colorCodeNext + 1

        self.fillCustomerFabricSpecsUI.emit(resultCustomerFabricSpecs)




    @Slot(str, str, str, str, str)
    def loadWorkerAndFabricInfo(self, machineNumber_, fabricPrintCodeLine1_, fabricPrintCodeLine2_, roundPerRoll_, customerName_):
        statemenSelectWorkerDetectedErrorPerformanceSQL = "SELECT \
        FirstName,\
        FaceImgURL, \
        User_ID \
        FROM WorkerPerformance WPFM \
        JOIN User USERROW ON USERROW.ID = WPFM.User_ID \
        WHERE (MchNumber = '%s' AND WorkDay = '%s' AND WorkShift = '%s' AND EndTime IS NULL) ORDER BY WPFM.ID DESC LIMIT 1"

        statemenSelectWorkerLetErrorPerformanceSQL = "SELECT \
        FirstName,\
        FaceImgURL,\
        CaculatedRolls, \
        PressTimeCounter, \
        QLTCheckTimeMetterH, \
        QLTCheckTimeMetterM, \
        QLTCheckTimeMetterS, \
        QLTCheckCounter, \
        YellowRedTimeMetterH, \
        YellowRedTimeMetterM, \
        YellowRedTimeMetterS, \
        YellowRedCounter, \
        GreenTimeMetterH, \
        GreenTimeMetterM, \
        GreenTimeMetterS, \
        GreenTimeConter, \
        WorkDay, \
        WorkShift, \
        User_ID \
        FROM WorkerPerformance WPFM \
        JOIN User USERROW ON USERROW.ID = WPFM.User_ID \
        WHERE (MchNumber = '%s' AND WorkDay <= '%s' AND User_ID != '%s') ORDER BY WPFM.ID DESC LIMIT 1"

        statemenSelectFabricSpecsSQL = "SELECT Subject, Name, PrintCode, FabricConfigId \
        FROM KF4DB.TB_FabricConfig AS FCR\
        JOIN Customer CTM_ROW ON CTM_ROW.ID = FCR.Customer_ID \
        INNER JOIN KF4DB.TB_MachineFabricConfig AS MFCR\
        ON FCR.FabricConfigId = MFCR.TB_FabricConfig_FabricConfigId AND MFCR.MachineNum = '%s' AND MFCR.StartTime < '%s' ORDER BY MachineFabricConfigId DESC LIMIT 1"

        try:
            db_config = read_db_config()
            conn = MySQLConnection(**db_config)
            userID_WorkerDetected = 0
            if conn.is_connected():
                cur = conn.cursor()
                # get worker detected error info
                cur.execute(statemenSelectWorkerDetectedErrorPerformanceSQL % (machineNumber_, self.timeValue.workDay_, self.timeValue.workShift_))
                dataWorkerDetectedErrorSpecs = cur.fetchall()
                dataSend = []
                if len(dataWorkerDetectedErrorSpecs) != 0:
                    dataSend.append([dataWorkerDetectedErrorSpecs[0][0], dataWorkerDetectedErrorSpecs[0][1], self.timeValue.workDayUI_, self.timeValue.workShift_])
                    self.fillWorkerDetectedErrorSpecsUI.emit(dataSend[0])
                    userID_WorkerDetected = dataWorkerDetectedErrorSpecs[0][2]
                    # for restore error detect to DTB when Confirm Button Clicked
                    self.workerDetectedError_UserID = dataWorkerDetectedErrorSpecs[0][2]
                else:
                    self.fillWorkerDetectedErrorSpecsUI.emit(dataSend)
                    # for restore error detect to DTB when Confirm Button Clicked
                    self.workerDetectedError_UserID = 0

                # get worker let error at tranfer shift time info
                cur.execute(statemenSelectWorkerLetErrorPerformanceSQL % (machineNumber_, self.timeValue.workDay_, userID_WorkerDetected))
                data = cur.fetchall() # data: dataWorkerLetErrorSpecs
                result = []
                if len(data) != 0:
                    result = []
                    result.append([data[0][0],data[0][1],str(data[0][2]),str(data[0][3]),str(data[0][4]),str(data[0][5]),str(data[0][6]),str(data[0][7]),str(data[0][8]),str(data[0][9]),str(data[0][10]),str(data[0][11]),str(data[0][12]),str(data[0][13]),str(data[0][14]),str(data[0][15]),data[0][16].strftime("%d/%m/%Y"),data[0][17]])
                    self.fillWorkerLetErrorSpecsUI.emit(result[0])
                    # for restore error detect to DTB when Confirm Button Clicked
                    self.workerLetError_UserID = data[0][18]
                    self.workDayLetError = data[0][16].strftime("%Y/%m/%d")
                    self.shiftDayLetError = data[0][17]
                else:
                    self.fillWorkerLetErrorSpecsUI.emit(result)
                    # for restore error detect to DTB when Confirm Button Clicked
                    self.workerLetError_UserID = 0
                    self.workDayLetError = ""
                    self.shiftDayLetError = ""

                # get fabric info of lastest fabric config of shift worker let error.
                cur.execute(statemenSelectFabricSpecsSQL % (machineNumber_, self.timeValue.startTimeOfShiftWorking))
                dataCustomerFabricSpecs = []
                dataCustomerFabricSpecs = cur.fetchall()
                if len(dataCustomerFabricSpecs) != 0:
                    self.fillFabricOfShiftWrokingWhenWorkerLetErrorSpecsUI.emit(dataCustomerFabricSpecs[0])
                    # for restore error detect to DTB when Confirm Button Clicked
                    self.errorFabricConfigID = dataCustomerFabricSpecs[0][3]
                else:
                    self.fillFabricOfShiftWrokingWhenWorkerLetErrorSpecsUI.emit(dataCustomerFabricSpecs)
                    # for restore error detect to DTB when Confirm Button Clicked
                    self.errorFabricConfigID = 0


        except Error as e:
            print("loadWorkerAndFabricInfo: ", e)
        finally:
            conn.close()

    @Slot()
    def comfirmErrorDetectedEvent(self):
        SQL_insertWorkerDetectErrorEvent = "INSERT INTO WorkerDetectErrorAtTranferTime(User_ID_WorkerDetect, User_ID_WorkerLet, TB_FabricConfig_FabricConfigId, WorkDayDetectError, WorkShiftDetectError, WorkDayLetError, WorkShiftLetError) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s')"
        if (self.workerDetectedError_UserID != 0 and self.workerLetError_UserID != 0):
            try:
                db_config = read_db_config()
                conn = MySQLConnection(**db_config)
                userID_WorkerDetected = 0
                if conn.is_connected():
                    cur = conn.cursor()
                    cur.execute(SQL_insertWorkerDetectErrorEvent % (self.workerDetectedError_UserID, self.workerLetError_UserID, self.errorFabricConfigID ,self.timeValue.workDay_, self.timeValue.workShift_, self.workDayLetError, self.shiftDayLetError))
                    conn.commit()
            except Error as e:
                print("comfirmErrorDetectedEvent: ", e)
            finally:
                conn.close()

