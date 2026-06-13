import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4


Rectangle {

    property int machineNumber: 1
    property string customerName: ""
    property string customerName1: ""
    property string customerName2: ""
    property string fabricPrintCodeLine1: ""
    property string fabricPrintCodeLine2: ""
    property string roundPerRoll: ""
    property string mainYarn: ""
    property string extralYarn: ""
    property string spandex: ""
    property string extralYarn2: ""
    property string extralYarn3: ""

    property int    colorCodeNumber: 0

    property color  colorUser1                 :   "#9145B6"
    property color  colorUser2                 :   "#FFE400"
    property color  colorUser3                 :   "#06FF00"
    property color  colorUser4                 :   "#7CD1B8"
    property color  colorUser5                 :   "#C84B31"
    property color  colorUser6                 :   "#F2789F"
    property color  colorUser7                 :   "#FF8E00"
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

    signal printButtonClicked()

    id: mchAdjustRect
    color: "#8d222222"
    radius: 2
    border.width: 1
    border.color: internal.dynamicColor //"#d7d6d6"

    QtObject{
        id: internal
        property  var dynamicColor: if(colorCodeNumber === 0){
                                        colorNoUser
                                    }
                                    else if(colorCodeNumber === 1){
                                        colorUser1
                                    }
                                    else if(colorCodeNumber === 2){
                                        colorUser2
                                    }
                                    else if(colorCodeNumber === 3){
                                        colorUser3
                                    }
                                    else if(colorCodeNumber === 4){
                                        colorUser4
                                    }
                                    else if(colorCodeNumber === 5){
                                        colorUser5
                                    }
                                    else if(colorCodeNumber === 6){
                                        colorUser6
                                    }
                                    else if(colorCodeNumber === 7){
                                        colorUser7
                                    }
                                    else if(colorCodeNumber === 8){
                                        colorUser8
                                    }
                                    else if(colorCodeNumber === 9){
                                        colorUser9
                                    }
                                    else if(colorCodeNumber === 10){
                                        colorUser10
                                    }
                                    else if(colorCodeNumber === 11){
                                        colorUser11
                                    }
                                    else if(colorCodeNumber === 12){
                                        colorUser12
                                    }
                                    else if(colorCodeNumber === 13){
                                        colorUser13
                                    }
                                    else if(colorCodeNumber === 14){
                                        colorUser14
                                    }
                                    else if(colorCodeNumber === 15){
                                        colorUser15
                                    }
                                    else if(colorCodeNumber === 16){
                                        colorUser16
                                    }
                                    else if(colorCodeNumber === 17){
                                        colorUser17
                                    }
                                    else if(colorCodeNumber === 18){
                                        colorUser18
                                    }

                                    else if(colorCodeNumber === 19){
                                        colorUser19
                                    }
                                    else if(colorCodeNumber === 20){
                                        colorUser20
                                    }
                                    else if(colorCodeNumber === 21){
                                        colorUser21
                                    }

    }

    function fillCustomerNameAndFabricPrintCode(dataList){
//        dataList[0]: customerName
//        dataList[1]: fabricPrintCode
        if(dataList[0] !== "CÔNG TY"){
            customerName = dataList[0] + " " + dataList[1]
        }
        else{
            customerName = "C.T " + dataList[1]
        }


        let i = 0
        if (customerName.length > 18){
            if (customerName.length < 18){
                customerName1 = customerName
            }
            else{
                if (customerName.charAt(17) === ' '){
                    customerName1 = customerName.substring(0, 18)
                    customerName2 = customerName.substring(19,)
                }
                else{
                    for (i = 16; i > 0; i--) {
                      if (customerName.charAt(i) === ' '){break}
                    }
                    customerName1 = customerName.substring(0, i)
                    customerName2 = customerName.substring(i+1,)
                }
            }
        }

        i = 0
        if (dataList[2].length < 18){
            fabricPrintCodeLine1 = dataList[2]
        }
        else{
            if (dataList[2].charAt(17) === ' '){
                fabricPrintCodeLine1 = dataList[2].substring(0, 18)
                fabricPrintCodeLine2 = dataList[2].substring(19,)
            }
            else{
                for (i = 16; i > 0; i--) {
                  if (dataList[2].charAt(i) === ' '){break}
                }
                fabricPrintCodeLine1 = dataList[2].substring(0, i)
                fabricPrintCodeLine2 = dataList[2].substring(i+1,)
            }
        }


        roundPerRoll = dataList[3]
        colorCodeNumber = parseInt(dataList[4])
        mainYarn = dataList[5]
        extralYarn = dataList[6]
        spandex = dataList[7]
        extralYarn2 = dataList[8]
        extralYarn3 = dataList[9]
    }

    //------------------------------------------------------------------------------------------------------- MACHINE RUNNING'S PROPERTY
    Label {
        id: machine_number
        width: machine_number.advance.width
        height: 28
        color: "#ff0000"
        text: "M" + machineNumber.toString()
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 37
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 4
        anchors.topMargin: 3
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
        id: bt_print
        width: 80
        height: 97
        text: ""
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.rightMargin: 5
        display: AbstractButton.TextBesideIcon
        background: Rectangle{
            id: rectangle
            width: parent.width
            height: parent.height
            radius: 2
            border.width: 0
            color: "#ffffff"
            Image {
                width: 60
                height: 60
                anchors.verticalCenter: parent.verticalCenter
                source: "../../images/svg_images/printer.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 0
                sourceSize.height: 60
                sourceSize.width: 60
                fillMode: Image.Tile
            }
        }
        onClicked: {
            se_btnClicked.play()
            mchAdjustRect.printButtonClicked()
        }
    }

    Label {
        id: lb_fabricPrintCodeLine1
        x: 8
        color: "#ffffff"
        text: fabricPrintCodeLine1
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pointSize: 16
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 56
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: lb_fabricPrintCodeLine2
        x: 78
        color: "#ffffff"
        text: fabricPrintCodeLine2
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        font.bold: true
        font.pointSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 83
    }



    Label {
        id: lb_roundPerRoll
        x: 3
        color: "#ffffff"
        text: roundPerRoll
        anchors.top: parent.top
        horizontalAlignment: Text.AlignRight
        anchors.horizontalCenter: machine_number.horizontalCenter
        font.bold: true
        anchors.topMargin: 31
        anchors.horizontalCenterOffset: 0
    }

    Rectangle {
        id: rectangle1
        x: 0
        width: 218
        height: 1
        color: "#8c8c8c"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 114
    }

    Rectangle {
        id: rectangle2
        x: 0
        width: 218
        height: 1
        color: "#8c8c8c"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 49
    }



    Rectangle {
        id: rectangle3
        x: 0
        width: 1
        height: 105
        color: "#8c8c8c"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 89
        anchors.topMargin: 114
    }

    Rectangle {
        id: rectangle4
        height: 1
        color: "#8c8c8c"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 90
        anchors.leftMargin: 1
        anchors.bottomMargin: 21
    }

    Rectangle {
        id: rectangle5
        height: 1
        color: "#8c8c8c"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1
        anchors.rightMargin: 90
        anchors.bottomMargin: 42
    }

    Rectangle {
        id: rectangle6
        height: 1
        color: "#8c8c8c"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1
        anchors.rightMargin: 90
        anchors.bottomMargin: 63
    }

    Rectangle {
        id: rectangle7
        height: 1
        color: "#8c8c8c"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1
        anchors.rightMargin: 90
        anchors.bottomMargin: 84
    }

    Label {
        id: lb_mainYarn
        width: 61
        height: 23
        color: "#ffffff"
        text: mainYarn
        anchors.left: parent.left
        anchors.top: rectangle1.bottom
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu Mono"
        anchors.leftMargin: 4
        font.pointSize: 15
        font.bold: false
        anchors.topMargin: -2
    }

    Label {
        id: lb_extralYarn1
        width: 61
        height: 23
        color: "#ffffff"
        text: extralYarn
        anchors.left: parent.left
        anchors.top: rectangle7.bottom
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu Mono"
        anchors.leftMargin: 4
        font.pointSize: 15
        anchors.topMargin: -2
        font.bold: false
    }

    Label {
        id: lb_spandex
        width: 61
        height: 23
        color: "#ffffff"
        text: spandex
        anchors.left: parent.left
        anchors.top: rectangle6.bottom
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu Mono"
        anchors.leftMargin: 4
        font.pointSize: 15
        font.bold: false
        anchors.topMargin: -2
    }

    Label {
        id: lb_extralYarn2
        width: 61
        height: 23
        color: "#ffffff"
        text: extralYarn2
        anchors.left: parent.left
        anchors.top: rectangle5.bottom
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu Mono"
        anchors.leftMargin: 4
        font.pointSize: 15
        anchors.topMargin: -2
        font.bold: false
    }

    Label {
        id: lb_extralYarn3
        width: 61
        height: 23
        color: "#ffffff"
        text: extralYarn3
        anchors.left: parent.left
        anchors.top: rectangle4.bottom
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu Mono"
        anchors.leftMargin: 4
        font.pointSize: 15
        font.bold: false
        anchors.topMargin: -2
    }

    Rectangle {
        id: rectangle8
        height: 44
        color: internal.dynamicColor
        radius: 2
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 62
        anchors.rightMargin: 3
        anchors.topMargin: 3
    }

    Label {
        id: lb_customerName
        visible: customerName1 === "" ? true : false
        x: 89
        width: 123
        height: 18
        color: "#000000"
        text: customerName
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: rectangle8.horizontalCenter
        font.pointSize: 13
        font.bold: true
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 16
    }

    Label {
        id: lb_customerName1
        x: 89
        width: 123
        height: 18
        color: "#000000"
        text: customerName1
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: rectangle8.horizontalCenter
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 4
        font.bold: true
        font.pointSize: 13
    }

    Label {
        id: lb_customerName2
        x: 89
        width: 123
        height: 18
        color: "#000000"
        text: customerName2
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: rectangle8.horizontalCenter
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 25
        font.bold: true
        font.pointSize: 13
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:220;width:220}
}
##^##*/
