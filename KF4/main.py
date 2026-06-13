# This Python file uses the following encoding: utf-8
import os
import sys

from models.TopBarBottomBarModel import TopBarBottomBarModel
from models.HomePageModel import HomePageModel
from models.YarnPageModel import YarnPageModel
from models.FabricPageModel import FabricPageModel
from models.CustomerPageModel import CustomerPageModel
from models.FabricMachinePageModel import FabricMachinePageModel
from models.AddUserPageModel import AddUserPageModel
from models.EditUserPageModel import EditUserPageModel
from models.AsignWorkerPageModel import AsignWorkerPageModel
from models.SetMchStatusPageModel import SetMchStatusPageModel
from models.PrintFabricPrintCodePageModel import PrintFabricPrintCodePageModel
from models.WorkerDetectedErrorPageModel import WorkerDetectedErrorPageModel
from models.WatchAsignFromManagerPageModel import WatchAsignFromManagerPageModel
from models.DefectProductBadCleaningPageModel import DefectProductBadCleaningPageModel
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, QThread, Slot
from PySide2.QtWidgets import QApplication
from supportClass.NetworkManager import NetworkManager
from supportClass.SpeakerNetworkManager import SpeakerNetworkManager
from supportClass.UdpWatchServer import UdpWatchServer
from supportClass.WatchManager import WatchManager
#from supportClass.Uart0Listener import Uart0Listener
#from supportClass.FtpServerAndPrint import FtpServerAndPrint
#from supportClass.Uart1Listener import Uart1Listener
from supportClass.TimeValue import TimeValue


class MainWindow(QObject):

    def __init__(self):
        QObject.__init__(self)

        self.timeValue = TimeValue()

        # knitting machine communication
        self.threadKnitMchComunication = QThread()
        self.nwManager = NetworkManager(self.timeValue)
        self.nwManager.moveToThread(self.threadKnitMchComunication)
        self.threadKnitMchComunication.started.connect(self.nwManager.start)
        self.threadKnitMchComunication.start()

        # speaker communication
        self.threadSpeakerComunication = QThread()
        self.spkNwManager = SpeakerNetworkManager()
        self.spkNwManager.moveToThread(self.threadSpeakerComunication)
        self.threadSpeakerComunication.started.connect(self.spkNwManager.start)
        self.threadSpeakerComunication.start()

        # udp watch communication
        self.threadUpdWatchComunication = QThread()
        self.udpWatchServer = UdpWatchServer()
        self.udpWatchServer.moveToThread(self.threadUpdWatchComunication)
        self.threadUpdWatchComunication.started.connect(self.udpWatchServer.startListener)
        self.threadUpdWatchComunication.start()

#        # watch communication
#        self.threadWatchComunication = QThread()
#        self.watchManager = WatchManager()
#        self.watchManager.moveToThread(self.threadWatchComunication)
#        self.threadWatchComunication.started.connect(self.watchManager.start)
#        self.threadWatchComunication.start()

#        # uart0 - rfid0 listening
#        self.threadRfidReader0 = QThread()
#        self.ua0Listener = Uart0Listener()
#        self.ua0Listener.moveToThread(self.threadRfidReader0)
#        self.threadRfidReader0.started.connect(self.ua0Listener.start)
#        self.threadRfidReader0.start()

#        # uart1 - rfid1 listening
#        self.threadRfidReader1 = QThread()
#        self.ua1Listener = Uart1Listener()
#        self.ua1Listener.moveToThread(self.threadRfidReader1)
#        self.threadRfidReader1.started.connect(self.ua1Listener.start)
#        self.threadRfidReader1.start()

#        # ftp server and print
#        self.threadFtpAndPrint = QThread()
#        self.ftpPrint = FtpServerAndPrint()
#        self.ftpPrint.moveToThread(self.threadFtpAndPrint)
#        self.threadFtpAndPrint.started.connect(self.ftpPrint.start)
#        self.threadFtpAndPrint.start()

    @Slot()
    def stopChildThread(self):
        # stop knitting machine communication
        print(" main: stopNetworkManaging")
        self.nwManager.stopNwMngTask()
        self.threadKnitMchComunication.quit()
        self.threadKnitMchComunication.wait()

        # stop speaker communication
        print(" main: stopSpeakerNetworkManaging")
        self.spkNwManager.stopSpkNwMngTask()
        self.threadSpeakerComunication.quit()
        self.threadSpeakerComunication.wait()

        # stop udp watch communication
        print(" main: stopUdpWatchManaging")
        self.udpWatchServer.stopUdpWtchMngTask()
        self.threadUpdWatchComunication.quit()
        self.threadUpdWatchComunication.wait()

#        # stop watch communication
#        print(" main: stopWatchManaging")
#        self.watchManager.stopWtchMngTask()
#        self.threadWatchComunication.quit()
#        self.threadWatchComunication.wait()

        # stop uart0 - rfid0 listening
        print(" main: stopUart0Listening")
        self.ua0Listener.stopUartListener()
        self.threadRfidReader0.quit()
        self.threadRfidReader0.wait()

        # stop uart1 - rfid1 listening
        print(" main: stopUart1Listening")
        self.ua1Listener.stopUartListener()
        self.threadRfidReader1.quit()
        self.threadRfidReader1.wait()

        # stop ftp and print service
        print(" main: stop Ftp and print")
        self.ftpPrint.stopFtpAndPrint()
        self.threadFtpAndPrint.quit()
        self.threadFtpAndPrint.wait()

if __name__ == "__main__":
    os.environ["QT_IM_MODULE"] = "qtvirtualkeyboard"
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()

    # Create Models - Set Context
#    timeValue = TimeValue()
    homePageModel = HomePageModel(main.nwManager, main.timeValue)
    yarnPageModel = YarnPageModel()
    fabricPageModel = FabricPageModel()
    customerPageModel = CustomerPageModel()
    fabricMachinePageModel = FabricMachinePageModel()
    #addUserPageModel = AddUserPageModel(main.ua0Listener)
    #editUserPageModel = EditUserPageModel(main.ua0Listener)
    #topBarBottomBarModel = TopBarBottomBarModel(main.nwManager, main.ua0Listener, homePageModel, main.spkNwManager, main.ftpPrint, main.ua1Listener, main.timeValue)
    asignWorkerPageModel = AsignWorkerPageModel(main.nwManager, main.timeValue)
    setMchStatusPageModel = SetMchStatusPageModel(main.nwManager)
    #printFabricPrintCodePageModel = PrintFabricPrintCodePageModel(main.ftpPrint)
    workerDetectedErrorPageModel = WorkerDetectedErrorPageModel(main.timeValue)
    watchAsignFromManagerPageModel = WatchAsignFromManagerPageModel()
    defectProductBadCleaningPageModel = DefectProductBadCleaningPageModel(main.timeValue)

    #engine.rootContext().setContextProperty("addUserPageBridge", addUserPageModel)
    #engine.rootContext().setContextProperty("editUserPageBridge", editUserPageModel)
    engine.rootContext().setContextProperty("nwManagerBridge", main.nwManager)
    #engine.rootContext().setContextProperty("topBarBottomModelBridge", topBarBottomBarModel)
    engine.rootContext().setContextProperty("homePageBridge", homePageModel)
    engine.rootContext().setContextProperty("mainBridge", main)
    engine.rootContext().setContextProperty("yarnPageBridge", yarnPageModel)
    engine.rootContext().setContextProperty("fabricPageBridge", fabricPageModel)
    engine.rootContext().setContextProperty("customerPageBridge", customerPageModel)
    engine.rootContext().setContextProperty("fabricMachinePageBridge", fabricMachinePageModel)
    engine.rootContext().setContextProperty("asignWorkerPageBridge", asignWorkerPageModel)
    engine.rootContext().setContextProperty("setMchStatusPageBridge", setMchStatusPageModel)
    #engine.rootContext().setContextProperty("printFabricPrintCodePageBridge", printFabricPrintCodePageModel)
    engine.rootContext().setContextProperty("workerDetectedErrorPageBridge", workerDetectedErrorPageModel)
    engine.rootContext().setContextProperty("watchAsignFromManagerPageBridge", watchAsignFromManagerPageModel)
    engine.rootContext().setContextProperty("defectProductBadCleaningPageBridge", defectProductBadCleaningPageModel)


    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qmls/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
