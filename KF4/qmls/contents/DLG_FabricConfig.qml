import QtQuick 2.2

Rectangle {
    id: delegate
    property color  bg_color_
    property color  text_color_
    property bool selected: ListView.isCurrentItem
    property real rowWidth
    property real rowHeigh
    property real ordRectWidth: 40
    width: rowWidth
    height: rowHeigh
    border.color: "#00000000"
    radius: 1
    color: "#00000000"

    Rectangle {
        id: rectangle1
        width: ordRectWidth
        height: rowHeigh
        color: bg_color_
        radius: 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Text {
            id: lb_num
            color: text_color_
            text: index + 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            minimumPointSize: 10
            font.family: "JetBrains Mono" //"Roboto Mono" //"Space Mono" //"Roboto" //"Ubuntu Mono"
            font.weight: Font.Normal
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 10
            //anchors.leftMargin: 8
            font.pointSize: 10
            font.bold: false
        }
    }

    Rectangle {
        id: rectangle2
        width: rowWidth - rectangle1.width - 3
        height: rowHeigh
        color: bg_color_
        radius: 2
        anchors.left: rectangle1.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label
            color: text_color_
            text: data1
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            minimumPointSize: 11
            font.family: "JetBrains Mono" //"Xanh Mono" //"Roboto Mono" //"Space Mono" //"Roboto" //"Ubuntu Mono"
            font.pointSize: 11
            font.weight: Font.Normal
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 11
            anchors.leftMargin: 8            
            font.bold: false
        }
    }

    QtObject{
        id: internal

        property bool colorDynamic: if(selected){
                                    bg_color_ = "#b3e7ff"
                                    text_color_ = "black"

                              }else{
                                    bg_color_ = "#a5d4a5" //"#9eff9e" //"300a24" "#ffffff"
                                    text_color_ = "black"
                              }
    }

    MouseArea {
        anchors.fill: delegate
        onClicked: {
            delegate.ListView.view.currentIndex = index
            fabricPage.fabricPrintCodeOfCurrentRowOfLV_fabricConfig = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).data2
            //console.log(index)
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:8}
}
##^##*/
