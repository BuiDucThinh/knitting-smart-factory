import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_deleteYarnType
//            x: rectangle.width/2 - pu_deleteYarnType.width/2
//            y: rectangle.height/2 - pu_deleteYarnType.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#22C12E11"//"#c32e1011"
            }
            background: Rectangle {
                width: pu_deleteYarnType.width
                height: pu_deleteYarnType.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_deleteYarnType.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_deleteYarnType.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: dividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  0
                        Label {
                            font.pointSize: 16
                            text: qsTr("Bạn có chắc chắn muốn xóa loại sợi ")
                            color: "#2b2b2b" //"#34aadc"

                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(lv_yarnType.model.get(lv_yarnType.currentIndex).text_)
                            color: "#2b2b2b" //"#34aadc"

                        }
                        Label {
                            font.pointSize: 16
                            text: qsTr(" này không ?")
                            color: "#2b2b2b" //"#34aadc"

                        }
                    }

//                    Label {
//                        font.pointSize: 16
//                        text: qsTr(" Nếu có! Mọi thông tin sản xuất liên quan đến loại sợi này sẽ vô nghĩa.")
//                        color: "#2b2b2b" //"#34aadc"
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        anchors.verticalCenter: parent.verticalCenter
//                        anchors.verticalCenterOffset:  20
//                    }
                }
                Rectangle {
                    id: dividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: row.top
                }
                Row {
                    id: row
                    height: 100 // Set height
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Button {
                        id: dialogButtonCancel
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: parent.width / 2 - 1
                        background: Rectangle {
                            id: rect1
                            color: dialogButtonCancel.pressed ? "#d7d7d7" : "#f7f7f7"
                            border.width: 0
                            radius: 2
                            Label {
                                text: qsTr("Hủy bỏ")
                                font.pointSize: 16
                                color: "#2b2b2b" //"#34aadc"
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.verticalCenter: rect1.verticalCenter
                                anchors.horizontalCenter: rect1.horizontalCenter
                            }

                        }
                        onClicked: {
                            pu_deleteYarnType.close()
                        }
                    }
                    Rectangle {
                        id: dividerVertical
                        width: 2
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        color: "#d7d7d7"
                    }
                    Button {
                        id: dialogButtonOk
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: parent.width / 2 - 1
                        background: Rectangle {
                            id: rect
                            color: dialogButtonOk.pressed ? "#d7d7d7" : "#ff3030"
                            border.width: 0
                            radius: 2
                            Label {
                                text: qsTr("Đồng ý")
                                font.pointSize: 16
                                color: "#2b2b2b" //"#34aadc"
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.verticalCenter: rect.verticalCenter
                                anchors.horizontalCenter: rect.horizontalCenter
                            }
                        }
                        onClicked: {
                            pu_deleteYarnType.close()
                            yarnPageBridge.deleteYarnType(lv_yarnType.model.get(lv_yarnType.currentIndex).index_)//, lv_yarnType.model.get(lv_yarnType.currentIndex).text_)
                            lv_yarnType.currentIndex = 0
                            tf_editYarnType.text = lv_yarnType.model.get(lv_yarnType.currentIndex).text_
                        }
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
                    border.color: "#ff3030"
                }
            }
        }
