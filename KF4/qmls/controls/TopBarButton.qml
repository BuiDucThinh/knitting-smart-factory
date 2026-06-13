import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnTBButton
    //CUSTOM PROPERTIES
    property  url btnIconSource: "../../images/svg_images/settings_icon.svg"
    property color btnColorDefault: "#000000"
    property color btnColorMouseOver: "#222222"
    property color btnColorClicked: "#222222"
    property int iconWidth: 18
    property int iconHeight: 18

    QtObject{
        id: internal

        //MOUSE OVER AND CLICK CHANGE COLOR
        property  var dynamicColor: if(btnTBButton.down){
                                        btnTBButton.down ? btnColorClicked : btnColorDefault
                                    } else {
                                        btnTBButton.pressAndHold() ? btnColorMouseOver : btnColorDefault
                                    }
    }

    implicitHeight: 32
    implicitWidth: 32

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        //border.color: "#910d0d0d"

        Image {
            id: iconBtn
            source: btnIconSource            
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            height: iconHeight
            width: iconWidth
            visible: false
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            antialiasing: true
            height: iconHeight
            width: iconWidth
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:16}
}
##^##*/
