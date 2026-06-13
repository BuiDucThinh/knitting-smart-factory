import QtQuick 2.2
import QtGraphicalEffects 1.15
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.4
import "../animations"

Rectangle {
    id: delegate
    property color  rank_color_
    property color  rank_color_border_

    property color  yellow_color_
    property color  yellow_color_border_

    property color  green_color_
    property color  green_color_border_

    property color  red_color_
    property color  red_color_border_

    property color  text_color_
    property bool selected: ListView.isCurrentItem
    property real rowWidth
    property real rowHeigh:     30
    property real rectWidth: 38
    property real ordRectWidth: 30
    width: rowWidth
    height: rowHeigh    
    border.color: "#00000000"
    radius: 1
    color: "#00000000"

    // worker face image
    Rectangle {
        id: rectangle1
        width: rowHeigh
        height: rowHeigh
        color: "#00ffffff"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: rec_workerImg
            color: "#00000000"
            anchors.fill: parent
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }

            Image {
                id: worker_img
                width: 40
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.height: worker_img.height
                sourceSize.width: worker_img.width
                fillMode: Image.PreserveAspectFit
                source: workerImgSource_ //"../../userImages/noUser.svg"
            }

            Rectangle {
                id: mask
                radius: 15
                anchors.fill: parent
                visible: false
            }
        }
        Rectangle {
            radius: 16
            width: 32
            height: 32
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#00000000"
            border.color: "#43abc9"
        }
    }

    Rectangle {
        id: rectangle2
        width: rowHeigh
        height: rowHeigh
        color: rank_color_
        border.color: rank_color_border_
        radius: 2
        anchors.left: rectangle1.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: index + 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
        }
    }

    Rectangle {
        id: rectangle3
        width: 30
        height: rowHeigh
        color: green_color_
        border.color: green_color_border_
        radius: 2
        anchors.left: rectangle2.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect3_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: workedShift_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect3_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle4
        width: rectWidth
        height: rowHeigh
        color: yellow_color_
        radius: 2
        border.color: yellow_color_border_
        anchors.left: rectangle3.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect4_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: workedShiftScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect4_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle5
        width: 46
        height: rowHeigh
        color: green_color_
        border.color: green_color_border_
        radius: 2
        anchors.left: rectangle4.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect5_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: periodCheckTime_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect5_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle6
        width: rectWidth
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle5.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect6_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: checkTimeScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect6_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle7
        width: 46
        height: rowHeigh
        color: green_color_
        border.color: green_color_border_
        radius: 2
        anchors.left: rectangle6.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect7_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: timeToEndYarnBreakFullRoll_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect7_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle8
        width: rectWidth
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle7.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect8_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: timeToEndYarnBreakFullRollScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect8_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle9
        width: 30
        height: rowHeigh
        color: green_color_
        border.color: green_color_border_
        radius: 2
        anchors.left: rectangle8.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect9_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberDetectFaultAtTranferTime_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect9_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle10
        width: rectWidth
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle9.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect10_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberDetectFaultAtTranferTimeScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect10_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle11
        width: 30
        height: rowHeigh
        color: green_color_
        border.color: green_color_border_
        radius: 2
        anchors.left: rectangle10.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect11_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberOfKnitSMYOWY_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect11_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle12
        width: 38
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle11.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect12_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberOfKnitSMYOWYScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect12_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle13
        width: 28
        height: rowHeigh
        color: (parseInt(numberBadClean_) === 0) ? green_color_ : red_color_
        border.color: (parseInt(numberBadClean_) === 0) ? green_color_border_ : red_color_border_
        radius: 2
        anchors.left: rectangle12.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect13_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberBadClean_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect13_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle14
        width: 40
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle13.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect14_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberBadCleanScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect14_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle15
        width: 28
        height: rowHeigh
        color: (parseInt(numberLetFaultAtTranferTime_) === 0) ? green_color_ : red_color_
        border.color: (parseInt(numberLetFaultAtTranferTime_) === 0) ? green_color_border_ : red_color_border_
        radius: 2
        anchors.left: rectangle14.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect15_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberLetFaultAtTranferTime_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect15_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle16
        width: 40
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle15.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect16_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: numberLetFaultAtTranferTimeScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect16_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle17
        width: 46
        height: rowHeigh
        color: (parseFloat(kgDefectProduct_) === 0) ? green_color_ : red_color_
        border.color: (parseFloat(kgDefectProduct_) === 0) ? green_color_border_ : red_color_border_
        radius: 2
        anchors.left: rectangle16.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect17_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: kgDefectProduct_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect17_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle18
        width: 48
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle17.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect18_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: kgDefectProductScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect18_text
                }
            }
        }
    }

    Rectangle {
        id: rectangle19
        width: 46
        height: rowHeigh
        color: yellow_color_
        border.color: yellow_color_border_
        radius: 2
        anchors.left: rectangle18.right
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 0
        Text {
            id: rect19_text
            font.family: "Ubuntu Mono"
            color: text_color_
            font.pointSize: 13
            text: totalScore_
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            minimumPixelSize: 12
            Behavior on text {
                FadeAnimation {
                    target: rect19_text
                }
            }
        }
    }

    QtObject{
        id: internal

        property bool colorDynamic: if(selected){
                                        rank_color_ = "#b3e7ff"
                                        rank_color_border_ = "#093145"

                                        yellow_color_ = "#b3e7ff"
                                        yellow_color_border_ = "#093145"

                                        green_color_ = "#b3e7ff"
                                        green_color_border_ = "#093145"

                                        red_color_ = "#b3e7ff"
                                        red_color_border_ = "#093145"

                                        text_color_ = "black"

                                  }else{

                                        rank_color_ = "#f26d21"
                                        rank_color_border_ = "#9a2617"

                                        yellow_color_ = "#3cffff00"
                                        yellow_color_border_ = "#ffff00"

                                        green_color_ = "#3c00ff00"
                                        green_color_border_ = "#00ff00"

                                        red_color_ = "#3cff0000"
                                        red_color_border_ = "#ff0000"

                                        text_color_ = "white"
                                  }
    }

    MouseArea {
        anchors.fill: delegate
        onClicked: {
            delegate.ListView.view.currentIndex = index
            //console.log(index)
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}D{i:5}D{i:2}
}
##^##*/
