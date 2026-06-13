import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
//import Qt5Compat.GraphicalEffects 1.15
import QtMultimedia 5.15
import "controls"
import "bars"
import "animations"

Window {
    id: window
    width: 1951
    height: 1105
    visible: true
    color: "#00000000"
    title: qsTr("Smart Knitting Factory 4.0")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Properties
    property int  windowStatus: 0
    property int  windowMargin: 10
    property string userPosition: "" // ""; "CEO"; "QUẢN LÝ"; "KỸ THUẬT"; "NGHỆ NHÂN DỆT"

    // Timer for 60s: if 60s don't have any action -> back to home page
    Timer {
        id: backToHomePageTimer
        interval: 60000; running: false; repeat: false
        onTriggered: {
            topBarBottomModelBridge.userSignedOut()
            homeButton.clicked()
        }
    }

    // Timer for 60s: if 60s don't have any action -> sign out user automatic
    Timer {
        id: userSignOutTimer
        interval: 60000; running: false; repeat: false
        onTriggered: {
            if( t_info.text === "Trang Chủ"){
                topBarBottomModelBridge.userSignedOut()
            }
        }
    }

    QtObject{
        id: internal

        function maximizeRestore(){
            if(windowStatus == 0){
                window.showMaximized()
                windowStatus = 1
                windowMargin = 0
                btn_maximize.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                window.showNormal()
                windowStatus = 0
                windowMargin = 10
                btn_maximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function fullScreen(){
            windowStatus = 1
            windowMargin = 0
            window.showFullScreen()
            btn_maximize.btnIconSource = "../images/svg_images/restore_icon.svg"
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                window.showNormal()
                windowMargin = 10
                windowStatus = 0
            }
        }
    }

    Component.onCompleted: {
        internal.fullScreen()
    }

    Rectangle {
        id: app_container
        x: 10
        y: 10
        z: 1
        color: "#0e0e0e"
        radius: 0
        border.width: 0
        anchors.fill: parent
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin

        Rectangle {
            id: top_bar
            height: 32
            color: "#000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: top_bar_left
                width: 491
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.horizontalCenter
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.rightMargin: 0

                Rectangle {
                    id: re_info_left
                    property int width_: t_info_left.width
                    width: width_
                    x: 311
                    color: "#ffe1f7"
                    anchors.bottomMargin: 4
                    anchors.topMargin: 3
                    radius: 13
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenterOffset: 135
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{
                        id: t_info_left
                        property int foo: 1
                        width: t_info_left.contentWidth + 10
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: '"CHÀO MỪNG ĐẾN VỚI NHÀ MÁY DỆT THÔNG MINH KF4"' //"Hành vi điều hành kế tiếp: 16h30 - Yêu Cầu Ae Kiểm Hàng Khi Nhận Máy"
                        Behavior on text {
                            FadeAnimation {
                                target: t_info_left
                            }
                        }
                        onWidthChanged: {
                            re_info_left.width_ = t_info_left.width + 150//190
                            if (re_info_left.width_ > 625){
                                re_info_left.width_ = 625
                            }
                        }
                    }
                }

                Image {
                    id: worker_images
                    y: 1
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    source: "../images/svg_images/worker.svg"
                    anchors.verticalCenterOffset: 1
                    anchors.leftMargin: 12
                }

                Label {
                    id: workerNumber
                    y: 0
                    width: 33
                    height: 32
                    color: "#00ff00"
                    text: qsTr(":NA")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: worker_images.right
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenterOffset: 2
                    font.pointSize: 11
                    anchors.leftMargin: 2
                }

                Image {
                    id: mch_icon
                    y: 1
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: worker_images.right
                    source: "../images/svg_images/machine.svg"
                    anchors.leftMargin: 42
                    anchors.verticalCenterOffset: 1
                }

                Label {
                    id: mch_num_2dot
                    width: 33
                    color: "#00ff00"
                    text: qsTr(":")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: mch_icon.right
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.verticalCenterOffset: 2
                    font.pointSize: 11
                }

                Label {
                    id: mch_num
                    x: 99
                    width: 33
                    color: "#00ff00"
                    text: qsTr("0")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: mch_icon.right
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                    anchors.verticalCenterOffset: 3
                    anchors.leftMargin: 9
                }

                Image {
                    id: roll_icon
                    y: 1
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: mch_icon.right
                    source: "../images/svg_images/fabric.svg"
                    anchors.leftMargin: 42
                    anchors.verticalCenterOffset: 1
                }

                Label {
                    id: roll_num
                    x: 171
                    width: 33
                    color: "#ffffff"
                    text: qsTr(":NA")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: roll_icon.right
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    font.pointSize: 11
                    anchors.verticalCenterOffset: 2
                }

                Image {
                    id: percent_icon
                    y: 1
                    width: 24
                    height: 24
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: roll_icon.right
                    source: "../images/svg_images/percent.svg"
                    anchors.leftMargin: 44
                    anchors.verticalCenterOffset: 0
                }

                Label {
                    id: percent_num_2dot
                    x: 244
                    width: 33
                    color: "#00ff00"
                    text: qsTr(":")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: percent_icon.right
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.verticalCenterOffset: 2
                    font.pointSize: 11
                }

                Label {
                    id: percent_num
                    x: 244
                    width: 33
                    color: "#00ff00"
                    text: qsTr("0%")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: percent_icon.right
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 9
                    font.pointSize: 11
                    anchors.verticalCenterOffset: 3
                }
            }

            Rectangle {
                id: top_bar_right
                width: 491
                color: "#00000000"
                anchors.left: parent.horizontalCenter
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0

                Rectangle {
                    id: re_info
                    property int width_: t_info.width
                    width: width_
                    x: 311
                    color: "#f2fb00"
                    anchors.bottomMargin: 4
                    anchors.topMargin: 3
                    radius: 13
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenterOffset: -235
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{
                        id: t_info
                        property int foo: 1
                        width: t_info.contentWidth + 10
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Trang Chủ"
                        Behavior on text {
                            FadeAnimation {
                                target: t_info
                            }
                        }
                        onWidthChanged: {
                            re_info.width_ = t_info.width + 150//190
                            if (re_info.width_ > 425){
                                re_info.width_ = 425
                            }
                        }
                    }
                }

                Image {
                    id: roll_icon1
                    x: -490
                    y: 4
                    width: 22
                    height: 22
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: row_btns.left
                    source: "../images/svg_images/wifi.svg"
                    anchors.rightMargin: 188
                    anchors.verticalCenterOffset: 1
                }

                Label {
                    id: timeDateLabel
                    x: 357
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.right: row_btns.left
                    anchors.top: parent.top
                    anchors.topMargin: 8
                    anchors.rightMargin: 5
                }

                Label {
                    id: workDayLabel
                    x: 358
                    color: "#00ff00"
                    text: qsTr("")
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 8
                    anchors.rightMargin: 347
                }

                Label {
                    id: workShiftLabel
                    x: 352
                    color: "#00ff00"
                    text: qsTr("")
                    anchors.right: workDayLabel.left
                    anchors.top: parent.top
                    anchors.topMargin: 8
                    anchors.rightMargin: 5
                }

                Row {
                    id: row_btns
                    x: 852
                    y: 0
                    width: 128
                    height: 32
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    TopBarButton {
                        id: btn_minimize
                        width: 32
                        height: 32
                        btnIconSource: "../images/svg_images/minimize_icon.svg"
                        onClicked: window.showMinimized()
                    }

                    TopBarButton {
                        id: btn_full_screen
                        width: 32
                        height: 32
                        btnIconSource: "../images/svg_images/full_screen_icon.svg"
                        onClicked: internal.fullScreen()
                    }

                    TopBarButton {
                        id: btn_maximize
                        width: 32
                        height: 32
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: {
                            internal.maximizeRestore()
                        }
                    }

                    TopBarButton {
                        id: btn_close
                        width: 32
                        height: 32
                        btnColorClicked: "#fd0f0f"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: {
                            mainBridge.stopChildThread() //stopNetworkManaging()
                            window.close()
                        }
                    }
                }



                anchors.topMargin: 0
                anchors.bottomMargin: 0
            }

            DragHandler {
//                onActiveChanged: if(active){
//                                     window.startSystemMove()
//                                     internal.ifMaximizedWindowRestore()
//                                 }
            }




        }

        Rectangle {
            id: contenPages
            height: 983
            color: "#0e0e0e"
            border.color: "#0e0e0e"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 34

            StackView {
                id: stackView_contenPage
                anchors.fill: parent
                initialItem: Qt.resolvedUrl("pages/homePage.qml")
                //initialItem: Qt.resolvedUrl("pages/yarnPage.qml")
            }                        
        }


        Rectangle {
            id: bottom_bar
            property string userPosition: ""
            property string userId: ""
            color: "#000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: contenPages.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.topMargin: 3

            BottomBarButton{
                id: homeButton
                enabled: bottom_bar.userPosition === "" ? false : true
                width: 124
                height: 62
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.topMargin: 1
                onClicked: {
                    stackView_contenPage.replace(Qt.resolvedUrl("pages/homePage.qml"))
                    t_info.text = "Trang Chủ"
                    positionSign.x = homeButton.x
                    positionSign2.x = positionSign.x
                    positionSign2.visible = false
                    if(stackView_bar_left.barNumber !== "L1"){
                        stackView_bar_left.replace(Qt.resolvedUrl("bars/barLeft1.qml"))
                        stackView_bar_left.barNumber = "L1"
                    }
                    if(stackView_bar_right.barNumber !== "R1"){
                        stackView_bar_right.replace(Qt.resolvedUrl("bars/barRight1.qml"))
                        stackView_bar_right.barNumber = "R1"
                    }
                    backToHomePageTimer.stop()
                    userSignOutTimer.restart()
                }

            }

            Rectangle {
                id: rectangle_left                
                color: "#00000000"
                border.color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 55
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                StackView {
                    id: stackView_bar_left
                    property string barNumber: "L1"
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("bars/barLeft1.qml")
                    replaceExit: Transition {
                        PropertyAnimation{
                          property: "opacity"
                          from: 1
                          to: 0
                          duration: 250
                        }
                    }
                    replaceEnter: Transition {
                        NumberAnimation {
                            property: "scale"
                            duration: 200
                            from: 0
                            to: 1
                            easing.type: Easing["Out"+"Quad"]
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle_right                
                color: "#00000000"
                border.color: "#00000000"
                anchors.left: parent.horizontalCenter
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 55
                anchors.rightMargin: 0
                StackView {
                    id: stackView_bar_right
                    property string barNumber: "R1"
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("bars/barRight1.qml")
                    // Animation 1
                    replaceExit: Transition {
                        PropertyAnimation{
                          property: "opacity"
                          from: 1
                          to: 0
                          duration: 250
                        }
                    }
                    replaceEnter: Transition {
                        NumberAnimation {
                            id: inAnimation
                            property: "scale"
                            duration: 200
                            from: 0
                            to: 1
                            easing.type: Easing["Out"+"Quad"]
                        }
                    }
                }
            }

            Image {
                id: positionSign
                source: "../images/svg_images/positionSign.svg"
                property int x_: homeButton.x
                x: 896
                //x: x_
                width: 124
                height: 62
                anchors.top: parent.top
                anchors.topMargin: -2
                Behavior on x { PropertyAnimation {} }
            }

            Image {
                id: positionSign2
                source: "../images/svg_images/positionSign.svg"
                property int x_: homeButton.x
                opacity: 0.5
                x: 896
                //x: x_
                width: 124
                height: 62
                anchors.top: parent.top
                anchors.topMargin: -2
                Behavior on x { PropertyAnimation {} }
            }

//            Rectangle {
//                id: arrowSign
//                width: 50
//                height: 50
//                color: "#dfff55"
//                Behavior on x { PropertyAnimation {} }
//            }
        }
        Item {
            id: uppest_layer
            x: 0
            y: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Image {
                id: bg_images
                source: "../images/svg_images/New_logo.svg"
                anchors.topMargin: 1
                anchors.horizontalCenter: parent.horizontalCenter
                x: 0

                width: 47
                height: 47
                anchors.top: parent.top
                //visible: false
            }
        }
    }


    DropShadow{
        anchors.fill: app_container
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: app_container
        z: 0
    }

    SoundEffect {
        id: se_newSpeakerConnected
        source: "../soundEffects/maytinhmatketnoi.wav"
    }

    SoundEffect {
        id: se_speakerDisconnected
        source: "../soundEffects/maytinhvuamatketnoitoiloa.wav"
    }

    SoundEffect {
        id: se_notifyNewConnectionForPrint
        source: "../soundEffects/Notify-maytinhdangnhan.wav"
    }

    SoundEffect {
        id: se_notifyDowloadedCompletedAndPrepareToPrint
        source: "../soundEffects/dowloadedFilePrepareToPrint.wav"
    }

    SoundEffect {
        id: se_notRightTimeToSeeAttendance
        source: "../soundEffects/chuadengiocoibangphanmay.wav"
    }

    SoundEffect {
        id: se_beep
        source: "../soundEffects/beep.wav"
    }

    SoundEffect {
        id: se_endShiftWork
        source: "../soundEffects/endWorkingShift.wav"
    }


    Connections{
        target: mainBridge

    }

    Connections{
        target: homePageBridge

        function onFillNumberWorkerUI(numberWorker_){
            // fill number of worker in top bar
            workerNumber.text = ": " + numberWorker_
        }

        function onRefeshHomePageSignal(){
            // worker tranfer time: need to request worker comfirm quality at tranfer time.
            print("refesh homepage after worker tranfer, and request worker to comfirm quality")
//            if(se_endShiftWork.playing){
//               se_endShiftWork.stop()
//            }
//            se_endShiftWork.play()
            homeButton.clicked()
        }
    }

    Connections{
        target: topBarBottomModelBridge

        function onUpdNextAudioNoteSpeakerUISignal(note_){
            //print("Update Next Audio Note Will Play")
            t_info_left.text = note_
        }

        function onWorkerInformEndOfWorkDay(){
            //print("Goodbye worker! See you tomorrow!")
            if(se_endShiftWork.playing){
               se_endShiftWork.stop()
            }
            se_endShiftWork.play()
            homeButton.clicked()
        }

        function onLoadUserInformationWithBeepSound(list_){
            se_beep.play()
            if(list_.length !== 0){
                // update new uer position
                bottom_bar.userPosition = list_[3]
                // update new user id
                bottom_bar.userId = list_[5]
            }
            userSignOutTimer.restart()
        }

        function onStartTimerBackToHomePageSignal(){
            if(backToHomePageTimer.running){
                print("restart backToHomePageTimer")
                backToHomePageTimer.restart()
            }
            else{
                print("start backToHomePageTimer")
                backToHomePageTimer.start()
            }
        }

        function onWorkerCheckAttendanceButInWrongTime(){
            if(!se_notRightTimeToSeeAttendance.playing){
                se_notRightTimeToSeeAttendance.play()
            }
        }

        function onNewCNTForPrintSignal(){
            if(!se_notifyNewConnectionForPrint.playing){
                se_notifyNewConnectionForPrint.play()
            }
        }

        function onRcvFileToPrintSignal(){
            if(!se_notifyDowloadedCompletedAndPrepareToPrint.playing){
                se_notifyDowloadedCompletedAndPrepareToPrint.play()
            }
        }

        function onTimeChange(value){
            timeDateLabel.text = value
        }

        function onWorkDayChange(value){
            workDayLabel.text = value
        }

        function onWorkShiftChange(value){
            if(value === "Ngày"){workShiftLabel.text = "Ca Ngày"}
            else if(value === "Đêm"){workShiftLabel.text = "Ca Đêm"}

        }

        function onWorkerNumChange(value){
            workerNumber.text = value
        }

        function onMchNumChange(value){
            mch_num.text = value
        }

        function onRollNumChange(value){
            roll_num.text = value
        }

        function onPercentChange(value){
            percent_num.text = value
        }

        function onSpeakerConnected(){
            print("new speaker connected")
            se_newSpeakerConnected.play()
        }

        function onSpeakerDisconnected(){
            print("speaker disconnected")
            se_speakerDisconnected.play()
        }

//        function onFabricTypePageQuery(){
//            stackView_contenPage.push(Qt.resolvedUrl("pages/yarnPage.qml"))
//        }
    }
}

















/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:40;locked:true}
}
##^##*/
