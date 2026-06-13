import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    id: item1

    Rectangle{
        height: parent.height
        //width: parent.width + 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 47
        anchors.left: parent.left
        anchors.leftMargin: 716 //537
        border.width: 2
        radius: parent.width/2
        color: "#35f5dd42" //"transparent"
        border.color: "#f5dd42" //"yellow"
    }

//    BottomBarButton{
//        id: b1
//        visible: false
//        anchors.right: b2.left
//        anchors.top: parent.top
//        btnIconSource: "../../images/svg_images/mchIPButton.svg"
//        anchors.rightMargin: 55
//        anchors.topMargin: 1
//        onClicked: {
//            positionSign.x = b1.x
//            positionSign2.x = b1.x
//            positionSign2.visible = false
//        }

//    }

//    BottomBarButton{
//        id: b2
//        visible: false
//        anchors.right: b3.left
//        anchors.top: parent.top
//        btnIconSource: "../../images/svg_images/watchButton.svg"
//        anchors.rightMargin: 55
//        anchors.topMargin: 1
//        onClicked: {
//            positionSign.x = b2.x
//            positionSign2.x = b2.x
//            positionSign2.visible = false
//        }
//    }

//    BottomBarButton{
//        id: b3
//        visible: false
//        anchors.right: b4_fabric_type.left
//        anchors.top: parent.top
//        btnIconSource: "../../images/svg_images/needleButton.svg"
//        anchors.rightMargin: 55
//        anchors.topMargin: 1
//        onClicked: {
//            positionSign.x = b3.x
//            positionSign2.x = b3.x
//            positionSign2.visible = false
//        }
//    }

//    BottomBarButton{
//        id: b4_fabric_type
//        visible: false
//        anchors.right: b5.left
//        anchors.top: parent.top
//        btnIconSource: "../../images/svg_images/NA.svg"
//        anchors.rightMargin: 55
//        anchors.topMargin: 1
//        onClicked: {
//            positionSign.x = b4_fabric_type.x
//            positionSign2.x = positionSign.x
//            positionSign2.visible = false
//        }
//    }

    BottomBarButton{
        id: b5
        x: 772
        anchors.right: parent.right
        anchors.top: parent.top
        btnIconSource: "../../images/svg_images/editUserButton.svg"
        anchors.rightMargin: 55
        anchors.topMargin: 1
        onClicked: {
            stackView_contenPage.replace(Qt.resolvedUrl("../pages/editUserPage.qml"))
            t_info.text = "Sửa Chữa Thông Tin Nhân Sự"
            positionSign.x = b5.x
//            positionSign2.x = b5.x
//            positionSign.x = b1_bar3.x + rectangle_right.x
            positionSign2.visible = true
//            if(stackView_bar_right.barNumber !== 3){
////                stackView_bar_right.replace(Qt.resolvedUrl("barRight2.qml"))
////                stackView_bar_right.barNumber = 3
//                positionSign2.visible = false
//            }
        }
    }

//    Connections{
//        target: bar1_connection
//    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:65;width:902}
}
##^##*/
