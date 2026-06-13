import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4


Rectangle {
    property int machineNumber: 1
    property string runStatus: "NORMAL" // NORMAL OR ADJUST
    property bool smallYarnRollConditions: false // small: true; big: false
    property bool weakYarnConditions: false // weak: true; strong: false
    signal statusMchChanged()

    function setRunStatus(strValue){
        mchAdjustRect.runStatus = strValue
        if(strValue === "NORMAL"){
            bt_normalMode.status = "ON"
            bt_adjustMode.status = "OFF"
        }
        else{
            bt_normalMode.status = "OFF"
            bt_adjustMode.status = "ON"
        }
    }

    function setKnitSmallYarnRollStatus(intValue){
        if(intValue === 1){
            bt_knitSmallYarnRoll.status = "ON"
            mchAdjustRect.smallYarnRollConditions = true
        }
        else{
            bt_knitSmallYarnRoll.status = "OFF"
            mchAdjustRect.smallYarnRollConditions = false
        }
    }

    function setKnitWeakYarnStatus(intValue){
        if(intValue === 1){
            bt_knitWeakYarn.status = "ON"
            mchAdjustRect.weakYarnConditions = true
        }
        else{
            bt_knitWeakYarn.status = "OFF"
            mchAdjustRect.weakYarnConditions = false
        }
    }

    id: mchAdjustRect
    color: "#8d222222"
    radius: 2
    border.width: 1
    border.color: "#d7d6d6"

    Component.onCompleted: {

    }
    QtObject{
        id: internal
    }

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


    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    RoundButton {
        property string status: "ON"
        id: bt_normalMode
        width: 68
        height: 68
        text: bt_normalMode.status
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 29
        anchors.topMargin: 52
        display: AbstractButton.TextBesideIcon
        background: Rectangle{
            width: parent.width
            height: parent.height
            radius: parent.width/2
            color: parent.status === "ON" ? "#00ff00" : "#F7F7FA"
        }
        onClicked: {
            se_btnClicked.play()
            if (bt_normalMode.status === "OFF"){
                bt_normalMode.status = "ON"                                

                bt_adjustMode.status = "OFF"
                bt_knitSmallYarnRoll.status = "OFF"
                bt_knitWeakYarn.status = "OFF"

                mchAdjustRect.runStatus = "NORMAL"
                mchAdjustRect.smallYarnRollConditions = false
                mchAdjustRect.weakYarnConditions = false

                mchAdjustRect.statusMchChanged()
            }
        }
    }

    RoundButton {
        id: bt_adjustMode
        x: 135
        width: 68
        height: 68
        text: bt_adjustMode.status
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 29
        anchors.topMargin: 52
        property string status: "OFF"
        background: Rectangle{
            width: parent.width
            height: parent.height
            radius: parent.width/2
            color: parent.status === "ON" ? "#FFE400" : "#F7F7FA"
        }
        onClicked: {
            se_btnClicked.play()
            if (bt_adjustMode.status === "OFF"){
                bt_adjustMode.status = "ON"                                

                bt_normalMode.status = "OFF"
                bt_knitSmallYarnRoll.status = "OFF"
                bt_knitWeakYarn.status = "OFF"

                mchAdjustRect.runStatus = "ADJUST"
                mchAdjustRect.smallYarnRollConditions = false
                mchAdjustRect.weakYarnConditions = false

                mchAdjustRect.statusMchChanged()
            }
        }
    }

    RoundButton {
        id: bt_knitSmallYarnRoll
        width: 68
        height: 68
        text: bt_knitSmallYarnRoll.status
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 29
        anchors.topMargin: 146
        property string status: "OFF"
        background: Rectangle{
            width: parent.width
            height: parent.height
            radius: parent.width/2
            color: parent.status === "ON" ? "#D47AE8" : "#F7F7FA"
        }
        onClicked: {
            se_btnClicked.play()
            if (bt_knitSmallYarnRoll.status === "OFF"){                
                bt_knitSmallYarnRoll.status = "ON"                                
                bt_normalMode.status = "ON"
                bt_adjustMode.status = "OFF"

                mchAdjustRect.runStatus = "NORMAL"
                mchAdjustRect.smallYarnRollConditions = true

                mchAdjustRect.statusMchChanged()
            }
            else if(bt_knitSmallYarnRoll.status === "ON"){
                bt_knitSmallYarnRoll.status = "OFF"

                mchAdjustRect.smallYarnRollConditions = false

                mchAdjustRect.statusMchChanged()
            }
        }
    }

    RoundButton {
        id: bt_knitWeakYarn
        x: 121
        width: 68
        height: 68
        text: bt_knitWeakYarn.status
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 29
        anchors.topMargin: 146
        property string status: "OFF"
        background: Rectangle{
            width: parent.width
            height: parent.height
            radius: parent.width/2
            color: parent.status === "ON" ? "#F2789F" : "#F7F7FA"
        }

        onClicked: {
            se_btnClicked.play()
            if (bt_knitWeakYarn.status === "OFF"){                
                bt_knitWeakYarn.status = "ON"
                bt_normalMode.status = "ON"
                bt_adjustMode.status = "OFF"

                mchAdjustRect.runStatus = "NORMAL"
                mchAdjustRect.weakYarnConditions = true

                mchAdjustRect.statusMchChanged()
            }
            else if(bt_knitWeakYarn.status === "ON"){

                bt_knitWeakYarn.status = "OFF"

                mchAdjustRect.weakYarnConditions = false

                mchAdjustRect.statusMchChanged()
            }
        }
    }

    Label {
        id: label
        x: 8
        color: "#ffffff"
        text: qsTr("Thợ Chạy")
        anchors.top: parent.top
        anchors.topMargin: 32
        anchors.horizontalCenter: bt_normalMode.horizontalCenter
    }

    Label {
        id: label1
        x: 131
        color: "#ffffff"
        text: qsTr("Chỉnh Máy")
        anchors.top: parent.top
        anchors.horizontalCenter: bt_adjustMode.horizontalCenter
        anchors.topMargin: 32
    }

    Label {
        id: label2
        x: 39
        color: "#ffffff"
        text: qsTr("Châm Tàn")
        anchors.top: parent.top
        anchors.horizontalCenter: bt_knitSmallYarnRoll.horizontalCenter
        anchors.topMargin: 127
    }

    Label {
        id: label3
        x: 119
        color: "#ffffff"
        text: qsTr("Sợi Dễ Đứt")
        anchors.top: parent.top
        anchors.horizontalCenter: bt_knitWeakYarn.horizontalCenter
        anchors.topMargin: 127
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:220;width:220}
}
##^##*/
