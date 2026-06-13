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
        id: rectangle
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
            font.family: "Ubuntu Mono"
            color: text_color_
            text: index + 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.pointSize: 13
            font.bold: false
        }
    }

    Rectangle {
        id: rectangle2
        width: rowWidth - ordRectWidth - 3
        height: rowHeigh
        color: bg_color_
        radius: 2
        anchors.left: rectangle.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: text_
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            anchors.leftMargin: 8            
        }
    }

    QtObject{
        id: internal

        property bool colorDynamic: if(selected){
                                        bg_color_ = "#b3e7ff"
                                        text_color_ = "black"

                                  }else{
                                        bg_color_ = "#a5d4a5" //"#300a24" //"#ffffff"
                                        text_color_ = "black"
                                  }
    }

    MouseArea {
        anchors.fill: delegate
        onClicked: {
            delegate.ListView.view.currentIndex = index
            //console.log(index)
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
