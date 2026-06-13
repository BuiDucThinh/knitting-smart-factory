import QtQuick 2.0

Item {
    id: item1
    Rectangle{
        anchors.fill: parent
        radius: parent.width/2
        color: "#f6ff00"
        Text {
            color: "#e60505"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            id: name
            text: qsTr("Quản lý Lô Sợi")
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:65;width:902}
}
##^##*/
