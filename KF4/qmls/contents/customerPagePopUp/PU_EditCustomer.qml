import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_editCustomer
//            x: rectangle.width/2 - pu_editCustomer.width/2
//            y: rectangle.height/2 - pu_editCustomer.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape
            focus: true
            Overlay.modal: Rectangle {
                color: "#c32e1011"
            }
            background: Rectangle {
                width: pu_editCustomer.width
                height: pu_editCustomer.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_editCustomer.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_editCustomer.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_editCustomerDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Label {
                        font.pointSize: 16
                        text: qsTr("Bạn có chắc chắn muốn sửa thông tin khách hàng")
                        color: "#2b2b2b" //"#34aadc"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -30
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -0
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(customerPage.subject_Customer_Want_To_Change.toLocaleUpperCase() + " " + customerPage.name_Customer_Want_To_Change.toLocaleUpperCase() + "   / " + customerPage.abbreviation_Customer_Want_To_Change)
                            color: "#2b2b2b" //"#34aadc"
                        }
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  30
                        Label {
                            font.pointSize: 16
                            text: qsTr(" thành ")
                            color: "#2b2b2b" //"#34aadc"

                        }
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  60
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(cb_subjectType.currentText.toLocaleUpperCase() + " " + tf_customerName.text.toLocaleUpperCase() + "   / " + tf_abberaviation.text.toLocaleUpperCase())
                            color: "#2b2b2b" //"#34aadc"

                        }                        
                    }                    
                }
                Rectangle {
                    id: pu_editCustomerDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_editCustomerRow.top
                }
                Row {
                    id: pu_editCustomerRow
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
                            se_btnClicked.play()
                            cb_subjectType.currentIndex = 0
                            tf_customerName.text = ""
                            tf_abberaviation.text = ""
                            pu_editCustomer.close()
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
                            customerPageBridge.updateCustomerInfo(customerPage.id_Customer_Want_To_Change,
                                                                    cb_subjectType.currentText,
                                                                    tf_customerName.text.toLocaleUpperCase(),
                                                                    tf_abberaviation.text.toLocaleUpperCase())

                            se_btnClicked.play()
                            cb_subjectType.currentIndex = 0
                            tf_customerName.text = ""
                            tf_abberaviation.text = ""
                            pu_editCustomer.close()
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
