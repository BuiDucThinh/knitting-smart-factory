import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_editFabricType
//            x: rectangle.width/2 - pu_editFabricType.width/2
//            y: rectangle.height/2 - pu_editFabricType.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#c32e1011"
            }
            background: Rectangle {
                width: pu_editFabricType.width
                height: pu_editFabricType.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_editFabricType.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_editFabricType.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_editFabricTypeDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -30
                        Label {
                            font.pointSize: 16
                            text: qsTr("Bạn có chắc chắn muốn thương hiệu sợi ")
                            color: "#2b2b2b" //"#34aadc"

                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(lv_producer.model.get(lv_producer.currentIndex).text_)
                            color: "#2b2b2b" //"#34aadc"

                        }
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  0

                        Label {
                            font.pointSize: 16
                            text: qsTr("thành ")
                            color: "#2b2b2b" //"#34aadc"

                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(tf_editProducer.text.toUpperCase())
                            color: "#2b2b2b" //"#34aadc"

                        }
                        Label {
                            font.pointSize: 16
                            text: qsTr(" không ? Nếu có!")
                            color: "#2b2b2b" //"#34aadc"

                        }
                    }

                    Label {
                        font.pointSize: 16
                        text: qsTr("Mọi thông tin sản xuất liên quan đến nhà sản xuất này sẽ bị sửa theo.")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  30
                    }
                }
                Rectangle {
                    id: pu_editFabricTypeDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_editFabricTypeRow.top
                }
                Row {
                    id: pu_editFabricTypeRow
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
                            tf_editProducer.text = lv_producer.model.get(lv_producer.currentIndex).text_
                            pu_editFabricType.close()
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
                            color: parent.pressed ? "#d7d7d7" : "#ff3030"
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
                            yarnPageBridge.editProducer(lv_producer.model.get(lv_producer.currentIndex).index_
                                                     , tf_editProducer.text
                                                     ,lv_producer.model.get(lv_producer.currentIndex).text_)
                            pu_editFabricType.close()
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
