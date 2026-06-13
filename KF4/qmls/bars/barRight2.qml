import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    id: bar3
    Rectangle{
        height: parent.height
        //width: parent.width + 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 358 //537
        anchors.left: parent.left
        anchors.leftMargin: 47
        border.width: 2
        radius: parent.width/2
        color: "#35f5dd42" //"transparent"
        border.color: "#f5dd42" //"yellow"
    }

    BottomBarButton{
        id: b1_bar3
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/fabricConfigManageButton.svg"
        anchors.topMargin: -1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"))
            t_info.text = "Quản Lý - Truy Xuất: Thông Tin Sản Xuất Mộc"
            positionSign.x = b1_bar3.x + rectangle_right.x
            positionSign2.visible = true
        }

    }

    BottomBarButton{
        id: b2
        anchors.left: b1_bar3.right
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/YarnManage.svg"
        anchors.topMargin: -1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/yarnPage.qml"))
            t_info.text = "Quản Lý - Truy Xuất: Thông Tin Lô Sợi"
            positionSign.x = b2.x + rectangle_right.x
            positionSign2.visible = true
        }

    }

    BottomBarButton{
        id: b3
        anchors.left: b2.right
        anchors.top: parent.top
        anchors.leftMargin: 55
        btnIconSource: "../../images/svg_images/customerButton.svg"
        anchors.topMargin: -1
        onClicked: {
            positionSign.x = b3.x + rectangle_right.x
            positionSign2.visible = true
            t_info.text = "Thông Tin Khách Hàng"
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/customerPage.qml"))
        }

    }

//    BottomBarButton{
//        id: b4
//        anchors.left: b3.right
//        anchors.top: parent.top
//        anchors.leftMargin: 55
//        btnIconSource: "../../images/svg_images/defectButton.svg"
//        anchors.topMargin: -1
//        onClicked: {
//            positionSign.x = b4.x + rectangle_right.x

//        }

//    }

//    BottomBarButton{
//        id: b5
//        anchors.left: b4.right
//        anchors.top: parent.top
//        anchors.leftMargin: 55
//        btnIconSource: "../../images/svg_images/addWkrButton.svg"
//        anchors.topMargin: -1
//        onClicked: {
//            positionSign.x = b5.x + rectangle_right.x

//        }

//    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:65;width:902}
}
##^##*/
