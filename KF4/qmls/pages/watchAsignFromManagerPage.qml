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
    property ListModel listWorker_: ListModel{
//        ListElement {
//            userId_: "0"
//            imageSource_: "../../userImages/noUser.svg"
//            name_: "Máy trống"
//        }
    }

    property ListModel listWatch_: ListModel{
        ListElement {
            watchNumber_: "1"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch1.svg"
        }
        ListElement {
            watchNumber_: "2"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch2.svg"
        }
        ListElement {
            watchNumber_: "3"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch3.svg"
        }
        ListElement {
            watchNumber_: "4"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch4.svg"
        }
        ListElement {
            watchNumber_: "5"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch5.svg"
        }
        ListElement {
            watchNumber_: "6"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch6.svg"
        }
        ListElement {
            watchNumber_: "7"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch7.svg"
        }
        ListElement {
            watchNumber_: "8"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch8.svg"
        }
        ListElement {
            watchNumber_: "9"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch9.svg"
        }
        ListElement {
            watchNumber_: "10"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch10.svg"
        }
        ListElement {
            watchNumber_: "11"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch11.svg"
        }
        ListElement {
            watchNumber_: "12"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch12.svg"
        }
        ListElement {
            watchNumber_: "13"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch13.svg"
        }
        ListElement {
            watchNumber_: "14"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch14.svg"
        }
        ListElement {
            watchNumber_: "15"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch15.svg"
        }
        ListElement {
            watchNumber_: "16"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch16.svg"
        }
        ListElement {
            watchNumber_: "17"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch17.svg"
        }
        ListElement {
            watchNumber_: "18"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch18.svg"
        }
        ListElement {
            watchNumber_: "19"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch19.svg"
        }
        ListElement {
            watchNumber_: "20"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch20.svg"
        }
        ListElement {
            watchNumber_: "21"
            imageSource_: "../../images/page_images/watchAsignFromManagerPage/watch21.svg"
        }
    }

    property ListModel listWorkerWatch_: ListModel{
        ListElement{
            familyNameName_: " "
            watchNumber_: "1"
        }
        ListElement{
            familyNameName_: "meo meo"
            watchNumber_: "2"
        }
    }
    Rectangle {
        id: rectangle
        color: "#222222"
        anchors.fill: parent

        Component.onCompleted: {
            watchAsignFromManagerPageBridge.initializingWorkerList()
            watchAsignFromManagerPageBridge.initializingWorkerWatchCouplesList()
        }

        Image {
            id: image
            width: 11
            anchors.right: lv_workerAndWatchCouples.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.rightMargin: 8
            fillMode: Image.PreserveAspectFit
            anchors.topMargin: 8
            anchors.bottomMargin: 8
        }

        Image {
            id: img_worker
            x: 100
            width: 300
            height: 300
            visible: true
            anchors.right: img_watch.left
            anchors.top: parent.top
            source: "../../images/page_images/watchAsignFromManagerPage/worker.svg"
            anchors.rightMargin: 140
            sourceSize.height: img_worker.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_worker.width
            antialiasing: true
            anchors.topMargin: 162
        }

        ComboBox {
            id: cb_WorkerSelect
            width: 300
            height: 300
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 147
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: img_worker.horizontalCenter
            transformOrigin: Item.Center
            textRole: "name_"
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
            Rectangle {
                id: mask
                width: cb_WorkerSelect.width
                height: cb_WorkerSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 10
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
                width: cb_WorkerSelect.width
                height: cb_WorkerSelect.width
                background: Rectangle {
                    anchors.fill: parent
                    color: "#222222"
                }
                contentItem: Item {
                    id: cti_ItemDelegate2
                    width: cb_WorkerSelect.width
                    height: cb_WorkerSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: mask2
                    }
                    Rectangle {
                        id: mask2
                        width: cb_WorkerSelect.width
                        height: cb_WorkerSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 10
                        visible: false
                    }
                    Image {
                        id: img_face
                        width: (cb_WorkerSelect.width/3)*4
                        height: cb_WorkerSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: imageSource_
                        sourceSize.height: cb_WorkerSelect.width
                        sourceSize.width: (cb_WorkerSelect.width/3)*4
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
                if(cb_WorkerSelect.model.count !== 0){
//                    userIdChoosedFromUI = parseInt(cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_)
//                    chooseWorkerRect.wokerChoosedChanged()
                }
            }
            contentItem: Rectangle{
                width: cb_WorkerSelect.width
                height: cb_WorkerSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: img_faceContentItem
                    width: (cb_WorkerSelect.width/3)*4
                    height: cb_WorkerSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: cb_WorkerSelect.width
                    sourceSize.width: (cb_WorkerSelect.width/3)*4
                    fillMode: Image.PreserveAspectFit
                    source: cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).imageSource_ //"../../userImages/noUser.svg"
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
                        text: cb_WorkerSelect.displayText
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
            id: cb_WatchSelect
            width: 300
            height: 300
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 147
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: img_watch.horizontalCenter
            transformOrigin: Item.Center
            textRole: "watchNumber_"
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask_cb_WatchSelect
            }
            Rectangle {
                id: mask_cb_WatchSelect
                width: cb_WatchSelect.width
                height: cb_WatchSelect.width
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

            model: listWatch_
            delegate: ItemDelegate {
                id: itemDlgt2_cb_WatchSelect
                width: cb_WatchSelect.width
                height: cb_WatchSelect.width
                background: Rectangle {
                    anchors.fill: parent
                    color: "#222222"
                }
                contentItem: Item {
                    id: cti_ItemDelegate2_cb_WatchSelect
                    width: cb_WatchSelect.width
                    height: cb_WatchSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: mask2_cb_WatchSelect
                    }
                    Rectangle {
                        id: mask2_cb_WatchSelect
                        width: cb_WatchSelect.width
                        height: cb_WatchSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 10
                        visible: false
                    }
                    Image {
                        id: img_face_cb_WatchSelect
                        width: (cb_WatchSelect.width/3)*4
                        height: cb_WatchSelect.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: imageSource_
                        sourceSize.height: cb_WatchSelect.width
                        sourceSize.width: (cb_WatchSelect.width/3)*4
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        horizontalAlignment: Text.AlignHCenter
                        text: watchNumber_
                        color: "#000000"
                        elide: Text.ElideRight
                    }
                }
            }
            onCurrentIndexChanged: {
                if(cb_WatchSelect.model.count !== 0){
//                    userIdChoosedFromUI = parseInt(cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).userId_)
//                    chooseWorkerRect.wokerChoosedChanged()
                }
            }
            contentItem: Rectangle{
                width: cb_WatchSelect.width
                height: cb_WatchSelect.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: img_faceContentItem_cb_WatchSelect
                    width: (cb_WatchSelect.width/3)*4
                    height: cb_WatchSelect.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: cb_WatchSelect.width
                    sourceSize.width: (cb_WatchSelect.width/3)*4
                    fillMode: Image.PreserveAspectFit
                    source: cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).imageSource_ //"../../userImages/noUser.svg"
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
                        text: cb_WatchSelect.displayText
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


        Image {
            id: img_watch
            width: 300
            height: 300
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/watchAsignFromManagerPage/watch.svg"
            sourceSize.width: img_watch.width
            fillMode: Image.PreserveAspectFit
            antialiasing: true
            anchors.topMargin: 162
            sourceSize.height: img_watch.height
            anchors.leftMargin: 550
        }

        ListView {
            id: lv_workerAndWatchCouples
            x: 1302
            width: 469
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 0
            anchors.bottomMargin: 50
            anchors.topMargin: 65
            spacing: 3
            model: listWorkerWatch_
            delegate: DLG_WorkerWatchCouples{rowWidth: lv_workerAndWatchCouples.width
                rowHeigh :40 }
            Component.onCompleted: {
//                yarnPageBridge.lv_workerAndWatchCouplesCompleted()
//                if(lv_workerAndWatchCouples.count != 0){
//                    lv_workerAndWatchCouples.currentIndex = 1
//                    lv_workerAndWatchCouples.currentIndex = 0
//                }
            }
            onCurrentIndexChanged: {

            }

            Rectangle {
                width: lv_workerAndWatchCouples.width
                height: 40
                color: "#222222"
                anchors.left: parent.left
                anchors.bottom: parent.top
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                width: lv_workerAndWatchCouples.width
                height: 40
                color: "#222222"
                anchors.left: parent.left
                anchors.top: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
            }

            ScrollBar {
                orientation: Qt.Vertical
                height: parent.height;
                width: 8
                scrollArea: parent;
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
        }

        Rectangle {
            x: 1503
            width: 360
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.top: parent.top
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: lv_workerAndWatchCouples.horizontalCenter
            anchors.topMargin: 24
            Label {
                id: label27
                width: label27.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng thợ đang dùng đồng hồ số bao nhiêu:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Button {
            id: bt_addUser
            y: 162
            width: 326
            height: 633
            anchors.left: img_watch.right
            anchors.leftMargin: 140

            onClicked: {
                se_btnClicked.play()
                print(cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_)
                print(cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).watchNumber_)
                watchAsignFromManagerPageBridge.updateWatchOfUser(cb_WorkerSelect.model.get(cb_WorkerSelect.currentIndex).userId_, cb_WatchSelect.model.get(cb_WatchSelect.currentIndex).watchNumber_)
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 10
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/watchAsignFromManagerPage/workerAsignWatch.svg"
                    sourceSize.height: 150
                    sourceSize.width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 292
                    height: 146
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
        target: watchAsignFromManagerPageBridge

        function onFillUsersListModel(list_){
            print("onFillUsersListModel:") //, list_)
            listWorker_.clear()
            if(list_.length !== 0){
                list_.forEach(function (item, index) {
                    listWorker_.append({"userId_": item[0], "imageSource_" : item[2], "name_" : item[1]})
                })
            }
            cb_WorkerSelect.currentIndex = 0
        }                

        function onFillWorkerWatchCouplesListModel(list_){
            print("onFillWorkerWatchCouplesListModel:") //, list_)
            listWorkerWatch_.clear()
            if(list_.length !== 0){
                list_.forEach(function (item, index) {
                    listWorkerWatch_.append({"familyNameName_" : item[0] + " " + item[1], "watchNumber_" : item[2]})
                })
            }
            lv_workerAndWatchCouples.currentIndex = 0
        }
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:68}D{i:76}
}
##^##*/
