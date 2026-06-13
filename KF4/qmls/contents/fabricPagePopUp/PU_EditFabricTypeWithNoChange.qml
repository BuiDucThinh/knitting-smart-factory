import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_editFabricTypeWithNoChange
//            x: rectangle.width/2 - pu_editFabricTypeWithNoChange.width/2
//            y: rectangle.height/2 - pu_editFabricTypeWithNoChange.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#2596bebb"
            }
            background: Rectangle {
                width: pu_editFabricTypeWithNoChange.width
                height: pu_editFabricTypeWithNoChange.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_editFabricTypeWithNoChange.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_editFabricTypeWithNoChange.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_editFabricTypeWithNoChangeDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Label {
                        font.pointSize: 16
                        text: qsTr("Tên loại mộc - xếp cam bạn muốn sửa vẫn chưa thay đổi trong ô nhập!")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -20
                    }
                    Label {
                        font.pointSize: 16
                        text: qsTr("Vui lòng kiểm tra lại!")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  20
                    }
                }
                Rectangle {
                    id: pu_editFabricTypeWithNoChangeDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_editFabricTypeWithNoChangeButton.top
                }
                Button {
                    id: pu_editFabricTypeWithNoChangeButton
                    height: 100 // Set height
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    background: Rectangle {
                        color: parent.pressed ? "#d7d7d7" : "#cce266"
                        border.width: 0
                        radius: 2
                        Label {
                            text: qsTr("Đã hiểu")
                            font.pointSize: 16
                            color: "#2b2b2b" //"#34aadc"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    onClicked: {
                        pu_editFabricTypeWithNoChange.close()
                    }
                }
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: -8
                    anchors.bottomMargin: -8
                    anchors.leftMargin: -8
                    anchors.rightMargin: -8
                    color: "#00000000"
                    radius: 2
                    border.width: 2
                    border.color: "#cce266"
                }
            }
        }
