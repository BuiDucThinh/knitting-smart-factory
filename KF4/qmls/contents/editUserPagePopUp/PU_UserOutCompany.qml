import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_userOutCompany
//            x: rectangle.width/2 - pu_userOutCompany.width/2
//            y: rectangle.height/2 - pu_userOutCompany.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.NoAutoClose //Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#0596bebb"
            }
            background: Rectangle {
                width: pu_userOutCompany.width
                height: pu_userOutCompany.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_userOutCompany.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_userOutCompany.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_userOutCompanyDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Label {
                        font.pointSize: 16
                        text: qsTr("Bạn có chắc muốn đưa nhân sự sau đây thành nghỉ việc:")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -90
                    }
                    Row{
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -30

                        Label {
                            font.pointSize: 16
                            text: qsTr("- Họ và tên: ")
                            color: "#2b2b2b" //"#34aadc"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(lastName.toUpperCase() + " " + firstName.toUpperCase())
                            color: "#2b2b2b" //"#34aadc"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Row{
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  0

                        Label {
                            font.pointSize: 16
                            text: qsTr("- Số điện thoại: ")
                            color: "#2b2b2b" //"#34aadc"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(phone)
                            color: "#2b2b2b" //"#34aadc"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Row{
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  30

                        Label {
                            font.pointSize: 16
                            text: qsTr("- Vị trí công tác: ")
                            color: "#2b2b2b" //"#34aadc"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(position)
                            color: "#2b2b2b" //"#34aadc"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                }
                Rectangle {
                    id: pu_userOutCompanyDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_userOutCompanyRow.top
                }
                Row {
                    id: pu_userOutCompanyRow
                    height: 100 // Set height
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Button {
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: parent.width / 2 - 1
                        background: Rectangle {
                            color: parent.pressed ? "#d7d7d7" : "#f7f7f7"
                            border.width: 0
                            radius: 2
                            Label {
                                text: qsTr("Hủy bỏ")
                                font.pointSize: 16
                                color: "#2b2b2b" //"#34aadc"
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                        }
                        onClicked: {
                            pu_userOutCompany.close()
                        }
                    }
                    Rectangle {
                        width: 2
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        color: "#d7d7d7"
                    }
                    Button {
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: parent.width / 2 - 1
                        background: Rectangle {
                            color: parent.pressed ? "#d7d7d7" : "#cce266"
                            border.width: 0
                            radius: 2
                            Label {
                                text: qsTr("Đồng ý")
                                font.pointSize: 16
                                color: "#2b2b2b" //"#34aadc"
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        onClicked: {
                            pu_userOutCompany.close()
                            editUserPageBridge.userOutCompany(idRow)
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
                    border.color: "#cce266"
                }
            }
//            Connections{
//                    target: yarnPageBridge
//            }
}
