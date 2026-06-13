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

    property list<WorkerAttendanceRect> listMch

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
            topBarBottomModelBridge.initializingMchAttendanceList()
            topBarBottomModelBridge.startTimerBackToHomePage()
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

        WorkerAttendanceRect {
            id: m1_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 11
            anchors.topMargin: 9
            machineNumber: 1

        }

        WorkerAttendanceRect {
            id: m4_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: parent.top
            machineNumber: 4
            anchors.topMargin: 9
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
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

        WorkerAttendanceRect {
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

        WorkerAttendanceRect {
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

        WorkerAttendanceRect {
            id: m2_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m1_rect.bottom
            machineNumber: 2
            anchors.topMargin: 37
            anchors.leftMargin: 11

        }

        WorkerAttendanceRect {
            id: m3_rect
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m2_rect.right
            machineNumber: 3
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m6_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m3_rect.right
            machineNumber: 6
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m7_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m6_rect.right
            machineNumber: 7
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m10_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m7_rect.right
            machineNumber: 10
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m18_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m2_rect.bottom
            machineNumber: 18
            anchors.topMargin: 9
            anchors.leftMargin: 11

        }

        WorkerAttendanceRect {
            id: m16_rect
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m18_rect.right
            machineNumber: 16
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m15_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 15
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m12_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m15_rect.right
            machineNumber: 12
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m11_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m12_rect.right
            machineNumber: 11
            anchors.leftMargin: 6

        }



        WorkerAttendanceRect {
            id: m17_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: m18_rect.bottom
            machineNumber: 17
            anchors.topMargin: 37
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m14_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m17_rect.right
            machineNumber: 14
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
            id: m13_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m14_rect.right
            machineNumber: 13
            anchors.leftMargin: 6

        }

        WorkerAttendanceRect {
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

        WorkerAttendanceRect {
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

        WorkerAttendanceRect {
            id: m21_rect
            y: 0
            width: 220
            height: 220
            anchors.verticalCenter: m20_rect.verticalCenter
            anchors.left: m20_rect.right
            machineNumber: 21
            anchors.leftMargin: 6

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

    SoundEffect {
        id: se_chaobanngaymoi
        source: "../../soundEffects/chaobanngaymoi.wav"
    }

    SoundEffect {
        id: se_chaobanratlaylamtiec
        source: "../../soundEffects/chaobanratlaylamtiec.wav"
    }

    //===================================================== POPUP


    // ================================================= CONNECTIONS

    Connections{
        target: topBarBottomModelBridge

        function onLoadWorkerAttendanceList(imgUrl_, mchList_){
            print("onLoadWorkerAttendanceList. imgUserUrl: ", imgUrl_, " - machineList: ", mchList_)
            m1_rect.resetUserImage()
            m2_rect.resetUserImage()
            m3_rect.resetUserImage()
            m4_rect.resetUserImage()
            m5_rect.resetUserImage()
            m6_rect.resetUserImage()
            m7_rect.resetUserImage()
            m8_rect.resetUserImage()
            m9_rect.resetUserImage()
            m10_rect.resetUserImage()
            m11_rect.resetUserImage()
            m12_rect.resetUserImage()
            m13_rect.resetUserImage()
            m14_rect.resetUserImage()
            m15_rect.resetUserImage()
            m16_rect.resetUserImage()
            m17_rect.resetUserImage()
            m18_rect.resetUserImage()
            m19_rect.resetUserImage()
            m20_rect.resetUserImage()
            m21_rect.resetUserImage()
            if(mchList_.length != 0){
                print("play sound effect: se_chaobanngaymoi")
                if(!se_chaobanngaymoi.playing){
                    se_chaobanngaymoi.play()
                }
                mchList_.forEach(function (mch, index){
                    print("machine: ", mch)
                    if(mch == "1"){m1_rect.setUserImage(imgUrl_)}
                    if(mch == "2"){m2_rect.setUserImage(imgUrl_)}
                    if(mch == "3"){m3_rect.setUserImage(imgUrl_)}
                    if(mch == "4"){m4_rect.setUserImage(imgUrl_)}
                    if(mch == "5"){m5_rect.setUserImage(imgUrl_)}
                    if(mch == "6"){m6_rect.setUserImage(imgUrl_)}
                    if(mch == "7"){m7_rect.setUserImage(imgUrl_)}
                    if(mch == "8"){m8_rect.setUserImage(imgUrl_)}
                    if(mch == "9"){m9_rect.setUserImage(imgUrl_)}
                    if(mch == "10"){m10_rect.setUserImage(imgUrl_)}
                    if(mch == "11"){m11_rect.setUserImage(imgUrl_)}
                    if(mch == "12"){m12_rect.setUserImage(imgUrl_)}
                    if(mch == "13"){m13_rect.setUserImage(imgUrl_)}
                    if(mch == "14"){m14_rect.setUserImage(imgUrl_)}
                    if(mch == "15"){m15_rect.setUserImage(imgUrl_)}
                    if(mch == "16"){m16_rect.setUserImage(imgUrl_)}
                    if(mch == "17"){m17_rect.setUserImage(imgUrl_)}
                    if(mch == "18"){m18_rect.setUserImage(imgUrl_)}
                    if(mch == "19"){m19_rect.setUserImage(imgUrl_)}
                    if(mch == "20"){m20_rect.setUserImage(imgUrl_)}
                    if(mch == "21"){m21_rect.setUserImage(imgUrl_)}
                })
            }
            else{
                print("play sound effect: se_chaoban rat lay lam tiec")
                if(!se_chaobanratlaylamtiec.playing){
                    se_chaobanratlaylamtiec.play()
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}D{i:35}D{i:37}D{i:40}D{i:26}
}
##^##*/
