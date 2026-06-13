import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents/asignWorkerPagePopUp"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4
import QtGraphicalEffects 1.15

Item {
    width: 1920
    height: 985

    property list<InformMchStatusRect> listMch

    property var runModeList: [] // 0: Worker Run; 1: Technician Adjust
    property var knitSmallYarnRollList: []
    property var knitWeakYarnList: []

    property var changedList: []

    property int runVariable: 0

    property ListModel listWorker_: ListModel{
//        ListElement {
//            userId_: "0"
//            imageSource_: "../../userImages/noUser.svg"
//            name_: "Máy trống"
//        }
    }

    property int positionSignValue: 1 // 1 is: current Shift; 2 is: next Shift.

    Component.onCompleted: {
        listMch.push(m1_rect)
        listMch.push(m2_rect)
        listMch.push(m3_rect)
        listMch.push(m4_rect)
        listMch.push(m5_rect)
        listMch.push(m6_rect)
        listMch.push(m7_rect)
        listMch.push(m8_rect)
        listMch.push(m9_rect)
        listMch.push(m10_rect)
        listMch.push(m11_rect)
        listMch.push(m12_rect)
        listMch.push(m13_rect)
        listMch.push(m14_rect)
        listMch.push(m15_rect)
        listMch.push(m16_rect)
        listMch.push(m17_rect)
        listMch.push(m18_rect)
        listMch.push(m19_rect)
        listMch.push(m20_rect)
        listMch.push(m21_rect)

        for(runVariable = 0; runVariable < 21; runVariable ++){
            runModeList[runVariable] = ""
            knitSmallYarnRollList[runVariable] = 0
            knitWeakYarnList[runVariable] = 0

            changedList[runVariable] = 0
        }        
    }

    Rectangle {
        id: rectangle
        color: "#222222"
        radius: 3
        anchors.fill: parent
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2

        Component.onCompleted: {
            setMchStatusPageBridge.initializingMchStatus()
        }


        Image {
            id: machine_bg
            x: 477
            width: rectangle.height
            height: rectangle.height
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

        InformMchStatusRect {
            id: m1_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 11
            anchors.topMargin: 9
            machineNumber: 1

            onStatusMchChanged: {
                changedList[0] = 1
                runModeList[0] = m1_rect.runStatus

                if(m1_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[0] = 1
                }
                else{
                    knitSmallYarnRollList[0] = 0
                }

                if(m1_rect.weakYarnConditions === true){                    
                    knitWeakYarnList[0] = 1
                }
                else{
                    knitWeakYarnList[0] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m4_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: parent.top
            machineNumber: 4
            anchors.topMargin: 9
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[3] = 1
                runModeList[3] = m4_rect.runStatus

                if(m4_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[3] = 1
                }
                else{
                    knitSmallYarnRollList[3] = 0
                }

                if(m4_rect.weakYarnConditions === true){
                    knitWeakYarnList[3] = 1
                }
                else{
                    knitWeakYarnList[3] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m5_rect
            x: 461
            width: 220
            height: 220
            anchors.left: m4_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            machineNumber: 5
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[4] = 1
                runModeList[4] = m5_rect.runStatus
                if(m5_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[4] = 1
                }
                else{
                    knitSmallYarnRollList[4] = 0
                }

                if(m5_rect.weakYarnConditions === true){
                    knitWeakYarnList[4] = 1
                }
                else{
                    knitWeakYarnList[4] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m8_rect
            x: 693
            width: 220
            height: 220
            anchors.left: m5_rect.right
            anchors.top: parent.top
            machineNumber: 8
            anchors.topMargin: 9
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[7] = 1
//                if(m8_rect.runStatus === "NORMAL"){
//                    runModeList[7] = 0
//                }
//                else{
//                    runModeList[7] = 1
//                }
                runModeList[7] = m8_rect.runStatus
                if(m8_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[7] = 1
                }
                else{
                    knitSmallYarnRollList[7] = 0
                }

                if(m8_rect.weakYarnConditions === true){
                    knitWeakYarnList[7] = 1
                }
                else{
                    knitWeakYarnList[7] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m9_rect
            x: 921
            width: 220
            height: 220
            anchors.left: m8_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            anchors.leftMargin: 6
            machineNumber: 9

            onStatusMchChanged: {
                changedList[8] = 1
//                if(m9_rect.runStatus === "NORMAL"){
//                    runModeList[8] = 0
//                }
//                else{
//                    runModeList[8] = 1
//                }
                runModeList[8] = m9_rect.runStatus
                if(m9_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[8] = 1
                }
                else{
                    knitSmallYarnRollList[8] = 0
                }

                if(m9_rect.weakYarnConditions === true){
                    knitWeakYarnList[8] = 1
                }
                else{
                    knitWeakYarnList[8] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m2_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m1_rect.bottom
            machineNumber: 2
            anchors.topMargin: 37
            anchors.leftMargin: 11

            onStatusMchChanged: {
                changedList[1] = 1
//                if(m2_rect.runStatus === "NORMAL"){
//                    runModeList[1] = 0
//                }
//                else{
//                    runModeList[1] = 1
//                }
                runModeList[1] = m2_rect.runStatus
                if(m2_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[1] = 1
                }
                else{
                    knitSmallYarnRollList[1] = 0
                }

                if(m2_rect.weakYarnConditions === true){
                    knitWeakYarnList[1] = 1
                }
                else{
                    knitWeakYarnList[1] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m3_rect
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m2_rect.right
            machineNumber: 3
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[2] = 1
//                if(m3_rect.runStatus === "NORMAL"){
//                    runModeList[2] = 0
//                }
//                else{
//                    runModeList[2] = 1
//                }
                runModeList[2] = m3_rect.runStatus
                if(m3_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[2] = 1
                }
                else{
                    knitSmallYarnRollList[2] = 0
                }

                if(m3_rect.weakYarnConditions === true){
                    knitWeakYarnList[2] = 1
                }
                else{
                    knitWeakYarnList[2] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m6_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m3_rect.right
            machineNumber: 6
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[5] = 1
//                if(m6_rect.runStatus === "NORMAL"){
//                    runModeList[5] = 0
//                }
//                else{
//                    runModeList[5] = 1
//                }
                runModeList[5] = m6_rect.runStatus
                if(m6_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[5] = 1
                }
                else{
                    knitSmallYarnRollList[5] = 0
                }

                if(m6_rect.weakYarnConditions === true){
                    knitWeakYarnList[5] = 1
                }
                else{
                    knitWeakYarnList[5] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m7_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m6_rect.right
            machineNumber: 7
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[6] = 1
//                if(m7_rect.runStatus === "NORMAL"){
//                    runModeList[6] = 0
//                }
//                else{
//                    runModeList[6] = 1
//                }
                runModeList[6] = m7_rect.runStatus
                if(m7_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[6] = 1
                }
                else{
                    knitSmallYarnRollList[6] = 0
                }

                if(m7_rect.weakYarnConditions === true){
                    knitWeakYarnList[6] = 1
                }
                else{
                    knitWeakYarnList[6] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m10_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m7_rect.right
            machineNumber: 10
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[9] = 1
//                if(m10_rect.runStatus === "NORMAL"){
//                    runModeList[9] = 0
//                }
//                else{
//                    runModeList[9] = 1
//                }
                runModeList[9] = m10_rect.runStatus
                if(m10_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[9] = 1
                }
                else{
                    knitSmallYarnRollList[9] = 0
                }

                if(m10_rect.weakYarnConditions === true){
                    knitWeakYarnList[9] = 1
                }
                else{
                    knitWeakYarnList[9] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m18_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m2_rect.bottom
            machineNumber: 18
            anchors.topMargin: 9
            anchors.leftMargin: 11

            onStatusMchChanged: {
                changedList[17] = 1
//                if(m18_rect.runStatus === "NORMAL"){
//                    runModeList[17] = 0
//                }
//                else{
//                    runModeList[17] = 1
//                }
                runModeList[17] = m18_rect.runStatus
                if(m18_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[17] = 1
                }
                else{
                    knitSmallYarnRollList[17] = 0
                }

                if(m18_rect.weakYarnConditions === true){
                    knitWeakYarnList[17] = 1
                }
                else{
                    knitWeakYarnList[17] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m16_rect
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m18_rect.right
            machineNumber: 16
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[15] = 1
//                if(m16_rect.runStatus === "NORMAL"){
//                    runModeList[15] = 0
//                }
//                else{
//                    runModeList[15] = 1
//                }

                runModeList[15] = m16_rect.runStatus

                if(m16_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[15] = 1
                }
                else{
                    knitSmallYarnRollList[15] = 0
                }

                if(m16_rect.weakYarnConditions === true){
                    knitWeakYarnList[15] = 1
                }
                else{
                    knitWeakYarnList[15] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m15_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 15
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[14] = 1
//                if(m15_rect.runStatus === "NORMAL"){
//                    runModeList[14] = 0
//                }
//                else{
//                    runModeList[14] = 1
//                }
                runModeList[14] = m15_rect.runStatus

                if(m15_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[14] = 1
                }
                else{
                    knitSmallYarnRollList[14] = 0
                }

                if(m15_rect.weakYarnConditions === true){
                    knitWeakYarnList[14] = 1
                }
                else{
                    knitWeakYarnList[14] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m12_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m15_rect.right
            machineNumber: 12
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[11] = 1
//                if(m12_rect.runStatus === "NORMAL"){
//                    runModeList[11] = 0
//                }
//                else{
//                    runModeList[11] = 1
//                }
                runModeList[11] = m12_rect.runStatus

                if(m12_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[11] = 1
                }
                else{
                    knitSmallYarnRollList[11] = 0
                }

                if(m12_rect.weakYarnConditions === true){
                    knitWeakYarnList[11] = 1
                }
                else{
                    knitWeakYarnList[11] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m11_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m12_rect.right
            machineNumber: 11
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[10] = 1
//                if(m11_rect.runStatus === "NORMAL"){
//                    runModeList[10] = 0
//                }
//                else{
//                    runModeList[10] = 1
//                }
                runModeList[10] = m11_rect.runStatus
                if(m11_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[10] = 1
                }
                else{
                    knitSmallYarnRollList[10] = 0
                }

                if(m11_rect.weakYarnConditions === true){
                    knitWeakYarnList[10] = 1
                }
                else{
                    knitWeakYarnList[10] = 0
                }
            }
        }



        InformMchStatusRect {
            id: m17_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: m18_rect.bottom
            machineNumber: 17
            anchors.topMargin: 37
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[16] = 1
//                if(m17_rect.runStatus === "NORMAL"){
//                    runModeList[16] = 0
//                }
//                else{
//                    runModeList[16] = 1
//                }
                runModeList[16] = m17_rect.runStatus
                if(m17_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[16] = 1
                }
                else{
                    knitSmallYarnRollList[16] = 0
                }

                if(m17_rect.weakYarnConditions === true){
                    knitWeakYarnList[16] = 1
                }
                else{
                    knitWeakYarnList[16] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m14_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m17_rect.right
            machineNumber: 14
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[13] = 1
//                if(m14_rect.runStatus === "NORMAL"){
//                    runModeList[13] = 0
//                }
//                else{
//                    runModeList[13] = 1
//                }
                runModeList[13] = m14_rect.runStatus
                if(m14_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[13] = 1
                }
                else{
                    knitSmallYarnRollList[13] = 0
                }

                if(m14_rect.weakYarnConditions === true){
                    knitWeakYarnList[13] = 1
                }
                else{
                    knitWeakYarnList[13] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m13_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m14_rect.right
            machineNumber: 13
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[12] = 1
//                if(m13_rect.runStatus === "NORMAL"){
//                    runModeList[12] = 0
//                }
//                else{
//                    runModeList[12] = 1
//                }

                runModeList[12] = m13_rect.runStatus

                if(m13_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[12] = 1
                }
                else{
                    knitSmallYarnRollList[12] = 0
                }

                if(m13_rect.weakYarnConditions === true){
                    knitWeakYarnList[12] = 1
                }
                else{
                    knitWeakYarnList[12] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m19_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 19
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 778

            onStatusMchChanged: {
                changedList[18] = 1
//                if(m19_rect.runStatus === "NORMAL"){
//                    runModeList[18] = 0
//                }
//                else{
//                    runModeList[18] = 1
//                }
                runModeList[18] = m19_rect.runStatus

                if(m19_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[18] = 1
                }
                else{
                    knitSmallYarnRollList[18] = 0
                }

                if(m19_rect.weakYarnConditions === true){
                    knitWeakYarnList[18] = 1
                }
                else{
                    knitWeakYarnList[18] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m20_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m19_rect.right
            machineNumber: 20
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[19] = 1
//                if(m20_rect.runStatus === "NORMAL"){
//                    runModeList[19] = 0
//                }
//                else{
//                    runModeList[19] = 1
//                }

                runModeList[19] = m20_rect.runStatus

                if(m20_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[19] = 1
                }
                else{
                    knitSmallYarnRollList[19] = 0
                }

                if(m20_rect.weakYarnConditions === true){
                    knitWeakYarnList[19] = 1
                }
                else{
                    knitWeakYarnList[19] = 0
                }
            }
        }

        InformMchStatusRect {
            id: m21_rect
            y: 0
            width: 220
            height: 220
            anchors.verticalCenter: m20_rect.verticalCenter
            anchors.left: m20_rect.right
            machineNumber: 21
            anchors.leftMargin: 6

            onStatusMchChanged: {
                changedList[20] = 1
//                if(m21_rect.runStatus === "NORMAL"){
//                    runModeList[20] = 0
//                }
//                else{
//                    runModeList[20] = 1
//                }

                runModeList[20] = m21_rect.runStatus

                if(m21_rect.smallYarnRollConditions === true){
                    knitSmallYarnRollList[20] = 1
                }
                else{
                    knitSmallYarnRollList[20] = 0
                }

                if(m21_rect.weakYarnConditions === true){
                    knitWeakYarnList[20] = 1
                }
                else{
                    knitWeakYarnList[20] = 0
                }
            }
        }

        Rectangle {
//            id: rectangle
            color: "#8d222222"
            radius: 2
            border.color: "#ffffff"
            anchors.left: m19_rect.left
            anchors.right: m21_rect.right
            anchors.top: parent.top
            anchors.bottom: m10_rect.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 9
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            Button {
                id: btn_save
                x: 92
                width: 400
                height: 400
                text: qsTr("Lưu")
                anchors.top: parent.top
                anchors.topMargin: 39
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                background: Rectangle {
                    width: 400
                    height: 400
                    radius: 200
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: "../../images/page_images/asignWorkerPage/save.svg"
                        anchors.verticalCenterOffset: 2
                        sourceSize.height: 50
                        sourceSize.width: 50
                        anchors.leftMargin: 20
                    }
                }
                onClicked:{
                    se_btnClicked.play()
                    setMchStatusPageBridge.saveStatusToDTB(changedList, runModeList, knitSmallYarnRollList, knitWeakYarnList)
                    for(runVariable = 0; runVariable < 21; runVariable ++){
                        changedList[runVariable] = 0
                    }
                }
            }
        }
    }

    SoundEffect {
        id: se_beep
        source: "../../soundEffects/beep.wav"
    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP
    PU_SaveNextWorkerRoster{
        id: pu_saveNextWorkerRoster
        x: rectangle.width/2 - pu_saveNextWorkerRoster.width/2
        y: rectangle.height/2 - pu_saveNextWorkerRoster.height/2
    }

    PU_AskBeforeApplyRosterToCurrentShift{
        id: pu_askBeforeApplyRosterToCurrentShift
        x: rectangle.width/2 - pu_askBeforeApplyRosterToCurrentShift.width/2
        y: rectangle.height/2 - pu_askBeforeApplyRosterToCurrentShift.height/2
    }

    // ================================================= CONNECTIONS
//    Connections{
//        target: uart0Bridge
//    }

    Connections{
        target: setMchStatusPageBridge
        function onFillStatusList(ListData_){
            ListData_.forEach(function (item, index){
                listMch[index].setRunStatus(item)
                runModeList[index] = item
            })
        }

        function onFillSmallYarnRollList(ListData_){
            ListData_.forEach(function (item, index){
                listMch[index].setKnitSmallYarnRollStatus(item)
                knitSmallYarnRollList[index] = item
            })
        }

        function onFillWeakYarnList(ListData_){            
            ListData_.forEach(function (item, index){
                listMch[index].setKnitWeakYarnStatus(item)
                knitWeakYarnList[index] = item
            })
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
