import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import "../contents/fabricPagePopUp"
import QtQuick.Extras 1.4
import QtMultimedia 5.4

Item {
    id: fabricPage

    width: 1920
    height: 985

    property var locale: Qt.locale()
    property date currentTime //: new Date()
    property string timeString

    property real yarn1Count: 0.00
    property real yarn2Count: 0.00
    property real yarn3Count: 0.00
    property real yarn4Count: 0.00
    property real yarn5Count: 0.00

    property int yarn1Speed: 0
    property int yarn2Speed: 0
    property int yarn3Speed: 0
    property int yarn4Speed: 0
    property int yarn5Speed: 0

    property int yarn1ConeNum: 0
    property int yarn2ConeNum: 0
    property int yarn3ConeNum: 0
    property int yarn4ConeNum: 0
    property int yarn5ConeNum: 0

    property real yarn1M: 0.00
    property real yarn2M: 0.00
    property real yarn3M: 0.00
    property real yarn4M: 0.00
    property real yarn5M: 0.00
    property real totalM: 0.00

    property real yarn1Percent: 0.00
    property real yarn2Percent: 0.00
    property real yarn3Percent: 0.00
    property real yarn4Percent: 0.00
    property real yarn5Percent: 0.00

    property real roundsPer215: 0.00
    property real kgPer23h: 0.00

    property int length: 0
    property int run: 0
    property int offsetPosition: 0

    property string printCode
    property bool fabricTypeAlreadyUsed

    property var fabricMachinePageMessage

    property string customerAbbreviation : ""
    property string customerID : ""

    property string fabricPrintCodeOfCurrentRowOfLV_fabricConfig: ""
    property string met_: ""
    property string width_: ""

    Component.onCompleted: {
        if(fabricMachinePageMessage !== undefined){
            t_info.text = '"Quản Lý - Truy Xuất: Thông Tin Sản Xuất Mộc"'
            positionSign.x = 1068
            positionSign2.visible = true

            tf_fabricMet.text = fabricMachinePageMessage.MPKg_
            tf_fabricWide.text = fabricMachinePageMessage.Wide_

            tf_speed1.text = fabricMachinePageMessage.Yarn1Speed_
            tf_speed2.text = fabricMachinePageMessage.Yarn2Speed_
            tf_speed3.text = fabricMachinePageMessage.Yarn3Speed_
            tf_speed4.text = fabricMachinePageMessage.Yarn4Speed_
            tf_speed5.text = fabricMachinePageMessage.Yarn5Speed_

            tf_coneNum1.text = fabricMachinePageMessage.Yarn1ConeNum_
            tf_coneNum2.text = fabricMachinePageMessage.Yarn2ConeNum_
            tf_coneNum3.text = fabricMachinePageMessage.Yarn3ConeNum_
            tf_coneNum4.text = fabricMachinePageMessage.Yarn4ConeNum_
            tf_coneNum5.text = fabricMachinePageMessage.Yarn5ConeNum_

            tf_roundPerRoll.text = fabricMachinePageMessage.YarnRoundsPerRoll_

            var i = 0
            for (i = 0; i < cb_machineDia.model.count; i++) {
                if(cb_machineDia.model.get(i).dia === fabricMachinePageMessage.Dia_)
                {
                    cb_machineDia.currentIndex = i
                    break;
                }
            }
            for (i = 0; i < cb_gauge.model.count; i++) {
                if(cb_gauge.model.get(i).g === fabricMachinePageMessage.G_)
                {
                    cb_gauge.currentIndex = i
                    break;
                }
            }
        }
    }

    Rectangle {
        id: rectangle
        color: "#222222"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        function fabricConfigCodeRefesh(){
            currentTime = new Date()
            timeString = currentTime.toLocaleTimeString(locale, 'hh:mm') + " " + currentTime.toLocaleDateString(locale, 'dd/MM/yy')

            if(tf_fabricMet.text.indexOf(".") >= 0){
                met_ = tf_fabricMet.text.replace(".", "M")
            }
            else if(tf_fabricMet.text.indexOf(",") >= 0){
                met_ = tf_fabricMet.text.replace(",", "M")
            }
            else{
                met_ = tf_fabricMet.text + "M"
            }

            if(tf_fabricWide.text.indexOf(".") >= 0){
                width_ = tf_fabricWide.text.replace(".", "M")
            }
            else if(tf_fabricWide.text.indexOf(",") >= 0){
                width_ = tf_fabricWide.text.replace(",", "M")
            }
            else{
                width_ = tf_fabricWide.text + "M"
            }


            lb_fabricConfigCode.text =  fabricPage.customerAbbreviation + "-" + cb_fabricType.currentText + "-" + cb_yarnType1.currentText
                                        + "|" + met_ + "-" + width_ + "|" + cb_machineDia.currentText + "-" +  cb_gauge.currentText

            // old code with idea fabricConfigCode has yarn cone number information
//            if(tf_speed1.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + cb_yarnType1.currentText +  tf_speed1.text + tf_coneNum1.text}
//            if(tf_speed2.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + cb_yarnType2.currentText +  tf_speed2.text + tf_coneNum2.text}
//            if(tf_speed3.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + cb_yarnType3.currentText +  tf_speed3.text + tf_coneNum3.text}
//            if(tf_speed4.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + cb_yarnType4.currentText +  tf_speed4.text + tf_coneNum4.text}

            // new code
            if(tf_speed1.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + "|" + cb_yarnType1.currentText.replace("DTY","")}
            if(tf_speed2.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + "+" + cb_yarnType2.currentText.replace("DTY","")}
            if(tf_speed3.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + "+" + cb_yarnType3.currentText.replace("DTY","")}
            if(tf_speed4.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + "+" + cb_yarnType4.currentText.replace("DTY","")}
            if(tf_speed5.enabled){lb_fabricConfigCode.text = lb_fabricConfigCode.text + "+" + cb_yarnType5.currentText.replace("DTY","")}


            offsetPosition = 93 - lb_fabricConfigCode.text.length - 12
            for(run = 1; run <= offsetPosition; run++){
                lb_fabricConfigCode.text = lb_fabricConfigCode.text + " "
            }
            lb_fabricConfigCode.text =  lb_fabricConfigCode.text + timeString

            printCode = ""

            printCode = cb_fabricType.currentText + " " + cb_yarnType1.currentText

            if(sw_1.checked === true){
                printCode = printCode + " LOT " + cb_yarnType2.currentText
            }
            if(sw_2.checked === true){
                printCode = printCode + " - " + cb_yarnType3.currentText
            }
            printCode = printCode + " " + met_
            if(sw_3.checked === true){
                printCode = printCode + " " + width_
            }
            if(sw_4.checked === true){
                printCode = printCode + " " + cb_machineDia.currentText + "INCH"
            }
            if(sw_5.checked === true){
                printCode = printCode + " " + cb_gauge.currentText + "G"
            }

            printCode = printCode + " " + fabricPage.customerAbbreviation

            tf_fabricConfigPrintText.text = printCode
        }

        //===============================================================================================================================================
        Image {
            id: img_handinkJet7
            width: 542
            height: 361
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/AI_Sketch_HanJet.png"
            sourceSize.width: img_handinkJet7.width
            anchors.topMargin: 589
            fillMode: Image.PreserveAspectFit
            anchors.leftMargin: 416
            sourceSize.height: img_handinkJet7.height
            antialiasing: true

        }

        ListView {
            id: lv_fabricConfig
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: tf_search.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 992
            anchors.rightMargin: 14
            anchors.topMargin: 3
            anchors.bottomMargin: 60
            spacing: 3
            model: ListModel {
                ListElement{
                    index_: ""  //FabricConfigId        1
                    data1: ""   //Code1                 2
                    data2: ""   //PrintCode             3
                    FabricType_FabricTypeId_: ""    //  4
                    MPKg_: ""                       //  5
                    Wide_: ""
                    YarnLotId1_: ""                //  6
                    YarnLotId2_: ""                //  7
                    YarnLotId3_: ""                //  8
                    YarnLotId4_: ""                //  9
                    YarnLotId5_: ""
                    Yarn1Speed_: ""                 //  10
                    Yarn2Speed_: ""                 //  11
                    Yarn3Speed_: ""                 //  12
                    Yarn4Speed_: ""                 //  13
                    Yarn5Speed_: ""                 //
                    Yarn1ConeNum_: ""               //  14
                    Yarn2ConeNum_: ""               //  15
                    Yarn3ConeNum_: ""               //  16
                    Yarn4ConeNum_: ""               //  17
                    Yarn5ConeNum_: ""               //
                    YarnRoundsPerRoll_: ""           //  18
                    Dia_: ""
                    G_: ""
                    CustomerId_: ""
                }
            }
            delegate: DLG_FabricConfig{rowWidth: lv_fabricConfig.width
                rowHeigh :40 }

            Component.onCompleted: {
                fabricPageBridge.lv_fabricConfigCompleted()
            }

            Rectangle {
                width: parent.width
                height: 40
                color: "#222222"
                anchors.left: parent.left
                anchors.bottom: parent.top
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                width: parent.width
                height: 40
                color: "#222222"
                anchors.left: parent.left
                anchors.top: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
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
        //====================================================================================================== LISTVIEW YARNTYPE

        //====================================================================================================== LISTVIEW PRODUCER
        //====================================================================================================== END LISTVIEW PRODUCER

        Image {
            id: img_handinkJet
            width: 40
            height: 40
            anchors.left: parent.left
            anchors.leftMargin: 33
            anchors.top: parent.top
            anchors.topMargin: 102
            source: "../../images/page_images/fabricPage/handInkJet.svg"
            //fillMode: Image.PreserveAspectFit
            //fillMode: Image.PreserveAspectFit
            sourceSize.width: img_handinkJet.width
            sourceSize.height: img_handinkJet.height
            visible: true
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }

        Rectangle {
            id: rectangle1
            x: 24
            y: 19
            width: 341
            height: 24
            color: "#00ff00"
            radius: 13
            Label {
                id: label1
                width: label1.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Tạo mới 1 thông tin sản xuất mộc:")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 12

            }
        }



        Rectangle {
            id: rec_fabricConfigCode
            height: 40
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            anchors.left: parent.left
            anchors.right: tf_fabricWide.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 14
            Label {
                id: lb_fabricConfigCode
                y: 5
                width: 397
                height: 28
                color: "#ffffff"
                text: qsTr("MÃ THÔNG TIN SẢN XUẤT MỘC")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                topPadding: -3
                anchors.verticalCenterOffset: 0

                font.family: "Space Mono"
                font.pointSize: 11
                anchors.leftMargin: 8
            }
            anchors.topMargin: 55
        }
        //======================================================================= COMBOBOX YARN TYPE
        ComboBox {
            id: cb_fabricType
            height: 40
            anchors.left: parent.left
            anchors.right: cb_machineDia.left
            anchors.top: tf_fabricConfigPrintText.bottom
            anchors.leftMargin: 100
            anchors.rightMargin: 3
            anchors.topMargin: 6
            font.family: "Ubuntu Mono"
            font.pointSize: 13
            transformOrigin: Item.Center
            textRole: "text_"
            model: ListModel {
                ListElement{
                    index_: ""
                    text_: ""
                }
            }
            indicator: Canvas {
                x: parent.width - width - parent.rightPadding
                y: parent.topPadding + (parent.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                    context.fill();
                }
            }
            contentItem: Text {
                text: parent.displayText
                color: "white"
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
            background: Rectangle {
                    color: "#5500ff00"
                    radius: 2
                    border.color: "#00ff00"
            }
            delegate: ItemDelegate {
                id:itemDlgt
                width: cb_fabricType.width
                height:40

                contentItem: Item {
                    id: cti_ItemDelegate
                      width: cb_fabricType.width
                      height: 40
                      anchors.top: parent.top
                      anchors.left: parent.left
                      Rectangle{
                          id: rectIndex
                          width: 60
                          height: 39
                          anchors.top: parent.top
                          anchors.topMargin: 1
                          anchors.left: parent.left
                          color: "white"
                          radius: 2
                          Text {
                              anchors.verticalCenter: parent.verticalCenter
                              anchors.left: parent.left
                              anchors.leftMargin: 8
                              horizontalAlignment: Text.AlignHCenter
                              text: index +1
                              //color: hovered?"black":"red"
                              font: cb_fabricType.font
                              elide: Text.ElideRight
                          }
                      }
                      Rectangle{
                          width: cb_fabricType.width - rectIndex.width
                          height: 39
                          anchors.top: parent.top
                          anchors.topMargin: 1
                          anchors.left: rectIndex.right
                          anchors.leftMargin: 1
                          color: "white"
                          radius: 2
                          Text {
                              anchors.verticalCenter: parent.verticalCenter
                              anchors.left: parent.left
                              anchors.leftMargin: 10
                              text: text_
                              font: cb_fabricType.font
                              elide: Text.ElideRight

                          }
                      }
                  }

                 background: Rectangle {
                    radius: 1
                    color: "#e6e6e6"//parent.hovered?"#507BF6":"white";
                    anchors.left: parent.left
                    anchors.top: parent.top
                    width:parent.width
                  }
            }
            Component.onCompleted: {
                fabricPageBridge.cb_fabricTypeCompleted()

                if(fabricMachinePageMessage !== undefined){
                    var i = 0
                    for (i = 0; i < cb_fabricType.model.count; i++) {
                        print("cb_fabricType.model.get(i).index_", cb_fabricType.model.get(i).index_)
                        print("fabricMachinePageMessage.FabricType_FabricTypeId_", fabricMachinePageMessage.FabricType_FabricTypeId_)
                        if(cb_fabricType.model.get(i).index_ === fabricMachinePageMessage.FabricType_FabricTypeId_)
                        {
                            break;
                        }
                    }
                    cb_fabricType.currentIndex = i
                }
            }
            onCurrentTextChanged: {
                rectangle.fabricConfigCodeRefesh()
            }
        }
//======================================================================= end COMBOBOX YARN TYPE

        Button {
            id: bt_addFabricConfig
            width: 234
            height: 40
            text: qsTr("Tạo mới")
            anchors.left: parent.left
            anchors.top: rec_percent.bottom
            anchors.topMargin: 5
            anchors.leftMargin: 17
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 11
            background: Rectangle{
                anchors.fill: parent
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
            }
            onClicked: {
                if((cb_yarnType2.currentText != "" && cb_yarnType2.currentText != "---") && (tf_speed2.text == "" || tf_coneNum2.text == "" )){pu_addFabricConfigWithNoText.open()}
                else if((cb_yarnType3.currentText != "" && cb_yarnType3.currentText != "---") && (tf_speed3.text == "" || tf_coneNum3.text == "" )){pu_addFabricConfigWithNoText.open()}
                else if((cb_yarnType4.currentText != "" && cb_yarnType4.currentText != "---") && (tf_speed4.text == "" || tf_coneNum4.text == "" )){pu_addFabricConfigWithNoText.open()}
                else if((cb_yarnType5.currentText != "" && cb_yarnType5.currentText != "---") && (tf_speed5.text == "" || tf_coneNum5.text == "" )){pu_addFabricConfigWithNoText.open()}
                else if(         cb_fabricType.currentText == ""
                        ||  cb_yarnType1.currentText == ""
                        ||  tf_fabricMet.text == ""
                        ||  tf_speed1.text == ""
                        ||  tf_coneNum1.text == ""
                        ||  tf_roundPerRoll.text == ""
                        ||  fabricPage.customerAbbreviation == ""
                        )
                {
                    pu_addFabricConfigWithNoText.open()
                }
                else
                {
                    pu_addFabricConfig.open()
                }
                se_btnClicked.play()
            }
        }


        //=================================================================================== bt_AddYarnType
        //=========================================================================================================== Button Add ProducerProducer
        ListView {
            id: lv_fabricType
            width: 454
            height: 300
            anchors.left: parent.left
            anchors.top: parent.top

            anchors.leftMargin: 992

            anchors.topMargin: 40
            spacing: 3
            model: ListModel {
                ListElement{
                    index_: ""
                    text_: ""
                }
            }
            delegate: DLG_OneText{rowWidth: 454
                rowHeigh :40 }
            Component.onCompleted: {
                fabricPageBridge.lv_fabricTypeCompleted()
            }
            onCurrentIndexChanged: {
                tf_editFabricType.text = lv_fabricType.model.get(lv_fabricType.currentIndex).text_
                fabricPageBridge.tf_editFabricTypeChangedNeedToUpdateAlreadyUseVariable(lv_fabricType.model.get(lv_fabricType.currentIndex).text_)
            }

            Rectangle {
                y: -38
                width: 464
                height: 38
                color: "#222222"
                anchors.left: parent.left
                anchors.bottom: parent.top
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                width: 464
                height: 40
                color: "#222222"
                anchors.left: parent.left
                anchors.top: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
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
            id: rec_bg4
            color: "#222222"
            radius: 2
            anchors.left: parent.left
            anchors.right: parent.right


            anchors.leftMargin: 990

            anchors.rightMargin: 440
        }

        Button {
            id: bt_viewDetail
            width: 261
            height: 40
            text: qsTr("Xem chi tiết / Tạo biến thể")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 934
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            font.bold: false
            font.weight: Font.Normal
            anchors.leftMargin: 992
            onClicked: {

                se_btnClicked.play()
                if(lv_fabricConfig.currentIndex != -1){
                    cb_yarnType2.currentIndex = -1
                    cb_yarnType3.currentIndex = -1
                    cb_yarnType4.currentIndex = -1
                    cb_yarnType5.currentIndex = -1

                    var i = 0
                    for (i = 0; i < cb_fabricType.model.count; i++) {
                        if(cb_fabricType.model.get(i).index_ === lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).FabricType_FabricTypeId_)
                        {
                            break;
                        }
                    }
                    cb_fabricType.currentIndex = i

                    fabricPageBridge.yarnDetails(lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnLotId1_,
                                                 lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnLotId2_,
                                                 lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnLotId3_,
                                                 lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnLotId4_,
                                                 lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnLotId5_)

                    tf_fabricMet.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).MPKg_
                    tf_fabricWide.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Wide_

                    tf_speed1.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn1Speed_
                    tf_speed2.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn2Speed_
                    tf_speed3.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn3Speed_
                    tf_speed4.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn4Speed_
                    tf_speed5.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn5Speed_

                    tf_coneNum1.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn1ConeNum_
                    tf_coneNum2.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn2ConeNum_
                    tf_coneNum3.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn3ConeNum_
                    tf_coneNum4.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn4ConeNum_
                    tf_coneNum5.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Yarn5ConeNum_

                    tf_roundPerRoll.text = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).YarnRoundsPerRoll_

                    for (i = 0; i < cb_machineDia.model.count; i++) {
                        if(cb_machineDia.model.get(i).dia === lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).Dia_)
                        {
                            cb_machineDia.currentIndex = i
                            break;
                        }
                    }
                    for (i = 0; i < cb_gauge.model.count; i++) {
                        if(cb_gauge.model.get(i).g === lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).G_)
                        {
                            cb_gauge.currentIndex = i
                            break;
                        }
                    }
                    for (i = 0; i < cb_customer.model.count; i++) {
                        if(cb_customer.model.get(i).id_ === lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).CustomerId_)
                        {
                            cb_customer.currentIndex = i
                            break;
                        }
                    }
                    tf_fabricConfigPrintText.text = fabricPage.fabricPrintCodeOfCurrentRowOfLV_fabricConfig

                }
            }
        }

        TextField {
            id: tf_search
            height: 40
            anchors.left: lv_fabricConfig.left
            anchors.right: lv_fabricConfig.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            topPadding: 8
            font.pointSize: 13
            anchors.topMargin: 411
            font.weight: Font.Bold
            font.capitalization: Font.MixedCase
            placeholderText: qsTr("Nhập mã thông tin sản xuất muốn tìm...")

            onTextChanged: {
                fabricPageBridge.tf_searchChanged(tf_search.text)
            }

        }
//------------------------------------------------------------------------------------------------------------------------------
        Rectangle {
            id: rec_yarnElement
            height: 260
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            border.width: 0
            anchors.left: rec_fabricConfigCode.left
            anchors.right: rec_fabricConfigCode.right
            anchors.top: cb_fabricType.bottom
            anchors.topMargin: 5
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Rectangle{
                id: rec1
                width: cb_yarnType1.width
                height: cb_yarnType1.height
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 86
                anchors.topMargin: 3
                Label {
                    id: label25
                    x: 163
                    y: 197
                    width: label25.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("Thành phần sợi")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    anchors.bottomMargin: 0
                    font.pointSize: 11
                }
            }
            Rectangle{
                id: rec2
                width: cb_yarnLot1.width
                height: cb_yarnType1.height
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.left: rec1.right
                anchors.top: rec1.top
                anchors.leftMargin: 3
                anchors.topMargin: 0
                Label {
                    id: label11
                    x: 370
                    y: 197
                    width: label11.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("Mã lô sợi")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    font.pointSize: 11
                }
            }

            Rectangle{
                id: rec3
                width: tf_speed1.width
                height: cb_yarnType1.height
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.left: rec2.right
                anchors.top: rec2.top
                anchors.leftMargin: 3
                anchors.topMargin: 0
                Label {
                    id: label17
                    x: 694
                    y: 204
                    width: label17.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("Tốc độ")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    font.pointSize: 11
                }
            }

            Rectangle{
                id: rec4
                width: tf_coneNum1.width
                height: tf_coneNum1.height
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.left: rec3.right
                anchors.top: rec3.top
                anchors.leftMargin: 3
                anchors.topMargin: 0
                Label {
                    id: label21
                    x: 783
                    y: 203
                    width: label21.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("Số cối")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    font.pointSize: 11
                }
            }
            ComboBox {
                id: cb_yarnType1
                width: 165
                height: 40
                anchors.left: rec1.left
                anchors.top: rec1.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                font.pointSize: 15
                textRole: "text_"
                model: ListModel {
                    ListElement{
                        index_: " "
                        text_: " "
                        d_: " "
                    }
                }
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                delegate: ItemDelegate {
                    id:itemDlgt1
                    width: parent.width
                    height:40
                    contentItem: Item {
                        id: cti_ItemDelegate1
                          width: parent.width
                          height: 40
                          anchors.top: parent.top
                          anchors.left: parent.left
                          Rectangle{
                              id: rectIndex1
                              width: 38
                              height: 39
                              anchors.top: parent.top
                              anchors.topMargin: 1
                              anchors.left: parent.left
                              color: "white"
                              radius: 2
                              Text {
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.left: parent.left
                                  anchors.leftMargin: 6
                                  horizontalAlignment: Text.AlignHCenter
                                  text: index +1
                                  //color: hovered?"black":"red"
                                  font: cb_fabricType.font
                                  elide: Text.ElideRight
                              }
                          }
                          Rectangle{
                              width: cb_yarnType1.width - rectIndex1.width - 1
                              height: 39
                              anchors.top: parent.top
                              anchors.topMargin: 1
                              anchors.left: rectIndex1.right
                              anchors.leftMargin: 1
                              color: "white"
                              radius: 2
                              Text {
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.left: parent.left
                                  anchors.leftMargin: 10
                                  text: text_
                                  //color: hovered?"black":"red"
                                  font: cb_fabricType.font
                                  elide: Text.ElideRight
                              }
                          }
                    }
                    background: Rectangle {
                       radius: 1
                       color: "#e6e6e6"//parent.hovered?"#507BF6":"white";
                       anchors.left: parent.left
                       anchors.top: parent.top
                       width:parent.width
                     }
                }
                Component.onCompleted: {
                    fabricPageBridge.cb_yarnType1Completed()
                    if(fabricMachinePageMessage !== undefined){
                        if (fabricMachinePageMessage.YarnLotId1_ !== "None"){
                            fabricPageBridge.yarn1Details(fabricMachinePageMessage.YarnLotId1_)
                        }
                    }
                }
                onCurrentTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    fabricPageBridge.updateYarnLot1Model(cb_yarnType1.currentText)
                    lb_percentYT1.text ="% " + cb_yarnType1.currentText + ":"
                    if(cb_yarnType1.currentText != "" && cb_yarnType1.currentText != "---"){
                        yarn1Count = parseFloat(cb_yarnType1.model.get(cb_yarnType1.currentIndex).d_)
                    }else{
                        yarn1Count = 0.0
                    }
                    yarn1M = yarn1ConeNum*yarn1Speed*yarn1Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M

                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM

                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"

                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)

                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
            }
            ComboBox {
                id: cb_yarnType2
                width: 165
                height: 40
                anchors.left: cb_yarnType1.left
                anchors.top: cb_yarnType1.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                delegate: cb_yarnType1.delegate
                model: cb_yarnType1.model
                font.weight: Font.Normal
                font.bold: false
                font.pointSize: 15
                textRole: "text_"
                onCurrentTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    fabricPageBridge.updateYarnLot2Model(cb_yarnType2.currentText)
                    lb_percentYT2.text ="% " + cb_yarnType2.currentText + ":"
                    if(cb_yarnType2.currentText != "" && cb_yarnType2.currentText != "---"){
                        yarn2Count = parseFloat(cb_yarnType2.model.get(cb_yarnType2.currentIndex).d_)
                    }else{
                        yarn2Count = 0.0
                    }
                    yarn2M = yarn2ConeNum*yarn2Speed*yarn2Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
                Component.onCompleted: {
                    if(fabricMachinePageMessage !== undefined){
                        if(fabricMachinePageMessage.YarnLotId2_ !== "None"){
                            fabricPageBridge.yarn2Details(fabricMachinePageMessage.YarnLotId2_)
                        }
                    }
                }
            }
            ComboBox {
                id: cb_yarnType3
                width: 165
                height: 40
                anchors.left: cb_yarnType2.left
                anchors.top: cb_yarnType2.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                font.pointSize: 15
                textRole: "text_"
                model: ListModel {
                    ListElement{
                        index_: " "
                        text_: " "
                        d_: " "
                    }
                }
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                delegate: cb_yarnType1.delegate
                Component.onCompleted: {
                    fabricPageBridge.cb_yarnType3Completed()
                    if(fabricMachinePageMessage !== undefined){
                        if(fabricMachinePageMessage.YarnLotId3_ !== "None"){
                            fabricPageBridge.yarn3Details(fabricMachinePageMessage.YarnLotId3_)
                        }
                    }
                }
                onCurrentTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    fabricPageBridge.updateYarnLot3Model(cb_yarnType3.currentText)
                    lb_percentYT3.text = "% " + cb_yarnType3.currentText + ":"
                    if(cb_yarnType3.currentText != "" && cb_yarnType3.currentText != "---"){
                        yarn3Count = parseFloat(cb_yarnType3.model.get(cb_yarnType3.currentIndex).d_)
                    }else{
                        yarn3Count = 0.0
                    }
                    yarn3M = yarn3ConeNum*yarn3Speed*yarn3Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
            }
            ComboBox {
                id: cb_yarnType4
                width: 165
                height: 40
                anchors.left: cb_yarnType3.left
                anchors.top: cb_yarnType3.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                font.pointSize: 15
                textRole: "text_"
                delegate: cb_yarnType1.delegate
                model: cb_yarnType1.model
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                onCurrentTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    fabricPageBridge.updateYarnLot4Model(cb_yarnType4.currentText)
                    lb_percentYT4.text = "% " + cb_yarnType4.currentText + ":"
                    if(cb_yarnType4.currentText != "" && cb_yarnType4.currentText != "---"){
                        yarn4Count = parseFloat(cb_yarnType4.model.get(cb_yarnType4.currentIndex).d_)
                    }else{
                        yarn4Count = 0.0
                    }
                    yarn4M = yarn4ConeNum*yarn4Speed*yarn4Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
                Component.onCompleted: {
                    if(fabricMachinePageMessage !== undefined){
                        if(fabricMachinePageMessage.YarnLotId4_ !== "None"){
                            fabricPageBridge.yarn4Details(fabricMachinePageMessage.YarnLotId4_)
                        }
                    }
                }
            }

            ComboBox {
                id: cb_yarnType5
                width: 165
                height: 40
                anchors.left: cb_yarnType3.left
                anchors.top: cb_yarnType4.bottom
                Component.onCompleted: {
                                if(fabricMachinePageMessage !== undefined){
                                    if(fabricMachinePageMessage.YarnLotId5_ !== "None"){
                                        fabricPageBridge.yarn5Details(fabricMachinePageMessage.YarnLotId5_)
                                    }
                                }
                            }
                font.weight: Font.Normal
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    onPaint: {
                                    context.reset();
                                    context.moveTo(0, 0);
                                    context.lineTo(width, 0);
                                    context.lineTo(width / 2, height);
                                    context.closePath();
                                    context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                                    context.fill();
                    }
                    contextType: "2d"
                }
                anchors.leftMargin: 0
                textRole: "text_"
                font.pointSize: 15
                model: cb_yarnType1.model
                contentItem: Text {
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                font.bold: false
                transformOrigin: Item.Center
                delegate: cb_yarnType1.delegate
                anchors.topMargin: 3
                background: Rectangle {
                    color: "#5500ff00"
                    radius: 2
                    border.color: "#00ff00"
                }
                onCurrentTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    fabricPageBridge.updateYarnLot5Model(cb_yarnType5.currentText)
                    lb_percentYT5.text = "% " + cb_yarnType5.currentText + ":"
                    if(cb_yarnType5.currentText != "" && cb_yarnType5.currentText != "---"){
                        yarn5Count = parseFloat(cb_yarnType5.model.get(cb_yarnType5.currentIndex).d_)
                    }else{
                        yarn5Count = 0.0
                    }
                    yarn5M = yarn5ConeNum*yarn5Speed*yarn5Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
            }

            ComboBox {
                id: cb_yarnLot1
                width: 524
                height: 40
                anchors.left: cb_yarnType1.right
                anchors.top: cb_yarnType1.top
                anchors.leftMargin: 3
                anchors.topMargin: 0
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                font.pointSize: 15
                textRole: "text_"
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                model: ListModel {
                    ListElement{
                        index_: ""
                        text_: ""
                        yarnType_: ""
                        producer_: ""
                        lot_: ""
                    }
                }
                delegate: ItemDelegate {
                    id:itemDlgt_cb_yarnLot1
                    width: cb_yarnLot1.width
                    height:40
                    contentItem: Item {
                          width: parent.width
                          height: 40
                          anchors.top: parent.top
                          anchors.left: parent.left
                          Rectangle{
                              id: rectIndex_cb_yarnLot1
                              width: 42
                              height: 39
                              anchors.top: parent.top
                              anchors.topMargin: 1
                              anchors.left: parent.left
                              color: "white"
                              radius: 2
                              Text {
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.left: parent.left
                                  anchors.leftMargin: 6
                                  horizontalAlignment: Text.AlignHCenter
                                  text: index +1
                                  //color: hovered?"black":"red"
                                  font: cb_fabricType.font
                                  elide: Text.ElideRight
                              }
                          }
                          Rectangle{
                              width: itemDlgt_cb_yarnLot1.width - rectIndex_cb_yarnLot1.width - 1
                              height: 39
                              anchors.top: parent.top
                              anchors.topMargin: 1
                              anchors.left: rectIndex_cb_yarnLot1.right
                              anchors.leftMargin: 1
                              color: "white"
                              radius: 2
                              Text {
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.left: parent.left
                                  anchors.leftMargin: 10
                                  text: text_
                                  //color: hovered?"black":"red"
                                  font: cb_fabricType.font
                                  elide: Text.ElideRight
                              }
                          }
                    }
                    background: Rectangle {
                       radius: 1
                       color: "#e6e6e6"//parent.hovered?"#507BF6":"white";
                       anchors.left: parent.left
                       anchors.top: parent.top
                       width:parent.width
                     }
                }
                onCurrentTextChanged: {
                    if(cb_yarnLot1.currentText != ""){
                        tf_speed1.enabled = true
                        tf_coneNum1.enabled = true
                    }
                    else{
                        tf_speed1.enabled = false
                        tf_coneNum1.enabled = false
                    }
                }
            }
            ComboBox {
                id: cb_yarnLot2
                width: 524
                height: 40
                anchors.left: cb_yarnLot1.left
                anchors.top: cb_yarnLot1.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                model: ListModel {
                    ListElement{
                        index_: ""
                        text_: ""
                        yarnType_: ""
                        producer_: ""
                        lot_: ""
                    }
                }
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                delegate: cb_yarnLot1.delegate
                font.weight: Font.Normal
                font.bold: false
                textRole: "text_"
                font.pointSize: 15
                onCurrentTextChanged: {
                    if(cb_yarnLot2.currentText != ""){
                        tf_speed2.enabled = true
                        tf_coneNum2.enabled = true
                    }
                    else{
                        tf_speed2.enabled = false
                        tf_coneNum2.enabled = false
                    }
                }
            }
            ComboBox {
                id: cb_yarnLot3
                width: 524
                height: 40
                anchors.left: cb_yarnLot2.left
                anchors.top: cb_yarnLot2.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                textRole: "text_"
                font.pointSize: 15
                delegate: cb_yarnLot1.delegate
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                model: ListModel {
                    ListElement{
                        index_: ""
                        text_: ""
                        yarnType_: ""
                        producer_: ""
                        lot_: ""
                    }
                }
                onCurrentTextChanged: {
                    if(cb_yarnLot3.currentText != ""){
                        tf_speed3.enabled = true
                        tf_coneNum3.enabled = true
                    }
                    else{
                        tf_speed3.enabled = false
                        tf_coneNum3.enabled = false
                    }
                }
            }
            ComboBox {
                id: cb_yarnLot4
                width: 524
                height: 40
                anchors.left: cb_yarnLot3.left
                anchors.top: cb_yarnLot3.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                textRole: "text_"
                font.pointSize: 15
                model: ListModel {
                    ListElement{
                        index_: ""
                        text_: ""
                        yarnType_: ""
                        producer_: ""
                        lot_: ""
                    }
                }
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                        color: "#5500ff00"
                        radius: 2
                        border.color: "#00ff00"
                }
                delegate: cb_yarnLot1.delegate
                onCurrentTextChanged: {
                    if(cb_yarnLot4.currentText != ""){
                        tf_speed4.enabled = true
                        tf_coneNum4.enabled = true
                    }
                    else{
                        tf_speed4.enabled = false
                        tf_coneNum4.enabled = false
                    }
                }
            }
            ComboBox {
                id: cb_yarnLot5
                width: 524
                height: 40
                anchors.left: cb_yarnLot3.left
                anchors.top: cb_yarnLot4.bottom
                model: ListModel {
                    ListElement {
                        index_: ""
                        yarnType_: ""
                        lot_: ""
                        producer_: ""
                        text_: ""
                    }
                }
                background: Rectangle {
                    color: "#5500ff00"
                    radius: 2
                    border.color: "#00ff00"
                }
                delegate: cb_yarnLot1.delegate
                font.weight: Font.Normal
                font.bold: false
                indicator: Canvas {
                    x: parent.width - width - parent.rightPadding
                    y: parent.topPadding + (parent.availableHeight - height) / 2
                    width: 12
                    height: 8
                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                    contextType: "2d"
                }
                anchors.topMargin: 3
                onCurrentTextChanged: {
                    if(cb_yarnLot5.currentText != ""){
                        tf_speed5.enabled = true
                        tf_coneNum5.enabled = true
                    }
                    else{
                        tf_speed5.enabled = false
                        tf_coneNum5.enabled = false
                    }
                }
                transformOrigin: Item.Center
                font.pointSize: 15
                textRole: "text_"
                contentItem: Text {
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                anchors.leftMargin: 0
            }

            TextField {
                id: tf_speed1
                width: 83
                height: 40
                anchors.left: cb_yarnLot1.right
                anchors.top: cb_yarnLot1.top
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 3
                font.capitalization: Font.AllUppercase
                placeholderText: qsTr("?")
                anchors.topMargin: 0
                topPadding: 8
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false

                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }

                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_speed1.text == ""){yarn1Speed = 0}
                    else{yarn1Speed = parseInt(tf_speed1.text)}

                    yarn1M = yarn1ConeNum*yarn1Speed*yarn1Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
            }
            TextField {
                id: tf_speed2
                x: 724
                y: 298
                width: 83
                height: 40
                anchors.left: tf_speed1.left
                anchors.top: tf_speed1.bottom
                horizontalAlignment: Text.AlignHCenter
                topPadding: 8
                anchors.leftMargin: 0
                font.capitalization: Font.AllUppercase
                anchors.topMargin: 3
                placeholderText: qsTr("?")

                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }

                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_speed2.text == ""){yarn2Speed = 0}
                    else{yarn2Speed = parseInt(tf_speed2.text)}

                    yarn2M = yarn2ConeNum*yarn2Speed*yarn2Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_speed2.text === "None"){
                        tf_speed2.text = ""
                    }
                }
            }
            TextField {
                id: tf_speed3
                x: 745
                y: 328
                width: 83
                height: 40
                anchors.left: tf_speed2.left
                anchors.top: tf_speed2.bottom
                horizontalAlignment: Text.AlignHCenter
                topPadding: 8
                anchors.leftMargin: 0
                font.capitalization: Font.AllUppercase
                anchors.topMargin: 3
                placeholderText: qsTr("?")
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_speed3.text == ""){yarn3Speed =  0}
                    else{yarn3Speed = parseInt(tf_speed3.text)}

                    yarn3M = yarn3ConeNum*yarn3Speed*yarn3Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_speed3.text === "None"){
                        tf_speed3.text = ""
                    }
                }
            }
            TextField {
                id: tf_speed4
                x: 745
                y: 416
                width: 83
                height: 40
                text: ""
                anchors.left: tf_speed3.left
                anchors.top: tf_speed3.bottom
                horizontalAlignment: Text.AlignHCenter
                topPadding: 8
                anchors.leftMargin: 0
                font.capitalization: Font.AllUppercase
                anchors.topMargin: 3
                placeholderText: qsTr("?")
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_speed4.text == ""){yarn4Speed = 0}
                    else{yarn4Speed = parseInt(tf_speed4.text)}

                    yarn4M = yarn4ConeNum*yarn4Speed*yarn4Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_speed4.text === "None"){
                        tf_speed4.text = ""
                    }
                }
            }
            TextField {
                id: tf_speed5
                x: 751
                y: 422
                width: 83
                height: 40
                color: "#ffffff"
                text: ""
                anchors.left: tf_speed3.left
                anchors.top: tf_speed4.bottom
                horizontalAlignment: Text.AlignHCenter
                placeholderText: qsTr("?")
                anchors.leftMargin: 0
                font.capitalization: Font.AllUppercase
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_speed5.text == ""){yarn5Speed = 0}
                    else{yarn5Speed = parseInt(tf_speed5.text)}

                    yarn5M = yarn5ConeNum*yarn5Speed*yarn5Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_speed5.text === "None"){
                        tf_speed5.text = ""
                    }
                }
                font.pointSize: 14
                placeholderTextColor: "#00ff00"
                topPadding: 8
                inputMethodHints: Qt.ImhDigitsOnly
                anchors.topMargin: 3
                background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
                }
                enabled: false
            }


            TextField {
                id: tf_coneNum1
                x: 812
                y: 43
                width: 83
                height: 40
                anchors.left: tf_speed1.right
                anchors.top: tf_speed1.top
                horizontalAlignment: Text.AlignHCenter
                topPadding: 8
                anchors.leftMargin: 3
                font.capitalization: Font.AllUppercase
                anchors.topMargin: 0
                placeholderText: qsTr("?")
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_coneNum1.text == ""){yarn1ConeNum = 0}
                    else{yarn1ConeNum = parseInt(tf_coneNum1.text)}

                    yarn1M = yarn1ConeNum*yarn1Speed*yarn1Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
            }
            TextField {
                id: tf_coneNum2
                width: 83
                height: 40
                anchors.left: tf_coneNum1.left
                anchors.top: tf_coneNum1.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 0
                anchors.topMargin: 3
                topPadding: 8
                font.capitalization: Font.AllUppercase
                placeholderText: qsTr("?")
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_coneNum2.text == ""){yarn2ConeNum = 0}
                    else{yarn2ConeNum = parseInt(tf_coneNum2.text)}

                    yarn2M = yarn2ConeNum*yarn2Speed*yarn2Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_coneNum2.text === "None"){
                        tf_coneNum2.text = ""
                    }
                }
            }
            TextField {
                id: tf_coneNum3
                width: 83
                height: 40
                anchors.left: tf_coneNum2.left
                anchors.top: tf_coneNum2.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 0
                anchors.topMargin: 3
                topPadding: 8
                font.capitalization: Font.AllUppercase
                placeholderText: qsTr("?")
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_coneNum3.text == ""){yarn3ConeNum = 0}
                    else{yarn3ConeNum = parseInt(tf_coneNum3.text)}

                    yarn3M = yarn3ConeNum*yarn3Speed*yarn3Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_coneNum3.text === "None"){
                        tf_coneNum3.text = ""
                    }
                }
            }
            TextField {
                id: tf_coneNum4
                width: 83
                height: 40
                anchors.left: tf_coneNum3.left
                anchors.top: tf_coneNum3.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 0
                anchors.topMargin: 3
                topPadding: 8
                font.capitalization: Font.AllUppercase
                placeholderText: qsTr("?")
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                enabled: false
                onTextChanged: {
                    rectangle.fabricConfigCodeRefesh()
                    if(tf_coneNum4.text == ""){yarn4ConeNum = 0}
                    else{yarn4ConeNum = parseInt(tf_coneNum4.text)}

                    yarn4M = yarn4ConeNum*yarn4Speed*yarn4Count/900000
                    totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                    yarn1Percent = yarn1M*100/totalM
                    yarn2Percent = yarn2M*100/totalM
                    yarn3Percent = yarn3M*100/totalM
                    yarn4Percent = yarn4M*100/totalM
                    yarn5Percent = yarn5M*100/totalM
                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                    lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                    roundsPer215 = 21500/totalM
                    lb_roundsPer215.text = roundsPer215.toFixed(2)
                    kgPer23h = 23*60*20*totalM/1000
                    lb_kgPerPDay.text = kgPer23h.toFixed(2)

                    if(tf_coneNum4.text === "None"){
                        tf_coneNum4.text = ""
                    }
                }
            }
            TextField {
                id: tf_coneNum5
                width: 83
                height: 40
                color: "#ffffff"
                anchors.left: tf_coneNum3.left
                anchors.top: tf_coneNum4.bottom
                horizontalAlignment: Text.AlignHCenter
                background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
                }
                topPadding: 8
                onTextChanged: {
                                rectangle.fabricConfigCodeRefesh()
                                if(tf_coneNum5.text == ""){yarn5ConeNum = 0}
                                else{yarn5ConeNum = parseInt(tf_coneNum5.text)}

                                yarn5M = yarn5ConeNum*yarn5Speed*yarn5Count/900000
                                totalM = yarn1M + yarn2M +yarn3M + yarn4M + yarn5M
                                yarn1Percent = yarn1M*100/totalM
                                yarn2Percent = yarn2M*100/totalM
                                yarn3Percent = yarn3M*100/totalM
                                yarn4Percent = yarn4M*100/totalM
                                yarn5Percent = yarn5M*100/totalM
                                lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
                                lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
                                lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
                                lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
                                lb_percentValue5.text = yarn5Percent.toFixed(2) + "%"
                                roundsPer215 = 21500/totalM
                                lb_roundsPer215.text = roundsPer215.toFixed(2)
                                kgPer23h = 23*60*20*totalM/1000
                                lb_kgPerPDay.text = kgPer23h.toFixed(2)

                                if(tf_coneNum5.text === "None"){
                                    tf_coneNum5.text = ""
                                }
                }
                font.capitalization: Font.AllUppercase
                enabled: false
                anchors.topMargin: 3
                font.pointSize: 14
                inputMethodHints: Qt.ImhDigitsOnly
                placeholderTextColor: "#00ff00"
                anchors.leftMargin: 0
                placeholderText: qsTr("?")
            }


            Rectangle {
                id: rec5
                height: cb_yarnType1.height
                color: "#ed5564"
                radius: 2
                border.color: "#ed5564"
                border.width: 2
                anchors.left: parent.left
                anchors.right: cb_yarnType1.left
                anchors.top: cb_yarnType1.top
                anchors.rightMargin: 3
                Label {
                    id: label26
                    x: 163
                    y: 197
                    width: label26.contentWidth
                    height: 28
                    color: "#000000"
                    text: qsTr("Chính")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                }
                anchors.leftMargin: 3
                anchors.topMargin: 0
            }

            Rectangle {
                id: rec6
                height: cb_yarnType1.height
                color: "#ffce54"
                radius: 2
                border.color: "#ffce54"
                border.width: 2
                anchors.left: rec5.left
                anchors.right: rec5.right
                anchors.top: cb_yarnType2.top
                Label {
                    id: label27
                    x: 163
                    y: 197
                    width: label27.contentWidth
                    height: 28
                    color: "#000000"
                    text: qsTr("Phụ 1")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                }
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
            }

            Rectangle {
                id: rec7
                height: cb_yarnType1.height
                color: "#a0d568"
                radius: 2
                border.color: "#a0d568"
                border.width: 2
                anchors.left: rec6.left
                anchors.right: rec6.right
                anchors.top: cb_yarnType3.top
                Label {
                    id: label28
                    x: 163
                    y: 197
                    width: label28.contentWidth
                    height: 28
                    color: "#000000"
                    text: qsTr("Spandex")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.verticalCenterOffset: 0
                    anchors.bottomMargin: 0
                    anchors.horizontalCenterOffset: 0
                }
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
            }

            Rectangle {
                id: rec8
                height: cb_yarnType1.height
                color: "#4fc1eb"
                radius: 2
                border.color: "#4fc1eb"
                border.width: 2
                anchors.left: rec7.left
                anchors.right: rec7.right
                anchors.top: cb_yarnType4.top
                Label {
                    id: label29
                    x: 163
                    y: 197
                    width: label29.contentWidth
                    height: 28
                    color: "#000000"
                    text: qsTr("Phụ 2")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    anchors.verticalCenterOffset: 0
                    font.bold: false
                    anchors.bottomMargin: 0
                    anchors.horizontalCenterOffset: 0
                }
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
            }

            Rectangle {
                id: rec9
                x: 3
                width: 80
                height: cb_yarnType1.height
                color: "#ac92eb"
                radius: 2
                border.color: "#ac92eb"
                border.width: 2
                anchors.left: rec6.left
                anchors.right: rec6.right
                anchors.top: cb_yarnType5.top
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 0
                Label {
                    id: label30
                    x: 163
                    y: 197
                    width: label30.contentWidth
                    height: 28
                    color: "#000000"
                    text: qsTr("Phụ 3")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    anchors.bottomMargin: 0
                    anchors.horizontalCenterOffset: 0
                }
            }

        }















        Rectangle {
            id: rec_percent
            width: 954
            height: 46
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            border.width: 0
            anchors.left: parent.left
            anchors.top: rec_rollsNum.bottom
            anchors.topMargin: 0
            anchors.leftMargin: 14

            Rectangle {
                id: rectangle4
                y: 8
                width: 114
                height: 40
                color: "#ed5564"
                radius: 2
                border.color: "#ed5564"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 3
                Label {
                    id: lb_percentYT1

                    x: 163
                    y: 197
                    width: lb_percentYT1.contentWidth

                    height: 28
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: false
                    onTextChanged: {
                        if(lb_percentYT1.text == "% :" || lb_percentYT1.text == "% ---:"){
                            lb_percentYT1.visible = false
                        }
                        else{
                            lb_percentYT1.visible = true
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle5
                y: 8
                width: 114
                height: 40
                color: "#ffce54"
                radius: 2
                border.color: "#ffce54"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle8.right
                anchors.verticalCenterOffset: 0
                anchors.leftMargin: 3
                Label {
                    id: lb_percentYT2

                    x: 163
                    y: 197
                    width: lb_percentYT2.contentWidth

                    height: 28
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: false
                    onTextChanged: {
                        if(lb_percentYT2.text == "% :" || lb_percentYT2.text == "% ---:"){
                            lb_percentYT2.visible = false
                        }
                        else{
                            lb_percentYT2.visible = true
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle6
                y: 8
                width: 114
                height: 40
                color: "#a0d568"
                radius: 2
                border.color: "#a0d568"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle9.right
                anchors.leftMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_percentYT3

                    x: 163
                    y: 197
                    width: lb_percentYT3.contentWidth

                    height: 28
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: false
                    onTextChanged: {
                        if(lb_percentYT3.text == "% :" || lb_percentYT3.text == "% ---:"){
                            lb_percentYT3.visible = false
                        }
                        else{
                            lb_percentYT3.visible = true
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle7
                y: 8
                width: 114
                height: 40
                color: "#4fc1eb"
                radius: 2
                border.color: "#4fc1eb"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle10.right
                anchors.leftMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_percentYT4

                    x: 163
                    y: 197
                    width: lb_percentYT4.contentWidth

                    height: 28
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: false
                    onTextChanged: {
                        if(lb_percentYT4.text == "% :" || lb_percentYT4.text == "% ---:"){
                            lb_percentYT4.visible = false
                        }
                        else{
                            lb_percentYT4.visible = true
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle8
                y: 8
                width: 70
                height: 40
                color: "#ed5564"
                radius: 2
                border.color: "#ed5564"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle4.right
                anchors.verticalCenterOffset: 0
                anchors.leftMargin: 3
                Label {
                    id: lb_percentValue1

                    x: 163
                    y: 197
                    width: lb_percentValue1.contentWidth

                    height: 28
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    styleColor: "#ffffff"
                    font.underline: false
                    font.italic: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: lb_percentYT1.visible
                    onTextChanged: {
                        if(lb_percentValue1.text == "NaN%" || lb_percentValue1.text == "0.00%"){
                            if(lb_percentValue1.text == "NaN%"){lb_percentValue1.text = "....%"}
                            lb_percentValue1.color = "#281b0d"
                        }
                        else{lb_percentValue1.color = "black"}
                    }
                }
            }

            Rectangle {
                id: rectangle9
                y: 8
                width: 70
                height: 40
                color: "#ffce54"
                radius: 2
                border.color: "#ffce54"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle5.right
                anchors.leftMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_percentValue2

                    x: 163
                    y: 197
                    width: lb_percentValue2.contentWidth

                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: lb_percentYT2.visible
                    onTextChanged: {
                        if(lb_percentValue2.text == "NaN%" || lb_percentValue2.text == "0.00%"){
                            if(lb_percentValue2.text == "NaN%"){lb_percentValue2.text = "....%"}
                            lb_percentValue2.color = "#281b0d"
                        }
                        else{lb_percentValue2.color = "black"}
                    }
                }
            }

            Rectangle {
                id: rectangle10
                y: 8
                width: 70
                height: 40
                color: "#a0d568"
                radius: 2
                border.color: "#a0d568"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle6.right
                anchors.leftMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_percentValue3

                    x: 163
                    y: 197
                    width: lb_percentValue3.contentWidth

                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: lb_percentYT3.visible
                    onTextChanged: {
                        if(lb_percentValue3.text == "NaN%" || lb_percentValue3.text == "0.00%"){
                            if(lb_percentValue3.text == "NaN%"){lb_percentValue3.text = "....%"}
                            lb_percentValue3.color = "#281b0d"
                        }
                        else{lb_percentValue3.color = "black"}
                    }
                }
            }

            Rectangle {
                id: rectangle11
                y: 8
                width: 70
                height: 40
                color: "#4fc1eb"
                radius: 2
                border.color: "#4fc1eb"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle7.right
                anchors.leftMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_percentValue4

                    x: 163
                    y: 197
                    width: lb_percentValue4.contentWidth

                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: lb_percentYT4.visible
                    onTextChanged: {
                        if(lb_percentValue4.text == "NaN%" || lb_percentValue4.text == "0.00%"){
                            if(lb_percentValue4.text == "NaN%"){lb_percentValue4.text = "....%"}
                            lb_percentValue4.color = "#281b0d"
                        }
                        else{lb_percentValue4.color = "black"}
                    }
                }
            }

            Rectangle {
                id: rectangle16
                y: 8
                width: 114
                height: 40
                color: "#ac92eb"
                radius: 2
                border.color: "#ac92eb"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle11.right
                anchors.verticalCenterOffset: 0
                anchors.leftMargin: 3
                Label {
                    id: lb_percentYT5
                    x: 163
                    y: 197
                    width: lb_percentYT5.contentWidth
                    height: 28
                    visible: false
                    color: "#000000"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                    onTextChanged: {
                        if(lb_percentYT5.text == "% :" || lb_percentYT5.text == "% ---:"){
                            lb_percentYT5.visible = false
                        }
                        else{
                            lb_percentYT5.visible = true
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.underline: true
                    font.bold: false
                    anchors.bottomMargin: 0
                    font.italic: true
                }
            }

            Rectangle {
                id: rectangle19
                y: 8
                height: 40
                color: "#ac92eb"
                radius: 2
                border.color: "#ac92eb"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rectangle16.right
                anchors.right: parent.right
                anchors.rightMargin: 3
                anchors.verticalCenterOffset: 0
                anchors.leftMargin: 3
                Label {
                    id: lb_percentValue5
                    x: 163
                    y: 197
                    width: lb_percentValue5.contentWidth
                    height: 28
                    visible: lb_percentYT5.visible
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                    onTextChanged: {
                                    if(lb_percentValue5.text == "NaN%" || lb_percentValue5.text == "0.00%"){
                                        if(lb_percentValue5.text == "NaN%"){lb_percentValue5.text = "....%"}
                                        lb_percentValue5.color = "#281b0d"
                                    }
                                    else{lb_percentValue5.color = "black"}
                                }
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    anchors.bottomMargin: 0
                }
            }
        }

        Rectangle {
            id: rec_rollsNum
            width: 954
            height: 46
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            border.width: 0
            anchors.left: parent.left
            anchors.top: rec_yarnElement.bottom
            Rectangle {
                id: rectangle13
                x: -50
                y: 8
                width: 176
                height: 40
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: rectangle18.left
                anchors.verticalCenterOffset: 0
                anchors.rightMargin: 3
                Label {
                    id: lb_rp215callculated1
                    x: 163
                    y: 197
                    width: lb_rp215callculated1.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("Sản lượng 23h:")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    font.pointSize: 11
                    anchors.bottomMargin: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                }
            }

            Rectangle {
                id: rectangle18
                x: 92
                y: 8
                width: 119
                height: 40
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: rectangle12.left
                anchors.rightMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_kgPerPDay
                    width: lb_kgPerPDay.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    visible: false
                    onTextChanged: {
                        if(lb_kgPerPDay.text == "0.00"){lb_kgPerPDay.visible = false}
                        else{lb_kgPerPDay.visible = true}
                    }
                }
            }

            Rectangle {
                id: rectangle12
                x: 57
                y: 8
                width: 175
                height: 40
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: rectangle17.left
                anchors.verticalCenterOffset: 0
                anchors.rightMargin: 3
                Label {
                    id: lb_rp215callculated

                    x: 163
                    y: 197
                    width: lb_rp215callculated.contentWidth

                    height: 28
                    color: "#ffffff"
                    text: qsTr("Số vòng / 21.5 Kg:")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                }
            }

            Rectangle {
                id: rectangle14
                y: 8
                width: 225
                height: 40
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: tf_roundPerRoll.left
                anchors.rightMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_rpr

                    x: 163
                    y: 197
                    width: lb_rpr.contentWidth

                    height: 28
                    color: "#ffffff"
                    text: qsTr("Số vòng cài đặt:")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                }
            }

            Rectangle {
                id: rectangle17
                y: 8
                width: 119
                height: 40
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: rectangle14.left
                anchors.rightMargin: 3
                anchors.verticalCenterOffset: 0
                Label {
                    id: lb_roundsPer215
                    width: lb_roundsPer215.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 11
                    font.bold: false
                    anchors.bottomMargin: 0
                    onTextChanged: {
                        if(lb_roundsPer215.text == "Infinity"){lb_roundsPer215.visible = false}
                        else{lb_roundsPer215.visible = true}
                    }
                }
            }

            TextField {
                id: tf_roundPerRoll
                y: 3
                width: 119
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 15
                anchors.rightMargin: 3
                placeholderText: qsTr("?")
                inputMethodHints: Qt.ImhDigitsOnly
                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }
            }
            anchors.topMargin: 3
            anchors.leftMargin: 14
        }

        Image {
            id: img_handinkJet1
            width: 40
            height: 40
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/fabricType.svg"
            sourceSize.height: img_handinkJet1.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_handinkJet1.width
            antialiasing: true
            anchors.leftMargin: 33
            anchors.topMargin: 147
        }

        TextField {
            id: tf_fabricMet
            width: 83
            height: 40
            anchors.top: cb_fabricType.top
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 14
            anchors.leftMargin: 795
            anchors.topMargin: 0
            placeholderText: qsTr("?")
            inputMethodHints: Qt.ImhDigitsOnly
            color: "white"
            anchors.left: parent.left
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            onTextChanged: {                
                rectangle.fabricConfigCodeRefesh()
            }
        }

        Image {
            id: img_handinkJet3
            width: 72
            height: 36
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/inchDia.svg"
            sourceSize.height: img_handinkJet3.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_handinkJet3.width
            antialiasing: true
            anchors.leftMargin: 619
            anchors.topMargin: 102
        }

        Image {
            id: img_handinkJet4
            width: 72
            height: 36
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/gauge.svg"
            sourceSize.height: img_handinkJet4.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_handinkJet4.width
            antialiasing: true
            anchors.leftMargin: 713
            anchors.topMargin: 102
        }

        ComboBox {
            id: cb_machineDia
            x: 603
            width: 90
            height: 40
            anchors.right: cb_gauge.left
            anchors.top: cb_fabricType.top
            anchors.rightMargin: 3
            font.pointSize: 15
            font.weight: Font.DemiBold
            font.bold: false
            textRole: "dia"
            anchors.topMargin: 0
            transformOrigin: Item.Center
            model: ListModel {
                ListElement {
                    dia: "34"
                }
                ListElement {
                    dia: "32"
                }
            }
            indicator: Canvas {
                x: parent.width - width - parent.rightPadding
                y: parent.topPadding + (parent.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                    context.fill();
                }
            }
            contentItem: Text {
                text: parent.displayText
                color: "white"
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
            background: Rectangle {
                    color: "#5500ff00"
                    radius: 2
                    border.color: "#00ff00"
            }
            delegate: ItemDelegate {
                id: itemDlgt2
                width: cb_machineDia.width
                height: 40
                background: Rectangle {
                    width: parent.width
                    color: "#e6e6e6"
                    radius: 1
                    anchors.left: parent.left
                    anchors.top: parent.top
                }
                contentItem: Item {
                    id: cti_ItemDelegate2
                    width: cb_machineDia.width
                    height: 40
                    anchors.left: parent.left
                    anchors.top: parent.top
                    Rectangle {
                        id: rectIndex2
                        width: cb_machineDia.width
                        height: 39
                        color: "#ffffff"
                        radius: 2
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Text {
                            text: dia
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            horizontalAlignment: Text.AlignHCenter
                            font: cb_fabricType.font
                            anchors.leftMargin: 8
                        }
                        anchors.topMargin: 1
                    }
                }
            }
            onCurrentTextChanged: {
                rectangle.fabricConfigCodeRefesh()
            }
        }

        ComboBox {
            id: cb_gauge
            x: 699
            width: 90
            height: 40
            anchors.right: tf_fabricMet.left
            anchors.top: cb_fabricType.top
            anchors.rightMargin: 3
            textRole: "g"
            anchors.topMargin: 0
            transformOrigin: Item.Center
            model: ListModel {
                ListElement {
                    g: "28"
                }

                ListElement {
                    g: "26"
                }
            }
            indicator: Canvas {
                x: parent.width - width - parent.rightPadding
                y: parent.topPadding + (parent.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                    context.fill();
                }
            }
            contentItem: Text {
                text: parent.displayText
                color: "white"
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
            background: Rectangle {
                    color: "#5500ff00"
                    radius: 2
                    border.color: "#00ff00"
            }
            delegate: ItemDelegate {
                id: itemDlgt3
                width: cb_gauge.width
                height: 40
                background: Rectangle {
                    width: parent.width
                    color: "#e6e6e6"
                    radius: 1
                    anchors.left: parent.left
                    anchors.top: parent.top
                }
                contentItem: Item {
                    id: cti_ItemDelegate3
                    width: cb_gauge.width
                    height: 40
                    anchors.left: parent.left
                    anchors.top: parent.top
                    Rectangle {
                        id: rectIndex3
                        width: cb_gauge.width
                        height: 39
                        color: "#ffffff"
                        radius: 2
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Text {
                            text: g
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            horizontalAlignment: Text.AlignHCenter
                            font: cb_fabricType.font
                            anchors.leftMargin: 8
                        }
                        anchors.topMargin: 1
                    }
                }
            }
            onCurrentTextChanged: {
                rectangle.fabricConfigCodeRefesh()
            }
        }

        Image {
            id: img_handinkJet5
            width: 84
            height: 42
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/addFabricType.svg"
            sourceSize.height: img_handinkJet5.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_handinkJet5.width
            antialiasing: true
            anchors.leftMargin: 1448
            anchors.topMargin: 40
        }

        TextField {
            id: tf_addFabricType
            x: 1527
            y: 40
            width: 377
            height: 40



            font.capitalization: Font.AllUppercase


            placeholderText: qsTr("TÊN MỘC - XẾP CAM MỚI")
            color: "white"
            placeholderTextColor: "#a5d4a5"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#a5d4a5"
            }

            onTextChanged: {
                tf_addFabricType.text = tf_addFabricType.text.replace(/[^a-zA-Z0-9 ]/g, "").replace(/\s/g, '')
            }
        }

        Button {
            id: bt_addFabricType
            y: 89
            width: 141
            height: 40
            text: qsTr("Tạo mới")
            anchors.left: parent.left
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            anchors.leftMargin: 1528
            font.bold: false
            font.weight: Font.Normal
            onClicked: {
                if(tf_addFabricType.text !== ""){
                    var x = false; //new Boolean(false);
                    for (let i = 0; i < lv_fabricType.model.count; i++) {
                        if(lv_fabricType.model.get(i).text_ === tf_addFabricType.text.toUpperCase())
                        {
                            x = true;
                            break;
                        }
                    }
                    if(x === true ){pu_addFabricTypeAlreadyExist.open()}
                    else{pu_addFabricType.open()}

                }
                else{
                    pu_addFabricTypeWithNoText.open()
                }
                se_btnClicked.play()
            }
        }

        Image {
            id: img_handinkJet6
            width: 84
            height: 42
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/editFabricType.svg"
            sourceSize.height: img_handinkJet6.height
            fillMode: Image.PreserveAspectFit
            sourceSize.width: img_handinkJet6.width
            antialiasing: true
            anchors.leftMargin: 1448
            anchors.topMargin: 165
        }

        TextField {
            id: tf_editFabricType
            x: 1527
            y: 165
            width: 377
            height: 40
            enabled: fabricTypeAlreadyUsed ? false: true
            color: "white"
            font.capitalization: Font.AllUppercase
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#a5d4a5"
            }


            placeholderText: qsTr("")
        }

        Button {
            id: bt_editFabricType
            x: 1528
            y: 214
            width: 141
            height: 40
            text: qsTr("Sửa")
            anchors.left: parent.left
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            anchors.leftMargin: 1529
            onClicked: {
                if(tf_editFabricType.text !== ""){
                    if(fabricTypeAlreadyUsed === true){
                        pu_editFabricTypeButAlreadyUsed.open()
                    }
                    else if (lv_fabricType.model.get(lv_fabricType.currentIndex).text_ === tf_editFabricType.text){
                        pu_editFabricTypeWithNoChange.open()
                    }
                    else{
                        var x = false; //new Boolean(false);
                        for (let i = 0; i < lv_fabricType.model.count; i++) {
                            if(lv_fabricType.model.get(i).text_ === tf_editFabricType.text.toUpperCase())
                            {
                                x = true;
                                break;
                            }
                        }
                        if(x === true ){pu_editFabricTypeToAlreadyExist.open()}
                        else{
                            pu_editFabricType.open()
                        }
                    }
                    se_btnClicked.play()
                }
            }
        }
        Rectangle {
            id: rec_bg5
            x: 986
            width: 483
            color: "#222222"
            anchors.top: parent.top

            anchors.topMargin: 0

        }

        TextField {
            id: tf_fabricWide
            width: 83
            height: 40
            anchors.top: cb_fabricType.top
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 14
            anchors.leftMargin: 881
            inputMethodHints: Qt.ImhDigitsOnly
            onTextChanged: {
                rectangle.fabricConfigCodeRefesh()
                if(tf_fabricWide.text === "0.0"){
                    tf_fabricWide.text = ""
                }
            }
            anchors.topMargin: 0
            anchors.left: parent.left
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
        }

        Image {
            id: image
            width: 11
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 975
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label
            x: 813
            y: 114
            color: "#ffffff"
            text: qsTr("Dài (m):")
        }

        Label {
            id: label3
            x: 887
            y: 114
            color: "#ffffff"
            text: qsTr("Rộng (m):")
            anchors.left: parent.left
            anchors.leftMargin: 890
        }

        Rectangle {
            id: rectangle2
            x: 1290
            y: 377
            width: 341
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.horizontalCenterOffset: 961
            Label {
                id: label4
                width: label4.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng các thông tin sản xuất đã được tạo:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
            anchors.horizontalCenter: rec_fabricConfigCode.horizontalCenter
        }

        Rectangle {
            id: rectangle3
            x: 1038
            y: 8
            width: 263
            height: 24
            color: "#a5d4a5"
            radius: 13
            Label {
                id: label5
                width: label5.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng các loại mộc - xếp cam:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
            anchors.horizontalCenter: lv_fabricType.horizontalCenter
            anchors.horizontalCenterOffset: 0
        }

        Switch {
            id: sw_1
            y: 712
            width: 129
            height: 33
            anchors.left: parent.left
            anchors.leftMargin: 17
            checked: false
            indicator: Rectangle {
                implicitWidth: 240
                implicitHeight: 40
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                width: 100
                height: 25
                radius: 20
                color: sw_1.checked ? "#9eff9e" : "#222222"
                border.color: "#6c6c6c"

                Rectangle {
                    x: sw_1.checked ? parent.width - width : 0
                    width: 50
                    height: 25
                    radius: 20
                    border.color: "#6c6c6c"
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#222222"
                        text: sw_1.checked ? "Bật" : "Tắt"
                    }
                    Behavior on x {
                        PropertyAnimation {
                            duration: 20
                        }
                    }
                }
            }

            Label {
                id: label2
                x: 118
                y: 6
                color: "#ffffff"
                text: qsTr(": Hiện sợi lót (phụ) trong nhãn in.")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: -2
            }
            onCheckedChanged: { rectangle.fabricConfigCodeRefesh()}
        }

        Switch {
            id: sw_2
            width: 129
            height: 33
            anchors.left: parent.left
            anchors.top: sw_1.bottom
            anchors.topMargin: 14
            anchors.leftMargin: 17
            checked: false
            Label {
                id: label6
                x: 118
                y: 6
                color: "#ffffff"
                text: qsTr(": Hiện loại spandex trong nhãn in.")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: -2
            }
            indicator: Rectangle {
                width: 100
                height: 25
                color: sw_2.checked ? "#9eff9e" : "#222222"
                radius: 20
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                implicitHeight: 40
                Rectangle {
                    x: sw_2.checked ? parent.width - width : 0
                    width: 50
                    height: 25
                    radius: 20
                    border.color: "#6c6c6c"
                    Text {
                        color: "#222222"
                        text: sw_2.checked ? "Bật" : "Tắt"
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                implicitWidth: 240
            }
            onCheckedChanged: { rectangle.fabricConfigCodeRefesh()}
        }

        Switch {
            id: sw_3
            width: 129
            height: 33
            anchors.left: parent.left
            anchors.top: sw_2.bottom
            anchors.topMargin: 14
            anchors.leftMargin: 17
            checked: false
            Label {
                id: label7
                x: 118
                y: 6
                color: "#ffffff"
                text: qsTr(": Hiện số khổ (rộng) của vải trong nhãn in.")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: -2
            }
            indicator: Rectangle {
                width: 100
                height: 25
                color: sw_3.checked ? "#9eff9e" : "#222222"
                radius: 20
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                implicitHeight: 40
                Rectangle {
                    x: sw_3.checked ? parent.width - width : 0
                    width: 50
                    height: 25
                    radius: 20
                    border.color: "#6c6c6c"
                    Text {
                        color: "#222222"
                        text: sw_3.checked ? "Bật" : "Tắt"
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                implicitWidth: 240
            }
            onCheckedChanged: { rectangle.fabricConfigCodeRefesh()}
        }

        Switch {
            id: sw_4
            width: 129
            height: 33
            anchors.left: parent.left
            anchors.top: sw_3.bottom
            anchors.topMargin: 14
            anchors.leftMargin: 17
            checked: false
            Label {
                id: label8
                x: 118
                y: 6
                color: "#ffffff"
                text: qsTr(": Hiện số Inch của máy trong nhãn in.")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: -2
            }
            indicator: Rectangle {
                width: 100
                height: 25
                color: sw_4.checked ? "#9eff9e" : "#222222"
                radius: 20
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                implicitHeight: 40
                Rectangle {
                    x: sw_4.checked ? parent.width - width : 0
                    width: 50
                    height: 25
                    radius: 20
                    border.color: "#6c6c6c"
                    Text {
                        color: "#222222"
                        text: sw_4.checked ? "Bật" : "Tắt"
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                implicitWidth: 240
            }
            onCheckedChanged: { rectangle.fabricConfigCodeRefesh()}
        }

        Rectangle {
            id: rectangle15
            width: 226
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 1615
            anchors.topMargin: 664
            anchors.leftMargin: 95
            Label {
                id: label9
                width: label9.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Tùy chọn nhãn in đầu cây:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Switch {
            id: sw_5
            width: 129
            height: 33
            anchors.left: parent.left
            anchors.top: sw_4.bottom
            indicator: Rectangle {
                width: 100
                height: 25
                color: sw_5.checked ? "#9eff9e" : "#222222"
                radius: 20
                border.color: "#6c6c6c"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                implicitHeight: 40
                implicitWidth: 240
                Rectangle {
                    x: sw_5.checked ? parent.width - width : 0
                    width: 50
                    height: 25
                    radius: 20
                    border.color: "#6c6c6c"
                    Text {
                        color: "#222222"
                        text: sw_5.checked ? "Bật" : "Tắt"
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            anchors.topMargin: 14
            Label {
                id: label10
                x: 118
                y: 6
                color: "#ffffff"
                text: qsTr(": Hiện số G của mâm trong nhãn in.")
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenterOffset: -2
            }
            anchors.leftMargin: 17
            checked: false
            onCheckedChanged: { rectangle.fabricConfigCodeRefesh()}
        }

        Label {
            id: label12
            x: 1528
            y: 17
            color: "#ffffff"
            text: qsTr("Tạo mới tên mộc - xếp cam:")
            font.pointSize: 12
        }

        Label {
            id: label13
            x: 1528
            y: 142
            color: fabricTypeAlreadyUsed ? "#ff0000" : "#ffffff"
            text: fabricTypeAlreadyUsed ? "Đã được dùng - không thể sửa!" : "Sửa tên mộc - xếp cam:"
            font.pointSize: 12
        }

        Button {
            id: bt_updateNewRoundPerRoll
            x: 1271
            width: 261
            height: 40
            text: qsTr("Sửa Số Vòng / 1 Cây Mộc")
            anchors.left: bt_viewDetail.right
            anchors.top: parent.top
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            anchors.topMargin: 934
            font.bold: false
            anchors.leftMargin: 16
            font.pointSize: 11
            font.weight: Font.Normal

            onClicked:{
                // 2 line code below: just for lv_fabricConfig update roundsPerRoll property for first row
                if(lv_fabricConfig.currentIndex == 0){
                    lv_fabricConfig.currentIndex = 1
                    lv_fabricConfig.currentIndex = 0
                }
                pu_editRoundsPerRollProperty.open()
            }
        }

        ComboBox {
            id: cb_customer
            y: 4
            width: 535
            height: 40
            anchors.left: parent.left
            anchors.top: parent.top
            transformOrigin: Item.Center
            delegate: ItemDelegate {
                id: itemDlgt4
                width: cb_customer.width
                height: 40
                contentItem: Item {
                    id: cti_ItemDelegate4
                    width: cb_customer.width
                    height: 40
                    anchors.left: parent.left
                    anchors.top: parent.top
                    Rectangle {
                        id: rectIndex4
                        width: 60
                        height: 39
                        color: "#ffffff"
                        radius: 2
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Text {
                            text: index +1
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            horizontalAlignment: Text.AlignHCenter
                            font: cb_customer.font
                            anchors.leftMargin: 8
                        }
                        anchors.topMargin: 1
                    }

                    Rectangle {
                        width: cb_customer.width - rectIndex4.width
                        height: 39
                        color: "#ffffff"
                        radius: 2
                        anchors.left: rectIndex4.right
                        anchors.top: parent.top
                        Text {
                            text: text_
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font: cb_customer.font
                            anchors.leftMargin: 10
                        }
                        anchors.topMargin: 1
                        anchors.leftMargin: 1
                    }
                }
                background: Rectangle {
                    width: parent.width
                    color: "#e6e6e6"
                    radius: 1
                    anchors.left: parent.left
                    anchors.top: parent.top
                }
            }
            font.family: "Roboto" //"Ubuntu Mono"
            font.pointSize: 13
            anchors.topMargin: 12
            contentItem: Text {
                color: "#ffffff"
                text: parent.displayText
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 10
            }
            background: Rectangle {
                color: "#5500ff00"
                radius: 2
                border.color: "#00ff00"
            }
            textRole: "text_"
            anchors.leftMargin: 429
            indicator: Canvas {
                x: parent.width - width - parent.rightPadding
                y: parent.topPadding + (parent.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"
                onPaint: {
                            context.reset();
                            context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = parent.pressed ? "#17a81a" : "#21be2b";
                    context.fill();
                }
            }
            model: ListModel {
                ListElement {
                    id_: ""
                    subject_: ""
                    name_: ""
                    abbreviation_: ""
                    text_: ""
                }
            }
            Component.onCompleted: {
                fabricPageBridge.cb_customerCompleted()

//                if(fabricMachinePageMessage !== undefined){
//                    var i = 0
//                    for (i = 0; i < cb_fabricType.model.count; i++) {
//                        print("cb_fabricType.model.get(i).index_", cb_fabricType.model.get(i).index_)
//                        print("fabricMachinePageMessage.FabricType_FabricTypeId_", fabricMachinePageMessage.FabricType_FabricTypeId_)
//                        if(cb_fabricType.model.get(i).index_ === fabricMachinePageMessage.FabricType_FabricTypeId_)
//                        {
//                            break;
//                        }
//                    }
//                    cb_fabricType.currentIndex = i
//                }
            }
            onCurrentTextChanged: {
                fabricPage.customerID = cb_customer.model.get(cb_customer.currentIndex).id_
                fabricPage.customerAbbreviation = cb_customer.model.get(cb_customer.currentIndex).abbreviation_
                rectangle.fabricConfigCodeRefesh()
            }
        }

        Image {
            id: img_customer
            y: 12
            width: 40
            height: 40
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricPage/customerSelect.svg"
            sourceSize.width: img_customer.width
            anchors.topMargin: 11
            fillMode: Image.PreserveAspectFit
            anchors.leftMargin: 383
            sourceSize.height: img_customer.height
            antialiasing: true
        }

        TextField {
            id: tf_fabricConfigPrintText
            x: 100
            y: 101
            width: 506
            height: 40
            color: "#ffffff"
            renderType: Text.NativeRendering
            placeholderTextColor: "#ffffff"
            placeholderText: qsTr("NHÃN IN")
            font.capitalization: Font.AllUppercase
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: "#a5d4a5"
            }

            onTextChanged: {

            }
        }

        Button {
            id: bt_updateNewPrintCode
            x: 1271
            width: 261
            height: 40
            text: qsTr("Sửa Nhãn In Đầu Cây")
            anchors.left: bt_updateNewRoundPerRoll.right
            anchors.top: parent.top
            font.pointSize: 11
            font.weight: Font.Normal
            anchors.leftMargin: 16
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.bold: false
            anchors.topMargin: 934

            onClicked: {
                se_btnClicked.play()
                pu_editPrintCode.open()
            }
        }

    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP
    PU_AddFabricTypeWithNoText{
        id: pu_addFabricTypeWithNoText
        x: rectangle.width/2 - pu_addFabricTypeWithNoText.width/2
        y: rectangle.height/2 - pu_addFabricTypeWithNoText.height/2
    }

    PU_AddFabricTypeAlreadyExist{
        id: pu_addFabricTypeAlreadyExist
        x: rectangle.width/2 - pu_addFabricTypeAlreadyExist.width/2
        y: rectangle.height/2 - pu_addFabricTypeAlreadyExist.height/2
    }

    PU_AddFabricType{
        id: pu_addFabricType
        x: rectangle.width/2 - pu_addFabricType.width/2
        y: rectangle.height/2 - pu_addFabricType.height/2
    }

    PU_AddFabricConfigWithNoText{
        id: pu_addFabricConfigWithNoText
        x: rectangle.width/2 - pu_addFabricConfigWithNoText.width/2
        y: rectangle.height/2 - pu_addFabricConfigWithNoText.height/2
    }

    PU_AddFabricConfig{
        id: pu_addFabricConfig
        x: rectangle.width/2 - pu_addFabricConfig.width/2
        y: rectangle.height/2 - pu_addFabricConfig.height/2
    }

    PU_EditFabricType{
        id: pu_editFabricType
        x: rectangle.width/2 - pu_editFabricType.width/2
        y: rectangle.height/2 - pu_editFabricType.height/2
    }

    PU_EditFabricTypeWithNoChange{
        id: pu_editFabricTypeWithNoChange
        x: rectangle.width/2 - pu_editFabricTypeWithNoChange.width/2
        y: rectangle.height/2 - pu_editFabricTypeWithNoChange.height/2
    }

    PU_EditFabricTypeButAlreadyUsed{
        id: pu_editFabricTypeButAlreadyUsed
        x: rectangle.width/2 - pu_editFabricTypeButAlreadyUsed.width/2
        y: rectangle.height/2 - pu_editFabricTypeButAlreadyUsed.height/2
    }

    PU_EditFabricTypeToAlreadyExist{
        id: pu_editFabricTypeToAlreadyExist
        x: rectangle.width/2 - pu_editFabricTypeToAlreadyExist.width/2
        y: rectangle.height/2 - pu_editFabricTypeToAlreadyExist.height/2
    }

    PU_EditRoundsPerRollProperty{
        id: pu_editRoundsPerRollProperty
        x: rectangle.width/2 - pu_editRoundsPerRollProperty.width/2
        y: rectangle.height/2 - pu_editRoundsPerRollProperty.height/2
    }

    PU_EditPrintCode{
        id: pu_editPrintCode
        x: rectangle.width/2 - pu_editPrintCode.width/2
        y: rectangle.height/2 - pu_editPrintCode.height/2
    }

    // end

    Connections{
        target: fabricPageBridge

         function onUpdateFabricTypeAlreadyUsedVariable(flag){
             fabricTypeAlreadyUsed = flag
         }

        function onFill_lv_fabricConfig(configData){
            lv_fabricConfig.model.clear()
            configData.forEach(function (item, index) {
              lv_fabricConfig.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                               "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9], "YarnLotId5_": item[10], "Yarn1Speed_": item[11], "Yarn2Speed_": item[12],
                                               "Yarn3Speed_": item[13], "Yarn4Speed_": item[14], "Yarn5Speed_": item[15], "Yarn1ConeNum_": item[16], "Yarn2ConeNum_": item[17], "Yarn3ConeNum_": item[18], "Yarn4ConeNum_": item[19], "Yarn5ConeNum_": item[20],
                                               "YarnRoundsPerRoll_": item[21], "Dia_": item[22], "G_": item[23], "CustomerId_": item[24]})
            })
            fabricPage.fabricPrintCodeOfCurrentRowOfLV_fabricConfig = lv_fabricConfig.model.get(lv_fabricConfig.currentIndex).data2
        }

        function onFill_lv_fabricType(fabricListData){
            lv_fabricType.model.clear()
            fabricListData.forEach(function (item, index) {
              lv_fabricType.model.append({"index_": item[0], "text_": item[1]})
            })
            tf_editFabricType.text = lv_fabricType.model.get(lv_fabricType.currentIndex).text_
        }
        function onFill_cb_fabricType(fabricListData){
            cb_fabricType.model.clear()
            fabricListData.forEach(function (item, index) {
              cb_fabricType.model.append({"index_": item[0], "text_": item[1]})
            })
        }

        function onFill_cb_customer(customerListData){
            cb_customer.model.clear()
            customerListData.forEach(function (item, index) {
              cb_customer.model.append({"id_": item[0], "subject_": item[1], "name_": item[2], "abbreviation_": item[3],"text_": item[1] + " " + item[2] + " (" + item[3] + ")"})
            })
        }

        function onFill_cb_yarnType1(yarnListData){
            cb_yarnType1.model.clear()
            yarnListData.forEach(function (item, index) {
              cb_yarnType1.model.append({"index_": item[0], "text_": item[1], "d_": item[2]})
            })
            cb_yarnType1.model.append({"index_": "", "text_": "---", "d_": ""})
        }

        function onFill_cb_yarnType3(yarnListData){
            cb_yarnType3.model.clear()
            yarnListData.forEach(function (item, index) {
              cb_yarnType3.model.append({"index_": item[0], "text_": item[1], "d_": item[2]})
            })
            cb_yarnType3.model.append({"index_": "", "text_": "---", "d_": ""})
        }

        function onFill_cb_yarnLot1Model(yarnLotData){
            cb_yarnLot1.model.clear()
            yarnLotData.forEach(function (item, index) {
              cb_yarnLot1.model.append({"index_": item[0], "text_": item[1], "yarnType_": item[2], "producer_": item[3], "lot_": item[4]})
            })
        }

        function onFill_cb_yarnLot2Model(yarnLotData){
            cb_yarnLot2.model.clear()
            yarnLotData.forEach(function (item, index) {
              cb_yarnLot2.model.append({"index_": item[0], "text_": item[1], "yarnType_": item[2], "producer_": item[3], "lot_": item[4]})
            })
        }

        function onFill_cb_yarnLot3Model(yarnLotData){
            cb_yarnLot3.model.clear()
            yarnLotData.forEach(function (item, index) {
              cb_yarnLot3.model.append({"index_": item[0], "text_": item[1], "yarnType_": item[2], "producer_": item[3], "lot_": item[4]})
            })
        }

        function onFill_cb_yarnLot4Model(yarnLotData){
            cb_yarnLot4.model.clear()
            yarnLotData.forEach(function (item, index) {
              cb_yarnLot4.model.append({"index_": item[0], "text_": item[1], "yarnType_": item[2], "producer_": item[3], "lot_": item[4]})
            })
        }

        function onFill_cb_yarnLot5Model(yarnLotData){
            cb_yarnLot5.model.clear()
            yarnLotData.forEach(function (item, index) {
              cb_yarnLot5.model.append({"index_": item[0], "text_": item[1], "yarnType_": item[2], "producer_": item[3], "lot_": item[4]})
            })
        }

        function onFillYarnDetails(yarnLotData){
            var i = 0
            for (i = 0; i < cb_yarnType1.model.count; i++) {
                if(cb_yarnType1.model.get(i).index_ === yarnLotData[0][2])
                {
                    break;
                }
            }
            cb_yarnType1.currentIndex = i

            cb_yarnLot1.model.clear()
            cb_yarnLot1.model.append({"index_": yarnLotData[0][0], "text_": yarnLotData[0][1], "yarnType_": yarnLotData[0][2], "producer_": yarnLotData[0][3], "lot_": yarnLotData[0][4]})
            cb_yarnLot1.currentIndex = 0

            cb_yarnLot2.model.clear()
            if(yarnLotData[1][0] !== ""){
                for (i = 0; i < cb_yarnType2.model.count; i++) {
                    if(cb_yarnType2.model.get(i).index_ === yarnLotData[1][2])
                    {
                        break;
                    }
                }
                cb_yarnType2.currentIndex = i

                cb_yarnLot2.model.append({"index_": yarnLotData[1][0], "text_": yarnLotData[1][1], "yarnType_": yarnLotData[1][2], "producer_": yarnLotData[1][3], "lot_": yarnLotData[1][4]})
                cb_yarnLot2.currentIndex = 0
            }

            cb_yarnLot3.model.clear()
            if(yarnLotData[2][0] !== ""){
                for (i = 0; i < cb_yarnType3.model.count; i++) {
                    if(cb_yarnType3.model.get(i).index_ === yarnLotData[2][2])
                    {
                        break;
                    }
                }
                cb_yarnType3.currentIndex = i

                cb_yarnLot3.model.append({"index_": yarnLotData[2][0], "text_": yarnLotData[2][1], "yarnType_": yarnLotData[2][2], "producer_": yarnLotData[2][3], "lot_": yarnLotData[2][4]})
                cb_yarnLot3.currentIndex = 0
            }

            cb_yarnLot4.model.clear()
            if(yarnLotData[3][0] !== ""){
                for (i = 0; i < cb_yarnType4.model.count; i++) {
                    if(cb_yarnType4.model.get(i).index_ === yarnLotData[3][2])
                    {
                        break;
                    }
                }
                cb_yarnType4.currentIndex = i

                cb_yarnLot4.model.append({"index_": yarnLotData[3][0], "text_": yarnLotData[3][1], "yarnType_": yarnLotData[3][2], "producer_": yarnLotData[3][3], "lot_": yarnLotData[3][4]})
                cb_yarnLot4.currentIndex = 0
            }

            cb_yarnLot5.model.clear()
            if(yarnLotData[4][0] !== ""){
                for (i = 0; i < cb_yarnType5.model.count; i++) {
                    if(cb_yarnType5.model.get(i).index_ === yarnLotData[4][2])
                    {
                        break;
                    }
                }
                cb_yarnType5.currentIndex = i

                cb_yarnLot5.model.append({"index_": yarnLotData[4][0], "text_": yarnLotData[4][1], "yarnType_": yarnLotData[4][2], "producer_": yarnLotData[4][3], "lot_": yarnLotData[4][4]})
                cb_yarnLot5.currentIndex = 0
            }

        }

        // update yarn 1 - used when create variant Button in FabricMachinePage is clicked
        function onFillYarn1Details(yarnLotData){
            var i = 0
            for (i = 0; i < cb_yarnType1.model.count; i++) {
                if(cb_yarnType1.model.get(i).index_ === yarnLotData[2])
                {
                    break;
                }
            }
            cb_yarnType1.currentIndex = i

            cb_yarnLot1.model.clear()
            cb_yarnLot1.model.append({"index_": yarnLotData[0], "text_": yarnLotData[1], "yarnType_": yarnLotData[2], "producer_": yarnLotData[3], "lot_": yarnLotData[4]})
            cb_yarnLot1.currentIndex = 0
        }
        // update yarn 2 - used when create variant Button in FabricMachinePage is clicked
        function onFillYarn2Details(yarnLotData){
            var i = 0
            for (i = 0; i < cb_yarnType2.model.count; i++) {
                if(cb_yarnType2.model.get(i).index_ === yarnLotData[2])
                {
                    break;
                }
            }
            cb_yarnType2.currentIndex = i

            cb_yarnLot2.model.clear()
            cb_yarnLot2.model.append({"index_": yarnLotData[0], "text_": yarnLotData[1], "yarnType_": yarnLotData[2], "producer_": yarnLotData[3], "lot_": yarnLotData[4]})
            cb_yarnLot2.currentIndex = 0
        }
        // update yarn 3 - used when create variant Button in FabricMachinePage is clicked
        function onFillYarn3Details(yarnLotData){
            var i = 0
            for (i = 0; i < cb_yarnType3.model.count; i++) {
                if(cb_yarnType3.model.get(i).index_ === yarnLotData[2])
                {
                    break;
                }
            }
            cb_yarnType3.currentIndex = i

            cb_yarnLot3.model.clear()
            cb_yarnLot3.model.append({"index_": yarnLotData[0], "text_": yarnLotData[1], "yarnType_": yarnLotData[2], "producer_": yarnLotData[3], "lot_": yarnLotData[4]})
            cb_yarnLot3.currentIndex = 0
        }
        // update yarn 4 - used when create variant Button in FabricMachinePage is clicked
        function onFillYarn4Details(yarnLotData){
            var i = 0
            for (i = 0; i < cb_yarnType4.model.count; i++) {
                if(cb_yarnType4.model.get(i).index_ === yarnLotData[2])
                {
                    break;
                }
            }
            cb_yarnType4.currentIndex = i

            cb_yarnLot4.model.clear()
            cb_yarnLot4.model.append({"index_": yarnLotData[0], "text_": yarnLotData[1], "yarnType_": yarnLotData[2], "producer_": yarnLotData[3], "lot_": yarnLotData[4]})
            cb_yarnLot4.currentIndex = 0
        }
    }


}




















/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
