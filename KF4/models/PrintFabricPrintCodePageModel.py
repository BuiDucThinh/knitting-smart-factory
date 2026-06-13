# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Slot, Signal
from database.read_dbconfig import read_db_config
from mysql.connector import MySQLConnection, Error
from fpdf import FPDF
import datetime
import cups


class PrintFabricPrintCodePageModel(QObject):

    fillCustomerFabricSpecsUI = Signal(list)
    fillPrinterListSpecsUI = Signal(list)
    printerName = "HP-LaserJet-Professional-P1102"


    def __init__(self, ftpPrint_):
        QObject.__init__(self)
        self.ftpPrint = ftpPrint_
        conn = cups.Connection()
        printers = conn.getPrinters()
        #print(printers)
        printerNameList = []
        i = -1
        j = 0
        for printer in printers:
            res = list(printers.keys())[0]
            printerNameList.append(res)
            if res == self.printerName:
                i = j
            j = j + 1
        if len(printers) != 0:
            if i == -1:
                self.printerName = printerNameList[0]
            self.ftpPrint.printerName = self.printerName
        else:
            self.ftpPrint.printerName = ""
            self.printerName = ""
        print("found printer: ", self.printerName)

    def dOW(self, isoweekday):
        switcher = {
            1: "T2",
            2: "T3",
            3: "T4",
            4: "T5",
            5: "T6",
            6: "T7",
            7: "CN",
        }
        return switcher.get(isoweekday, "nothing")

    @Slot(str)
    def updateDefaultPrinterName(self, printerName_):
        self.printerName = printerName_
        self.ftpPrint.printerName = self.printerName

    @Slot()
    def lv_printerListCompleted(self):
        conn = cups.Connection()
        printers = conn.getPrinters()
        #print(printers)
        printerNameList = []
        for printer in printers:
#            res = list(printers.keys())[0]
            printerNameList.append(printer)
        #print(printerNameList)
        self.fillPrinterListSpecsUI.emit(printerNameList)

    @Slot()
    def initializingMchInfoAboutCustomerAndFabric(self):
        print("PrintFabricCodePageModel.py - fillAllRectData function")

        statemenSelectFabricSpecsSQL = "SELECT Subject, Name, PrintCode, RoundsPerRoll, \
        YarnLot_YarnLotId1, \
        YarnLot_YarnLotId2, \
        YarnLot_YarnLotId3, \
        YarnLot_YarnLotId4, \
        YarnLot_YarnLotId5\
        FROM KF4DB.TB_FabricConfig AS FCR\
        JOIN Customer CTM_ROW ON CTM_ROW.ID = FCR.Customer_ID \
        INNER JOIN KF4DB.TB_MachineFabricConfig AS MFCR\
        ON FCR.FabricConfigId = MFCR.TB_FabricConfig_FabricConfigId AND MFCR.MachineNum = '%s' ORDER BY MachineFabricConfigId DESC LIMIT 1"

        stmSelectYarnType = "SELECT YarnTypeName FROM YarnType YTR JOIN YarnLot YLR ON YTR.YarnTypeId = YLR.YarnType_YarnTypeId AND YLR.YarnLotId = %s"


        dataCustomerFabricSpecs = []
        yarnTypeData = []
        yarnTypeDataResult = []
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
                        yarnTypeDataResult.clear
                        yarnTypeDataResult.clear

                        # main yarn
                        if str(dataCustomerFabricSpecs[0][4]) != "None":
                            cur.execute(stmSelectYarnType % (str(dataCustomerFabricSpecs[0][4])))
                            yarnTypeData.clear
                            yarnTypeData = cur.fetchall()
                            resultCustomerFabricSpecs[i-1].append(yarnTypeData[0][0])
                        else:
                            resultCustomerFabricSpecs[i-1].append("")

                        # extra yarn 1
                        if str(dataCustomerFabricSpecs[0][5]) != "None":
                            cur.execute(stmSelectYarnType % (str(dataCustomerFabricSpecs[0][5])))
                            yarnTypeData.clear
                            yarnTypeData = cur.fetchall()
                            resultCustomerFabricSpecs[i-1].append(yarnTypeData[0][0])
                        else:
                            resultCustomerFabricSpecs[i-1].append("")

                        # spandex
                        if str(dataCustomerFabricSpecs[0][6]) != "None":
                            cur.execute(stmSelectYarnType % (str(dataCustomerFabricSpecs[0][6])))
                            yarnTypeData.clear
                            yarnTypeData = cur.fetchall()
                            resultCustomerFabricSpecs[i-1].append(yarnTypeData[0][0])
                        else:
                            resultCustomerFabricSpecs[i-1].append("")

                        # extra yarn 2
                        if str(dataCustomerFabricSpecs[0][7]) != "None":
                            cur.execute(stmSelectYarnType % (str(dataCustomerFabricSpecs[0][7])))
                            yarnTypeData.clear
                            yarnTypeData = cur.fetchall()
                            resultCustomerFabricSpecs[i-1].append(yarnTypeData[0][0])
                        else:
                            resultCustomerFabricSpecs[i-1].append("")

                        # extra yarn 3
                        if str(dataCustomerFabricSpecs[0][8]) != "None":
                            cur.execute(stmSelectYarnType % (str(dataCustomerFabricSpecs[0][8])))
                            yarnTypeData.clear
                            yarnTypeData = cur.fetchall()
                            resultCustomerFabricSpecs[i-1].append(yarnTypeData[0][0])
                        else:
                            resultCustomerFabricSpecs[i-1].append("")
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
            if len(resultCustomerFabricSpecs[i]) != 0:
                if resultCustomerFabricSpecs[i][4] in my_dict.keys():
                    resultCustomerFabricSpecs[i][4] = my_dict[resultCustomerFabricSpecs[i][4]]
                else:
                    my_dict[resultCustomerFabricSpecs[i][4]] = str(colorCodeNext)
                    resultCustomerFabricSpecs[i][4] = str(colorCodeNext)
                    colorCodeNext = colorCodeNext + 1

        self.fillCustomerFabricSpecsUI.emit(resultCustomerFabricSpecs)



    @Slot(str, str, str, str, str, str, str, str, str, str)
    def printGuideBoard(self, machineNumber_, fabricPrintCodeLine1_, fabricPrintCodeLine2_, roundPerRoll_, customerName_, fbrType1_, fbrType2_, fbrType3_, fbrType4_, fbrType5_):
        machineNumber = machineNumber_
        indentifyFactory1 = "M"
        indentifyFactory2 = str(machineNumber)
        indentifyFactory3 = "+ CM + Tên + Ngày"
        fabricPrintCode = fabricPrintCodeLine1_ + " " + fabricPrintCodeLine2_
        customerName = customerName_
        roundPerRoll = roundPerRoll_

        mainYarn = fbrType1_
        extraYarn1 = fbrType2_
        spandex = fbrType3_
        extraYarn2 = fbrType4_
        extraYarn3 = fbrType5_

        dayOW = datetime.datetime.today().isoweekday()
        dayOfWeek = self.dOW(dayOW)
        now = datetime.datetime.now()
        time = now.strftime("%H:%M")
        day = now.strftime("%d")
        month = now.strftime("%m")
        year = now.strftime("%Y")[2:]

        customerName1 = ""
        customerName2 = ""
        if len(customerName) > 9:
                    customerName = customerName.replace("C.T ", "")
                    if len(customerName) > 9:
                        cutPosition = 9
                        if len(customerName) <= cutPosition+1:
                                customerName1 = customerName
                                customerName2 = ""

                        elif customerName[cutPosition] == ' ':
                                customerName1 = customerName[0:cutPosition]
                                customerName2 = customerName[cutPosition+1:]
                        else:
                                for i in range(cutPosition-1, 0, -1):
                                        if customerName[i] == ' ':
                                                break
                                customerName1 = customerName[0:i]
                                customerName2 = customerName[i+1:]

        cutPosition = 10
        if len(fabricPrintCode) <= cutPosition+1:
                fabricPrintLine1 = fabricPrintCode
                fabricPrintLine2 = ""

        elif fabricPrintCode[cutPosition] == ' ':
                fabricPrintLine1 = fabricPrintCode[0:cutPosition]
                fabricPrintLine2 = fabricPrintCode[cutPosition+1:]
        else:
                for i in range(cutPosition-1, 0, -1):
                        if fabricPrintCode[i] == ' ':
                                break
                fabricPrintLine1 = fabricPrintCode[0:i]
                fabricPrintLine2 = fabricPrintCode[i+1:]



        # create pdf object ----------------------------------------------------------------------------------
        pdf = FPDF('L', 'mm', 'A4')
        pdf.add_page()
        pdf.set_text_color(0,0,0)
        pdf.set_auto_page_break(False)
        doc_w = pdf.w
        pdf.add_font('RobotoB', '', './fonts/Roboto-Black.ttf', uni=False)
        pdf.add_font('Roboto-BlackItalic', '', './fonts/Roboto-BlackItalic.ttf', uni=False)
        pdf.add_font('ALATA', '', './fonts/Alata-Regular.ttf', uni=False)
        # end create pdf object


        # content written to fabric roll +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        pdf.set_text_color(158,158,158)
        pdf.set_font('RobotoB', '', 68)
        title_w = pdf.get_string_width(indentifyFactory1) + 4
        pdf.set_y(0)
        pdf.set_margins(34,2,0)
        pdf.cell(title_w, 30, indentifyFactory1, border=0, ln=1, align='C', fill=False)

        pdf.set_text_color(0,0,0)
        pdf.set_font('RobotoB', '', 110)
        title_w = pdf.get_string_width(indentifyFactory2) + 4
        pdf.set_y(0)
        pdf.set_margins(57,1.5,0)
        pdf.cell(title_w, 30, indentifyFactory2, border=0, ln=1, align='L', fill=False)

        pdf.set_text_color(158,158,158)
        pdf.set_font('RobotoB', '', 50)
        title_w = pdf.get_string_width(indentifyFactory3) + 4
        pdf.set_y(0)
        pdf.set_margins(117,0,0)
        pdf.cell(title_w, 30, indentifyFactory3, border=0, ln=1, align='C', fill=False)

        pdf.set_text_color(0,0,0)

        pdf.set_font('RobotoB', '', 100)
        title_w = pdf.get_string_width(fabricPrintLine1) + 6
        pdf.set_margins(((doc_w - title_w) / 2) + 4.5,35,0)
        pdf.cell(title_w, 30, fabricPrintLine1, border=False, ln=1, align='C', fill=False)
        title_w = pdf.get_string_width(fabricPrintLine2) + 6
        pdf.set_margins(((doc_w - title_w) / 2) + 4.5,74,0)
        pdf.cell(title_w, 30, fabricPrintLine2, border=False, ln=1, align='C', fill=False)
        # end content written to fabric roll


        #blank frame ==========================================================================================
        pdf.set_y(0)
        pdf.set_margins(0,104,0)
        pdf.cell(297, 1, "", border=False, ln=1, align='C', fill=1)

        pdf.set_y(0)
        pdf.set_margins(0,141,0)
        pdf.cell(297, 1, "", border=False, ln=1, align='C', fill=1)

        pdf.set_y(0)
        pdf.set_margins(0,178,0)
        pdf.cell(297, 1, "", border=False, ln=1, align='C', fill=1)


        pdf.set_y(0)
        pdf.set_margins(140,104,0)
        pdf.cell(1, 74, "", border=False, ln=1, align='C', fill=1)

        pdf.set_y(0)
        pdf.set_margins(140,160,36)
        pdf.cell(121, 1, "", border=False, ln=1, align='C', fill=1)

        pdf.set_y(0)
        pdf.set_margins(260,142,0)
        pdf.cell(1, 36, "", border=False, ln=1, align='C', fill=1)



        pdf.image('./guideBoard/GHIDAUCAY.png', 0,12,9,81,'','')
        pdf.image('./guideBoard/SOICHINH.png', 0,106,9,36,'','')
        pdf.image('./guideBoard/SOIPHU1.png', 140,106,18,36,'','')
        pdf.image('./guideBoard/SPANDEX.png', 0,143,9,36,'','')
        pdf.image('./guideBoard/SOIPHU2.png', 224,142,36,9,'','')
        pdf.image('./guideBoard/SOIPHU3.png', 224,161,36,9,'','')
        # end blank frame


        # content written yarn specific +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        pdf.set_font('ALATA', '', 60)

        title_w = pdf.get_string_width(mainYarn) + 6
        pdf.set_y(0)
        pdf.set_margins(((140 - title_w) / 2) + 4.5,109,0)
        pdf.cell(title_w, 30, mainYarn, border=0, ln=1, align='C', fill=False)

        title_w = pdf.get_string_width(extraYarn1) + 6
        pdf.set_y(0)
        pdf.set_margins(((140 - title_w) / 2) + 153.5 + 4.5,109,0)
        pdf.cell(title_w, 30, extraYarn1, border=0, ln=1, align='C', fill=False)

        title_w = pdf.get_string_width(spandex) + 6
        pdf.set_y(0)
        pdf.set_margins(((140 - title_w) / 2) + 4.5,146,0)
        pdf.cell(title_w, 30, spandex, border=0, ln=1, align='C', fill=False)

        pdf.set_font('ALATA', '', 30)
        title_w = pdf.get_string_width(extraYarn2) + 6
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 34,137,0)
        pdf.cell(title_w, 30, extraYarn2, border=0, ln=1, align='C', fill=False)

        title_w = pdf.get_string_width(extraYarn3) + 6
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 34,155,0)
        pdf.cell(title_w, 30, extraYarn3, border=0, ln=1, align='C', fill=False)

        # end content written yarn specific

        # customer name >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        pdf.set_text_color(255,255,255)
        pdf.set_fill_color(158,158,158)
        pdf.set_font('Roboto-BlackItalic', '', 60)
        if customerName1 == "":
                title_w = pdf.get_string_width(customerName) + 20
                if title_w > 288:
                        title_w = 280
                pdf.set_y(180)
                pdf.set_margins(0,0,140)
                #pdf.cell(title_w, 22, customerName, border=False, ln=1, align='C', fill=1)
                pdf.cell(140, 22, customerName, border=False, ln=1, align='C', fill=1)
        else:
                title_w = pdf.get_string_width(customerName1) + 20
                if title_w > 288:
                        title_w = 280
                pdf.set_y(180)
                pdf.set_margins(0,0,140)
                #pdf.cell(title_w, 22, customerName1, border=False, ln=1, align='C', fill=1)
                pdf.cell(140, 22, customerName1, border=False, ln=1, align='C', fill=1)
        # end customer name

        # time change ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        pdf.set_font('ALATA', '', 30)
        pdf.set_text_color(0,0,0)
        title_w = pdf.get_string_width("Đổi lúc:")
        pdf.set_y(0)
        pdf.set_margins(160,177,0)
        pdf.cell(title_w, 30, "Đổi lúc:", border=0, ln=1, align='C', fill=False)

        # time
        title_w = pdf.get_string_width(time + ",")
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 68,177,0)
        pdf.cell(title_w, 30, time  + ",", border=0, ln=1, align='C', fill=False)

        # day of week
        title_w = pdf.get_string_width(dayOfWeek)
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 95,177,0)
        pdf.cell(title_w, 30, dayOfWeek, border=0, ln=1, align='C', fill=False)

        # day
        title_w = pdf.get_string_width(day)
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 110,174,0)
        pdf.cell(title_w, 30, day, border=0, ln=1, align='C', fill=False)

        # ---
        pdf.set_fill_color(0,0,0)
        pdf.set_y(0)
        pdf.set_margins(251,194,36)
        pdf.cell(15, 1, "", border=False, ln=1, align='C', fill=1)

        # month
        title_w = pdf.get_string_width(month)
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 110,187,0)
        pdf.cell(title_w, 30, month, border=0, ln=1, align='C', fill=False)

        # year
        title_w = pdf.get_string_width(year)
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 125,177,0)
        pdf.cell(title_w, 30, year, border=0, ln=1, align='C', fill=False)

        # rounds per roll *******************************************************************************
        title_w = pdf.get_string_width(roundPerRoll) + 6
        pdf.set_y(0)
        pdf.set_margins(((297 - title_w) / 2) + 130,148,0)
        pdf.cell(title_w, 15, roundPerRoll, border=0, ln=1, align='C', fill=False)

        pdf.set_font('ALATA', '', 20)
        title_w = pdf.get_string_width("(Vòng)")
        pdf.set_y(0)
        pdf.set_margins(291 - title_w,158,0)
        pdf.cell(title_w, 15, "(Vòng)", border=0, ln=1, align='C', fill=False)
        # end

        pdf.output('./guideBoard/gb.pdf')
        conn = cups.Connection()
        conn.printFile(self.printerName, './guideBoard/gb.pdf', "Bảng Hướng Dẫn", {})


