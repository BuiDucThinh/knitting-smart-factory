import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_addProducer
//            x: rectangle.width/2 - pu_addProducer.width/2
//            y: rectangle.height/2 - pu_addProducer.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.NoAutoClose //Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#0596bebb"
            }
            background: Rectangle {
                width: pu_addProducer.width
                height: pu_addProducer.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_addProducer.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_addProducer.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_addProducerDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        Label {
                            font.pointSize: 16
                            text: qsTr('Bạn có chắc muốn thêm thương hiệu mới ')
                            color: "#2b2b2b" //"#34aadc"
                            //anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(tf_addProducer.text.toUpperCase())
                            color: "#2b2b2b" //"#34aadc"
                            //anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                        Label {
                            font.pointSize: 16
                            text: qsTr(' không ?')
                            color: "#2b2b2b" //"#34aadc"
                            //anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset:  0
                        }
                    }
                }
                Rectangle {
                    id: pu_addProducerDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_addProducerRow.top
                }
                Row {
                    id: pu_addProducerRow
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
                            tf_addProducer.text = ""
                            pu_addProducer.close()
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
                            pu_addProducer.close()
                            yarnPageBridge.addProducer(tf_addProducer.text.toUpperCase())
                            tf_addProducer.text = ""
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
