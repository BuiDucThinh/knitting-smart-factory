import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4


Rectangle {
    property int    machineNumber               :   1
    property int    userIdFromDTB               :   2
    property int    userIdChoosedFromUI               :   1
    property color  colorNoUser                 :   "#00B7FF"

    property color  colorUser1                 :   "#FF8E00"
    property color  colorUser2                 :   "#FFE400"
    property color  colorUser3                 :   "#06FF00"
    property color  colorUser4                 :   "#7CD1B8"
    property color  colorUser5                 :   "#C84B31"
    property color  colorUser6                 :   "#F2789F"
    property color  colorUser7                 :   "#9145B6"
    property color  colorUser8                 :   "#FF5677"
    property color  colorUser9                 :   "#84DFFF"
    property color  colorUser10                :   "#519259"
    property color  colorUser11                :   "#FBFFE2"
    property color  colorUser12                :   "#EC255A"
    property color  colorUser13                :   "#D47AE8"
    property color  colorUser14                :   "#FDFF8F"
    property color  colorUser15                :   "#FF7800"
    property color  colorUser16                :   "#EBE645"
    property color  colorUser17                :   "#71DFE7"
    property color  colorUser18                :   "#9AE66E"
    property color  colorUser19                :   "#AA14F0"
    property color  colorUser20                :   "#49FF00"
    property color  colorUser21                :   "#E1578A"
    property color  colorUser22                :   "#FF0075"
    property color  colorUser23                :   "#A03C78"
    property color  colorUser24                :   "#78DEC7"
    property color  colorUser25                :   "#F55C47"

    property color  colorJustNearChanged        :   "#FF0000"
    property color  colorNormal                 :   "#00FF00"
    property ListModel listWorker : ListModel{
                                       ListElement {
                                           userId_: "0"
                                           imageSource_: "../../userImages/noUser.svg"
                                           name_: "Chua Co Ai"
                                       }
                                   }

    function setUser(userID){
//        print("machineNumber", machineNumber)
//        print("user from DTB", userID)
        comboBox.currentIndex = 0
        userIdFromDTB = userID
        for(let i = 0; i < listWorker.count; i++){            
//            print("listWorker.get(i).userId_", listWorker.get(i).userId_)
//            print("userID", userID)
            if(listWorker.get(i).userId_ === userID.toString()){
                comboBox.currentIndex = i
//                print("set current index", i)
                break
            }
        }        
    }
    signal wokerChoosedChanged()
    id: chooseWorkerRect
    color: "#8d222222"
    radius: 2
    border.width: 1
    border.color: "#d7d6d6"

    Component.onCompleted: {
//        internal.dynamicColor = colorNoUser
    }
    QtObject{
        id: internal
        property  var dynamicColor: if(comboBox.currentIndex === 0){
                                        colorNoUser
                                    }
                                    else if(comboBox.currentIndex === 1){
                                        colorUser1
                                    }
                                    else if(comboBox.currentIndex === 2){
                                        colorUser2
                                    }
                                    else if(comboBox.currentIndex === 3){
                                        colorUser3
                                    }
                                    else if(comboBox.currentIndex === 4){
                                        colorUser4
                                    }
                                    else if(comboBox.currentIndex === 5){
                                        colorUser5
                                    }
                                    else if(comboBox.currentIndex === 6){
                                        colorUser6
                                    }
                                    else if(comboBox.currentIndex === 7){
                                        colorUser7
                                    }
                                    else if(comboBox.currentIndex === 8){
                                        colorUser8
                                    }
                                    else if(comboBox.currentIndex === 9){
                                        colorUser9
                                    }
                                    else if(comboBox.currentIndex === 10){
                                        colorUser10
                                    }
                                    else if(comboBox.currentIndex === 11){
                                        colorUser11
                                    }
                                    else if(comboBox.currentIndex === 12){
                                        colorUser12
                                    }
                                    else if(comboBox.currentIndex === 13){
                                        colorUser13
                                    }
                                    else if(comboBox.currentIndex === 14){
                                        colorUser14
                                    }
                                    else if(comboBox.currentIndex === 15){
                                        colorUser15
                                    }
                                    else if(comboBox.currentIndex === 16){
                                        colorUser16
                                    }
                                    else if(comboBox.currentIndex === 17){
                                        colorUser17
                                    }
                                    else if(comboBox.currentIndex === 18){
                                        colorUser18
                                    }

                                    else if(comboBox.currentIndex === 19){
                                        colorUser19
                                    }
                                    else if(comboBox.currentIndex === 20){
                                        colorUser20
                                    }
                                    else if(comboBox.currentIndex === 21){
                                        colorUser21
                                    }

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
        id: se_mchStop
        source: "../../soundEffects/machine_stop_sound.wav"
    }

    SoundEffect {
        id: se_mchOnline
        source: "../../soundEffects/online.wav"
    }

    SoundEffect {
        id: se_mchOffline
        source: "../../soundEffects/offline.wav"
    }

    Rectangle{
        id: rec_border
        width: 186
        height: 186
        color: "#00000000"
        radius: 100
        border.width: 1
        border.color: comboBox.currentIndex === 0 ? "#00B7FF" : comboBox.model.get(comboBox.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5de00e6"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Glow {
        anchors.fill: rec_border
        radius: 8
        samples: 17
        color: comboBox.currentIndex === 0 ? "#00B7FF" : comboBox.model.get(comboBox.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
        source: rec_border
    }

    ComboBox {
        id: comboBox
        width: 180
        height: 180
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        transformOrigin: Item.Center
        textRole: "name_"
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }
        Rectangle {
            id: mask
            width: 180
            height: 180
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 90
            visible: false
        }
        background: Rectangle {
            width: 180
            height: 180
            color: "#00FF00"
            border.color: "red"
            radius: 2
        }

        model: listWorker
        delegate: ItemDelegate {
            id: itemDlgt2
            width: 180
            height: 180
            background: Rectangle {
                anchors.fill: parent
                color: "#222222"
            }
            contentItem: Item {
                id: cti_ItemDelegate2
                width: 180
                height: 180
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: mask2
                }
                Rectangle {
                    id: mask2
                    width: 180
                    height: 180
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: 110
                    visible: false
                }
                Image {
                    id: img_face
                    width: 240
                    height: 180
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: imageSource_
                    sourceSize.height: 180
                    sourceSize.width: 240
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    horizontalAlignment: Text.AlignHCenter
                    text: name_
                    color: "#00FF00"
                    elide: Text.ElideRight
                }
            }
        }
        onCurrentIndexChanged: {
            if(comboBox.model.count !== 0){
                userIdChoosedFromUI = parseInt(comboBox.model.get(comboBox.currentIndex).userId_)
                chooseWorkerRect.wokerChoosedChanged()
            }
        }
        contentItem: Rectangle{
            width: 180
            height: 180
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: img_faceContentItem
                width: 240
                height: 180
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.height: 180
                sourceSize.width: 240
                fillMode: Image.PreserveAspectFit
                source: comboBox.model.get(comboBox.currentIndex).imageSource_//"../../userImages/noUser.svg"
            }

            Rectangle{
                id: rec_textContainer
                width: tx_name.contentWidth + 10
                height: 20
                radius: 10
                color: comboBox.currentIndex === 0 ? "#00B7FF" : comboBox.model.get(comboBox.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red"//"#d5f600ff"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                Text {
                    id: tx_name
                    text: comboBox.displayText
                    color: "#333333"
                    verticalAlignment: Text.AlignVCenter
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Glow {
                anchors.fill: rec_textContainer
                radius: 8
                samples: 17
                color: comboBox.currentIndex === 0 ? "#00B7FF" : comboBox.model.get(comboBox.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
                source: rec_textContainer
                spread: 0.1
            }
        }
        indicator: Canvas {
            id:indicator2
            width: 0
            height: 10
        }
        Image {
            id: img_indicator
            width: 25
            height: 25
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 6
            source: "../../images/svg_images/cbbIndicator.svg"
            fillMode: Image.PreserveAspectFit
            visible: false
            ColorOverlay{
                //id: colorOL
                anchors.fill: img_indicator //slider
                source: img_indicator //slider
                anchors.verticalCenter: img_indicator.verticalCenter
                anchors.horizontalCenter: img_indicator.horizontalCenter
                color: comboBox.currentIndex === 0 ? "#00B7FF" : comboBox.model.get(comboBox.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red"
                antialiasing: true
            }
        }

        Glow {
            anchors.fill: img_indicator
            radius: 8
            samples: 17
            color: comboBox.currentIndex === 0 ? "#00B7FF" : comboBox.model.get(comboBox.currentIndex).userId_ === userIdFromDTB.toString() ? internal.dynamicColor : "red" //"#d5f600ff"
            source: img_indicator
            spread: 0.1
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:220;width:220}
}
##^##*/
