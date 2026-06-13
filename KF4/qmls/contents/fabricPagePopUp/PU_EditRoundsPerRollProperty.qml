import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
            id: pu_editRoundsPerRollProperty
//            x: rectangle.width/2 - pu_editRoundsPerRollProperty.width/2
//            y: rectangle.height/2 - pu_editRoundsPerRollProperty.height/2

            width: 800
            height: 550
            modal: true
            closePolicy: Popup.CloseOnEscape

            focus: true
            Overlay.modal: Rectangle {
                color: "#c32e1011"
            }
            background: Rectangle {
                width: pu_editRoundsPerRollProperty.width
                height: pu_editRoundsPerRollProperty.height
                color: "#ffffff"
                radius: 2
            }
            contentItem: Rectangle {
                width: pu_editRoundsPerRollProperty.width //+ 4         // Set the width, necessary for Android-devices
                height: pu_editRoundsPerRollProperty.height // +4       // Set the height, necessary for Android-devices
                color: "#f7f7f7"    // Set the color
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pu_editRoundsPerRollPropertyDividerHorizontal.top
                    color: "#f7f7f7"
                    radius: 2
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  -40
                        Label {
                            font.pointSize: 16
                            text: qsTr("Số vòng cũ:  ")
                            color: "#2b2b2b" //"#34aadc"
                        }
                        Label {
                            font.bold: true
                            font.pointSize: 16
                            text: qsTr(lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnRoundsPerRoll_)
                            color: "#2b2b2b" //"#34aadc"
                        }
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset:  0

                        Label {
                            font.pointSize: 16
                            text: qsTr("Số vòng mới: ")
                            color: "#2b2b2b" //"#34aadc"

                        }
                        TextField {
                            id: tf_newRoundsPerRoll
                            inputMethodHints: Qt.ImhDigitsOnly
                            anchors.verticalCenter: parent.verticalCenter
                            font.pointSize: 16
                            font.bold: true
                            anchors.verticalCenterOffset:  -5
                        }
                    }
                }
                Rectangle {
                    id: pu_editRoundsPerRollPropertyDividerHorizontal
                    color: "#d7d7d7"
                    height: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: pu_editRoundsPerRollPropertyRow.top
                }
                Row {
                    id: pu_editRoundsPerRollPropertyRow
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
                            pu_editRoundsPerRollProperty.close()
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
                            if(tf_newRoundsPerRoll.text != ""){
                                /*
                                lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).index_: it means id of fabric config row.
                                parseInt(tf_newRoundsPerRoll.text): it means new rounds per roll.
                                */
                                fabricPageBridge.editRoundsPerRoll(lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).index_, parseInt(tf_newRoundsPerRoll.text).toString())
                                pu_editRoundsPerRollProperty.close()
                                bt_viewDetail.clicked()
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
