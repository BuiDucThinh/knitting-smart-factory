import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: customButton
    //CUSTOM PROPERTIES
    property  url btnIconSource: "../../images/svg_images/homeButton.svg"
    property real buttonWidth
    property real buttonHeight
    implicitWidth: buttonWidth
    implicitHeight: buttonHeight
    background: Rectangle{
        id: bgBtn
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent" //"#000000"
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.width: buttonWidth
            sourceSize.height: buttonHeight
            visible: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectFit
            antialiasing: true

        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:8}
}
##^##*/
