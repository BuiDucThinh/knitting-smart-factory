import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_editPrintCode
//            x: rectangle.width/2 - pu_editPrintCode.width/2
//            y: rectangle.height/2 - pu_editPrintCode.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape

            focus: true

            Overlay.modal: Rectangle {
                color: "#c32e1011"
            }
            background: Rectangle {
                width: pu_editPrintCode.width
                height: pu_editPrintCode.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_editPrintCode.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_editPrintCode.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_editPrintCodeDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -40
                        Label {
                            font.pointSize: 16
                            text: qsTr("Mã in cũ:  ")
                            color: "#2b2b2b" //"#34aadc"
                        }
                        Label {
                            id: lb_fbrPrintCodeOld
                            font.bold: true
                            font.pointSize: 16
                            text: fabricPage.fabricPrintCodeOfCurrentRowOfLV_fabricConfig //lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).data2 // data2 is printcode
                            color: "#2b2b2b" //"#34aadc"
                        }
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  0

                        Label {
                            font.pointSize: 16
                            text: qsTr("Nhãn in mới: ")
                            color: "#2b2b2b" //"#34aadc"

                        }
                        TextField {
                            id: tf_newPrintCode
                            width: 650
                            anchors.verticalCenter: parent.verticalCenter
                            font.capitalization: Font.AllUppercase
                            font.pointSize: 16
                            font.bold: true
                            anchors.verticalCenterOffset:  -5
                            text: fabricPage.fabricPrintCodeOfCurrentRowOfLV_fabricConfig
                        }
                    }
                }
                Rectangle {
                    id: pu_editPrintCodeDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_editPrintCodeRow.top
                }
                Row {
                    id: pu_editPrintCodeRow
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
                            pu_editPrintCode.close()
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
                            if(tf_newPrintCode.text != ""){
                                fabricPageBridge.editPrintCode(lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).index_, tf_newPrintCode.text.toLocaleUpperCase())
                                pu_editPrintCode.close()
                                //bt_viewDetail.clicked()
                            }
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

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
