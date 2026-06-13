import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4
//import QtGraphicalEffects 1.15
import Qt5Compat.GraphicalEffects

Item {
    id: homePage
    width: 1920
    height: 985

    property list<MachineInfoRect> listMch
    property var onlineState: []
    property int i: 0
    property int onlineRunMchNum : 0
    property real percentMachineWork: 0.00

    property bool speakerConneted: false

    property int temp: 0
    property int temp1: 0
    property int movingDirection: 0 // 0: down, 1: up

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

    function updateHowManyRunMachines(){
        onlineRunMchNum = 0
        for(i = 0; i < 22; i++){
            if(onlineState[i] === true){
                onlineRunMchNum++
            }
        }
        percentMachineWork = onlineRunMchNum*100/21

        mch_num.text = onlineRunMchNum.toString()
        percent_num.text = percentMachineWork.toFixed(2) + "%"
    }

    Timer {
        id: scrollAutomacticPerformanceWorkerTable
        interval: 2000; running: true; repeat: true
        onTriggered: {
            //print("timer working")
            //lv_scoreTable.positionViewAtIndex(lv_scoreTable.count - 1, ListView.Beginning)
            if (movingDirection === 0){
                lv_scoreTable.incrementCurrentIndex()
            }
            else{
                lv_scoreTable.decrementCurrentIndex()
            }
            if (lv_scoreTable.currentIndex === lv_scoreTable.count - 1){
                movingDirection = 1
            }
            else if (lv_scoreTable.currentIndex === 0){
                movingDirection = 0
            }
        }
    }

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
            for(i = 0; i < 22; i++){
                onlineState[i] = false
            }
            homePageBridge.initializingOnline()
            //            homePageBridge.initializingFabricInfo()
            //            homePageBridge.initializingCountNum()
            //            homePageBridge.initializingTimeMetter()
            //            homePageBridge.initializingRoundNum()
            //            homePageBridge.fillWorkerPerformaceData()
            homePageBridge.fillAllRectsData()
            homePageBridge.fillNumberWorker()
            //print("fill user in....")
            topBarBottomModelBridge.fillUserInformation()
            topBarBottomModelBridge.fillSpeakerInformation()
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
            anchors.leftMargin: 6
        }

        Rectangle {
            id: rectangle3
            y: 771
            width: 220
            height: 220
            opacity: 0.543
            color: "#00ffffff"
            radius: 2
            border.color: "#555555"
            anchors.left: m11_rect.left
            anchors.top: m13_rect.top
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Image {
                id: im_speakerConnected
                height: 220
                visible: homePage.speakerConneted
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../images/page_images/homePage/speakerConnected.svg"
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 2
                sourceSize.height: 220
                sourceSize.width: 220
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: im_speakerDisconnected
                visible: !homePage.speakerConneted
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../images/page_images/homePage/speakerDisconnected.svg"
                anchors.topMargin: 2
                sourceSize.height: 220
                sourceSize.width: 220
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle
            y: 754
            color: "#8d222222"
            radius: 110
            border.color: "#ffffff"
            anchors.left: m19_rect.left
            anchors.right: m21_rect.right
            anchors.top: m13_rect.top
            anchors.bottom: m13_rect.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Image {
                id: img_face
                width: 210
                height: 210
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../userImages/noUser.svg"
                anchors.rightMargin: 6
                sourceSize.height: 210
                sourceSize.width: 280
                anchors.topMargin: 5
                fillMode: Image.Tile
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: mask
                }
                Rectangle {
                    id: mask
                    width: 210
                    height: 210
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: 110
                    visible: false
                }
            }

            Label {
                id: lb_userName
                x: 230
                y: 6
                color: "#ffffff"
                text: qsTr("- Tên:")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                anchors.verticalCenterOffset: -39
            }

            Label {
                id: lb_userPosition
                x: 230
                y: 7
                color: "#ffffff"
                text: qsTr("- Chức vụ:")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                anchors.verticalCenterOffset: 0
            }

            Label {
                id: lb_userAuthority
                x: 230
                y: 0
                color: "#ffffff"
                text: qsTr("- Quyền:")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                anchors.verticalCenterOffset: 39
            }

            RoundButton {
                id: bt_signOut
                y: 7
                width: 210
                height: 210
                text: "           Đăng xuất"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pointSize: 14
                anchors.leftMargin: 6

                background: Rectangle {
                    id: rectangle2
                    anchors.fill: parent
                    radius: 110
                    Image {
                        width: 60
                        height: 60
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: "../../images/page_images/homePage/signOut.svg"
                        anchors.leftMargin: 27
                        sourceSize.height: 60
                        sourceSize.width: 60
                        fillMode: Image.Tile
                    }
                }

                onClicked: {
                    topBarBottomModelBridge.userSignedOut()
                    bottom_bar.userPosition = ""
                    bottom_bar.userId = ""
                    se_logOut.play()

                    for(let i = 0; i < listMch.length; i++){
                        listMch[i].setVisible(true)
                        listMch[i].setUserLoginFlag(false)
                    }
                }
            }

            Label {
                id: lb_userName1
                x: 360
                y: 4
                color: "#ffffff"
                text: qsTr("THÔNG TIN NGƯỜI DÙNG:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.underline: true
                font.italic: true
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                anchors.verticalCenterOffset: -77
            }

            Label {
                id: lb_userNameValue
                x: 308
                y: -1
                color: "#ffffff"
                text: qsTr(".")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: -39
            }

            Label {
                id: lb_userPositionValue
                x: 308
                y: 0
                color: "#ffffff"
                text: qsTr(".")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: 0
            }

            Label {
                id: lb_userAuthorityValue
                x: 308
                y: -7
                color: "#ffffff"
                text: qsTr(".")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: 39
            }
        }

        Rectangle {
            id: rectangle4
            y: 771
            width: 220
            height: 220
            opacity: 0.54
            color: "#00ffffff"
            radius: 2
            border.color: "#555555"
            anchors.left: m18_rect.left
            anchors.top: m17_rect.top
            Image {
                id: im_powerMetterConcept
                height: 220
                opacity: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../images/page_images/homePage/powerMetterConcept.svg"
                anchors.topMargin: 2
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                sourceSize.height: 220
                sourceSize.width: 220
                fillMode: Image.PreserveAspectFit
            }
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }

        Rectangle {
            id: rec_scoreTable
            color: "#8f040404"
            border.width: 1
            anchors.left: m10_rect.right
            anchors.right: m21_rect.right
            anchors.top: m1_rect.top
            anchors.bottom: m19_rect.top
            anchors.leftMargin: 10
            anchors.bottomMargin: 7
            anchors.topMargin: 0
            anchors.rightMargin: -7

            ListView {
                id: lv_scoreTable
                height: 261
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle5.bottom
                anchors.leftMargin: 5
                anchors.topMargin: 3
                spacing: 3
                model: ListModel {
//                    ListElement{
//                        workerImgSource_                    : "../../userImages/noUser.svg"
//                        workedShift_                        : "25"
//                        workedShiftScore_                   : "9.0"
//                        periodCheckTime_                    : "35.5"
//                        checkTimeScore_                     : "20.0"
//                        timeToEndYarnBreakFullRoll_         : "4.5"
//                        timeToEndYarnBreakFullRollScore_    : "4.0"
//                        numberDetectFaultAtTranferTime_     : "99"
//                        numberDetectFaultAtTranferTimeScore_: "10.0"
//                        numberOfKnitSMYOWY_                 : "5"
//                        numberOfKnitSMYOWYScore_            : "5.0"
//                        numberBadClean_                     : "2"
//                        numberBadCleanScore_                : "-6.0"
//                        numberLetFaultAtTranferTime_        : "99"
//                        numberLetFaultAtTranferTimeScore_   : "-6.0"
//                        kgDefectProduct_                    : "999.5"
//                        kgDefectProductScore_               : "-40.0"
//                        totalScore_                         : "34.5"
//                    }


                }
                delegate: DLG_ScoreTable{rowWidth: 742
                    rowHeigh :30 }
                Component.onCompleted: {
                    homePageBridge.lv_scoreTableCompleted()
                }
                onCurrentIndexChanged: {


                }

                //                ScrollBar {
                //                    orientation: Qt.Vertical
                //                    height: parent.height;
                //                    width: 8
                //                    scrollArea: parent;
                //                    anchors.right: parent.right
                //                    anchors.bottom: parent.bottom
                //                    anchors.top: parent.top
                //                    anchors.bottomMargin: 0
                //                    anchors.topMargin: 0
                //                }
            }

            Rectangle {
                id: rectangle5
                width: 30
                color: "#f26d21"
                radius: 2
                border.color: "#9a2617"
                anchors.left: parent.left
                anchors.top: rectangle9.top
                anchors.bottom: rectangle7.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 38

                Label {
                    x: 16
                    y: 103
                    color: "#ffffff"
                    text: qsTr("Xếp hạng:")
                    anchors.verticalCenter: parent.verticalCenter
                    rotation: -90
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle6
                width: 71
                height: 105
                color: "#3c00ff00"
                radius: 2
                border.color: "#00ff00"
                anchors.left: rectangle5.right
                anchors.top: parent.top
                anchors.topMargin: 70
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số ca")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("làm:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 32
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("( chuyên")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 56
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("cần )")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
            }

            Rectangle {
                id: rectangle8
                width: 87
                color: "#3a00ff00"
                radius: 2
                border.color: "#00ff00"
                anchors.left: rectangle6.right
                anchors.top: rectangle6.top
                anchors.bottom: rectangle6.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số phút")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 9
                    color: "#ffffff"
                    text: qsTr("kiểm hàng")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 56
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 1
                    color: "#ffffff"
                    text: qsTr("trung bình:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("không")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 32
                }
            }

            Rectangle {
                id: rectangle10
                width: 87
                color: "#3a00ff00"
                radius: 2
                border.color: "#00ff00"
                anchors.left: rectangle8.right
                anchors.top: rectangle8.top
                anchors.bottom: rectangle8.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số phút")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("nối sợi")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 32
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("- cắt cây")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 56
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("trung bình:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 80
                }
            }

            Rectangle {
                id: rectangle12
                width: 71
                color: "#3a00ff00"
                radius: 2
                border.color: "#00ff00"
                anchors.left: rectangle10.right
                anchors.top: rectangle10.top
                anchors.bottom: rectangle10.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số lần")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("phát hiện")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 32
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("lỗi khi ")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 56
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("giao ca:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 80
                }
            }

            Rectangle {
                id: rectangle14
                width: 71
                color: "#3a00ff00"
                radius: 2
                border.color: "#00ff00"
                anchors.left: rectangle12.right
                anchors.top: rectangle6.top
                anchors.bottom: rectangle6.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số lần")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 12
                    color: "#ffffff"
                    text: qsTr("châm tàn")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 32
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 18
                    color: "#ffffff"
                    text: qsTr("- dệt sợi")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 56
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 21
                    color: "#ffffff"
                    text: qsTr("yếu:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
            }

            Rectangle {
                id: rectangle16
                width: 71
                color: "#3aff0000"
                radius: 2
                border.color: "#ff0000"
                anchors.left: rectangle14.right
                anchors.top: rectangle6.top
                anchors.bottom: rectangle6.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số lần")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 21
                    color: "#ffffff"
                    text: qsTr("bỏ vệ")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 32
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 28
                    color: "#ffffff"
                    text: qsTr("sinh khi")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 56
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }

                Label {
                    x: 20
                    color: "#ffffff"
                    text: qsTr("giao ca:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
            }

            Rectangle {
                id: rectangle18
                width: 71
                color: "#3aff0000"
                radius: 2
                border.color: "#ff0000"
                anchors.left: rectangle16.right
                anchors.top: rectangle6.top
                anchors.bottom: rectangle6.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số lần")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("để lại")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 32
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("lỗi khi")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 56
                }

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("giao ca:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.topMargin: 80
                }
            }

            Rectangle {
                id: rectangle20
                width: 97
                color: "#3aff0000"
                radius: 2
                border.color: "#ff0000"
                anchors.left: rectangle18.right
                anchors.top: rectangle6.top
                anchors.bottom: rectangle6.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Số kg")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    x: 20
                    color: "#ffffff"
                    text: qsTr("hàng hư:")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 32
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
            }

            Rectangle {
                id: rectangle22
                width: 46
                color: "#3affff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle20.right
                anchors.top: rectangle5.top
                anchors.bottom: rectangle5.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 3

                Label {
                    x: 16
                    y: 103
                    color: "#ffffff"
                    text: qsTr("Tổng điểm:")
                    anchors.verticalCenter: parent.verticalCenter
                    rotation: -90
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle7
                height: 31
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle6.left
                anchors.right: rectangle20.right
                anchors.top: rectangle6.bottom
                anchors.rightMargin: 0
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("Điểm:")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.leftMargin: 0
                anchors.topMargin: 3
            }

            Rectangle {
                id: rectangle9
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle6.left
                anchors.right: rectangle6.right
                anchors.bottom: rectangle6.top
                anchors.bottomMargin: 3
                anchors.rightMargin: 0
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("9%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle11
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle8.left
                anchors.right: rectangle8.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("20%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle13
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle10.left
                anchors.right: rectangle10.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("4%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle15
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle12.left
                anchors.right: rectangle12.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("10%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle17
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle14.left
                anchors.right: rectangle14.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("5%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle19
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle16.left
                anchors.right: rectangle16.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("6%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle21
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle18.left
                anchors.right: rectangle18.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("6%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle23
                height: 27
                color: "#3cffff00"
                radius: 2
                border.color: "#ffff00"
                anchors.left: rectangle20.left
                anchors.right: rectangle20.right
                anchors.bottom: rectangle9.bottom
                Label {
                    x: 16
                    color: "#ffffff"
                    text: qsTr("40%")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    rotation: 0
                }
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rectangle24
                height: 34
                color: "#107896"
                radius: 2
                border.color: "#a3b86c"
                border.width: 1
                anchors.left: rectangle5.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 2
                anchors.leftMargin: 0
                anchors.topMargin: 3

                Label {
                    id: label
                    x: 39
                    y: 6
                    color: "#ffffff"
                    text: qsTr("BẢNG ĐIỂM CHUYÊN NGHIỆP")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenterOffset: 3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 14
                    font.bold: true
                }
            }


        }

    }

    SoundEffect {
        id: se_beep
        source: "../../soundEffects/beep.wav"
    }

    SoundEffect {
        id: se_logOut
        source: "../../soundEffects/button_click.wav"
    }

    SoundEffect {
        id: se_mchOnline
        source: "../../soundEffects/online.wav"
    }

    SoundEffect {
        id: se_scoreTableScroll
        source: "../../soundEffects/reCaculateScore.wav"
    }



    // ================================================= CONNECTIONS

    Connections{
        target: topBarBottomModelBridge

        function onReSetAllRectVisible(){
            for(let i = 0; i < listMch.length; i++){
                listMch[i].setVisible(true)
            }
        }

        function onReSetAllRectUserLogin(){
            for(let i = 0; i < listMch.length; i++){
                listMch[i].setUserLoginFlag(false)
            }
        }

        function onLoadUserInformationWithBeepSound(list_){
            //se_beep.play()
            if(list_.length !== 0){
                lb_userNameValue.text = list_[2] + " " + list_[1]
                lb_userPositionValue.text = list_[3]
                img_face.source = list_[4]

                // update new uer position
                //bottom_bar.userPosition = lb_userPositionValue.text
                //                print("set user position:", bottom_bar.userPosition)
                // update new user id
                //bottom_bar.userId = list_[5]

                if(lb_userPositionValue.text === "NGHỆ NHÂN DỆT"){
                    temp = 0
                    for(let i = 0; i < listMch.length; i++){
                        if(listMch[i].getSliderValue() === 1){
                            temp = temp + 1
                        }
                        listMch[i].setUserLoginFlag(true)
                    }
                    if (temp !== 0){
                        for(let i = 0; i < listMch.length; i++){
                            if(listMch[i].workerImageSource === img_face.source){
                                listMch[i].setVisible(true)
                            }
                            else{
                                listMch[i].setVisible(false)
                            }
                        }
                    }
                }
                else{
                    for(let i = 0; i < listMch.length; i++){
                        listMch[i].setVisible(true)
                        listMch[i].setUserLoginFlag(false)
                    }
                }
            }
        }

        function onLoadUserInformationWithNoBeepSound(list_){
            if(list_.length != 0){
                lb_userNameValue.text = list_[2] + " " + list_[1]
                lb_userPositionValue.text = list_[3]
                img_face.source = list_[4]

                // update new uer position
                bottom_bar.userPosition = lb_userPositionValue.text
                print("bottom_bar.userPosition", bottom_bar.userPosition)
                //                print("set user position:", bottom_bar.userPosition)
                // update new user id
                bottom_bar.userId = list_[5]
            }
        }

        function onSpeakerConnected_WithNoSoundInform(){
            homePage.speakerConneted = true
        }

        function onSpeakerDisconnected_WithNoSoundInform(){
            homePage.speakerConneted = false
        }



        function onRefeshWorkerRoster(){

        }



    }

    Connections{
        target: homePageBridge

        function onRefeshScoreTableSignal(scoreTableDataList_){
//            if(!se_scoreTableScroll.playing){
//                se_scoreTableScroll.play()
//            }
            temp1 = lv_scoreTable.currentIndex
            lv_scoreTable.model.clear()
            scoreTableDataList_.forEach(function (item, index){
                lv_scoreTable.model.append({"workerImgSource_": item[0]
                                            , "workedShift_": item[1]
                                            , "workedShiftScore_": item[2]
                                            , "periodCheckTime_": item[3]
                                            , "checkTimeScore_": item[4]
                                            , "timeToEndYarnBreakFullRoll_": item[5]
                                            , "timeToEndYarnBreakFullRollScore_": item[6]
                                            , "numberDetectFaultAtTranferTime_": item[7]
                                            , "numberDetectFaultAtTranferTimeScore_": item[8]
                                            , "numberOfKnitSMYOWY_": item[9]
                                            , "numberOfKnitSMYOWYScore_": item[10]
                                            , "numberBadClean_": item[11]
                                            , "numberBadCleanScore_": item[12]
                                            , "numberLetFaultAtTranferTime_": item[13]
                                            , "numberLetFaultAtTranferTimeScore_": item[14]
                                            , "kgDefectProduct_": item[15]
                                            , "kgDefectProductScore_": item[16]
                                            , "totalScore_": item[17]})
            })
            lv_scoreTable.currentIndex = temp1
        }

        function onFillWorkerPerformanceUI(listWorkerPerformanceIndexs_){
            // fill worker performance data.
            listWorkerPerformanceIndexs_.forEach(function (workerPerformanceIndexsData, index){
                if(workerPerformanceIndexsData.length !== 0){
                    listMch[index].fillPerformanceIndex(workerPerformanceIndexsData)
                }
            })
        }

        function onFillFabricSpecsUI(listFabricSpecificInfo_){
            // fill fabric specific data.
            listFabricSpecificInfo_.forEach(function (fabricSpecificData, index){
                if(fabricSpecificData.length !== 0){
                    listMch[index].fillFabricSpecInfo(fabricSpecificData)
                }
            })
        }

        function onFillBlinkStatesUI( listDataBlinkStates_){
            // fill blink states.
            listDataBlinkStates_.forEach(function (dataBlinkStates_, index){
                if(dataBlinkStates_.length !== 0){
                    listMch[index].setBlinkState(dataBlinkStates_)
                }
            })
        }

        function onInitializingOnlineState(mchList_){
            mchList_.forEach(function (mch, index){
                if(mch === "1"){
                    m1_rect.onlinedChange()
                    onlineState[0] = true

                }
                else if(mch === "2"){
                    m2_rect.onlinedChange()
                    onlineState[1] = true
                }
                else if(mch === "3"){
                    m3_rect.onlinedChange()
                    onlineState[2] = true
                }
                else if(mch === "4"){
                    m4_rect.onlinedChange()
                    onlineState[3] = true
                }
                else if(mch === "5"){
                    m5_rect.onlinedChange()
                    onlineState[4] = true
                }
                else if(mch === "6"){
                    m6_rect.onlinedChange()
                    onlineState[5] = true
                }
                else if(mch === "7"){
                    m7_rect.onlinedChange()
                    onlineState[6] = true
                }
                else if(mch === "8"){
                    m8_rect.onlinedChange()
                    onlineState[7] = true
                }
                else if(mch === "9"){
                    m9_rect.onlinedChange()
                    onlineState[8] = true
                }
                else if(mch === "10"){
                    m10_rect.onlinedChange()
                    onlineState[9] = true
                }
                else if(mch === "11"){
                    m11_rect.onlinedChange()
                    onlineState[10] = true

                }
                else if(mch === "12"){
                    m12_rect.onlinedChange()
                    onlineState[11] = true
                }
                else if(mch === "13"){
                    m13_rect.onlinedChange()
                    onlineState[12] = true
                }
                else if(mch === "14"){
                    m14_rect.onlinedChange()
                    onlineState[13] = true
                }
                else if(mch === "15"){
                    m15_rect.onlinedChange()
                    onlineState[14] = true
                }
                else if(mch === "16"){
                    m16_rect.onlinedChange()
                    onlineState[15] = true
                }
                else if(mch === "17"){
                    m17_rect.onlinedChange()
                    onlineState[16] = true
                }
                else if(mch === "18"){
                    m18_rect.onlinedChange()
                    onlineState[17] = true
                }
                else if(mch === "19"){
                    m19_rect.onlinedChange()
                    onlineState[18] = true
                }
                else if(mch === "20"){
                    m20_rect.onlinedChange()
                    onlineState[19] = true
                }
                else if(mch === "21"){
                    m21_rect.onlinedChange()
                    onlineState[20] = true
                }
            })
            updateHowManyRunMachines()
        }

        function onNewMchConnected(mchList_){
            mchList_.forEach(function (mch, index){
                if(mch === "1"){
                    m1_rect.onlinedChange()
                    onlineState[0] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 1 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "2"){
                    m2_rect.onlinedChange()
                    onlineState[1] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 2 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "3"){
                    m3_rect.onlinedChange()
                    onlineState[2] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 3 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "4"){
                    m4_rect.onlinedChange()
                    onlineState[3] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 4 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "5"){
                    m5_rect.onlinedChange()
                    onlineState[4] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 5 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "6"){
                    m6_rect.onlinedChange()
                    onlineState[5] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 6 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "7"){
                    m7_rect.onlinedChange()
                    onlineState[6] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 7 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "8"){
                    m8_rect.onlinedChange()
                    onlineState[7] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 8 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "9"){
                    m9_rect.onlinedChange()
                    onlineState[8] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 9 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "10"){
                    m10_rect.onlinedChange()
                    onlineState[9] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 10 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "11"){
                    m11_rect.onlinedChange()
                    onlineState[10] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 11 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "12"){
                    m12_rect.onlinedChange()
                    onlineState[11] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 12 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "13"){
                    m13_rect.onlinedChange()
                    onlineState[12] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 13 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "14"){
                    m14_rect.onlinedChange()
                    onlineState[13] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 14 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "15"){
                    m15_rect.onlinedChange()
                    onlineState[14] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 15 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "16"){
                    m16_rect.onlinedChange()
                    onlineState[15] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 16 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "17"){
                    m17_rect.onlinedChange()
                    onlineState[16] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 17 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "18"){
                    m18_rect.onlinedChange()
                    onlineState[17] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 18 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "19"){
                    m19_rect.onlinedChange()
                    onlineState[18] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 19 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "20"){
                    m20_rect.onlinedChange()
                    onlineState[19] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 20 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
                else if(mch === "21"){
                    m21_rect.onlinedChange()
                    onlineState[20] = true
                    if( !se_mchOnline.playing){
                        //print("onNewMchConnected: machine 21 onlined -> playmusic onlined")
                        se_mchOnline.play()
                    }
                }
            })
            updateHowManyRunMachines()
        }

        function onLostMchConnection(mchList_){
            print("working on lost slot")
            print(mchList_)
            mchList_.forEach(function (mch, index){
                if(mch === "1"){
                    m1_rect.offlinedChange()
                    onlineState[0] = false
                }
                else if(mch === "2"){
                    m2_rect.offlinedChange()
                    onlineState[1] = false
                }
                else if(mch === "3"){
                    m3_rect.offlinedChange()
                    onlineState[2] = false
                }
                else if(mch === "4"){
                    m4_rect.offlinedChange()
                    onlineState[3] = false
                }
                else if(mch === "5"){
                    m5_rect.offlinedChange()
                    onlineState[4] = false
                }
                else if(mch === "6"){
                    m6_rect.offlinedChange()
                    onlineState[5] = false
                }
                else if(mch === "7"){
                    m7_rect.offlinedChange()
                    onlineState[6] = false
                }
                else if(mch === "8"){
                    m8_rect.offlinedChange()
                    onlineState[7] = false
                }
                else if(mch === "9"){
                    m9_rect.offlinedChange()
                    onlineState[8] = false
                }
                else if(mch === "10"){
                    m10_rect.offlinedChange()
                    onlineState[9] = false
                }
                else if(mch === "11"){
                    m11_rect.offlinedChange()
                    onlineState[10] = false
                }
                else if(mch === "12"){
                    m12_rect.offlinedChange()
                    onlineState[11] = false
                }
                else if(mch === "13"){
                    m13_rect.offlinedChange()
                    onlineState[12] = false
                }
                else if(mch === "14"){
                    m14_rect.offlinedChange()
                    onlineState[13] = false
                }
                else if(mch === "15"){
                    m15_rect.offlinedChange()
                    onlineState[14] = false
                }
                else if(mch === "16"){
                    m16_rect.offlinedChange()
                    onlineState[15] = false
                }
                else if(mch === "17"){
                    m17_rect.offlinedChange()
                    onlineState[16] = false
                }
                else if(mch === "18"){
                    m18_rect.offlinedChange()
                    onlineState[17] = false
                }
                else if(mch === "19"){
                    m19_rect.offlinedChange()
                    onlineState[18] = false
                }
                else if(mch === "20"){
                    m20_rect.offlinedChange()
                    onlineState[19] = false
                }
                else if(mch === "21"){
                    m21_rect.offlinedChange()
                    onlineState[20] = false
                }
            })
            updateHowManyRunMachines()
        }

        function onSetAllSliderToOne(){
            m1_rect.setSliderValue(1)
            m2_rect.setSliderValue(1)
            m3_rect.setSliderValue(1)
            m4_rect.setSliderValue(1)
            m5_rect.setSliderValue(1)
            m6_rect.setSliderValue(1)
            m7_rect.setSliderValue(1)
            m8_rect.setSliderValue(1)
            m9_rect.setSliderValue(1)
            m10_rect.setSliderValue(1)
            m11_rect.setSliderValue(1)
            m12_rect.setSliderValue(1)
            m13_rect.setSliderValue(1)
            m14_rect.setSliderValue(1)
            m15_rect.setSliderValue(1)
            m16_rect.setSliderValue(1)
            m17_rect.setSliderValue(1)
            m18_rect.setSliderValue(1)
            m19_rect.setSliderValue(1)
            m20_rect.setSliderValue(1)
            m21_rect.setSliderValue(1)
        }

        function onNewRound(mch, speed){
            print("on New Round")
            print(mch)
            if(mch === "1"){
                m1_rect.incrRPS(speed)
            }
            else if(mch === "2"){
                m2_rect.incrRPS(speed)
            }
            else if(mch === "3"){
                m3_rect.incrRPS(speed)
            }
            else if(mch === "4"){
                m4_rect.incrRPS(speed)
            }
            else if(mch === "5"){
                m5_rect.incrRPS(speed)
            }
            else if(mch === "6"){
                m6_rect.incrRPS(speed)
            }
            else if(mch === "7"){
                m7_rect.incrRPS(speed)
            }
            else if(mch === "8"){
                m8_rect.incrRPS(speed)
            }
            else if(mch === "9"){
                m9_rect.incrRPS(speed)
            }
            else if(mch === "10"){
                m10_rect.incrRPS(speed)
            }
            else if(mch === "11"){
                m11_rect.incrRPS(speed)
            }
            else if(mch === "12"){
                m12_rect.incrRPS(speed)
            }
            else if(mch === "13"){
                m13_rect.incrRPS(speed)
            }
            else if(mch === "14"){
                m14_rect.incrRPS(speed)
            }
            else if(mch === "15"){
                m15_rect.incrRPS(speed)
            }
            else if(mch === "16"){
                m16_rect.incrRPS(speed)
            }
            else if(mch === "17"){
                m17_rect.incrRPS(speed)
            }
            else if(mch === "18"){
                m18_rect.incrRPS(speed)
            }
            else if(mch === "19"){
                m19_rect.incrRPS(speed)
            }
            else if(mch === "20"){
                m20_rect.incrRPS(speed)
            }
            else if(mch === "21"){
                m21_rect.incrRPS(speed)
            }
        }

        function onSetRPS(dataList_){
            //            m1_rect.updateRPS(dataList_[0])
            //            m2_rect.updateRPS(dataList_[1])
            //            m3_rect.updateRPS(dataList_[2])
            //            m4_rect.updateRPS(dataList_[3])
            //            m5_rect.updateRPS(dataList_[4])
            //            m6_rect.updateRPS(dataList_[5])
            //            m7_rect.updateRPS(dataList_[6])
            //            m8_rect.updateRPS(dataList_[7])
            //            m9_rect.updateRPS(dataList_[8])
            //            m10_rect.updateRPS(dataList_[9])
            //            m11_rect.updateRPS(dataList_[10])
            //            m12_rect.updateRPS(dataList_[11])
            //            m13_rect.updateRPS(dataList_[12])
            //            m14_rect.updateRPS(dataList_[13])
            //            m15_rect.updateRPS(dataList_[14])
            //            m16_rect.updateRPS(dataList_[15])
            //            m17_rect.updateRPS(dataList_[16])
            //            m18_rect.updateRPS(dataList_[17])
            //            m19_rect.updateRPS(dataList_[18])
            //            m20_rect.updateRPS(dataList_[19])
            //            m21_rect.updateRPS(dataList_[20])
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
                m1_rect.qltRequestCheckEnd()
            }
            else if(mch === "2"){
                m2_rect.qltRequestCheckEnd()
            }
            else if(mch === "3"){
                m3_rect.qltRequestCheckEnd()
            }
            else if(mch === "4"){
                m4_rect.qltRequestCheckEnd()
            }
            else if(mch === "5"){
                m5_rect.qltRequestCheckEnd()
            }
            else if(mch === "6"){
                m6_rect.qltRequestCheckEnd()
            }
            else if(mch === "7"){
                m7_rect.qltRequestCheckEnd()
            }
            else if(mch === "8"){
                m8_rect.qltRequestCheckEnd()
            }
            else if(mch === "9"){
                m9_rect.qltRequestCheckEnd()
            }
            else if(mch === "10"){
                m10_rect.qltRequestCheckEnd()
            }
            else if(mch === "11"){
                m11_rect.qltRequestCheckEnd()
            }
            else if(mch === "12"){
                m12_rect.qltRequestCheckEnd()
            }
            else if(mch === "13"){
                m13_rect.qltRequestCheckEnd()
            }
            else if(mch === "14"){
                m14_rect.qltRequestCheckEnd()
            }
            else if(mch === "15"){
                m15_rect.qltRequestCheckEnd()
            }
            else if(mch === "16"){
                m16_rect.qltRequestCheckEnd()
            }
            else if(mch === "17"){
                m17_rect.qltRequestCheckEnd()
            }
            else if(mch === "18"){
                m18_rect.qltRequestCheckEnd()
            }
            else if(mch === "19"){
                m19_rect.qltRequestCheckEnd()
            }
            else if(mch === "20"){
                m20_rect.qltRequestCheckEnd()
            }
            else if(mch === "21"){
                m21_rect.qltRequestCheckEnd()
            }
        }
        function onQLTCheckOn(mch){
            print("on QLT Check On")
            print(mch)
            if(mch === "1"){
                m1_rect.qltRequestCheckStart()
            }
            else if(mch === "2"){
                m2_rect.qltRequestCheckStart()
            }
            else if(mch === "3"){
                m3_rect.qltRequestCheckStart()
            }
            else if(mch === "4"){
                m4_rect.qltRequestCheckStart()
            }
            else if(mch === "5"){
                m5_rect.qltRequestCheckStart()
            }
            else if(mch === "6"){
                m6_rect.qltRequestCheckStart()
            }
            else if(mch === "7"){
                m7_rect.qltRequestCheckStart()
            }
            else if(mch === "8"){
                m8_rect.qltRequestCheckStart()
            }
            else if(mch === "9"){
                m9_rect.qltRequestCheckStart()
            }
            else if(mch === "10"){
                m10_rect.qltRequestCheckStart()
            }
            else if(mch === "11"){
                m11_rect.qltRequestCheckStart()
            }
            else if(mch === "12"){
                m12_rect.qltRequestCheckStart()
            }
            else if(mch === "13"){
                m13_rect.qltRequestCheckStart()
            }
            else if(mch === "14"){
                m14_rect.qltRequestCheckStart()
            }
            else if(mch === "15"){
                m15_rect.qltRequestCheckStart()
            }
            else if(mch === "16"){
                m16_rect.qltRequestCheckStart()
            }
            else if(mch === "17"){
                m17_rect.qltRequestCheckStart()
            }
            else if(mch === "18"){
                m18_rect.qltRequestCheckStart()
            }
            else if(mch === "19"){
                m19_rect.qltRequestCheckStart()
            }
            else if(mch === "20"){
                m20_rect.qltRequestCheckStart()
            }
            else if(mch === "21"){
                m21_rect.qltRequestCheckStart()
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
            //            m1_rect.updateCountNums(dataList_[0][0], dataList_[1][0], dataList_[2][0], dataList_[3][0])
            //            m2_rect.updateCountNums(dataList_[0][1], dataList_[1][1], dataList_[2][1], dataList_[3][1])
            //            m3_rect.updateCountNums(dataList_[0][2], dataList_[1][2], dataList_[2][2], dataList_[3][2])
            //            m4_rect.updateCountNums(dataList_[0][3], dataList_[1][3], dataList_[2][3], dataList_[3][3])
            //            m5_rect.updateCountNums(dataList_[0][4], dataList_[1][4], dataList_[2][4], dataList_[3][4])
            //            m6_rect.updateCountNums(dataList_[0][5], dataList_[1][5], dataList_[2][5], dataList_[3][5])
            //            m7_rect.updateCountNums(dataList_[0][6], dataList_[1][6], dataList_[2][6], dataList_[3][6])
            //            m8_rect.updateCountNums(dataList_[0][7], dataList_[1][7], dataList_[2][7], dataList_[3][7])
            //            m9_rect.updateCountNums(dataList_[0][8], dataList_[1][8], dataList_[2][8], dataList_[3][8])
            //            m10_rect.updateCountNums(dataList_[0][9], dataList_[1][9], dataList_[2][9], dataList_[3][9])
            //            m11_rect.updateCountNums(dataList_[0][10], dataList_[1][10], dataList_[2][10], dataList_[3][10])
            //            m12_rect.updateCountNums(dataList_[0][11], dataList_[1][11], dataList_[2][11], dataList_[3][11])
            //            m13_rect.updateCountNums(dataList_[0][12], dataList_[1][12], dataList_[2][12], dataList_[3][12])
            //            m14_rect.updateCountNums(dataList_[0][13], dataList_[1][13], dataList_[2][13], dataList_[3][13])
            //            m15_rect.updateCountNums(dataList_[0][14], dataList_[1][14], dataList_[2][14], dataList_[3][14])
            //            m16_rect.updateCountNums(dataList_[0][15], dataList_[1][15], dataList_[2][15], dataList_[3][15])
            //            m17_rect.updateCountNums(dataList_[0][16], dataList_[1][16], dataList_[2][16], dataList_[3][16])
            //            m18_rect.updateCountNums(dataList_[0][17], dataList_[1][17], dataList_[2][17], dataList_[3][17])
            //            m19_rect.updateCountNums(dataList_[0][18], dataList_[1][18], dataList_[2][18], dataList_[3][18])
            //            m20_rect.updateCountNums(dataList_[0][19], dataList_[1][19], dataList_[2][19], dataList_[3][19])
            //            m21_rect.updateCountNums(dataList_[0][20], dataList_[1][20], dataList_[2][20], dataList_[3][20])
        }

        function onSetTimeMetter(dataList_){
            //            m1_rect.updateTimeMetters(dataList_[0][0], dataList_[1][0], dataList_[2][0], dataList_[3][0])
            //            m2_rect.updateTimeMetters(dataList_[0][1], dataList_[1][1], dataList_[2][1], dataList_[3][1])
            //            m3_rect.updateTimeMetters(dataList_[0][2], dataList_[1][2], dataList_[2][2], dataList_[3][2])
            //            m4_rect.updateTimeMetters(dataList_[0][3], dataList_[1][3], dataList_[2][3], dataList_[3][3])
            //            m5_rect.updateTimeMetters(dataList_[0][4], dataList_[1][4], dataList_[2][4], dataList_[3][4])
            //            m6_rect.updateTimeMetters(dataList_[0][5], dataList_[1][5], dataList_[2][5], dataList_[3][5])
            //            m7_rect.updateTimeMetters(dataList_[0][6], dataList_[1][6], dataList_[2][6], dataList_[3][6])
            //            m8_rect.updateTimeMetters(dataList_[0][7], dataList_[1][7], dataList_[2][7], dataList_[3][7])
            //            m9_rect.updateTimeMetters(dataList_[0][8], dataList_[1][8], dataList_[2][8], dataList_[3][8])
            //            m10_rect.updateTimeMetters(dataList_[0][9], dataList_[1][9], dataList_[2][9], dataList_[3][9])
            //            m11_rect.updateTimeMetters(dataList_[0][10], dataList_[1][10], dataList_[2][10], dataList_[3][10])
            //            m12_rect.updateTimeMetters(dataList_[0][11], dataList_[1][11], dataList_[2][11], dataList_[3][11])
            //            m13_rect.updateTimeMetters(dataList_[0][12], dataList_[1][12], dataList_[2][12], dataList_[3][12])
            //            m14_rect.updateTimeMetters(dataList_[0][13], dataList_[1][13], dataList_[2][13], dataList_[3][13])
            //            m15_rect.updateTimeMetters(dataList_[0][14], dataList_[1][14], dataList_[2][14], dataList_[3][14])
            //            m16_rect.updateTimeMetters(dataList_[0][15], dataList_[1][15], dataList_[2][15], dataList_[3][15])
            //            m17_rect.updateTimeMetters(dataList_[0][16], dataList_[1][16], dataList_[2][16], dataList_[3][16])
            //            m18_rect.updateTimeMetters(dataList_[0][17], dataList_[1][17], dataList_[2][17], dataList_[3][17])
            //            m19_rect.updateTimeMetters(dataList_[0][18], dataList_[1][18], dataList_[2][18], dataList_[3][18])
            //            m20_rect.updateTimeMetters(dataList_[0][19], dataList_[1][19], dataList_[2][19], dataList_[3][19])
            //            m21_rect.updateTimeMetters(dataList_[0][20], dataList_[1][20], dataList_[2][20], dataList_[3][20])
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
    D{i:0;formeditorZoom:1.1}D{i:25;locked:true}D{i:28;locked:true}D{i:42;locked:true}
D{i:48}D{i:53}D{i:54}D{i:108}
}
##^##*/
