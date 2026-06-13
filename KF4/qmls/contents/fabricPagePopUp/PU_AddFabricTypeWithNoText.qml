import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_addFabricTypeWithNoText
//            x: rectangle.width/2 - pu_addFabricTypeWithNoText.width/2
//            y: rectangle.height/2 - pu_addFabricTypeWithNoText.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#2596bebb"
            }
            background: Rectangle {
                width: pu_addFabricTypeWithNoText.width
                height: pu_addFabricTypeWithNoText.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_addFabricTypeWithNoText.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_addFabricTypeWithNoText.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_addFabricTypeWithNoTextDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Label {
                        font.pointSize: 16
                        text: qsTr("Bạn chưa nhập tên và mật độ loại sợi bạn muốn thêm!")
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
                    id: pu_addFabricTypeWithNoTextDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_addFabricTypeWithNoTextButton.top
                }
                Button {
                    id: pu_addFabricTypeWithNoTextButton
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
                        pu_addFabricTypeWithNoText.close()
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
