import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4
import QtGraphicalEffects 1.15

Item {
    id: printFabricPrintCodePage
    width: 1920
    height: 985

    property list<PrintFabricPrintCodeRect> listMch
    property string defaultPrinter: "HP-LaserJet-Professional-P1102"

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
            printFabricPrintCodePageBridge.initializingMchInfoAboutCustomerAndFabric()
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

        PrintFabricPrintCodeRect {
            id: m1_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 11
            anchors.topMargin: 9
            machineNumber: 1

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m1_rect.machineNumber.toString(), m1_rect.fabricPrintCodeLine1, m1_rect.fabricPrintCodeLine2, m1_rect.roundPerRoll, m1_rect.customerName, m1_rect.mainYarn, m1_rect.extralYarn, m1_rect.spandex, m1_rect.extralYarn2, m1_rect.extralYarn3)
            }
        }

        PrintFabricPrintCodeRect {
            id: m4_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: parent.top
            machineNumber: 4
            anchors.topMargin: 9
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m4_rect.machineNumber.toString(), m4_rect.fabricPrintCodeLine1, m4_rect.fabricPrintCodeLine2, m4_rect.roundPerRoll, m4_rect.customerName, m4_rect.mainYarn, m4_rect.extralYarn, m4_rect.spandex, m4_rect.extralYarn2, m4_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m5_rect
            x: 461
            width: 220
            height: 220
            anchors.left: m4_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            machineNumber: 5
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m5_rect.machineNumber.toString(), m5_rect.fabricPrintCodeLine1, m5_rect.fabricPrintCodeLine2, m5_rect.roundPerRoll, m5_rect.customerName, m5_rect.mainYarn, m5_rect.extralYarn, m5_rect.spandex, m5_rect.extralYarn2, m5_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m8_rect
            x: 693
            width: 220
            height: 220
            anchors.left: m5_rect.right
            anchors.top: parent.top
            machineNumber: 8
            anchors.topMargin: 9
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m8_rect.machineNumber.toString(), m8_rect.fabricPrintCodeLine1, m8_rect.fabricPrintCodeLine2, m8_rect.roundPerRoll, m8_rect.customerName, m8_rect.mainYarn, m8_rect.extralYarn, m8_rect.spandex, m8_rect.extralYarn2, m8_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m9_rect
            x: 921
            width: 220
            height: 220
            anchors.left: m8_rect.right
            anchors.top: parent.top
            anchors.topMargin: 9
            anchors.leftMargin: 6
            machineNumber: 9

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m9_rect.machineNumber.toString(), m9_rect.fabricPrintCodeLine1, m9_rect.fabricPrintCodeLine2, m9_rect.roundPerRoll, m9_rect.customerName, m9_rect.mainYarn, m9_rect.extralYarn, m9_rect.spandex, m9_rect.extralYarn2, m9_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m2_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m1_rect.bottom
            machineNumber: 2
            anchors.topMargin: 37
            anchors.leftMargin: 11

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m2_rect.machineNumber.toString(), m2_rect.fabricPrintCodeLine1, m2_rect.fabricPrintCodeLine2, m2_rect.roundPerRoll, m2_rect.customerName, m2_rect.mainYarn, m2_rect.extralYarn, m2_rect.spandex, m2_rect.extralYarn2, m2_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m3_rect
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m2_rect.right
            machineNumber: 3
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m3_rect.machineNumber.toString(), m3_rect.fabricPrintCodeLine1, m3_rect.fabricPrintCodeLine2, m3_rect.roundPerRoll, m3_rect.customerName, m3_rect.mainYarn, m3_rect.extralYarn, m3_rect.spandex, m3_rect.extralYarn2, m3_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m6_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m3_rect.right
            machineNumber: 6
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m6_rect.machineNumber.toString(), m6_rect.fabricPrintCodeLine1, m6_rect.fabricPrintCodeLine2, m6_rect.roundPerRoll, m6_rect.customerName, m6_rect.mainYarn, m6_rect.extralYarn, m6_rect.spandex, m6_rect.extralYarn2, m6_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m7_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m6_rect.right
            machineNumber: 7
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m7_rect.machineNumber.toString(), m7_rect.fabricPrintCodeLine1, m7_rect.fabricPrintCodeLine2, m7_rect.roundPerRoll, m7_rect.customerName, m7_rect.mainYarn, m7_rect.extralYarn, m7_rect.spandex, m7_rect.extralYarn2, m7_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m10_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m2_rect.verticalCenter
            anchors.left: m7_rect.right
            machineNumber: 10
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m10_rect.machineNumber.toString(), m10_rect.fabricPrintCodeLine1, m10_rect.fabricPrintCodeLine2, m10_rect.roundPerRoll, m10_rect.customerName, m10_rect.mainYarn, m10_rect.extralYarn, m10_rect.spandex, m10_rect.extralYarn2, m10_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m18_rect
            width: 220
            height: 220
            anchors.left: parent.left
            anchors.top: m2_rect.bottom
            machineNumber: 18
            anchors.topMargin: 9
            anchors.leftMargin: 11

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m18_rect.machineNumber.toString(), m18_rect.fabricPrintCodeLine1, m18_rect.fabricPrintCodeLine2, m18_rect.roundPerRoll, m18_rect.customerName, m18_rect.mainYarn, m18_rect.extralYarn, m18_rect.spandex, m18_rect.extralYarn2, m18_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m16_rect
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m18_rect.right
            machineNumber: 16
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m16_rect.machineNumber.toString(), m16_rect.fabricPrintCodeLine1, m16_rect.fabricPrintCodeLine2, m16_rect.roundPerRoll, m16_rect.customerName, m16_rect.mainYarn, m16_rect.extralYarn, m16_rect.spandex, m16_rect.extralYarn2, m16_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m15_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 15
            anchors.leftMargin: 6

            onPrintButtonClicked: {

                printFabricPrintCodePageBridge.printGuideBoard(m15_rect.machineNumber.toString(), m15_rect.fabricPrintCodeLine1, m15_rect.fabricPrintCodeLine2, m15_rect.roundPerRoll, m15_rect.customerName, m15_rect.mainYarn, m15_rect.extralYarn, m15_rect.spandex, m15_rect.extralYarn2, m15_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m12_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m15_rect.right
            machineNumber: 12
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m12_rect.machineNumber.toString(), m12_rect.fabricPrintCodeLine1, m12_rect.fabricPrintCodeLine2, m12_rect.roundPerRoll, m12_rect.customerName, m12_rect.mainYarn, m12_rect.extralYarn, m12_rect.spandex, m12_rect.extralYarn2, m12_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m11_rect
            x: 921
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m12_rect.right
            machineNumber: 11
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m11_rect.machineNumber.toString(), m11_rect.fabricPrintCodeLine1, m11_rect.fabricPrintCodeLine2, m11_rect.roundPerRoll, m11_rect.customerName, m11_rect.mainYarn, m11_rect.extralYarn, m11_rect.spandex, m11_rect.extralYarn2, m11_rect.extralYarn3)
            }

        }



        PrintFabricPrintCodeRect {
            id: m17_rect
            width: 220
            height: 220
            anchors.left: m1_rect.right
            anchors.top: m18_rect.bottom
            machineNumber: 17
            anchors.topMargin: 37
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m17_rect.machineNumber.toString(), m17_rect.fabricPrintCodeLine1, m17_rect.fabricPrintCodeLine2, m17_rect.roundPerRoll, m17_rect.customerName, m17_rect.mainYarn, m17_rect.extralYarn, m17_rect.spandex, m17_rect.extralYarn2, m17_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m14_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m17_rect.right
            machineNumber: 14
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m14_rect.machineNumber.toString(), m14_rect.fabricPrintCodeLine1, m14_rect.fabricPrintCodeLine2, m14_rect.roundPerRoll, m14_rect.customerName, m14_rect.mainYarn, m14_rect.extralYarn, m14_rect.spandex, m14_rect.extralYarn2, m14_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m13_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m17_rect.verticalCenter
            anchors.left: m14_rect.right
            machineNumber: 13
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m13_rect.machineNumber.toString(), m13_rect.fabricPrintCodeLine1, m13_rect.fabricPrintCodeLine2, m13_rect.roundPerRoll, m13_rect.customerName, m13_rect.mainYarn, m13_rect.extralYarn, m13_rect.spandex, m13_rect.extralYarn2, m13_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m19_rect
            x: 461
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m16_rect.right
            machineNumber: 19
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 778

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m19_rect.machineNumber.toString(), m19_rect.fabricPrintCodeLine1, m19_rect.fabricPrintCodeLine2, m19_rect.roundPerRoll, m19_rect.customerName, m19_rect.mainYarn, m19_rect.extralYarn, m19_rect.spandex, m19_rect.extralYarn2, m19_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m20_rect
            x: 693
            width: 220
            height: 220
            anchors.verticalCenter: m18_rect.verticalCenter
            anchors.left: m19_rect.right
            machineNumber: 20
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m20_rect.machineNumber.toString(), m20_rect.fabricPrintCodeLine1, m20_rect.fabricPrintCodeLine2, m20_rect.roundPerRoll, m20_rect.customerName, m20_rect.mainYarn, m20_rect.extralYarn, m20_rect.spandex, m20_rect.extralYarn2, m20_rect.extralYarn3)
            }

        }

        PrintFabricPrintCodeRect {
            id: m21_rect
            y: 0
            width: 220
            height: 220
            anchors.verticalCenter: m20_rect.verticalCenter
            anchors.left: m20_rect.right
            machineNumber: 21
            anchors.leftMargin: 6

            onPrintButtonClicked: {

               printFabricPrintCodePageBridge.printGuideBoard(m21_rect.machineNumber.toString(), m21_rect.fabricPrintCodeLine1, m21_rect.fabricPrintCodeLine2, m21_rect.roundPerRoll, m21_rect.customerName, m21_rect.mainYarn, m21_rect.extralYarn, m21_rect.spandex, m21_rect.extralYarn2, m21_rect.extralYarn3)
            }

        }
    }

    ListView {
        id: lv_printerList
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 13
        anchors.leftMargin: 1233
        anchors.topMargin: 124
        anchors.bottomMargin: 631
        spacing: 3
        model: ListModel {
            ListElement{
                printerName_: "1102"   //Code1                 2
            }
            ListElement{
                printerName_: "M15"   //Code1                 2
            }
        }
        delegate: DLG_PrinterList{rowWidth: lv_printerList.width
            rowHeigh :40 }

        Component.onCompleted: {
            printFabricPrintCodePageBridge.lv_printerListCompleted()
        }

        ScrollBar {
            orientation: Qt.Vertical
            height: parent.height;
            width: 8
            scrollArea: parent;
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.bottomMargin: 0
            anchors.topMargin: 0
        }
    }

    Rectangle {
        id: rectangle1
        color: "#ffffff"
        radius: 10
        anchors.left: lv_printerList.left
        anchors.right: lv_printerList.right
        anchors.top: parent.top
        anchors.bottom: lv_printerList.top
        anchors.bottomMargin: 10
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 18

        Image {
            id: img_currentPrinter
            width: 84
            height: 42
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/svg_images/printer.svg"
            sourceSize.height: img_currentPrinter.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_currentPrinter.width
            antialiasing: true
            anchors.leftMargin: 27
            anchors.topMargin: 17
        }

        Label {
            id: lb_printer
            x: 1242
            color: "#000000"
            text: qsTr("Chọn in tại máy:")
            anchors.top: img_currentPrinter.bottom
            anchors.topMargin: 11
            anchors.horizontalCenter: img_currentPrinter.horizontalCenter
        }

        Label {
            id: lb_printerName
            x: 155
            y: 15
            width: 500
            height: 66
            color: "#000000"
            text: printFabricPrintCodePage.defaultPrinter
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 20
            anchors.rightMargin: 10
        }
    }



    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP

    // ================================================= CONNECTIONS

    Connections{
        target: printFabricPrintCodePageBridge

        function onFillCustomerFabricSpecsUI(listCTMFabricSpecificInfo_){
            // fill fabric specific data.
            listCTMFabricSpecificInfo_.forEach(function (ctmFabricSpecificData, index){
                if(ctmFabricSpecificData.length !== 0){
                    listMch[index].fillCustomerNameAndFabricPrintCode(ctmFabricSpecificData)
                }
            })
        }

        function onFillPrinterListSpecsUI(printerNameListData){
            //print("onFillPrinterListSpecsUI 123")
            lv_printerList.model.clear()
            let i = -1
            printerNameListData.forEach(function (item, index) {
                if(item === printFabricPrintCodePage.defaultPrinter){
                    i = index
                }
                lv_printerList.model.append({"printerName_": item})
            })
            if (i === -1){
                printFabricPrintCodePage.defaultPrinter = lv_printerList.model.get(lv_printerList.currentIndex).printerName_
                printFabricPrintCodePageBridge.updateDefaultPrinterName(printFabricPrintCodePage.defaultPrinter)
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:32}D{i:30}
}
##^##*/
