import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_addYarnLot
//            x: rectangle.width/2 - pu_addYarnLot.width/2
//            y: rectangle.height/2 - pu_addYarnLot.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.NoAutoClose //Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#0596bebb"
            }
            background: Rectangle {
                width: pu_addYarnLot.width
                height: pu_addYarnLot.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_addYarnLot.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_addYarnLot.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_addYarnLotDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Label {
                        font.pointSize: 16
                        text: qsTr("Bạn có chắc muốn thêm lô sợi mới mã")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -20
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  20

                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(lb_yarnLotCode.text.toUpperCase())
                            color: "#2b2b2b" //"#34aadc"
                            //anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            //anchors.verticalCenterOffset:  20
                        }

                        Label {
                            font.pointSize: 16
                            text: ' không ?'
                            color: "#2b2b2b" //"#34aadc"
                            //anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            //anchors.verticalCenterOffset:  20
                        }
                    }

                }
                Rectangle {
                    id: pu_addYarnLotDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_addYarnLotRow.top
                }
                Row {
                    id: pu_addYarnLotRow
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
                            pu_addYarnLot.close()
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
                            pu_addYarnLot.close()
                            yarnPageBridge.addYarnLot(lb_yarnLotCode.text.toUpperCase()
                                                   ,cb_yarnType.model.get(cb_yarnType.currentIndex).index_
                                                   , cb_producer.model.get(cb_producer.currentIndex).index_
                                                   ,tf_lot.text.toUpperCase() )
                            cb_yarnType.currentIndex = -1
                            cb_producer.currentIndex = -1
                            lb_yarnLotCode.text = ""
                            tf_lot.text = ""
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
