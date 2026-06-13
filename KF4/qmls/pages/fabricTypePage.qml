import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4

Item {
    width: 1920
    height: 985
    property alias addYarnLotRec: addYarnLotRec
    Component.onCompleted: {
        console.log("page completed")
    }
    Rectangle {
        id: rectangle1
        color: "#222222"
        radius: 3
        anchors.fill: parent
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2

        Button {
            id: button
            x: 169
            y: 715
            text: qsTr("THÊM")
        }

        TextField {
            id: textField
            x: 169
            y: 639
            width: 363
            height: 55
            font.capitalization: Font.AllUppercase
            placeholderText: qsTr("THÊM SỢI")
            onTextChanged: {
                textField1.text = textField.text
            }
        }

        TextField {
            id: textField1
            x: 169
            y: 49
            width: 363
            height: 55
            text: "555555555555555555555555555555"
            font.capitalization: Font.AllUppercase
            enabled: false

        }

        ComboBox {
            id: comboBox
            x: 662
            y: 640
            width: 352
            height: 54
        }

        Rectangle {
            id: addYarnLotRec
            x: 144
            y: 210
            width: 612
            height: 400
            color: "#00000000"
            radius: 2
            border.color: "#09ff40"

            ListView {
                id: listYarnLot
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 35
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.bottomMargin: 21
                delegate: YarnListViewDelegate{itemSize: 606 }
                model: ListModel {
                    ListElement {
                        num: "1"
                        code: "PE30HG"
                        yarntype: "PE30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "2"
                        code: "TC30HG"
                        yarntype: "TC30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "3"
                        code: "TC26HG"
                        yarntype: "TC26"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "4"
                        code: "PL100144TQ-100N28"
                        yarntype: "PL100144"
                        producer: "TRUNG QUOC"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "5"
                        code: "PEXAM201KN-100N28"
                        yarntype: "PEXAM201"
                        producer: "KHAI NGUYEN"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "1"
                        code: "PE30HG"
                        yarntype: "PE30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "2"
                        code: "TC30HG"
                        yarntype: "TC30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "3"
                        code: "TC26HG"
                        yarntype: "TC26"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "4"
                        code: "PL100144TQ-100N28"
                        yarntype: "PL100144"
                        producer: "TRUNG QUOC"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "5"
                        code: "PEXAM201KN-100N28"
                        yarntype: "PEXAM201"
                        producer: "KHAI NGUYEN"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "1"
                        code: "PE30HG"
                        yarntype: "PE30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "2"
                        code: "TC30HG"
                        yarntype: "TC30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "3"
                        code: "TC26HG"
                        yarntype: "TC26"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "4"
                        code: "PL100144TQ-100N28"
                        yarntype: "PL100144"
                        producer: "TRUNG QUOC"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "5"
                        code: "PEXAM201KN-100N28"
                        yarntype: "PEXAM201"
                        producer: "KHAI NGUYEN"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "1"
                        code: "PE30HG"
                        yarntype: "PE30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "2"
                        code: "TC30HG"
                        yarntype: "TC30"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "3"
                        code: "TC26HG"
                        yarntype: "TC26"
                        producer: "HAN GIA"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "4"
                        code: "PL100144TQ-100N28"
                        yarntype: "PL100144"
                        producer: "TRUNG QUOC"
                        lot: "100N28"
                    }

                    ListElement {
                        num: "5"
                        code: "PEXAM201KN-100N28"
                        yarntype: "PEXAM201"
                        producer: "KHAI NGUYEN"
                        lot: "100N28"
                    }
                }
                spacing: 3
                Component.onCompleted: {
                    console.log("list completed")
                    modelBridge.yarnListCompleted()
                }
            }

            ScrollBar {
                id: listScrollBar

                orientation: Qt.Vertical
                height: listYarnLot.height;
                width: 8
                scrollArea: listYarnLot;
                anchors.right: listYarnLot.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.bottomMargin: 3
                anchors.topMargin: 32
            }

            Rectangle {
                id: rectangle
                width: 37
                height: 26
                color: "#ffffff"
                radius: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 3

                Label {
                    id: label
                    x: 32
                    y: 28
                    text: qsTr("STT")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    font.bold: false
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle2
                width: 203
                height: 26
                color: "#ffffff"
                radius: 2
                anchors.left: rectangle.right
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 3
                Label {
                    id: label1
                    x: 32
                    y: 28
                    text: qsTr("MÃ")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                }
            }

            Rectangle {
                id: rectangle3
                width: 118
                height: 26
                color: "#ffffff"
                radius: 2
                anchors.left: rectangle2.right
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 3
                Label {
                    id: label2
                    x: 32
                    y: 28
                    text: qsTr("CHỦNG LOẠI")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                }
            }

            Rectangle {
                id: rectangle4
                width: 124
                height: 26
                color: "#ffffff"
                radius: 2
                anchors.left: rectangle3.right
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 3
                Label {
                    id: label3
                    x: 32
                    y: 28
                    text: qsTr("NHÀ SẢN XUẤT")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                }
            }

            Rectangle {
                id: rectangle5
                width: 112
                height: 26
                color: "#ffffff"
                radius: 2
                anchors.left: rectangle4.right
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 3
                Label {
                    id: label4
                    x: 32
                    y: 28
                    text: qsTr("SỐ LÔ")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                }
            }
        }

    }



    Connections{
        target: modelBridge
        function onClearYarnList(yarnListData){
            listYarnLot.model.clear()
            yarnListData.forEach(function (item, index) {
              console.log(item, index);
              listYarnLot.model.append({"num": (index+1).toString(), "code": item[0], "yarntype": item[1], "producer": item[2], "lot": item[3]})
            })
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
