import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4


Rectangle {
    id: workerAttendaceRect
    property int    machineNumber               :   1
    property string userImageUrl                :   "../../userImages/noUser.svg"

    function setMachineNumber(mchNum_){
        machineNumber = mchNum_
    }

    function setUserImage(userImageUrl_){
        userImageUrl = userImageUrl_
    }

    function resetUserImage(userImageUrl_){
        userImageUrl = "../../userImages/noUser.svg"
    }
    color: "#8d222222"
    radius: 2
    border.width: 1
    border.color: "#d7d6d6"

    //------------------------------------------------------------------------------------------------------- MACHINE RUNNING'S PROPERTY

    Label {
        id: machine_number
        width: machine_number.advance.width
        height: 28
        color: "#d7d6d6"
        text: "M" + machineNumber.toString()
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 37
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 2
        anchors.topMargin: 0
        font.italic: false
        font.weight: Font.Black
        font.family: "Ubuntu Mono"
        font.bold: true
        renderType: Text.QtRendering
        textFormat: Text.AutoText
    }

    // worker face image
    Rectangle {
        id: rectangle
        color: "#00000000"
        x: 0
        y: 0
        width: 186
        height: 186
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }

        Image {
            id: worker_img
            width: 248
            height: 186
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.height: 248
            sourceSize.width: 186
            fillMode: Image.PreserveAspectFit
            source: userImageUrl
        }

        Rectangle {
            id: mask
            radius: 90
            width: rectangle.width
            height: rectangle.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
        }
    }

    Rectangle{
        id: rec_border
        width: 186
        height: 186
        color: "#00000000"
        radius: 100
        border.width: 1
        border.color: "#00B7FF"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Glow {
        color: "#16d0e5"
        anchors.fill: rec_border
        radius: 8
        samples: 17
        //"#d5f600ff"
        source: rec_border
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:220;width:220}
}
##^##*/
