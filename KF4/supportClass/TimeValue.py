# This Python file uses the following encoding: utf-8
import _thread
import threading
import time
import datetime
from datetime import timedelta
from PySide2.QtCore import QObject, Signal, Slot, QTimer


class TimeValue(QObject):

    startHourDayShift = 6
    startMinuteDayShift = 30

    startHourNightShift = 16 #16
    startMinuteNightShift = 30 #30

    currentTime = ""
    startTimeOfShiftWorking = ""
    endTimeOfShiftWorking = ""

    workDay_ = ""
    workDayTimeLibVariable_ = None
    workShift_ = ""

    priorWorkDay_ = ""
    priorWorkDayUI_ = ""
    priorWorkShift_ = ""

    nextWorkDay_ = ""
    nextWorkShift_ = ""

    workDayUI_ = ""
    nextWorkDayUI_ = ""

    hourRequestDayShift_ = 0
    minRequestDayShift_ = 0
    hourRequestNightShift_ = 0
    minRequestNightShift_ = 0

    checkAtdHour_lds = "" # check attedance hour left, day shift
    checkAtdMin_lds = ""
    checkAtdHour_rds = "" # check attedance hour right, day shift
    checkAtdMin_rds = ""

    checkAtdHour_lns = "" # check attedance hour left, night shift
    checkAtdMin_lns = ""
    checkAtdHour_rns = "" # check attedance hour right, day shift
    checkAtdMin_rns = ""

    disableMchPermit = True # for special scnerario: worker check card to card reader 1 to inform "end of working shift"

    TimeToRequestWorkerSignQualityAtTranferTimeSignal = Signal()
    ControlSpeakerAtTranferTimeSignal = Signal()

    workingMonth = None
    workingYear = None

    UpdateOfflineTimeSignal = Signal() # when signal is emitted. OfflineTime of knitting machine will be updated as current time. This strategi for scneratio "power turn off" suddently. And for purpose calculate period worker checking action more accurate.

    def __init__(self):
        super(TimeValue, self).__init__()

        self.hourRequestDayShift_ = self.startHourDayShift
        self.minRequestDayShift_ = self.startMinuteDayShift + 1#10
        if self.minRequestDayShift_ >= 60:
            self.minRequestDayShift_ = self.minRequestDayShift_ - 60
            self.hourRequestDayShift_ = self.hourRequestDayShift_ + 1

        self.hourRequestNightShift_ = self.startHourNightShift
        self.minRequestNightShift_ = self.startMinuteNightShift + 1 #10
        if self.minRequestNightShift_ >= 60:
            self.minRequestNightShift_ = self.minRequestNightShift_ - 60
            self.hourRequestNightShift_ = self.hourRequestNightShift_ + 1

        print(self.hourRequestNightShift_)
        print(self.minRequestNightShift_)

        self.updateTimeValue()
        if self.startMinuteDayShift >= 10:
            self.checkAtdHour_lds = self.startHourDayShift
            self.checkAtdMin_lds = self.startMinuteDayShift - 10
        else:
            self.checkAtdHour_lds = self.startHourDayShift - 1
            self.checkAtdMin_lds = self.startMinuteDayShift + 60 - 10
        self.checkAtdHour_rds = self.checkAtdHour_lds + 2
        self.checkAtdMin_rds = self.checkAtdMin_lds

        if self.startMinuteNightShift >= 10:
            self.checkAtdHour_lns = self.startHourNightShift - 2
            self.checkAtdMin_lns = self.startMinuteNightShift - 10
        else:
            self.checkAtdHour_lns = self.startHourNightShift - 2 - 1
            self.checkAtdMin_lns = self.startMinuteNightShift + 60 - 10
        self.checkAtdHour_rns = self.startHourNightShift + 2
        self.checkAtdMin_rns = self.checkAtdMin_lns

        print(self.checkAtdHour_lds, " ", self.checkAtdMin_lds, " -> ",self.checkAtdHour_rds, " ", self.checkAtdMin_rds)
        print(self.checkAtdHour_lns, " ", self.checkAtdMin_lns, " -> ",self.checkAtdHour_rns, " ", self.checkAtdMin_rns)

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.updateTimeValue())
        self.timer.start(60000)

    def checkTime1BeforeTime2(self, hour1, min1, second1, hour2, min2, second2):
        if hour1 < hour2:
            return True
        elif hour1 == hour2:
            if min1 < min2:
                return True
            elif min1 == min2:
                if second1 < second2:
                    return True
                elif second1 == second2:
                    return False
                elif second1 > second2:
                    return False
            elif min1 > min2:
                return False
        elif hour1 > hour2:
            return False

    def updateTimeValue(self):
#        print("updated TimeValue")
        now = datetime.datetime.now()
        today = now.date()
        yesterday = today - timedelta(days=1)
        tomorrow = today + timedelta(days=1)

        self.currentTime = now.strftime("%Y-%m-%d %H:%M:%S")

        #ex: 6h30'01 -> 16h30'00
        if self.checkTime1BeforeTime2(self.startHourDayShift,self.startMinuteDayShift,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.startHourNightShift,self.startMinuteNightShift,0):
            self.workDay_ = now.strftime("%Y/%m/%d")
            self.workingMonth = now.strftime("%m")
            self.workingYear = now.strftime("%Y")

            self.workingMonth = now.strftime("%m")
            self.workingYear = now.strftime("%Y")
            self.workDayTimeLibVariable_ = now.date()
            self.workDayUI_ = now.strftime("%d/%m/%Y")
            self.workShift_ = "Ngày"
            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " " + str(self.startHourDayShift) + ":" + str(self.startMinuteDayShift) + ":01" # example: + " 6:30:01"
            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " " + str(self.startHourNightShift) + ":" + str(self.startMinuteNightShift) + ":00" # example: + " 16:30:00"
            self.priorWorkDay_ = yesterday.strftime("%Y/%m/%d")
            self.priorWorkDayUI_ = yesterday.strftime("%d/%m/%Y")
            self.priorWorkShift_ = "Đêm"

            self.nextWorkDay_ = now.strftime("%Y/%m/%d")
            self.nextWorkDayUI_ = now.strftime("%d/%m/%Y")
            self.nextWorkShift_ = "Đêm"
        #ex: 16h30'01 -> 23h59'59
        elif self.checkTime1BeforeTime2(self.startHourNightShift,self.startMinuteNightShift,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,23,59,59):
            self.workDay_ = now.strftime("%Y/%m/%d")
            self.workingMonth = now.strftime("%m")
            self.workingYear = now.strftime("%Y")
            self.workDayTimeLibVariable_ = now.date()
            self.workDayUI_ = now.strftime("%d/%m/%Y")
            self.workShift_ = "Đêm"
            self.startTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " " + str(self.startHourNightShift) + ":" + str(self.startMinuteNightShift) + ":01" # example:  + " 16:30:01"
            self.endTimeOfShiftWorking = tomorrow.strftime("%Y-%m-%d") + " " + str(self.startHourDayShift) + ":" + str(self.startMinuteDayShift) + ":00" # example:  + " 6:30:00"
            self.priorWorkDay_ = now.strftime("%Y/%m/%d")
            self.priorWorkDayUI_ = now.strftime("%d/%m/%Y")
            self.priorWorkShift_ = "Ngày"
            self.nextWorkDay_ = tomorrow.strftime("%Y/%m/%d")
            self.nextWorkDayUI_ = tomorrow.strftime("%d/%m/%Y")
            self.nextWorkShift_ = "Ngày"
        #ex: 0 -> 6h30'0
        elif self.checkTime1BeforeTime2(0,0,0,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.startHourDayShift,self.startMinuteDayShift,0):
            yesterday = now.date() - timedelta(days=1)
            self.workDay_ = yesterday.strftime("%Y/%m/%d")
            self.workingMonth = yesterday.strftime("%m")
            self.workingYear = yesterday.strftime("%Y")
            self.workDayTimeLibVariable_ = yesterday
            self.workDayUI_ = yesterday.strftime("%d/%m/%Y")
            self.workShift_ = "Đêm"
            self.startTimeOfShiftWorking = yesterday.strftime("%Y-%m-%d") + " " + str(self.startHourNightShift) + ":" + str(self.startMinuteNightShift) + ":01" # example:  + " 16:30:01"
            self.endTimeOfShiftWorking = today.strftime("%Y-%m-%d") + " " + str(self.startHourDayShift) + ":" + str(self.startMinuteDayShift) + ":00" # example:  + " 6:30:00"
            self.priorWorkDay_ = yesterday.strftime("%Y/%m/%d")
            self.priorWorkDayUI_ = yesterday.strftime("%d/%m/%Y")
            self.priorWorkShift_ = "Ngày"
            self.nextWorkDay_ = now.strftime("%Y/%m/%d")
            self.nextWorkDayUI_ = now.strftime("%d/%m/%Y")
            self.nextWorkShift_ = "Ngày"

        #ex: 6h20'01 -> 6h39'00 : disableMch = False
        if self.checkTime1BeforeTime2(self.startHourDayShift,self.startMinuteDayShift-10,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.startHourDayShift,self.startMinuteDayShift+9,0):
            self.disableMchPermit = False
        #ex: 16h20'01 -> 16h39'00 : disableMch = False
        elif self.checkTime1BeforeTime2(self.startHourNightShift,self.startMinuteNightShift-10,1,now.hour,now.minute,now.second) and self.checkTime1BeforeTime2(now.hour,now.minute,now.second,self.startHourNightShift,self.startMinuteNightShift+9,0):
            self.disableMchPermit = False
        else:
            self.disableMchPermit = True

        if (now.hour == self.hourRequestDayShift_ and now.minute == self.minRequestDayShift_) or (now.hour == self.hourRequestNightShift_ and now.minute == self.minRequestNightShift_):
            print("let request worker sign quality at tranfer time")
            self.TimeToRequestWorkerSignQualityAtTranferTimeSignal.emit()
            self.ControlSpeakerAtTranferTimeSignal.emit()

        self.UpdateOfflineTimeSignal.emit()

#        print("self.workDay_: ", self.workDay_)
#        print("self.workShift_", self.workShift_)
#        print("self.priorWorkDay_", self.priorWorkDay_)
#        print("self.priorWorkShift_", self.priorWorkShift_)
#        print("self.nextWorkDay_", self.nextWorkDay_)
#        print("self.nextWorkShift_", self.nextWorkShift_)
#        print("self.currentTime", self.currentTime)
#        print("self.hourRequestDayShift_: ", self.hourRequestDayShift_)
#        print("self.minRequestDayShift_", self.minRequestDayShift_)

    def start(self):
        print("start")

    def stopUartListener(self):
        TimeValue.running = False
        TimeValue.ser.close()

