import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4

Button {
    id: btnBBButton
    //CUSTOM PROPERTIES
    property  url btnIconSource: "../../images/svg_images/homeButton.svg"
    property int iconWidth: 124 //120
    property int iconHeight: 62 //60
    implicitHeight: 62 //60
    implicitWidth: 124 //120
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
            //anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            visible: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectFit
            antialiasing: true

        }
    }
    onClicked: {
        se_btnClicked.play()
    }
    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:8}
}
##^##*/
