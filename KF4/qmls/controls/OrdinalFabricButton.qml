import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: odnFButton
    //CUSTOM PROPERTIES
    property  url btnIconSource: "../../images/svg_images/ordinalFabricBackground.svg"
    property color btnColorDefault: "#ff0000"
    property color btnColorMouseOver: "#00ff00"
    property color btnColorClicked: "#222222"
    property int iconWidth: 19
    property int iconHeight: 19
    visible: true
    implicitHeight: 19
    implicitWidth: 19

    QtObject{
        id: internal

        //MOUSE OVER AND CLICK CHANGE COLOR
        property  var dynamicColor: if(odnFButton.down){
                                        odnFButton.down ? btnColorClicked : btnColorDefault
                                    } else {
                                        odnFButton.pressAndHold() ? btnColorMouseOver : btnColorDefault
                                    }
    }

//    Image {
//        id: iconBtn
//        source: btnIconSource
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter
//        sourceSize.width: iconWidth
//        sourceSize.height: iconHeight
//        height: iconHeight
//        width: iconWidth
//        visible: true
//        fillMode: Image.PreserveAspectFit
//        antialiasing: true
//    }

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: 14
        border.width: 0
        height: iconHeight
        width: iconWidth
    }
}





/*##^##
Designer {
    D{i:0;formeditorZoom:10}
}
##^##*/
