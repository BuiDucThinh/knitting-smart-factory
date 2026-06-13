import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    width: 1920
    height: 985
    Rectangle {
        id: rectangle1
        color: "#222222"
        radius: 3
        anchors.fill: parent
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2        

        Component.onCompleted: {
            homePageBridge.initializingOnline()
            homePageBridge.initializingFabricInfo()
            homePageBridge.initializingCountNum()
            homePageBridge.initializingTimeMetter()
            homePageBridge.initializingRoundNum()
        }



        Image {
            id: machine_bg
            x: 477
            width: rectangle1.height
            height: rectangle1.height
            opacity: 1
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/svg_images/knitting_machine.svg"
            fillMode: Image.PreserveAspectFit
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0
        }

        MachineInfoRect {
            id: m1_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 11
            anchors.topMargin: 9
            machineNumber: 1
        }

        MachineInfoRect {
            id: m4_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: parent.top
            blinkRedLight: true
            machineNumber: 4
            anchors.topMargin: 9
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m5_rect
            x: 461
            width: 220
            height: 220
            anchors.left: m4_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            machineNumber: 5
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m8_rect
            x: 693
            width: 220
            height: 220
            anchors.left: m5_rect.right
            anchors.top: parent.top
            machineNumber: 8
            blinkYellowLight: true
            anchors.topMargin: 9
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m9_rect
            x: 921
            width: 220
            height: 220
            anchors.left: m8_rect.right
            anchors.top: parent.top
            editAble: true
            ordinalButtonVisible: false
            online: true
            anchors.topMargin: 9
            anchors.leftMargin: 6
            machineNumber: 9
        }

        MachineInfoRect {
            id: m2_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m1_rect.bottom
            machineNumber: 2
            anchors.topMargin: 37
            anchors.leftMargin: 11
        }

        MachineInfoRect {
            id: m3_rect
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m2_rect.right
            machineNumber: 3
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m6_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m3_rect.right
            machineNumber: 6
            online: false
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m7_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m6_rect.right
            machineNumber: 7
            blinkGreenLight: true
            online: false
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m10_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m7_rect.right
            machineNumber: 10
            online: false
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m18_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m2_rect.bottom
            machineNumber: 18
            anchors.topMargin: 9
            anchors.leftMargin: 11
        }

        MachineInfoRect {
            id: m16_rect
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m18_rect.right
            machineNumber: 16
            blinkYellowLight: true
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m15_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 15
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m12_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m15_rect.right
            machineNumber: 12
            blinkRedLight: true
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m11_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m12_rect.right
            machineNumber: 11
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m17_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: m18_rect.bottom
            machineNumber: 17
            blinkYellowLight: true
            anchors.topMargin: 37
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m14_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m17_rect.right
            machineNumber: 14
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m13_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m14_rect.right
            machineNumber: 13
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m19_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 19
            blinkGreenLight: true
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 778
        }

        MachineInfoRect {
            id: m20_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m19_rect.right
            machineNumber: 20
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 6
        }

        MachineInfoRect {
            id: m21_rect
            y: 0
            width: 220
            height: 220
            anchors.verticalCenter: m20_rect.verticalCenter
            anchors.left: m20_rect.right
            machineNumber: 21
            blinkRedLight: true
            anchors.leftMargin: 6
        }
    }

// ================================================= CONNECTIONS
    Connections{
        target: homePageBridge

        function onInitializingOnlineState(mchList_){
            m1_rect.online = false
            m2_rect.online = false
            m3_rect.online = false
            m4_rect.online = false
            m5_rect.online = false
            m6_rect.online = false
            m7_rect.online = false
            m8_rect.online = false
            m9_rect.online = false
            m10_rect.online = false
            m11_rect.online = false
            m12_rect.online = false
            m13_rect.online = false
            m14_rect.online = false
            m15_rect.online = false
            m16_rect.online = false
            m17_rect.online = false
            m18_rect.online = false
            m19_rect.online = false
            m20_rect.online = false
            m21_rect.online = false
            mchList_.forEach(function (mch, index){
                if(mch === "1"){
                    m1_rect.onlinedChange()
                }
                else if(mch === "2"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "3"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "4"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "5"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "6"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "7"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "8"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "9"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "10"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "11"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "12"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "13"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "14"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "15"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "16"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "17"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "18"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "19"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "20"){
                    m5_rect.onlinedChange()
                }
                else if(mch === "21"){
                    m5_rect.onlinedChange()
                }
            })
        }

        function onNewMchConnected(mchList_){
            mchList_.forEach(function (mch, index){
                if(mch === "1"){
                    m1_rect.onlinedChange()
                }
                else if(mch === "2"){
                    m2_rect.onlinedChange()
                }
                else if(mch === "3"){
                    m3_rect.onlinedChange()
                }
                else if(mch === "4"){
                    m4_rect.onlinedChange()
                }
                else if(mch === "5"){
                    print("new connected m5")
                    m5_rect.onlinedChange()
                }
                else if(mch === "6"){
                    m6_rect.onlinedChange()
                }
                else if(mch === "7"){
                    m7_rect.onlinedChange()
                }
                else if(mch === "8"){
                    m8_rect.onlinedChange()
                }
                else if(mch === "9"){
                    m9_rect.onlinedChange()
                }
                else if(mch === "10"){
                    m10_rect.onlinedChange()
                }
                else if(mch === "11"){
                    m11_rect.onlinedChange()
                }
                else if(mch === "12"){
                    m12_rect.onlinedChange()
                }
                else if(mch === "13"){
                    m13_rect.onlinedChange()
                }
                else if(mch === "14"){
                    m14_rect.onlinedChange()
                }
                else if(mch === "15"){
                    m15_rect.onlinedChange()
                }
                else if(mch === "16"){
                    m16_rect.onlinedChange()
                }
                else if(mch === "17"){
                    m17_rect.onlinedChange()
                }
                else if(mch === "18"){
                    m18_rect.onlinedChange()
                }
                else if(mch === "19"){
                    m19_rect.onlinedChange()
                }
                else if(mch === "20"){
                    m20_rect.onlinedChange()
                }
                else if(mch === "21"){
                    m21_rect.onlinedChange()
                }
            })
        }

        function onLostMchConnection(mchList_){
            print("working on lost slot")
            print(mchList_)
            mchList_.forEach(function (mch, index){
                if(mch === "1"){
                    m1_rect.offlinedChange()
                }
                else if(mch === "2"){
                    m2_rect.offlinedChange()
                }
                else if(mch === "3"){
                    m3_rect.offlinedChange()
                }
                else if(mch === "4"){
                    m4_rect.offlinedChange()
                }
                else if(mch === "5"){
                    m5_rect.offlinedChange()
                }
                else if(mch === "6"){
                    m6_rect.offlinedChange()
                }
                else if(mch === "7"){
                    m7_rect.offlinedChange()
                }
                else if(mch === "8"){
                    m8_rect.offlinedChange()
                }
                else if(mch === "9"){
                    m9_rect.offlinedChange()
                }
                else if(mch === "10"){
                    m10_rect.offlinedChange()
                }
                else if(mch === "11"){
                    m11_rect.offlinedChange()
                }
                else if(mch === "12"){
                    m12_rect.offlinedChange()
                }
                else if(mch === "13"){
                    m13_rect.offlinedChange()
                }
                else if(mch === "14"){
                    m14_rect.offlinedChange()
                }
                else if(mch === "15"){
                    m15_rect.offlinedChange()
                }
                else if(mch === "16"){
                    m16_rect.offlinedChange()
                }
                else if(mch === "17"){
                    m17_rect.offlinedChange()
                }
                else if(mch === "18"){
                    m18_rect.offlinedChange()
                }
                else if(mch === "19"){
                    m19_rect.offlinedChange()
                }
                else if(mch === "20"){
                    m20_rect.offlinedChange()
                }
                else if(mch === "21"){
                    m21_rect.offlinedChange()
                }
            })
        }

        function onSetAllSliderToOne(){
            m1_rect.setSliderValue(1)
            m2_rect.setSliderValue(1)
            m3_rect.setSliderValue(1)
            m4_rect.setSliderValue(1)
            m5_rect.setSliderValue(1)
        }

        function onNewRound(mch){
            print("on New Round")
            print(mch)
            if(mch === "1"){
                m1_rect.incrRPS()
            }
            else if(mch === "2"){
                m2_rect.incrRPS()
            }
            else if(mch === "3"){
                m3_rect.incrRPS()
            }
            else if(mch === "4"){
                m4_rect.incrRPS()
            }
            else if(mch === "5"){
                m5_rect.incrRPS()
            }
            else if(mch === "6"){
                m6_rect.incrRPS()
            }
            else if(mch === "7"){
                m7_rect.incrRPS()
            }
            else if(mch === "8"){
                m8_rect.incrRPS()
            }
            else if(mch === "9"){
                m9_rect.incrRPS()
            }
            else if(mch === "10"){
                m10_rect.incrRPS()
            }
            else if(mch === "11"){
                m11_rect.incrRPS()
            }
            else if(mch === "12"){
                m12_rect.incrRPS()
            }
            else if(mch === "13"){
                m13_rect.incrRPS()
            }
            else if(mch === "14"){
                m14_rect.incrRPS()
            }
            else if(mch === "15"){
                m15_rect.incrRPS()
            }
            else if(mch === "16"){
                m16_rect.incrRPS()
            }
            else if(mch === "17"){
                m17_rect.incrRPS()
            }
            else if(mch === "18"){
                m18_rect.incrRPS()
            }
            else if(mch === "19"){
                m19_rect.incrRPS()
            }
            else if(mch === "20"){
                m20_rect.incrRPS()
            }
            else if(mch === "21"){
                m21_rect.incrRPS()
            }
        }

        function onSetRPS(dataList_){
            m1_rect.updateRPS(dataList_[0])
            m2_rect.updateRPS(dataList_[1])
            m3_rect.updateRPS(dataList_[2])
            m4_rect.updateRPS(dataList_[3])
            m5_rect.updateRPS(dataList_[4])
            m6_rect.updateRPS(dataList_[5])
            m7_rect.updateRPS(dataList_[6])
            m8_rect.updateRPS(dataList_[7])
            m9_rect.updateRPS(dataList_[8])
            m10_rect.updateRPS(dataList_[9])
            m11_rect.updateRPS(dataList_[10])
            m12_rect.updateRPS(dataList_[11])
            m13_rect.updateRPS(dataList_[12])
            m14_rect.updateRPS(dataList_[13])
            m15_rect.updateRPS(dataList_[14])
            m16_rect.updateRPS(dataList_[15])
            m17_rect.updateRPS(dataList_[16])
            m18_rect.updateRPS(dataList_[17])
            m19_rect.updateRPS(dataList_[18])
            m20_rect.updateRPS(dataList_[19])
            m21_rect.updateRPS(dataList_[20])
        }

        //=== green blink control
        function onGreenLedBlinkOff(mch){
            print("on Green blink Off")
            print(mch)
            if(mch === "1"){
                m1_rect.greenRollFullEnd()
            }
            else if(mch === "2"){
                m2_rect.greenRollFullEnd()
            }
            else if(mch === "3"){
                m3_rect.greenRollFullEnd()
            }
            else if(mch === "4"){
                m4_rect.greenRollFullEnd()
            }
            else if(mch === "5"){
                m5_rect.greenRollFullEnd()
            }
            else if(mch === "6"){
                m6_rect.greenRollFullEnd()
            }
            else if(mch === "7"){
                m7_rect.greenRollFullEnd()
            }
            else if(mch === "8"){
                m8_rect.greenRollFullEnd()
            }
            else if(mch === "9"){
                m9_rect.greenRollFullEnd()
            }
            else if(mch === "10"){
                m10_rect.greenRollFullEnd()
            }
            else if(mch === "11"){
                m11_rect.greenRollFullEnd()
            }
            else if(mch === "12"){
                m12_rect.greenRollFullEnd()
            }
            else if(mch === "13"){
                m13_rect.greenRollFullEnd()
            }
            else if(mch === "14"){
                m14_rect.greenRollFullEnd()
            }
            else if(mch === "15"){
                m15_rect.greenRollFullEnd()
            }
            else if(mch === "16"){
                m16_rect.greenRollFullEnd()
            }
            else if(mch === "17"){
                m17_rect.greenRollFullEnd()
            }
            else if(mch === "18"){
                m18_rect.greenRollFullEnd()
            }
            else if(mch === "19"){
                m19_rect.greenRollFullEnd()
            }
            else if(mch === "20"){
                m20_rect.greenRollFullEnd()
            }
            else if(mch === "21"){
                m21_rect.greenRollFullEnd()
            }
        }
        function onGreenLedBlinkOn(mch){
            print("on green blink On")
            print(mch)
            if(mch === "1"){
                m1_rect.greenRollFullStart()
            }
            else if(mch === "2"){
                m2_rect.greenRollFullStart()
            }
            else if(mch === "3"){
                m3_rect.greenRollFullStart()
            }
            else if(mch === "4"){
                m4_rect.greenRollFullStart()
            }
            else if(mch === "5"){
                m5_rect.greenRollFullStart()
            }
            else if(mch === "6"){
                m6_rect.greenRollFullStart()
            }
            else if(mch === "7"){
                m7_rect.greenRollFullStart()
            }
            else if(mch === "8"){
                m8_rect.greenRollFullStart()
            }
            else if(mch === "9"){
                m9_rect.greenRollFullStart()
            }
            else if(mch === "10"){
                m10_rect.greenRollFullStart()
            }
            else if(mch === "11"){
                m11_rect.greenRollFullStart()
            }
            else if(mch === "12"){
                m12_rect.greenRollFullStart()
            }
            else if(mch === "13"){
                m13_rect.greenRollFullStart()
            }
            else if(mch === "14"){
                m14_rect.greenRollFullStart()
            }
            else if(mch === "15"){
                m15_rect.greenRollFullStart()
            }
            else if(mch === "16"){
                m16_rect.greenRollFullStart()
            }
            else if(mch === "17"){
                m17_rect.greenRollFullStart()
            }
            else if(mch === "18"){
                m18_rect.greenRollFullStart()
            }
            else if(mch === "19"){
                m19_rect.greenRollFullStart()
            }
            else if(mch === "20"){
                m20_rect.greenRollFullStart()
            }
            else if(mch === "21"){
                m21_rect.greenRollFullStart()
            }
        }
        //=== green blink control end session code

        //=== red blink control
        function onRedLedBlinkOff(mch){
            print("on Red blink Off")
            print(mch)
            if(mch === "1"){
                m1_rect.redYarnBreakEnd()
            }
            else if(mch === "2"){
                m2_rect.redYarnBreakEnd()
            }
            else if(mch === "3"){
                m3_rect.redYarnBreakEnd()
            }
            else if(mch === "4"){
                m4_rect.redYarnBreakEnd()
            }
            else if(mch === "5"){
                m5_rect.redYarnBreakEnd()
            }
            else if(mch === "6"){
                m6_rect.redYarnBreakEnd()
            }
            else if(mch === "7"){
                m7_rect.redYarnBreakEnd()
            }
            else if(mch === "8"){
                m8_rect.redYarnBreakEnd()
            }
            else if(mch === "9"){
                m9_rect.redYarnBreakEnd()
            }
            else if(mch === "10"){
                m10_rect.redYarnBreakEnd()
            }
            else if(mch === "11"){
                m11_rect.redYarnBreakEnd()
            }
            else if(mch === "12"){
                m12_rect.redYarnBreakEnd()
            }
            else if(mch === "13"){
                m13_rect.redYarnBreakEnd()
            }
            else if(mch === "14"){
                m14_rect.redYarnBreakEnd()
            }
            else if(mch === "15"){
                m15_rect.redYarnBreakEnd()
            }
            else if(mch === "16"){
                m16_rect.redYarnBreakEnd()
            }
            else if(mch === "17"){
                m17_rect.redYarnBreakEnd()
            }
            else if(mch === "18"){
                m18_rect.redYarnBreakEnd()
            }
            else if(mch === "19"){
                m19_rect.redYarnBreakEnd()
            }
            else if(mch === "20"){
                m20_rect.redYarnBreakEnd()
            }
            else if(mch === "21"){
                m21_rect.redYarnBreakEnd()
            }
        }
        function onRedLedBlinkOn(mch){
            print("on red blink On")
            print(mch)
            if(mch === "1"){
                m1_rect.redYarnBreakStart()
            }
            else if(mch === "2"){
                m2_rect.redYarnBreakStart()
            }
            else if(mch === "3"){
                m3_rect.redYarnBreakStart()
            }
            else if(mch === "4"){
                m4_rect.redYarnBreakStart()
            }
            else if(mch === "5"){
                m5_rect.redYarnBreakStart()
            }
            else if(mch === "6"){
                m6_rect.redYarnBreakStart()
            }
            else if(mch === "7"){
                m7_rect.redYarnBreakStart()
            }
            else if(mch === "8"){
                m8_rect.redYarnBreakStart()
            }
            else if(mch === "9"){
                m9_rect.redYarnBreakStart()
            }
            else if(mch === "10"){
                m10_rect.redYarnBreakStart()
            }
            else if(mch === "11"){
                m11_rect.redYarnBreakStart()
            }
            else if(mch === "12"){
                m12_rect.redYarnBreakStart()
            }
            else if(mch === "13"){
                m13_rect.redYarnBreakStart()
            }
            else if(mch === "14"){
                m14_rect.redYarnBreakStart()
            }
            else if(mch === "15"){
                m15_rect.redYarnBreakStart()
            }
            else if(mch === "16"){
                m16_rect.redYarnBreakStart()
            }
            else if(mch === "17"){
                m17_rect.redYarnBreakStart()
            }
            else if(mch === "18"){
                m18_rect.redYarnBreakStart()
            }
            else if(mch === "19"){
                m19_rect.redYarnBreakStart()
            }
            else if(mch === "20"){
                m20_rect.redYarnBreakStart()
            }
            else if(mch === "21"){
                m21_rect.redYarnBreakStart()
            }
        }
        //=== red blink control end session code

        //=== yellow blink control
        function onYellowLedBlinkOff(mch){
            print("on Yellow blink Off")
            print(mch)
            if(mch === "1"){
                m1_rect.yellowYarnBreakEnd()
            }
            else if(mch === "2"){
                m2_rect.yellowYarnBreakEnd()
            }
            else if(mch === "3"){
                m3_rect.yellowYarnBreakEnd()
            }
            else if(mch === "4"){
                m4_rect.yellowYarnBreakEnd()
            }
            else if(mch === "5"){
                m5_rect.yellowYarnBreakEnd()
            }
            else if(mch === "6"){
                m6_rect.yellowYarnBreakEnd()
            }
            else if(mch === "7"){
                m7_rect.yellowYarnBreakEnd()
            }
            else if(mch === "8"){
                m8_rect.yellowYarnBreakEnd()
            }
            else if(mch === "9"){
                m9_rect.yellowYarnBreakEnd()
            }
            else if(mch === "10"){
                m10_rect.yellowYarnBreakEnd()
            }
            else if(mch === "11"){
                m11_rect.yellowYarnBreakEnd()
            }
            else if(mch === "12"){
                m12_rect.yellowYarnBreakEnd()
            }
            else if(mch === "13"){
                m13_rect.yellowYarnBreakEnd()
            }
            else if(mch === "14"){
                m14_rect.yellowYarnBreakEnd()
            }
            else if(mch === "15"){
                m15_rect.yellowYarnBreakEnd()
            }
            else if(mch === "16"){
                m16_rect.yellowYarnBreakEnd()
            }
            else if(mch === "17"){
                m17_rect.yellowYarnBreakEnd()
            }
            else if(mch === "18"){
                m18_rect.yellowYarnBreakEnd()
            }
            else if(mch === "19"){
                m19_rect.yellowYarnBreakEnd()
            }
            else if(mch === "20"){
                m20_rect.yellowYarnBreakEnd()
            }
            else if(mch === "21"){
                m21_rect.yellowYarnBreakEnd()
            }
        }
        function onYellowLedBlinkOn(mch){
            print("on Yellow blink On")
            print(mch)
            if(mch === "1"){
                m1_rect.yellowYarnBreakStart()
            }
            else if(mch === "2"){
                m2_rect.yellowYarnBreakStart()
            }
            else if(mch === "3"){
                m3_rect.yellowYarnBreakStart()
            }
            else if(mch === "4"){
                m4_rect.yellowYarnBreakStart()
            }
            else if(mch === "5"){
                m5_rect.yellowYarnBreakStart()
            }
            else if(mch === "6"){
                m6_rect.yellowYarnBreakStart()
            }
            else if(mch === "7"){
                m7_rect.yellowYarnBreakStart()
            }
            else if(mch === "8"){
                m8_rect.yellowYarnBreakStart()
            }
            else if(mch === "9"){
                m9_rect.yellowYarnBreakStart()
            }
            else if(mch === "10"){
                m10_rect.yellowYarnBreakStart()
            }
            else if(mch === "11"){
                m11_rect.yellowYarnBreakStart()
            }
            else if(mch === "12"){
                m12_rect.yellowYarnBreakStart()
            }
            else if(mch === "13"){
                m13_rect.yellowYarnBreakStart()
            }
            else if(mch === "14"){
                m14_rect.yellowYarnBreakStart()
            }
            else if(mch === "15"){
                m15_rect.yellowYarnBreakStart()
            }
            else if(mch === "16"){
                m16_rect.yellowYarnBreakStart()
            }
            else if(mch === "17"){
                m17_rect.yellowYarnBreakStart()
            }
            else if(mch === "18"){
                m18_rect.yellowYarnBreakStart()
            }
            else if(mch === "19"){
                m19_rect.yellowYarnBreakStart()
            }
            else if(mch === "20"){
                m20_rect.yellowYarnBreakStart()
            }
            else if(mch === "21"){
                m21_rect.yellowYarnBreakStart()
            }
        }
        //=== yellow blink control end session code

        //=== qltc icon blink control
        function onQLTCheckOff(mch){
            print("on QLT Check Off")
            print(mch)
            if(mch === "1"){
                m1_rect.blinkCheckQLT = false
            }
            else if(mch === "2"){
                m2_rect.blinkCheckQLT = false
            }
            else if(mch === "3"){
                m3_rect.blinkCheckQLT = false
            }
            else if(mch === "4"){
                m4_rect.blinkCheckQLT = false
            }
            else if(mch === "5"){
                m5_rect.blinkCheckQLT = false
            }
            else if(mch === "6"){
                m6_rect.blinkCheckQLT = false
            }
            else if(mch === "7"){
                m7_rect.blinkCheckQLT = false
            }
            else if(mch === "8"){
                m8_rect.blinkCheckQLT = false
            }
            else if(mch === "9"){
                m9_rect.blinkCheckQLT = false
            }
            else if(mch === "10"){
                m10_rect.blinkCheckQLT = false
            }
            else if(mch === "11"){
                m11_rect.blinkCheckQLT = false
            }
            else if(mch === "12"){
                m12_rect.blinkCheckQLT = false
            }
            else if(mch === "13"){
                m13_rect.blinkCheckQLT = false
            }
            else if(mch === "14"){
                m14_rect.blinkCheckQLT = false
            }
            else if(mch === "15"){
                m15_rect.blinkCheckQLT = false
            }
            else if(mch === "16"){
                m16_rect.blinkCheckQLT = false
            }
            else if(mch === "17"){
                m17_rect.blinkCheckQLT = false
            }
            else if(mch === "18"){
                m18_rect.blinkCheckQLT = false
            }
            else if(mch === "19"){
                m19_rect.blinkCheckQLT = false
            }
            else if(mch === "20"){
                m20_rect.blinkCheckQLT = false
            }
            else if(mch === "21"){
                m21_rect.blinkCheckQLT = false
            }
        }
        function onQLTCheckOn(mch){
            print("on QLT Check On")
            print(mch)
            if(mch === "1"){
                m1_rect.blinkCheckQLT = true
            }
            else if(mch === "2"){
                m2_rect.blinkCheckQLT = true
            }
            else if(mch === "3"){
                m3_rect.blinkCheckQLT = true
            }
            else if(mch === "4"){
                m4_rect.blinkCheckQLT = true
            }
            else if(mch === "5"){
                m5_rect.blinkCheckQLT = true
            }
            else if(mch === "6"){
                m6_rect.blinkCheckQLT = true
            }
            else if(mch === "7"){
                m7_rect.blinkCheckQLT = true
            }
            else if(mch === "8"){
                m8_rect.blinkCheckQLT = true
            }
            else if(mch === "9"){
                m9_rect.blinkCheckQLT = true
            }
            else if(mch === "10"){
                m10_rect.blinkCheckQLT = true
            }
            else if(mch === "11"){
                m11_rect.blinkCheckQLT = true
            }
            else if(mch === "12"){
                m12_rect.blinkCheckQLT = true
            }
            else if(mch === "13"){
                m13_rect.blinkCheckQLT = true
            }
            else if(mch === "14"){
                m14_rect.blinkCheckQLT = true
            }
            else if(mch === "15"){
                m15_rect.blinkCheckQLT = true
            }
            else if(mch === "16"){
                m16_rect.blinkCheckQLT = true
            }
            else if(mch === "17"){
                m17_rect.blinkCheckQLT = true
            }
            else if(mch === "18"){
                m18_rect.blinkCheckQLT = true
            }
            else if(mch === "19"){
                m19_rect.blinkCheckQLT = true
            }
            else if(mch === "20"){
                m20_rect.blinkCheckQLT = true
            }
            else if(mch === "21"){
                m21_rect.blinkCheckQLT = true
            }
        }
        //=== qltc icon blink control end session code

        function onFill_fabricTypeAndRoundsNum(dataList_){
            m1_rect.updateFabricType(dataList_[0][0], dataList_[0][1])
            m2_rect.updateFabricType(dataList_[1][0], dataList_[1][1])
            m3_rect.updateFabricType(dataList_[2][0], dataList_[2][1])
            m4_rect.updateFabricType(dataList_[3][0], dataList_[3][1])
            m5_rect.updateFabricType(dataList_[4][0], dataList_[4][1])
            m6_rect.updateFabricType(dataList_[5][0], dataList_[5][1])
            m7_rect.updateFabricType(dataList_[6][0], dataList_[6][1])
            m8_rect.updateFabricType(dataList_[7][0], dataList_[7][1])
            m9_rect.updateFabricType(dataList_[8][0], dataList_[8][1])
            m10_rect.updateFabricType(dataList_[9][0], dataList_[9][1])
            m11_rect.updateFabricType(dataList_[10][0], dataList_[10][1])
            m12_rect.updateFabricType(dataList_[11][0], dataList_[11][1])
            m13_rect.updateFabricType(dataList_[12][0], dataList_[12][1])
            m14_rect.updateFabricType(dataList_[13][0], dataList_[13][1])
            m15_rect.updateFabricType(dataList_[14][0], dataList_[14][1])
            m16_rect.updateFabricType(dataList_[15][0], dataList_[15][1])
            m17_rect.updateFabricType(dataList_[16][0], dataList_[16][1])
            m18_rect.updateFabricType(dataList_[17][0], dataList_[17][1])
            m19_rect.updateFabricType(dataList_[18][0], dataList_[18][1])
            m20_rect.updateFabricType(dataList_[19][0], dataList_[19][1])
            m21_rect.updateFabricType(dataList_[20][0], dataList_[20][1])
        }

        function onSetCountNum(dataList_){
            m1_rect.updateCountNums(dataList_[0][0], dataList_[1][0], dataList_[2][0], dataList_[3][0])
            m2_rect.updateCountNums(dataList_[0][1], dataList_[1][1], dataList_[2][1], dataList_[3][1])
            m3_rect.updateCountNums(dataList_[0][2], dataList_[1][2], dataList_[2][2], dataList_[3][2])
            m4_rect.updateCountNums(dataList_[0][3], dataList_[1][3], dataList_[2][3], dataList_[3][3])
            m5_rect.updateCountNums(dataList_[0][4], dataList_[1][4], dataList_[2][4], dataList_[3][4])
            m6_rect.updateCountNums(dataList_[0][5], dataList_[1][5], dataList_[2][5], dataList_[3][5])
            m7_rect.updateCountNums(dataList_[0][6], dataList_[1][6], dataList_[2][6], dataList_[3][6])
            m8_rect.updateCountNums(dataList_[0][7], dataList_[1][7], dataList_[2][7], dataList_[3][7])
            m9_rect.updateCountNums(dataList_[0][8], dataList_[1][8], dataList_[2][8], dataList_[3][8])
            m10_rect.updateCountNums(dataList_[0][9], dataList_[1][9], dataList_[2][9], dataList_[3][9])
            m11_rect.updateCountNums(dataList_[0][10], dataList_[1][10], dataList_[2][10], dataList_[3][10])
            m12_rect.updateCountNums(dataList_[0][11], dataList_[1][11], dataList_[2][11], dataList_[3][11])
            m13_rect.updateCountNums(dataList_[0][12], dataList_[1][12], dataList_[2][12], dataList_[3][12])
            m14_rect.updateCountNums(dataList_[0][13], dataList_[1][13], dataList_[2][13], dataList_[3][13])
            m15_rect.updateCountNums(dataList_[0][14], dataList_[1][14], dataList_[2][14], dataList_[3][14])
            m16_rect.updateCountNums(dataList_[0][15], dataList_[1][15], dataList_[2][15], dataList_[3][15])
            m17_rect.updateCountNums(dataList_[0][16], dataList_[1][16], dataList_[2][16], dataList_[3][16])
            m18_rect.updateCountNums(dataList_[0][17], dataList_[1][17], dataList_[2][17], dataList_[3][17])
            m19_rect.updateCountNums(dataList_[0][18], dataList_[1][18], dataList_[2][18], dataList_[3][18])
            m20_rect.updateCountNums(dataList_[0][19], dataList_[1][19], dataList_[2][19], dataList_[3][19])
            m21_rect.updateCountNums(dataList_[0][20], dataList_[1][20], dataList_[2][20], dataList_[3][20])
        }

        function onSetTimeMetter(dataList_){
            m1_rect.updateTimeMetters(dataList_[0][0], dataList_[1][0], dataList_[2][0], dataList_[3][0])
            m2_rect.updateTimeMetters(dataList_[0][1], dataList_[1][1], dataList_[2][1], dataList_[3][1])
            m3_rect.updateTimeMetters(dataList_[0][2], dataList_[1][2], dataList_[2][2], dataList_[3][2])
            m4_rect.updateTimeMetters(dataList_[0][3], dataList_[1][3], dataList_[2][3], dataList_[3][3])
            m5_rect.updateTimeMetters(dataList_[0][4], dataList_[1][4], dataList_[2][4], dataList_[3][4])
            m6_rect.updateTimeMetters(dataList_[0][5], dataList_[1][5], dataList_[2][5], dataList_[3][5])
            m7_rect.updateTimeMetters(dataList_[0][6], dataList_[1][6], dataList_[2][6], dataList_[3][6])
            m8_rect.updateTimeMetters(dataList_[0][7], dataList_[1][7], dataList_[2][7], dataList_[3][7])
            m9_rect.updateTimeMetters(dataList_[0][8], dataList_[1][8], dataList_[2][8], dataList_[3][8])
            m10_rect.updateTimeMetters(dataList_[0][9], dataList_[1][9], dataList_[2][9], dataList_[3][9])
            m11_rect.updateTimeMetters(dataList_[0][10], dataList_[1][10], dataList_[2][10], dataList_[3][10])
            m12_rect.updateTimeMetters(dataList_[0][11], dataList_[1][11], dataList_[2][11], dataList_[3][11])
            m13_rect.updateTimeMetters(dataList_[0][12], dataList_[1][12], dataList_[2][12], dataList_[3][12])
            m14_rect.updateTimeMetters(dataList_[0][13], dataList_[1][13], dataList_[2][13], dataList_[3][13])
            m15_rect.updateTimeMetters(dataList_[0][14], dataList_[1][14], dataList_[2][14], dataList_[3][14])
            m16_rect.updateTimeMetters(dataList_[0][15], dataList_[1][15], dataList_[2][15], dataList_[3][15])
            m17_rect.updateTimeMetters(dataList_[0][16], dataList_[1][16], dataList_[2][16], dataList_[3][16])
            m18_rect.updateTimeMetters(dataList_[0][17], dataList_[1][17], dataList_[2][17], dataList_[3][17])
            m19_rect.updateTimeMetters(dataList_[0][18], dataList_[1][18], dataList_[2][18], dataList_[3][18])
            m20_rect.updateTimeMetters(dataList_[0][19], dataList_[1][19], dataList_[2][19], dataList_[3][19])
            m21_rect.updateTimeMetters(dataList_[0][20], dataList_[1][20], dataList_[2][20], dataList_[3][20])
        }

        function onBtnClicked(mch){
            print("on Btn Clicked")
            print(mch)
            if(mch === "1"){
                m1_rect.incrBtnClick()
            }
            else if(mch === "2"){
                m2_rect.incrBtnClick()
            }
            else if(mch === "3"){
                m3_rect.incrBtnClick()
            }
            else if(mch === "4"){
                m4_rect.incrBtnClick()
            }
            else if(mch === "5"){
                m5_rect.incrBtnClick()
            }
            else if(mch === "6"){
                m6_rect.incrBtnClick()
            }
            else if(mch === "7"){
                m7_rect.incrBtnClick()
            }
            else if(mch === "8"){
                m8_rect.incrBtnClick()
            }
            else if(mch === "9"){
                m9_rect.incrBtnClick()
            }
            else if(mch === "10"){
                m10_rect.incrBtnClick()
            }
            else if(mch === "11"){
                m11_rect.incrBtnClick()
            }
            else if(mch === "12"){
                m12_rect.incrBtnClick()
            }
            else if(mch === "13"){
                m13_rect.incrBtnClick()
            }
            else if(mch === "14"){
                m14_rect.incrBtnClick()
            }
            else if(mch === "15"){
                m15_rect.incrBtnClick()
            }
            else if(mch === "16"){
                m16_rect.incrBtnClick()
            }
            else if(mch === "17"){
                m17_rect.incrBtnClick()
            }
            else if(mch === "18"){
                m18_rect.incrBtnClick()
            }
            else if(mch === "19"){
                m19_rect.incrBtnClick()
            }
            else if(mch === "20"){
                m20_rect.incrBtnClick()
            }
            else if(mch === "21"){
                m21_rect.incrBtnClick()
            }
        }

//        function onM1Test2(m1){
//            m1_rect.sliderValue = 1
//        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
