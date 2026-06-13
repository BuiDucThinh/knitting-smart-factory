import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4
import QtGraphicalEffects 1.15

Item {
    id: workerDetectedErrorPage
    width: 1920
    height: 985

    property list<WorkerDetectedErrorRect> listMch

    Component.onCompleted: {
        listMch.push(m1_rect)
        listMch.push(m2_rect)
        listMch.push(m3_rect)
        listMch.push(m4_rect)
        listMch.push(m5_rect)
        listMch.push(m6_rect)
        listMch.push(m7_rect)
        listMch.push(m8_rect)
        listMch.push(m9_rect)
        listMch.push(m10_rect)
        listMch.push(m11_rect)
        listMch.push(m12_rect)
        listMch.push(m13_rect)
        listMch.push(m14_rect)
        listMch.push(m15_rect)
        listMch.push(m16_rect)
        listMch.push(m17_rect)
        listMch.push(m18_rect)
        listMch.push(m19_rect)
        listMch.push(m20_rect)
        listMch.push(m21_rect)
    }

    Rectangle {
        id: rectangle
        color: "#222222"
        radius: 3
        anchors.fill: parent
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2

        Component.onCompleted: {
            workerDetectedErrorPageBridge.initializingMchInfoAboutCustomerAndFabric()
        }



        Image {
            id: machine_bg
            x: 477
            width: rectangle.height
            height: rectangle.height
            opacity: 1
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/svg_images/knitting_machine.svg"
            fillMode: Image.PreserveAspectFit
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0



        }

        WorkerDetectedErrorRect {
            id: m1_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 11
            anchors.topMargin: 9
            machineNumber: 1

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m1_rect.machineNumber.toString(), m1_rect.fabricPrintCodeLine1, m1_rect.fabricPrintCodeLine2, m1_rect.roundPerRoll, m1_rect.customerName)
            }
        }

        WorkerDetectedErrorRect {
            id: m4_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: parent.top
            machineNumber: 4
            anchors.topMargin: 9
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m4_rect.machineNumber.toString(), m4_rect.fabricPrintCodeLine1, m4_rect.fabricPrintCodeLine2, m4_rect.roundPerRoll, m4_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m5_rect
            x: 461
            width: 220
            height: 220
            anchors.left: m4_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            machineNumber: 5
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m5_rect.machineNumber.toString(), m5_rect.fabricPrintCodeLine1, m5_rect.fabricPrintCodeLine2, m5_rect.roundPerRoll, m5_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m8_rect
            x: 693
            width: 220
            height: 220
            anchors.left: m5_rect.right
            anchors.top: parent.top
            machineNumber: 8
            anchors.topMargin: 9
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m8_rect.machineNumber.toString(), m8_rect.fabricPrintCodeLine1, m8_rect.fabricPrintCodeLine2, m8_rect.roundPerRoll, m8_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m9_rect
            x: 921
            width: 220
            height: 220
            anchors.left: m8_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            anchors.leftMargin: 6
            machineNumber: 9

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m9_rect.machineNumber.toString(), m9_rect.fabricPrintCodeLine1, m9_rect.fabricPrintCodeLine2, m9_rect.roundPerRoll, m9_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m2_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m1_rect.bottom
            machineNumber: 2
            anchors.topMargin: 37
            anchors.leftMargin: 11

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m2_rect.machineNumber.toString(), m2_rect.fabricPrintCodeLine1, m2_rect.fabricPrintCodeLine2, m2_rect.roundPerRoll, m2_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m3_rect
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m2_rect.right
            machineNumber: 3
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m3_rect.machineNumber.toString(), m3_rect.fabricPrintCodeLine1, m3_rect.fabricPrintCodeLine2, m3_rect.roundPerRoll, m3_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m6_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m3_rect.right
            machineNumber: 6
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m6_rect.machineNumber.toString(), m6_rect.fabricPrintCodeLine1, m6_rect.fabricPrintCodeLine2, m6_rect.roundPerRoll, m6_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m7_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m6_rect.right
            machineNumber: 7
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m7_rect.machineNumber.toString(), m7_rect.fabricPrintCodeLine1, m7_rect.fabricPrintCodeLine2, m7_rect.roundPerRoll, m7_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m10_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m7_rect.right
            machineNumber: 10
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m10_rect.machineNumber.toString(), m10_rect.fabricPrintCodeLine1, m10_rect.fabricPrintCodeLine2, m10_rect.roundPerRoll, m10_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m18_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m2_rect.bottom
            machineNumber: 18
            anchors.topMargin: 9
            anchors.leftMargin: 11

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m18_rect.machineNumber.toString(), m18_rect.fabricPrintCodeLine1, m18_rect.fabricPrintCodeLine2, m18_rect.roundPerRoll, m18_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m16_rect
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m18_rect.right
            machineNumber: 16
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m16_rect.machineNumber.toString(), m16_rect.fabricPrintCodeLine1, m16_rect.fabricPrintCodeLine2, m16_rect.roundPerRoll, m16_rect.customerName)
            }

        }


        WorkerDetectedErrorRect {
            id: m15_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 15
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m15_rect.machineNumber.toString(), m15_rect.fabricPrintCodeLine1, m15_rect.fabricPrintCodeLine2, m15_rect.roundPerRoll, m15_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m12_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m15_rect.right
            machineNumber: 12
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m12_rect.machineNumber.toString(), m12_rect.fabricPrintCodeLine1, m12_rect.fabricPrintCodeLine2, m12_rect.roundPerRoll, m12_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m11_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m12_rect.right
            machineNumber: 11
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m11_rect.machineNumber.toString(), m11_rect.fabricPrintCodeLine1, m11_rect.fabricPrintCodeLine2, m11_rect.roundPerRoll, m11_rect.customerName)
            }

        }



        WorkerDetectedErrorRect {
            id: m17_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: m18_rect.bottom
            machineNumber: 17
            anchors.topMargin: 37
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m17_rect.machineNumber.toString(), m17_rect.fabricPrintCodeLine1, m17_rect.fabricPrintCodeLine2, m17_rect.roundPerRoll, m17_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m14_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m17_rect.right
            machineNumber: 14
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m14_rect.machineNumber.toString(), m14_rect.fabricPrintCodeLine1, m14_rect.fabricPrintCodeLine2, m14_rect.roundPerRoll, m14_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m13_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m14_rect.right
            machineNumber: 13
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m13_rect.machineNumber.toString(), m13_rect.fabricPrintCodeLine1, m13_rect.fabricPrintCodeLine2, m13_rect.roundPerRoll, m13_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m19_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 19
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 778

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m19_rect.machineNumber.toString(), m19_rect.fabricPrintCodeLine1, m19_rect.fabricPrintCodeLine2, m19_rect.roundPerRoll, m19_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m20_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m19_rect.right
            machineNumber: 20
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m20_rect.machineNumber.toString(), m20_rect.fabricPrintCodeLine1, m20_rect.fabricPrintCodeLine2, m20_rect.roundPerRoll, m20_rect.customerName)
            }

        }

        WorkerDetectedErrorRect {
            id: m21_rect
            y: 0
            width: 220
            height: 220
            anchors.verticalCenter: m20_rect.verticalCenter
            anchors.left: m20_rect.right
            machineNumber: 21
            anchors.leftMargin: 6

            onDetectedButtonClicked: {
                workerDetectedErrorPageBridge.loadWorkerAndFabricInfo(m21_rect.machineNumber.toString(), m21_rect.fabricPrintCodeLine1, m21_rect.fabricPrintCodeLine2, m21_rect.roundPerRoll, m21_rect.customerName)
            }

        }

        Rectangle {
            id: rectangle1
            color: "#8d222222"
            radius: 5
            border.width: 1
            anchors.left: m19_rect.left
            anchors.right: m21_rect.right
            anchors.top: m9_rect.top
            anchors.bottom: m21_rect.top
            anchors.bottomMargin: 6
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0

            Rectangle{
                id: rec_border
                visible: false
                width: 194
                height: 194
                color: "#00000000"
                radius: 100
                border.width: 2
                border.color: "#999999"//"#00FF00"
                anchors.verticalCenter: rec_workerImg1.verticalCenter
                anchors.horizontalCenter: rec_workerImg1.horizontalCenter
            }

            Glow {
                visible: true
                anchors.fill: rec_border
                radius: 10 //6 //8
                samples: 15 //10 //17
                color: "#00FF00"
                source: rec_border
            }

            // worker face image
            Rectangle {
                id: rec_workerImg1
                color: "#00000000"
                width: 186
                height: 186
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -106
                anchors.horizontalCenterOffset: -164
                anchors.horizontalCenter: parent.horizontalCenter
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: mask1
                }



                Image {
                    id: worker_img1
                    width: 248
                    height: 186
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: 248
                    sourceSize.width: 186
                    fillMode: Image.PreserveAspectFit
                }

                Rectangle {
                    id: mask1
                    radius: 100
                    width: rec_workerImg1.width
                    height: rec_workerImg1.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: false
                }


            }

            Rectangle{
                id: rec_border2
                visible: false
                width: 194
                height: 194
                color: "#00000000"
                radius: 100
                border.width: 2
                border.color: "#999999"//"#00FF00"
                anchors.verticalCenter: rec_workerImg2.verticalCenter
                anchors.horizontalCenter: rec_workerImg2.horizontalCenter
            }

            Glow {
                anchors.fill: rec_border2
                radius: 10 //6 //8
                samples: 15 //10 //17
                color: "#ff2e2e"
                source: rec_border2
            }

            Rectangle {
                id: rec_workerImg2
                x: -7
                y: -6
                width: 186
                height: 186
                color: "#00000000"
                anchors.verticalCenter: parent.verticalCenter
                Image {
                    id: worker_img2
                    width: 248
                    height: 186
                    anchors.verticalCenter: parent.verticalCenter
                    sourceSize.height: 248
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.width: 186
                    fillMode: Image.PreserveAspectFit
                }

                Rectangle {
                    id: mask2
                    width: rec_workerImg2.width
                    height: rec_workerImg2.height
                    visible: false
                    radius: 90
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 164
                layer.enabled: true
                anchors.verticalCenterOffset: -106
                layer.effect: OpacityMask {
                    maskSource: mask2
                }
            }

            RoundButton {
                id: btn_Cofirm
                y: 408
                height: 67
                text: qsTr("Xác nhận")
                radius: 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.leftMargin: 8

                onClicked: {
                    if (lb_workerDetectedError.text !== "" && lb_workerLetError.text !== ""){
                        se_btnClicked.play()
                        workerDetectedErrorPageBridge.comfirmErrorDetectedEvent()
                    }
                }
            }

            Label {
                id: label
                x: 111
                color: "#00ff00"
                text: qsTr("Người phát hiện lỗi:")
                anchors.top: parent.top
                font.pointSize: 13
                font.bold: true
                anchors.topMargin: 7
                anchors.horizontalCenter: rec_workerImg1.horizontalCenter
            }

            Label {
                id: label1
                x: 440
                color: "#ff0000"
                text: qsTr("Người để lại lỗi:")
                anchors.top: parent.top
                font.bold: true
                font.pointSize: 13
                anchors.horizontalCenter: rec_workerImg2.horizontalCenter
                anchors.topMargin: 7
            }



            Rectangle {
                id: rectangle3
                y: 244
                width: 324
                height: 27
                color: "#cb222222"
                radius: 4
                border.width: 0
                anchors.left: rectangle2.left
                anchors.leftMargin: 0

                Label {
                    id: lb_workerDetectedError
                    x: 328
                    y: -14
                    color: "#00ff00"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle4
                x: 360
                y: 244
                width: 328
                height: 32
                color: "#cb222222"
                radius: 4
                anchors.right: rectangle2.right
                anchors.bottom: rectangle2.top
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.horizontalCenter: rec_workerImg2.horizontalCenter

                Label {
                    id: lb_workerLetError
                    x: 140
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.pointSize: 12
                }
            }

            Rectangle {
                id: rectangle2
                y: 274
                height: 126
                color: "#cb222222"
                radius: 4
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.leftMargin: 8

                Label {
                    id: label2
                    x: 14
                    color: "#ff0000"
                    text: qsTr("+ Mộc dệt:")
                    anchors.top: parent.top
                    font.italic: true
                    anchors.topMargin: 4
                }

                Label {
                    id: label3
                    x: 14
                    color: "#ff0000"
                    text: qsTr("+ Số cây đã dệt:")
                    anchors.top: label2.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_fabricPrintCode
                    x: 92
                    y: 14
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.top: label2.top
                    anchors.topMargin: 0
                }

                Label {
                    id: lb_numberRollKinttedInPriviousShift
                    x: 126
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.top: label2.bottom
                    anchors.topMargin: 7
                }

                Label {
                    id: label4
                    x: 429
                    color: "#ff0000"
                    text: qsTr("+ Số lần kiểm hàng:")
                    anchors.top: label2.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: label5
                    x: 14
                    color: "#ff0000"
                    text: qsTr("+ Số lần dừng vì yêu cầu kiểm hàng bắt buộc:")
                    anchors.top: label3.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: label6
                    x: 429
                    color: "#ff0000"
                    text: qsTr("+ Thời gian dừng:")
                    anchors.top: label3.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: label7
                    x: 14
                    color: "#ff0000"
                    text: qsTr("+ Số lần dừng vì đèn vàng (đỏ) báo:")
                    anchors.top: label5.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: label8
                    x: 429
                    color: "#ff0000"
                    text: qsTr("+ Thời gian dừng:")
                    anchors.top: label5.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: label9
                    x: 14
                    color: "#ff0000"
                    text: qsTr("+ Số lần dừng vì đèn xanh báo:")
                    anchors.top: label7.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: label10
                    x: 429
                    color: "#ff0000"
                    text: qsTr("+ Thời gian dừng:")
                    anchors.top: label7.bottom
                    font.italic: true
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_checkCounter
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.top: label2.bottom
                    anchors.leftMargin: 575
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_numberStopByESP32
                    x: 327
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.top: label3.bottom
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_timeStopbyCheckStopByESP32
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.top: label3.bottom
                    anchors.leftMargin: 575
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_timeStopByYellowRedStop
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.top: label5.bottom
                    anchors.leftMargin: 575
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_timeStopByGreenStop
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.top: label7.bottom
                    anchors.leftMargin: 575
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_numberStopByYellowRed
                    x: 327
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.top: label5.bottom
                    anchors.topMargin: 7
                }

                Label {
                    id: lb_numberStopByGreen
                    x: 327
                    color: "#ff0000"
                    text: qsTr("")
                    anchors.top: label7.bottom
                    anchors.topMargin: 7
                }
            }



        }
    }



    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP

    // ================================================= CONNECTIONS

    Connections{
        target: workerDetectedErrorPageBridge

        function onFillCustomerFabricSpecsUI(listCTMFabricSpecificInfo_){
            // fill fabric specific data.
            listCTMFabricSpecificInfo_.forEach(function (ctmFabricSpecificData, index){
                if(ctmFabricSpecificData.length !== 0){
                    listMch[index].fillCustomerNameAndFabricPrintCode(ctmFabricSpecificData)
                }
            })
        }

        function onFillWorkerDetectedErrorSpecsUI(listWorkerDetectErrorSpecificInfo_){
            if (listWorkerDetectErrorSpecificInfo_.length !== 0){
                lb_workerDetectedError.text = listWorkerDetectErrorSpecificInfo_[0] + " - Ca " + listWorkerDetectErrorSpecificInfo_[3] + " - " + listWorkerDetectErrorSpecificInfo_[2]
                worker_img1.source = listWorkerDetectErrorSpecificInfo_[1]
            }
            else{
                lb_workerDetectedError.text = ""
                worker_img1.source = ""
            }
        }

        function onFillWorkerLetErrorSpecsUI(listWorkerLetErrorPerformanceInfo_){
            if (listWorkerLetErrorPerformanceInfo_.length !== 0){
                lb_workerLetError.text = listWorkerLetErrorPerformanceInfo_[0] + " - Ca " + listWorkerLetErrorPerformanceInfo_[17] + " - " + listWorkerLetErrorPerformanceInfo_[16]
                worker_img2.source = listWorkerLetErrorPerformanceInfo_[1]
                lb_numberRollKinttedInPriviousShift.text = listWorkerLetErrorPerformanceInfo_[2]
                lb_checkCounter.text = listWorkerLetErrorPerformanceInfo_[3]

                lb_timeStopbyCheckStopByESP32.text = listWorkerLetErrorPerformanceInfo_[4] + "h" + listWorkerLetErrorPerformanceInfo_[5] + "'" + listWorkerLetErrorPerformanceInfo_[6]
                lb_numberStopByESP32.text = listWorkerLetErrorPerformanceInfo_[7]

                lb_timeStopByYellowRedStop.text = listWorkerLetErrorPerformanceInfo_[8] + "h" + listWorkerLetErrorPerformanceInfo_[9] + "'" + listWorkerLetErrorPerformanceInfo_[10]
                lb_numberStopByYellowRed.text = listWorkerLetErrorPerformanceInfo_[11]

                lb_timeStopByGreenStop.text = listWorkerLetErrorPerformanceInfo_[12] + "h" + listWorkerLetErrorPerformanceInfo_[13] + "'" + listWorkerLetErrorPerformanceInfo_[14]
                lb_numberStopByGreen.text = listWorkerLetErrorPerformanceInfo_[15]



                lb_workerDetectedError.text = listWorkerDetectErrorSpecificInfo_[0]
                worker_img1.source = listWorkerDetectErrorSpecificInfo_[1]
            }
            else{
                lb_workerLetError.text = ""
                worker_img2.source = ""
                lb_numberRollKinttedInPriviousShift.text = ""
                lb_checkCounter.text = ""

                lb_timeStopbyCheckStopByESP32.text = ""
                lb_numberStopByESP32.text = ""

                lb_timeStopByYellowRedStop.text = ""
                lb_numberStopByYellowRed.text = ""

                lb_timeStopByGreenStop.text = ""
                lb_numberStopByGreen.text = ""

                lb_workerDetectedError.text = ""
                worker_img1.source = ""
            }
        }

        function onFillFabricOfShiftWrokingWhenWorkerLetErrorSpecsUI(fabricOfShiftWrokingWhenWorkerLetErrorInfo_){
            lb_fabricPrintCode.text = fabricOfShiftWrokingWhenWorkerLetErrorInfo_[2] + " /" + fabricOfShiftWrokingWhenWorkerLetErrorInfo_[0] + " " + fabricOfShiftWrokingWhenWorkerLetErrorInfo_[1]
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:2;locked:true}D{i:41}D{i:40}D{i:43}D{i:42}D{i:45}D{i:49}
D{i:50}D{i:51}D{i:56}D{i:57}D{i:58}D{i:59}D{i:60}D{i:61}D{i:62}D{i:44}
}
##^##*/
