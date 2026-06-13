import QtQuick 2.2

Rectangle {
    id: delegate
    property color  color_                      :   "#FFFFFF"
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
        color: color_
        radius: 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Text {
            id: lb_num
            text: index + 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter            
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            anchors.leftMargin: 8
            font.family: "Roboto" //"Ubuntu Mono"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle2
        width: 150
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle1.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label
            text: subject_
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter            
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            anchors.leftMargin: 8
            font.family: "Roboto" //"Ubuntu Mono"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle3
        width: 498
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle2.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_3
            text: name_
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            anchors.leftMargin: 6
            font.family: "Roboto" //"Ubuntu Mono"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle4
        width: 257
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle3.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_4
            text: abbreviation_
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            anchors.leftMargin: 6
            font.family: "Roboto" //"Ubuntu Mono"
            color: "black"
            font.pointSize: 13
        }
    }



    QtObject{
        id: internal

        property bool colorDynamic: if(selected){
                                  color_ = "#b3e7ff"

                              }else{
                                  color_ = "#a5d4a5"
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
