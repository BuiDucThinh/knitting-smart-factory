import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_addYarnType
//            x: rectangle.width/2 - pu_addYarnType.width/2
//            y: rectangle.height/2 - pu_addYarnType.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.NoAutoClose //Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#0596bebb"
            }
            background: Rectangle {
                width: pu_addYarnType.width
                height: pu_addYarnType.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_addYarnType.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_addYarnType.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_addYarnTypeDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  0
                        Label {
                            font.pointSize: 16
                            text: qsTr('Bạn có chắc muốn thêm loại sợi mới ')
                            color:"#2b2b2b" // "#34aadc"

                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(tf_addYarnType.text.toUpperCase())
                            color:"#2b2b2b" // "#34aadc"

                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                        Label {
                            font.pointSize: 16
                            text: qsTr(' với mật độ ')
                            color:"#2b2b2b" // "#34aadc"

                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(tf_D.text)
                            color:"#2b2b2b" // "#34aadc"

                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                        Label {
                            font.pointSize: 16
                            text: qsTr(' không ?')
                            color:"#2b2b2b" // "#34aadc"

                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                    }
                }
                Rectangle {
                    id: pu_addYarnTypeDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_addYarnTypeRow.top
                }
                Row {
                    id: pu_addYarnTypeRow
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
                            tf_addYarnType.text = ""
                            pu_addYarnType.close()
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
                            pu_addYarnType.close()
                            yarnPageBridge.addYarnType(tf_addYarnType.text.toUpperCase(), tf_D.text)
                            tf_addYarnType.text = ""
                            tf_D.text = ""
                            tf_Ne.text = ""
                            tf_Dtex.text = ""
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
        }
