import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_addFabricConfig
//            x: rectangle.width/2 - pu_addFabricConfig.width/2
//            y: rectangle.height/2 - pu_addFabricConfig.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.NoAutoClose //Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#0596bebb"
            }
            background: Rectangle {
                width: pu_addFabricConfig.width
                height: pu_addFabricConfig.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_addFabricConfig.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_addFabricConfig.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_addFabricConfigDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Label {
                        font.pointSize: 16
                        text: qsTr("Bạn có chắc muốn thêm thông tin mới cho loại mộc:")
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
                            text: qsTr(tf_fabricConfigPrintText.text.toUpperCase())
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
                    id: pu_addFabricConfigDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_addFabricConfigRow.top
                }
                Row {
                    id: pu_addFabricConfigRow
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
                            pu_addFabricConfig.close()
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
                            pu_addFabricConfig.close()
                            var yarnLot2Id = ""
                            if(cb_yarnLot2.currentIndex != -1){yarnLot2Id = cb_yarnLot2.model.get(cb_yarnLot2.currentIndex).index_}
                            var yarnLot3Id = ""
                            if(cb_yarnLot3.currentIndex != -1){yarnLot3Id = cb_yarnLot3.model.get(cb_yarnLot3.currentIndex).index_}
                            var yarnLot4Id = ""
                            if(cb_yarnLot4.currentIndex != -1){yarnLot4Id = cb_yarnLot4.model.get(cb_yarnLot4.currentIndex).index_}
                            var yarnLot5Id = ""
                            if(cb_yarnLot5.currentIndex != -1){yarnLot5Id = cb_yarnLot5.model.get(cb_yarnLot5.currentIndex).index_}

//                            print("1 ",lb_fabricConfigCode.text)
//                            print("2 ",tf_fabricConfigPrintText.text)
//                            print("3 ",cb_fabricType.model.get(cb_fabricType.currentIndex).index_)
//                            print("4 ",tf_fabricMet.text)
//                            print("5 ",cb_yarnLot1.model.get(cb_yarnLot1.currentIndex).index_)
//                            print("6 ",yarnLot2Id)
//                            print("7 ",yarnLot3Id)
//                            print("8 ",yarnLot4Id)
//                            print("9 ",tf_speed1.text)
//                            print("10 ",tf_speed2.text)
//                            print("11 ",tf_speed3.text)
//                            print("12 ",tf_speed4.text)
//                            print("13 ",tf_coneNum1.text)
//                            print("14 ",tf_coneNum2.text)
//                            print("15 ",tf_coneNum3.text)
//                            print("16 ",tf_coneNum4.text)
//                            print("17 ",tf_roundPerRoll.text)
//                            print("18 ",cb_machineDia.currentText)
//                            print("19 ",cb_gauge.currentText)

                            if(tf_fabricWide.text === ""){
                                fabricPageBridge.addFabricConfig(lb_fabricConfigCode.text, tf_fabricConfigPrintText.text.toUpperCase(), cb_fabricType.model.get(cb_fabricType.currentIndex).index_, tf_fabricMet.text.replace(",","."), "0",
                                                        cb_yarnLot1.model.get(cb_yarnLot1.currentIndex).index_, tf_speed1.text, tf_coneNum1.text,
                                                        yarnLot2Id, tf_speed2.text, tf_coneNum2.text,
                                                        yarnLot3Id, tf_speed3.text, tf_coneNum3.text,
                                                        yarnLot4Id, tf_speed4.text, tf_coneNum4.text,
                                                        yarnLot5Id, tf_speed5.text, tf_coneNum5.text,
                                                        tf_roundPerRoll.text, cb_machineDia.currentText, cb_gauge.currentText, fabricPage.customerID  )
                            }
                            else{
                                fabricPageBridge.addFabricConfig(lb_fabricConfigCode.text, tf_fabricConfigPrintText.text.toUpperCase(), cb_fabricType.model.get(cb_fabricType.currentIndex).index_, tf_fabricMet.text.replace(",","."), tf_fabricWide.text.replace(",","."),
                                                        cb_yarnLot1.model.get(cb_yarnLot1.currentIndex).index_, tf_speed1.text, tf_coneNum1.text,
                                                        yarnLot2Id, tf_speed2.text, tf_coneNum2.text,
                                                        yarnLot3Id, tf_speed3.text, tf_coneNum3.text,
                                                        yarnLot4Id, tf_speed4.text, tf_coneNum4.text,
                                                        yarnLot5Id, tf_speed5.text, tf_coneNum5.text,
                                                        tf_roundPerRoll.text, cb_machineDia.currentText, cb_gauge.currentText, fabricPage.customerID  )
                            }

                            lb_fabricConfigCode.text = ""
                            tf_fabricConfigPrintText.text = ""

                            tf_fabricMet.text = ""
                            tf_fabricWide.text = ""
                            cb_machineDia.currentIndex = 0
                            cb_gauge.currentIndex = 0

                            cb_yarnType1.currentIndex = -1
                            cb_yarnType2.currentIndex = -1
                            cb_yarnType3.currentIndex = -1
                            cb_yarnType4.currentIndex = -1

                            cb_yarnLot1.currentIndex = -1
                            cb_yarnLot2.currentIndex = -1
                            cb_yarnLot3.currentIndex = -1
                            cb_yarnLot4.currentIndex = -1
                            cb_yarnLot5.currentIndex = -1

                            tf_speed1.text = ""
                            tf_speed2.text = ""
                            tf_speed3.text = ""
                            tf_speed4.text = ""
                            tf_speed5.text = ""

                            tf_coneNum1.text = ""
                            tf_coneNum2.text = ""
                            tf_coneNum3.text = ""
                            tf_coneNum4.text = ""
                            tf_coneNum5.text = ""

                            tf_roundPerRoll.text = ""
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
