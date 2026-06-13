import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    id: item1    

    BottomBarButton{
        id: b1
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        anchors.right: b2.left
        anchors.top: parent.top
        btnIconSource: "../../images/svg_images/mchTechnicianAdjust.svg"
        anchors.rightMargin: 55
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/setMchStatusPage.qml"))
            t_info.text = 'Khai Báo: Trạng Thái Sản Xuất.'
            positionSign.x = b1.x
            positionSign2.x = b1.x
            positionSign2.visible = false

            if(stackView_bar_left.barNumber !== "L1"){
                stackView_bar_left.replace(Qt.resolvedUrl("barLeft1.qml"))
                stackView_bar_left.barNumber = "L1"
            }
            if(stackView_bar_right.barNumber !== "R1"){
                stackView_bar_right.replace(Qt.resolvedUrl("barRight1.qml"))
                stackView_bar_right.barNumber = "R1"
            }
        }

    }

    BottomBarButton{
        id: b2                
        enabled: (bottom_bar.userPosition === "") ? false : true
        anchors.right: b3.left
        anchors.top: parent.top
        btnIconSource: "../../images/svg_images/watchButton.svg"
        anchors.rightMargin: 55
        anchors.topMargin: 1
        onClicked: {
            if(bottom_bar.userPosition === "NGHỆ NHÂN DỆT"){
                stackView_contenPage.replace(Qt.resolvedUrl("../pages/watchAsignFromWorkerPage.qml"))
            }
            else{
                stackView_contenPage.replace(Qt.resolvedUrl("../pages/watchAsignFromManagerPage.qml"))
            }
            t_info.text = 'Khai Báo: Đồng Hồ Dừng Máy.'
            positionSign.x = b2.x
            positionSign2.x = b2.x
            positionSign2.visible = false

            if(stackView_bar_left.barNumber !== "L1"){
                stackView_bar_left.replace(Qt.resolvedUrl("barLeft1.qml"))
                stackView_bar_left.barNumber = "L1"
            }
            if(stackView_bar_right.barNumber !== "R1"){
                stackView_bar_right.replace(Qt.resolvedUrl("barRight1.qml"))
                stackView_bar_right.barNumber = "R1"
            }
        }
    }

    BottomBarButton{
        id: b3
        anchors.right: b4_fabric_type.left
        enabled: (bottom_bar.userPosition === "") ? false : true
        anchors.top: parent.top
        btnIconSource: "../../images/svg_images/needleButton.svg"
        anchors.rightMargin: 55
        anchors.topMargin: 1
        onClicked: {
            positionSign.x = b3.x
            positionSign2.x = b3.x
            positionSign2.visible = false
        }
    }

    BottomBarButton{
        id: b4_fabric_type
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        anchors.right: b5.left
        anchors.top: parent.top
        btnIconSource: "../../images/svg_images/printButton.svg"
        anchors.rightMargin: 55
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/printFabricPrintCodePage.qml"))
            t_info.text = 'In Bảng "Hướng Dẫn Ghi Đầu Cây"'
            positionSign.x = b4_fabric_type.x
            positionSign2.x = positionSign.x
            positionSign2.visible = false
        }
    }

    BottomBarButton{
        id: b5
        visible: bottom_bar.userPosition === "NGHỆ NHÂN DỆT" ? false : true
        enabled: (bottom_bar.userPosition === "" || bottom_bar.userPosition === "NGHỆ NHÂN DỆT") ? false : true
        x: 772
        anchors.right: parent.right
        anchors.top: parent.top
        btnIconSource: "../../images/svg_images/fabricConfigMachineButton.svg"
        anchors.rightMargin: 55
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricMachinePage.qml"))
            t_info.text = 'Khai Báo: Trạng Thái Sản Xuất Của Máy'
            positionSign.x = b5.x
            positionSign2.x = b5.x
            if(stackView_bar_right.barNumber !== "R2"){
                stackView_bar_right.replace(Qt.resolvedUrl("barRight2.qml"))
                stackView_bar_right.barNumber = "R2"
                positionSign2.visible = false
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:65;width:902}
}
##^##*/
