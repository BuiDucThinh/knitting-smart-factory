import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_deleteProducer

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape
            focus: true
            Overlay.modal: Rectangle {
                color: "#22C12E11"//"#c32e1011"
            }
            background: Rectangle {
                width: pu_deleteProducer.width
                height: pu_deleteProducer.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_deleteProducer.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_deleteProducer.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: dpu_deleteProducerDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2

                    Label {
                        font.pointSize: 16
                        text: qsTr("Bạn có chắc chắn muốn xóa thương hiệu / nhà sản xuất sợi:")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -15
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  15

//                        Label {
//                            font.pointSize: 16
//                            text: qsTr("Bạn có chắc chắn muốn xóa thương hiệu / nhà sản xuất sợi ")
//                            color: "#2b2b2b" //"#34aadc"

//                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(lv_producer.model.get(lv_producer.currentIndex).text_)
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
//                        text: qsTr("Mọi thông tin sản xuất liên quan đến thương hiệu sợi này sẽ vô nghĩa.")
//                        color: "#2b2b2b" //"#34aadc"
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        anchors.verticalCenter: parent.verticalCenter
//                        anchors.verticalCenterOffset:  30
//                    }
                }
                Rectangle {
                    id: dpu_deleteProducerDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_deleteProducerRow.top
                }
                Row {
                    id: pu_deleteProducerRow
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
                            pu_deleteProducer.close()
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
                            pu_deleteProducer.close()
                            yarnPageBridge.deleteProducer(lv_producer.model.get(lv_producer.currentIndex).index_) //, lv_producer.model.get(lv_producer.currentIndex).text_)
                            lv_producer.currentIndex = 0
                            tf_editProducer.text = lv_producer.model.get(lv_producer.currentIndex).text_
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
