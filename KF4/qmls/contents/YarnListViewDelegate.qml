import QtQuick 2.2

Rectangle {
    id: delegate

    property bool selected: ListView.isCurrentItem
    property real itemSize
    width: itemSize
    height: 26
    color: "#00000000"
    border.color: "#00000000"

    Rectangle {
        id: rectangle
        width: 37
        height: 26
        color: "#ffffff"
        radius: 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Text {
            id: label
            x: 32
            y: 28
            text: num
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
            font.bold: false
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangle2
        width: 203
        height: 26
        color: "#ffffff"
        radius: 2
        anchors.left: rectangle.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label1
            y: 28
            text: code
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            anchors.leftMargin: 5
            font.pointSize: 12
            font.bold: false
        }
    }

    Rectangle {
        id: rectangle3
        width: 118
        height: 26
        color: "#ffffff"
        radius: 2
        anchors.left: rectangle2.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label2
            y: 28
            text: yarntype
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            anchors.leftMargin: 5
            font.pointSize: 12
            font.bold: false
        }
    }

    Rectangle {
        id: rectangle4
        width: 124
        height: 26
        color: "#ffffff"
        radius: 2
        anchors.left: rectangle3.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label3
            y: 28
            text: producer
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            anchors.leftMargin: 5
            font.pointSize: 12
            font.bold: false
        }
    }

    Rectangle {
        id: rectangle5
        width: 112
        height: 26
        color: "#ffffff"
        radius: 2
        anchors.left: rectangle4.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: label4
            y: 28
            text: lot
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            anchors.leftMargin: 5
            font.pointSize: 12
            font.bold: false
        }
    }

//    Image {
//        anchors.centerIn: parent
//        source: image
//    }

//    Text {
//        id: titleText

//        anchors {
//            left: parent.left; leftMargin: 20
//            right: parent.right; rightMargin: 20
//            top: parent.top; topMargin: 20
//        }

//        font { pixelSize: 18; bold: true }
//        text: name
//        color: selected ? "#ffffff" : "#ebebdd"
//        scale: selected ? 1.15 : 1.0
//        Behavior on color { ColorAnimation { duration: 150 } }
//        Behavior on scale { PropertyAnimation { duration: 300 } }
//    }

//    BusyIndicator {
//        scale: 0.8
//        //visible: delegate.ListView.isCurrentItem && window.loading
//        visible: delegate.ListView.isCurrentItem
//        anchors.centerIn: parent
//    }

    MouseArea {
        anchors.fill: delegate
        onClicked: {
            delegate.ListView.view.currentIndex = index
            if (window.currentFeed == feed)
                feedModel.reload()
            else
                window.currentFeed = feed
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:4}D{i:6}D{i:8}D{i:10}
}
##^##*/
