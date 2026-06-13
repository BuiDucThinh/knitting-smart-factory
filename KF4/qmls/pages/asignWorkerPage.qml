import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents/asignWorkerPagePopUp"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4
//import QtGraphicalEffects 1.15
import Qt5Compat.GraphicalEffects

Item {
    width: 1920
    height: 985

    property list<ChooseWorkerRect> listMch

    property var userChoosedList: []

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
            asignWorkerPageBridge.initializingWorkerList()
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

        ChooseWorkerRect {
            id: m1_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 11
            anchors.topMargin: 9
            machineNumber: 1
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[0] = m1_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m4_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: parent.top
            machineNumber: 4
            anchors.topMargin: 9
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[3] = m4_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m5_rect
            x: 461
            width: 220
            height: 220
            anchors.left: m4_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            machineNumber: 5
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[4] = m5_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m8_rect
            x: 693
            width: 220
            height: 220
            anchors.left: m5_rect.right
            anchors.top: parent.top
            machineNumber: 8
            anchors.topMargin: 9
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[7] = m8_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m9_rect
            x: 921
            width: 220
            height: 220
            anchors.left: m8_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            anchors.leftMargin: 6
            machineNumber: 9
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[8] = m9_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m2_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m1_rect.bottom
            machineNumber: 2
            anchors.topMargin: 37
            anchors.leftMargin: 11
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[1] = m2_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m3_rect
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m2_rect.right
            machineNumber: 3
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[2] = m3_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m6_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m3_rect.right
            machineNumber: 6
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[5] = m6_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m7_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m6_rect.right
            machineNumber: 7
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[6] = m7_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m10_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m7_rect.right
            machineNumber: 10
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[9] = m10_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m18_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m2_rect.bottom
            machineNumber: 18
            anchors.topMargin: 9
            anchors.leftMargin: 11
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[17] = m18_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m16_rect
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m18_rect.right
            machineNumber: 16
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[15] = m16_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m15_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 15
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[14] = m15_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m12_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m15_rect.right
            machineNumber: 12
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[11] = m12_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m11_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m12_rect.right
            machineNumber: 11
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[10] = m11_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }



        ChooseWorkerRect {
            id: m17_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: m18_rect.bottom
            machineNumber: 17
            anchors.topMargin: 37
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[16] = m17_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m14_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m17_rect.right
            machineNumber: 14
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[13] = m14_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m13_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m14_rect.right
            machineNumber: 13
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[12] = m13_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m19_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 19
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 778
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[18] = m19_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m20_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m19_rect.right
            machineNumber: 20
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[19] = m20_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
            }
        }

        ChooseWorkerRect {
            id: m21_rect
            y: 0
            width: 220
            height: 220
            anchors.verticalCenter: m20_rect.verticalCenter
            anchors.left: m20_rect.right
            machineNumber: 21
            anchors.leftMargin: 6
            listWorker: listWorker_
            onWokerChoosedChanged:{
                userChoosedList[20] = m21_rect.userIdChoosedFromUI.toString()
                //print(userChoosedList)
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

            CustomButton {
                id: bt_previousShift
                width: 100
                height: 100
                anchors.top: parent.top
                anchors.horizontalCenterOffset: -110
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 128
                buttonHeight: 182
                anchors.verticalCenterOffset: 0
                btnIconSource: "../../images/page_images/asignWorkerPage/previousShift.svg"
                buttonWidth: 182
                opacity: bt_previousShift.enabled === true ? 1 : 0.1
                enabled: false
                onClicked: {
                    se_btnClicked.play()
                    positionSignValue = 1
                    bt_previousShift.enabled = false
                    bt_nextShift.enabled = true
                    positionSign.x = 186
                    asignWorkerPageBridge.loadCurrentWorkerRoster()
                }
                ColorOverlay{
                    //id: colorOL
                    anchors.fill: bt_previousShift //slider
                    source: bt_previousShift //slider
                    anchors.verticalCenter: bt_previousShift.verticalCenter
                    anchors.horizontalCenter: bt_previousShift.horizontalCenter
                    color: bt_previousShift.enabled === true ? "#BDF9BD" : "#828282"
                    antialiasing: true
                }
            }

            CustomButton {
                id: bt_nextShift
                property bool activated: true
                width: 100
                height: 100
                anchors.top: bt_previousShift.top
                anchors.horizontalCenterOffset: 110
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 0
                buttonHeight: 182
                anchors.verticalCenterOffset: 0
                btnIconSource: "../../images/page_images/asignWorkerPage/nextShift.svg"
                buttonWidth: 182
                opacity: bt_nextShift.enabled === true ? 1 : 0.1
                onClicked: {
                    se_btnClicked.play()
                    positionSignValue = 2
                    bt_previousShift.enabled = true
                    bt_nextShift.enabled = false
                    positionSign.x = 406

                    asignWorkerPageBridge.loadNextWorkerRoster()
                }
                ColorOverlay{
                    //id: colorOL
                    anchors.fill: bt_nextShift //slider
                    source: bt_nextShift //slider
                    anchors.verticalCenter: bt_nextShift.verticalCenter
                    anchors.horizontalCenter: bt_nextShift.horizontalCenter
                    color: bt_nextShift.enabled === true ? "#BDF9BD" : "#828282"
                    antialiasing: true
                }
            }

            Image {
                id: positionSign
                source: "../../images/page_images/asignWorkerPage/positionSignBg.svg"
                sourceSize.height: 80
                sourceSize.width: 80
                property int x_: homeButton.x
                x: 186
                y: 14
                //x: x_
                width: 80
                height: 80
                Behavior on x { PropertyAnimation {} }
                ColorOverlay{
                    //id: colorOL
                    anchors.fill: positionSign //slider
                    source: positionSign //slider
                    anchors.verticalCenter: positionSign.verticalCenter
                    anchors.horizontalCenter: positionSign.horizontalCenter
                    color: "#BDF9BD"
                    antialiasing: true
                }
            }

            Rectangle{
                id: rec_curentShiftLableContainer
                x: 141
                y: 51
                width: 150
                height: 26
                radius: 13
                anchors.horizontalCenterOffset: -110
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    id: label
                    x: 1581
                    y: 738
                    color: "#000000"
                    text: qsTr("Ca hiện tại")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rec_nextShiftLableContainer
                x: 378
                y: 51
                width: 150
                height: 26
                radius: 13
                anchors.horizontalCenterOffset: 110
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    id: label1
                    x: 1581
                    y: 738
                    color: "#000000"
                    text: qsTr("Ca kế")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Button {
                id: btn_load
                x: 91
                width: 494
                height: 80
                text: qsTr("Copy bảng phân máy ngày hôm qua")
                anchors.top: parent.top
                anchors.topMargin: 260
                font.pointSize: 12
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: positionSignValue === 2 ? 1 : 0.1
                enabled: positionSignValue === 2 ? true : false
                background: Rectangle{
                    width: 494
                    height: 80
                    radius: 40
                    Image {
                        source: "../../images/page_images/asignWorkerPage/load.svg"
                        sourceSize.height: 50
                        sourceSize.width: 50
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 60
                    }
                }
                onClicked:{
                    se_btnClicked.play()
                    asignWorkerPageBridge.loadYesterdayRosterForNextShift()
                }
            }

            Button {
                id: btn_save
                x: 92
                width: 494
                height: 80
                text: qsTr("Lưu")
                anchors.top: parent.top
                anchors.topMargin: 375
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                background: Rectangle {
                    width: 494
                    height: 80
                    radius: 40
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: "../../images/page_images/asignWorkerPage/save.svg"
                        anchors.verticalCenterOffset: 2
                        sourceSize.height: 50
                        sourceSize.width: 50
                        anchors.leftMargin: 60
                    }
                }
                onClicked:{
                    se_btnClicked.play()
                    if(positionSignValue === 1) {pu_askBeforeApplyRosterToCurrentShift.open()}
                    else if(positionSignValue === 2) {pu_saveNextWorkerRoster.open()}
                }
            }

            Rectangle {
                id: rec_curentShiftLableContainer1
                x: 138
                y: 83
                width: 150
                height: 26
                radius: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -110
                Label {
                    id: lb_currentShiftDayValue
                    x: 1581
                    y: 738
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rec_nextShiftLableContainer1
                x: 375
                y: 83
                width: 150
                height: 26
                radius: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 110
                Label {
                    id: lb_nextShiftDayValue
                    x: 1581
                    y: 738
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
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

    Connections{
        target: asignWorkerPageBridge

        function onFillCurrentWorkerRoster(dataList_){
//            print("onFillCurrentWorkerRoster:", dataList_)
            dataList_.forEach(function (item, index){
                if(item !== 0){
                    //print("ha ha", item, index)
                }
                listMch[index].setUser(item)
            })
        }

        function onFillNextWorkerRoster(list_){
//            print("onFillNextWorkerRoster:", list_)
            list_.forEach(function (item, index) {
                listMch[index].setUser(item)
            })
        }

        function onFillUsersListModel(list_){
            print("onFillUsersListModel:") //, list_)
            listWorker_.clear()
            if(list_.length !== 0){
                list_.forEach(function (item, index) {
                    listWorker_.append({"userId_": item[0], "imageSource_" : item[2], "name_" : item[1]})
                })
            }
            for(let i = 0; i < listMch.length; i++){
//                print("set User: 0  for machine:", i+1)
                listMch[i].setUser("0")
            }
        }

        function onFillTimeData(list_){
            lb_currentShiftDayValue.text = list_[0] + " - " + list_[1]
            lb_nextShiftDayValue.text = list_[2] + " - " + list_[3]
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}D{i:35}D{i:37}D{i:40}D{i:26}
}
##^##*/
