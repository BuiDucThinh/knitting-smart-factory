import QtQuick 2.2

Rectangle {
    id: delegate
    property color  color_                      :   "#FFFFFF"
    property bool selected: ListView.isCurrentItem
    property real rowWidth
    property real rowHeigh
    property real ordRectWidth: 40
    property real rectWidth1: 120
    property real rectWidth2: 210
    property real rectWidth3: 160
    property real rectWidth4: 210
    property real rectWidth5: 150
    property real rectWidth6: 230
    property real rectWidth7: 230
    width: rowWidth
    height: rowHeigh
    border.color: "#00000000"
    radius: 1
    color: "#00000000"

    Rectangle {
        id: rectangleOrd
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
//            anchors.left: parent.left

            horizontalAlignment: Text.AlignHCenter            
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            anchors.leftMargin: 8
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle1
        width: rectWidth1
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangleOrd.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_1
            text: text1_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle2
        width: rectWidth2
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle1.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_2
            text: text2_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle3
        width: rectWidth3
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle2.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_3
            text: text3_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle4
        width: rectWidth4
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle3.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_4
            text: text4_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle5
        width: rectWidth5
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle4.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_5
            text: text5_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle6
        width: rectWidth6
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle5.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_6
            text: text6_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
            color: "black"
            font.pointSize: 13
        }
    }

    Rectangle {
        id: rectangle7
        width: rectWidth7
        height: rowHeigh
        color: color_
        radius: 2
        anchors.left: rectangle6.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: lb_7
            text: text7_
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            font.family: "Ubuntu"
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
