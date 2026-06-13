import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4
import "../controls"
import "../contents"
import "../contents/yarnPagePopUp"


Item {

    width: 1920
    height: 985
    property int positionSignValue: 1 // 1 is: privious Shift; 2 is: current Shift.

    property ListModel listWorker_: ListModel{
        //        ListElement {
        //            userId_: "0"
        //            imageSource_: "../../userImages/noUser.svg"
        //            name_: "Máy trống"
        //        }
    }

    property ListModel listMch_: ListModel{
        ListElement {
            mchNumber_: "1"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch1.svg"
        }
        ListElement {
            mchNumber_: "2"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch2.svg"
        }
        ListElement {
            mchNumber_: "3"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch3.svg"
        }
        ListElement {
            mchNumber_: "4"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch4.svg"
        }
        ListElement {
            mchNumber_: "5"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch5.svg"
        }
        ListElement {
            mchNumber_: "6"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch6.svg"
        }
        ListElement {
            mchNumber_: "7"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch7.svg"
        }
        ListElement {
            mchNumber_: "8"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch8.svg"
        }
        ListElement {
            mchNumber_: "9"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch9.svg"
        }
        ListElement {
            mchNumber_: "10"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch10.svg"
        }
        ListElement {
            mchNumber_: "11"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch11.svg"
        }
        ListElement {
            mchNumber_: "12"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch12.svg"
        }
        ListElement {
            mchNumber_: "13"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch13.svg"
        }
        ListElement {
            mchNumber_: "14"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch14.svg"
        }
        ListElement {
            mchNumber_: "15"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch15.svg"
        }
        ListElement {
            mchNumber_: "16"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch16.svg"
        }
        ListElement {
            mchNumber_: "17"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch17.svg"
        }
        ListElement {
            mchNumber_: "18"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch18.svg"
        }
        ListElement {
            mchNumber_: "19"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch19.svg"
        }
        ListElement {
            mchNumber_: "20"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch20.svg"
        }
        ListElement {
            mchNumber_: "21"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch21.svg"
        }
    }

    property ListModel listWorkerWatch_: ListModel{
        ListElement{
            familyNameName_: " "
            mchNumber_: "1"
        }
        ListElement{
            familyNameName_: "meo meo"
            mchNumber_: "2"
        }
    }
    Rectangle {
        id: rectangle
        color: "#222222"
        anchors.fill: parent

        Component.onCompleted: {
            defectProductBadCleaningPageBridge.initializingWorkerList()
            defectProductBadCleaningPageBridge.initializingTime()
        }

        Image {
            id: image
            width: 11
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.verticalCenterOffset: 8
            anchors.leftMargin: 1244
            anchors.rightMargin: 8
            fillMode: Image.PreserveAspectFit
            anchors.topMargin: 8
        }


        Rectangle {
            width: 360
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1409
            anchors.topMargin: 24
            Label {
                id: label27
                width: label27.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Thống kê các lần giao ca có lỗi để lại")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Image {
            id: image1
            x: 706
            width: 11
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.horizontalCenter: rectangle2.horizontalCenter
            fillMode: Image.PreserveAspectFit
            anchors.topMargin: 320
            anchors.rightMargin: 724
            anchors.bottomMargin: 8
        }

        Rectangle {
            width: 360
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 104
            anchors.topMargin: 24
            Label {
                id: label28
                width: label28.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Thống kê hư hàng")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
            anchors.horizontalCenterOffset: -1404
        }


        RoundButton {
            id: btn_CofirmBadCleaning
            width: 166
            height: 200
            radius: 150
            text: qsTr("Xác nhận")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1066
            anchors.topMargin: 350

            onClicked: {
                se_btnClicked.play()
                defectProductBadCleaningPageBridge.comfirmBadCleaning(cb_BadCleaningWorkerSelect.model.get(cb_BadCleaningWorkerSelect.currentIndex).userId_, cb_MchSelect.model.get(cb_MchSelect.currentIndex).mchNumber_, positionSignValue.toString())
            }
        }

        Rectangle {
            x: 731
            width: 360
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.top: parent.top
            anchors.topMargin: 24
            Label {
                id: label29
                width: label29.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Thống kê bỏ vệ sinh")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
            anchors.horizontalCenterOffset: -604
        }

        ComboBox {
            id: cb_BadCleaningWorkerSelect
            width: 200
            height: 200
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 637
            anchors.topMargin: 350
            contentItem: Rectangle {
                width: cb_BadCleaningWorkerSelect.width
                height: cb_BadCleaningWorkerSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: img_faceContentItem1
                    width: (cb_BadCleaningWorkerSelect.width/3)*4
                    height: cb_BadCleaningWorkerSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    source: cb_BadCleaningWorkerSelect.model.get(cb_BadCleaningWorkerSelect.currentIndex).imageSource_
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: cb_BadCleaningWorkerSelect.width
                    sourceSize.width: (cb_BadCleaningWorkerSelect.width/3)*4
                }

                Rectangle {
                    id: rec_textContainer1
                    width: tx_name1.contentWidth + 10
                    height: 20
                    color: "#00b7ff"
                    radius: 10
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: tx_name1
                        color: "#333333"
                        text: cb_BadCleaningWorkerSelect.displayText
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: false
                    }
                    anchors.bottomMargin: 10
                }

                Glow {
                    color: "#00b7ff"
                    radius: 8
                    anchors.fill: rec_textContainer1
                    source: rec_textContainer1
                    samples: 17
                    spread: 0.1
                }
            }
            textRole: "name_"
            layer.effect: OpacityMask {
                maskSource: mask1
            }
            delegate: ItemDelegate {
                id: itemDlgt3
                width: cb_BadCleaningWorkerSelect.width
                height: cb_BadCleaningWorkerSelect.width
                contentItem: Item {
                    id: cti_ItemDelegate3
                    width: cb_BadCleaningWorkerSelect.width
                    height: cb_BadCleaningWorkerSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    layer.effect: OpacityMask {
                        maskSource: mask3
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    Rectangle {
                        id: mask3
                        width: cb_BadCleaningWorkerSelect.width
                        height: cb_BadCleaningWorkerSelect.width
                        visible: false
                        radius: 10
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Image {
                        id: img_face1
                        width: (cb_BadCleaningWorkerSelect.width/3)*4
                        height: cb_BadCleaningWorkerSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        source: imageSource_
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize.height: cb_BadCleaningWorkerSelect.width
                        sourceSize.width: (cb_BadCleaningWorkerSelect.width/3)*4
                    }

                    Text {
                        color: "#00ff00"
                        text: name_
                        elide: Text.ElideRight
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignHCenter
                        anchors.leftMargin: 8
                    }
                    layer.enabled: true
                }
                background: Rectangle {
                    color: "#222222"
                    anchors.fill: parent
                }
            }
            transformOrigin: Item.Center
            Rectangle {
                id: mask1
                width: cb_BadCleaningWorkerSelect.width
                height: cb_BadCleaningWorkerSelect.width
                visible: false
                radius: 150
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: img_indicator1
                width: 25
                height: 25
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "../../images/svg_images/cbbIndicator.svg"
                fillMode: Image.PreserveAspectFit
                ColorOverlay {
                    color: "#00b7ff"
                    anchors.verticalCenter: img_indicator1.verticalCenter
                    anchors.fill: img_indicator1
                    source: img_indicator1
                    anchors.horizontalCenter: img_indicator1.horizontalCenter
                    antialiasing: true
                }
                anchors.rightMargin: 6
            }

            Glow {
                color: "#00b7ff"
                radius: 8
                anchors.fill: img_indicator1
                source: img_indicator1
                samples: 17
                spread: 0.1
            }
            indicator: Canvas {
                id: indicator3
                width: 0
                height: 10
            }
            layer.enabled: true
            model: listWorker_
            anchors.horizontalCenterOffset: 0
        }

        Rectangle {
            id: rectangle2
            x: 62
            y: 72
            width: 1212
            height: 246
            //            id: rectangle
            color: "#27116224"
            radius: 8
            border.color: "#3b3b3b"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -293
            anchors.horizontalCenterOffset: -334
            anchors.horizontalCenter: parent.horizontalCenter

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
                    positionSign.x = 452
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
                    positionSign.x = 674

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
                x: 456
                y: 12
                //x: x_
                width: 80
                height: 80
                Behavior on x { PropertyAnimation {} }
                ColorOverlay{
                    //id: colorOL
                    anchors.fill: positionSign //slider
                    source: positionSign
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0 //slider
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
                    text: qsTr("Ca trước")
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
                    text: qsTr("Ca hiện tại")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rec_priorShiftLableContainer1
                x: 138
                y: 83
                width: 150
                height: 26
                radius: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -110
                Label {
                    id: lb_priorShiftDayValue
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
                id: rec_currentShiftLableContainer1
                x: 375
                y: 83
                width: 150
                height: 26
                radius: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 110
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
        }

        ComboBox {
            id: cb_DefectProductWorkerSelect
            x: 62
            y: 444
            width: 200
            height: 200
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 350
            transformOrigin: Item.Center
            textRole: "name_"
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
            Rectangle {
                id: mask
                width: cb_DefectProductWorkerSelect.width
                height: cb_DefectProductWorkerSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 150
                visible: false
            }
            //            background: Rectangle {
            //                width: cb_WorkerSelect.width
            //                height: cb_WorkerSelect.width
            //                color: "#00FF00"
            //                border.color: "green"
            //                radius: 2
            //            }

            model: listWorker_
            delegate: ItemDelegate {
                id: itemDlgt2
                width: cb_DefectProductWorkerSelect.width
                height: cb_DefectProductWorkerSelect.width
                background: Rectangle {
                    anchors.fill: parent
                    color: "#222222"
                }
                contentItem: Item {
                    id: cti_ItemDelegate2
                    width: cb_DefectProductWorkerSelect.width
                    height: cb_DefectProductWorkerSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: mask2
                    }
                    Rectangle {
                        id: mask2
                        width: cb_DefectProductWorkerSelect.width
                        height: cb_DefectProductWorkerSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 10
                        visible: false
                    }
                    Image {
                        id: img_face
                        width: (cb_DefectProductWorkerSelect.width/3)*4
                        height: cb_DefectProductWorkerSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: imageSource_
                        sourceSize.height: cb_DefectProductWorkerSelect.width
                        sourceSize.width: (cb_DefectProductWorkerSelect.width/3)*4
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                        horizontalAlignment: Text.AlignHCenter
                        text: name_
                        color: "#00FF00"
                        elide: Text.ElideRight
                    }
                }
            }
            onCurrentIndexChanged: {
                if(cb_DefectProductWorkerSelect.model.count !== 0){
                    //                    userIdChoosedFromUI = parseInt(cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_)
                    //                    chooseWorkerRect.wokerChoosedChanged()
                }
            }
            contentItem: Rectangle{
                width: cb_DefectProductWorkerSelect.width
                height: cb_DefectProductWorkerSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: img_faceContentItem
                    width: (cb_DefectProductWorkerSelect.width/3)*4
                    height: cb_DefectProductWorkerSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: cb_DefectProductWorkerSelect.width
                    sourceSize.width: (cb_DefectProductWorkerSelect.width/3)*4
                    fillMode: Image.PreserveAspectFit
                    source: cb_DefectProductWorkerSelect.model.get(cb_DefectProductWorkerSelect.currentIndex).imageSource_ //"../../userImages/noUser.svg"
                }

                Rectangle{
                    id: rec_textContainer
                    width: tx_name.contentWidth + 10
                    height: 20
                    radius: 10
                    color: "#00B7FF" //cb_WorkerSelect.currentIndex === 0 ? "#00B7FF" : cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red"//"#d5f600ff"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    Text {
                        id: tx_name
                        text: cb_DefectProductWorkerSelect.displayText
                        color: "#333333"
                        verticalAlignment: Text.AlignVCenter
                        font.bold: false
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Glow {
                    anchors.fill: rec_textContainer
                    radius: 8
                    samples: 17
                    color: "#00B7FF" //cb_WorkerSelect.currentIndex === 0 ? "#00B7FF" : cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
                    source: rec_textContainer
                    spread: 0.1
                }
            }
            indicator: Canvas {
                id:indicator2
                width: 0
                height: 10
            }
            Image {
                id: img_indicator
                width: 25
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 6
                source: "../../images/svg_images/cbbIndicator.svg"
                fillMode: Image.PreserveAspectFit
                visible: false
                ColorOverlay{
                    //id: colorOL
                    anchors.fill: img_indicator //slider
                    source: img_indicator //slider
                    anchors.verticalCenter: img_indicator.verticalCenter
                    anchors.horizontalCenter: img_indicator.horizontalCenter
                    color: "#00B7FF" //cb_WorkerSelect.currentIndex === 0 ? "#00B7FF" : cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red"
                    antialiasing: true
                }
            }

            Glow {
                anchors.fill: img_indicator
                radius: 8
                samples: 17
                color: "#00B7FF" //cb_WorkerSelect.currentIndex === 0 ? "#00B7FF" : cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
                source: img_indicator
                spread: 0.1
            }
        }

        ComboBox {
            id: cb_MchSelect
            x: 851
            width: 200
            height: 200
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -43
            transformOrigin: Item.Center
            textRole: "mchNumber_"
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask_cb_WatchSelect
            }
            Rectangle {
                id: mask_cb_WatchSelect
                width: cb_MchSelect.width
                height: cb_MchSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 10
                visible: false
            }
//            background: Rectangle {
//                width: cb_WatchSelect.width
//                height: cb_WatchSelect.width
//                color: "#00FF00"
//                border.color: "green"
//                radius: 2
//            }

            model: listMch_
            delegate: ItemDelegate {
                id: itemDlgt2_cb_WatchSelect
                width: cb_MchSelect.width
                height: cb_MchSelect.width
                background: Rectangle {
                    anchors.fill: parent
                    color: "#222222"
                }
                contentItem: Item {
                    id: cti_ItemDelegate2_cb_WatchSelect
                    width: cb_MchSelect.width
                    height: cb_MchSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: mask2_cb_WatchSelect
                    }
                    Rectangle {
                        id: mask2_cb_WatchSelect
                        width: cb_MchSelect.width
                        height: cb_MchSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 10
                        visible: false
                    }
                    Image {
                        id: img_face_cb_WatchSelect
                        width: (cb_MchSelect.width/3)*4
                        height: cb_MchSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: imageSource_
                        sourceSize.height: cb_MchSelect.width
                        sourceSize.width: (cb_MchSelect.width/3)*4
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        horizontalAlignment: Text.AlignHCenter
                        text: mchNumber_
                        color: "#000000"
                        elide: Text.ElideRight
                    }
                }
            }
            onCurrentIndexChanged: {
                if(cb_MchSelect.model.count !== 0){
//                    userIdChoosedFromUI = parseInt(cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).userId_)
//                    chooseWorkerRect.wokerChoosedChanged()
                }
            }
            contentItem: Rectangle{
                width: cb_MchSelect.width
                height: cb_MchSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: img_faceContentItem_cb_WatchSelect
                    width: (cb_MchSelect.width/3)*4
                    height: cb_MchSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: cb_MchSelect.width
                    sourceSize.width: (cb_MchSelect.width/3)*4
                    fillMode: Image.PreserveAspectFit
                    source: cb_MchSelect.model.get(cb_MchSelect.currentIndex).imageSource_ //"../../userImages/noUser.svg"
                }

                Rectangle{
                    id: rec_textContainer_cb_WatchSelect
                    width: tx_name.contentWidth + 10
                    height: 20
                    radius: 10
                    color: "#00B7FF" //cb_WatchSelect.currentIndex === 0 ? "#00B7FF" : cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red"//"#d5f600ff"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    Text {
                        id: tx_name_cb_WatchSelect
                        text: cb_MchSelect.displayText
                        color: "#333333"
                        verticalAlignment: Text.AlignVCenter
                        font.bold: false
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Glow {
                    anchors.fill: rec_textContainer_cb_WatchSelect
                    radius: 8
                    samples: 17
                    color: "#00B7FF" //cb_WatchSelect.currentIndex === 0 ? "#00B7FF" : cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
                    source: rec_textContainer_cb_WatchSelect
                    spread: 0.1
                }
            }
            indicator: Canvas {
                id:indicator2_cb_WatchSelect
                width: 0
                height: 10
            }
            Image {
                id: img_indicator_cb_WatchSelect
                width: 25
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 6
                source: "../../images/svg_images/cbbIndicator.svg"
                fillMode: Image.PreserveAspectFit
                visible: false
                ColorOverlay{
                    //id: colorOL
                    anchors.fill: img_indicator_cb_WatchSelect //slider
                    source: img_indicator_cb_WatchSelect //slider
                    anchors.verticalCenter: img_indicator_cb_WatchSelect.verticalCenter
                    anchors.horizontalCenter: img_indicator_cb_WatchSelect.horizontalCenter
                    color: "#00B7FF" //cb_WatchSelect.currentIndex === 0 ? "#00B7FF" : cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red"
                    antialiasing: true
                }
            }

            Glow {
                anchors.fill: img_indicator_cb_WatchSelect
                radius: 8
                samples: 17
                color: "#00B7FF" //cb_WatchSelect.currentIndex === 0 ? "#00B7FF" : cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
                source: img_indicator_cb_WatchSelect
                spread: 0.1
            }
        }

        TextField {
            id: tf_numberKgDefectProduct
            x: 391
            y: 474
            width: 373
            height: 76
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 17
            anchors.leftMargin: 235
            anchors.topMargin: 350
            placeholderText: qsTr("?")
            inputMethodHints: Qt.ImhDigitsOnly
            color: "white"
            anchors.left: parent.left
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: "#00ff00"
            }
        }

        RoundButton {
            id: btn_CofirmDefectNumberKg
            x: 391
            y: 645
            width: 373
            height: 103
            text: qsTr("Xác nhận")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 447
            anchors.leftMargin: 235
            radius: 35

            onClicked: {
                if (tf_numberKgDefectProduct.text !== ""){
                    se_btnClicked.play()
                    defectProductBadCleaningPageBridge.comfirmKgDefectProduct(cb_DefectProductWorkerSelect.model.get(cb_DefectProductWorkerSelect.currentIndex).userId_, tf_numberKgDefectProduct.text.replace(",","."), positionSignValue.toString())
                }
            }
        }




    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP
    //    PU_DeleteProducer{
    //        id: pu_deleteProducer
    //        x: rectangle.width/2 - pu_deleteProducer.width/2
    //        y: rectangle.height/2 - pu_deleteProducer.height/2
    //    }

    // end
    Connections{
        target: defectProductBadCleaningPageBridge

        function onFillUsersListModel(list_){
            print("onFillUsersListModel:") //, list_)
            listWorker_.clear()
            if(list_.length !== 0){
                list_.forEach(function (item, index) {
                    listWorker_.append({"userId_": item[0], "imageSource_" : item[2], "name_" : item[1]})
                })
            }
            cb_DefectProductWorkerSelect.currentIndex = 0
            cb_BadCleaningWorkerSelect.currentIndex = 0
        }

        function onFillTimeData(list_){
            lb_priorShiftDayValue.text = list_[0] + " - " + list_[1]
            lb_currentShiftDayValue.text = list_[2] + " - " + list_[3]
        }
    }

}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:28}D{i:29}D{i:31}D{i:32}D{i:63}D{i:56;locked:true}D{i:71;locked:true}
}
##^##*/
