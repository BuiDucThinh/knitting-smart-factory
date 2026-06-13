import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0
import QtMultimedia

Item {
    id: item1
    BottomBarButton{
        id: barRightb1
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/wkrMchButton.svg"
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/asignWorkerPage.qml"))
            t_info.text = "Phân Công Máy Dệt"
            positionSign.x = barRightb1.x + rectangle_right.x
            positionSign2.x = barRightb1.x + rectangle_right.x            
        }

    }

    BottomBarButton{
        id: b2
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        anchors.left: barRightb1.right
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/historyButton.svg"
        anchors.topMargin: 1
        onClicked: {
            positionSign.x = b2.x + rectangle_right.x
            positionSign2.x = b2.x + rectangle_right.x
//            positionSign2.visible = false
        }
    }

    BottomBarButton{
        id: b3
        //visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        //enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        enabled: bottom_bar.userPosition === "" ? false : true
        anchors.left: b2.right
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/workerAttendance.svg"
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/workerAttendancePage.qml"))
            t_info.text = "Phân Công Máy Dệt"
            positionSign.x = b3.x + rectangle_right.x
            positionSign2.x = b3.x + rectangle_right.x
//            positionSign2.visible = false
        }
    }

    BottomBarButton{
        id: b4
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        anchors.left: b3.right
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/defectButton.svg"
        anchors.topMargin: 1
        onClicked: {
            //stackView_contenPage.replace(Qt.resolvedUrl("../pages/workerDetectedErrorPage.qml"))
//            stackView_contenPage.replace(Qt.resolvedUrl("../pages/defectProduct-BadCleaningPage"))
//            t_info.text = "Xác nhận giao ca phát hiện lỗi"
//            positionSign.x = b4.x + rectangle_right.x
//            positionSign2.x = b4.x + rectangle_right.x
//            positionSign2.visible = false

            stackView_contenPage.replace(Qt.resolvedUrl("../pages/defectProduct-BadCleaningPage.qml"))
            t_info.text = "Thống kê hư hàng - không vệ sinh máy"
            positionSign.x = b4.x + rectangle_right.x
            positionSign2.x = b4.x + rectangle_right.x
            stackView_bar_left.replace(Qt.resolvedUrl("barLeft3.qml"))
            stackView_bar_left.barNumber = "L3"
        }
    }

    BottomBarButton{
        id: b5
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        anchors.left: b4.right
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/addWkrButton.svg"
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/addUserPage.qml"))
            t_info.text = "Thêm Nhân Sự"
            positionSign.x = b5.x + rectangle_right.x - 5
            positionSign2.x = b5.x + rectangle_right.x - 5
            stackView_bar_left.replace(Qt.resolvedUrl("barLeft2.qml"))
            stackView_bar_left.barNumber = "L2"
        }
    }

    SoundEffect {
        id: se_beep
        source: "../../soundEffects/beep.wav"
    }

    Connections{
        target: topBarBottomModelBridge

        function onWorkerCheckAttendanceWithBeepSound(workerData_, mchList_){
            if(!se_beep.playing){
                se_beep.play()
            }
            b3.clicked()
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:65;width:902}
}
##^##*/
