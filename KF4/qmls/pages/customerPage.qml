import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import "../contents/customerPagePopUp"
import QtQuick.Extras 1.4
import QtMultimedia 5.4

Item {
    id: customerPage

    property string subject_Customer : "A"
    property string name_Customer : ""
    property bool startUpPage : false

    property string id_Customer_Want_To_Change: ""
    property string subject_Customer_Want_To_Change: ""
    property string name_Customer_Want_To_Change: ""
    property string abbreviation_Customer_Want_To_Change: ""

    width: 1920
    height: 985    

    Component.onCompleted: {

    }

    Rectangle {
        id: rectangle
        color: "#222222"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        //===============================================================================================================================================

        ListView {
            id: lv_fabricConfig
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 12
            anchors.leftMargin: 992
            anchors.topMargin: 275
            anchors.bottomMargin: 8
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
                    Yarn1Speed_: ""                 //  10
                    Yarn2Speed_: ""                 //  11
                    Yarn3Speed_: ""                 //  12
                    Yarn4Speed_: ""                 //  13
                    Yarn1ConeNum_: ""               //  14
                    Yarn2ConeNum_: ""               //  15
                    Yarn3ConeNum_: ""               //  16
                    Yarn4ConeNum_: ""               //  17
                    YarnRoundsPerRoll_: ""           //  18
                    Dia_: ""
                    G_: ""
                }
            }
            delegate: DLG_FabricConfig{rowWidth: lv_fabricConfig.width
                rowHeigh :40 }

            Component.onCompleted: {
                //customerPageBridge.lv_fabricConfigCompleted()
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

        Rectangle {
            id: rectangle1
            x: 119            
            y: 29
            width: 1038
            height: 25
            color: "#00ff00"
            radius: 13
            Label {
                id: label1
                width: label1.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Tạo mới 1 khách hàng:")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 12

            }
        }


        //======================================================================= COMBOBOX YARN TYPE
//======================================================================= end COMBOBOX YARN TYPE

        Button {
            id: bt_addFabricConfig
            y: 63
            width: 286
            height: 90
            text: qsTr("Tạo mới")
            anchors.left: parent.left
            topPadding: 6
            anchors.leftMargin: 1306
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 11
            background: Rectangle{
                anchors.fill: parent
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 50
            }
            onClicked: {
                se_btnClicked.play()

                if(bt_addFabricConfig.text == "Tạo mới"){
                    if(tf_customerName.text == "" || tf_abberaviation.text == "")
                    {
                        pu_addCustomerWithBlankText.open()
                    }
                    else
                    {
                        pu_addCustomer.open()
                    }
                }
                else{
                    print(customerPage.subject_Customer_Want_To_Change)
                    pu_editCustomer.open()
                }
            }
        }


        //=================================================================================== bt_AddYarnType
        //=========================================================================================================== Button Add ProducerProducer



        ListView {
            id: lv_customerInfo
            width: 963
            height: 700
            anchors.left: parent.left
            anchors.top: parent.top

            anchors.leftMargin: 12

            anchors.topMargin: 275
            spacing: 3
            model: ListModel {
                ListElement{
                    id_: "1"
                    subject_: "Cong ty"
                    name_: "Song King (A Hoang/09x.xxx.xxxx)"
                    abbreviation_: "SK"
                }
                ListElement{
                    id_: "2"
                    subject_: "Anh"
                    name_: "Huy Duong"
                    abbreviation_: "H Duong"
                }
                ListElement{
                    id_: "3"
                    subject_: "Chi"
                    name_: "Nhu"
                    abbreviation_: "C Nhu"
                }
                ListElement{
                    id_: "4"
                    subject_: "Cong ty"
                    name_: "Samil"
                    abbreviation_: "Samil"
                }
            }
            delegate: DLG_Customer_ThreeText{rowWidth: 913
                rowHeigh :40 }
            Component.onCompleted: {
                customerPageBridge.lv_customerInfoCompleted()
            }
            onCurrentIndexChanged: {
                if (customerPage.startUpPage == true){
                    customerPageBridge.update_lv_fabricConfig(lv_customerInfo.model.get(lv_customerInfo.currentIndex).id_)
                }
                else{customerPage.startUpPage = true}

//                customerPage.id_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).id_
//                customerPage.subject_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).subject_
//                customerPage.name_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).name_
//                customerPage.abbreviation_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).abbreviation_

                if(bt_rewriteCustomerInfo.text == "Hủy"){
                    cb_subjectType.currentIndex = 0
                    tf_customerName.text = ""
                    tf_abberaviation.text = ""

                    bt_addFabricConfig.text = "Tạo mới"
                    bt_rewriteCustomerInfo.text = "Sửa"
                }
            }

            Rectangle {
                y: -38
                width: 938
                height: 38
                color: "#222222"
                anchors.left: parent.left
                anchors.bottom: parent.top
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                width: 955
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

        TextField {
            id: tf_search
            height: 40
            anchors.left: lv_fabricConfig.left
            anchors.right: parent.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            anchors.leftMargin: 0
            anchors.rightMargin: 12
            topPadding: 8
            font.pointSize: 13
            anchors.topMargin: 232
            font.weight: Font.Bold
            font.capitalization: Font.MixedCase
            placeholderText: qsTr("Nhập mã thông tin sản xuất muốn tìm...")

            onTextChanged: {
                customerPageBridge.tf_searchChanged(lv_customerInfo.model.get(lv_customerInfo.currentIndex).id_, tf_search.text)
            }

        }
//------------------------------------------------------------------------------------------------------------------------------
        Rectangle {
            id: rec_yarnElement
            x: 8
            y: 63
            width: 1604
            height: 90
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            border.width: 0
            anchors.topMargin: 65
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Rectangle{
                id: rec1
                width: 250
                height: cb_subjectType.height
                color: "#00ffffff"
                radius: 2
                border.color: "#6c6c6c"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 3
                Label {
                    id: label25
                    x: 163
                    y: 197
                    width: label25.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("Đại từ xưng hô:")
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
                width: 620
                height: cb_subjectType.height
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
                    text: qsTr("Tên:")
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
                width: 400
                height: cb_subjectType.height
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
                    text: qsTr("Ký hiệu in đầu cây:")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    font.pointSize: 11
                }
            }

            ComboBox {
                id: cb_subjectType
                height: 40
                anchors.left: rec1.left
                anchors.right: rec1.right
                anchors.top: rec1.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 3
                transformOrigin: Item.Center
                font.weight: Font.Normal
                font.bold: false
                font.pointSize: 15
                textRole: "subject_"
                model: ListModel {
                    ListElement {
                        subject_: "ANH"
                    }
                    ListElement {
                        subject_: "CHỊ"
                    }
                    ListElement {
                        subject_: "CÔ"
                    }
                    ListElement {
                        subject_: "CHÚ"
                    }
                    ListElement {
                        subject_: "CẬU"
                    }
                    ListElement {
                        subject_: "MỢ"
                    }
                    ListElement {
                        subject_: "BÁC"
                    }
                    ListElement {
                        subject_: "CÔNG TY"
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
                              width: cb_subjectType.width - rectIndex1.width - 1
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
                                  text: subject_
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

                }
                onCurrentTextChanged: {
                    if(cb_subjectType.currentText == "CÔNG TY"){
                        customerPage.subject_Customer = ""
                    }
                    else{
                        customerPage.subject_Customer = cb_subjectType.currentText.charAt(0) + "."
                    }
                    tf_abberaviation.text = customerPage.subject_Customer + customerPage.name_Customer

                }
            }

            TextField {
                id: tf_abberaviation
                y: 46
                height: 40
                anchors.left: rec3.left
                anchors.right: rec3.right
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                font.capitalization: Font.AllUppercase
                placeholderText: qsTr("?")
                anchors.topMargin: 0
                topPadding: 8
                font.pointSize: 14

                color: "white"
                placeholderTextColor: "#00ff00"
                background: Rectangle {
                        color: "#00ffffff"
                        radius: 2
                        border.color: "#00ff00"
                }

                onTextChanged: {
//                    rectangle.fabricConfigCodeRefesh()
//                    if(tf_abberaviation.text == ""){yarn1Speed = 0}
//                    else{yarn1Speed = parseInt(tf_abberaviation.text)}

//                    yarn1M = yarn1ConeNum*yarn1Speed*yarn1Count/900000
//                    totalM = yarn1M + yarn2M +yarn3M + yarn4M
//                    yarn1Percent = yarn1M*100/totalM
//                    yarn2Percent = yarn2M*100/totalM
//                    yarn3Percent = yarn3M*100/totalM
//                    yarn4Percent = yarn4M*100/totalM
//                    lb_percentValue1.text = yarn1Percent.toFixed(2) + "%"
//                    lb_percentValue2.text = yarn2Percent.toFixed(2) + "%"
//                    lb_percentValue3.text = yarn3Percent.toFixed(2) + "%"
//                    lb_percentValue4.text = yarn4Percent.toFixed(2) + "%"
//                    roundsPer215 = 21500/totalM
//                    lb_roundsPer215.text = roundsPer215.toFixed(2)
//                    kgPer23h = 23*60*20*totalM/1000
//                    lb_kgPerPDay.text = kgPer23h.toFixed(2)
                }
            }


            TextField {
                id: tf_customerName
                y: 46
                height: 40
                color: "#ffffff"
                anchors.left: rec2.left
                anchors.right: rec2.right

                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 0
                font.capitalization: Font.AllUppercase
                topPadding: 8
                font.pointSize: 14
                placeholderText: qsTr("?")
                background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
                }
                anchors.leftMargin: 0
                anchors.topMargin: 0
                placeholderTextColor: "#00ff00"
                onTextChanged: {

                    if(tf_customerName.text.indexOf(" ", 0) == 0){
                        tf_customerName.text = tf_customerName.text.substring(1,)
                    }
                    if(tf_customerName.text.indexOf(" ", 0) != -1){
                        customerPage.name_Customer = tf_customerName.text.substring(0, tf_customerName.text.indexOf(" ", 0))
                    }
                    else{
                        customerPage.name_Customer =  tf_customerName.text
                    }

                    tf_abberaviation.text = customerPage.subject_Customer + customerPage.name_Customer
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

        Image {
            id: image
            x: 975
            width: 11
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.bottomMargin: 0
            anchors.topMargin: 159
            anchors.leftMargin: 975
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: rectangle2
            x: 1290
            y: 193
            width: 341
            height: 24
            color: "#a5d4a5"
            radius: 13
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
        }

        Rectangle {
            id: rectangle3
            x: 1038
            y: 193
            width: 263
            height: 24
            color: "#a5d4a5"
            radius: 13
            Label {
                id: label5
                width: label5.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng các khách hàng:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
            anchors.horizontalCenter: lv_customerInfo.horizontalCenter
            anchors.horizontalCenterOffset: -36
        }

        Label {
            id: lb_canNotChange
            x: 1666
            y: 158
            color: "#ff0000"
            text: qsTr("* Đã dùng không thể sửa.")
            font.pointSize: 12
            visible: false
        }

        Button {
            id: bt_rewriteCustomerInfo
            y: 63
            width: 286
            height: 90
            text: qsTr("Sửa")
            anchors.left: parent.left
            font.pointSize: 11
            topPadding: 6
            font.weight: Font.Normal
            font.bold: false
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 50
                anchors.fill: parent
            }
            anchors.leftMargin: 1614
            onClicked: {
                se_btnClicked.play()
                if(bt_rewriteCustomerInfo.text == "Sửa"){

                    customerPage.id_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).id_
                    customerPage.subject_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).subject_
                    customerPage.name_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).name_
                    customerPage.abbreviation_Customer_Want_To_Change = lv_customerInfo.model.get(lv_customerInfo.currentIndex).abbreviation_

                    bt_addFabricConfig.text = "Lưu"
                    bt_rewriteCustomerInfo.text = "Hủy"

                    var i = 0
                    for (i = 0; i < cb_subjectType.model.count; i++) {
                        if(cb_subjectType.model.get(i).subject_ === lv_customerInfo.model.get(lv_customerInfo.currentIndex).subject_)
                        {
                            break;
                        }
                    }
                    cb_subjectType.currentIndex = i

                    tf_customerName.text = lv_customerInfo.model.get(lv_customerInfo.currentIndex).name_
                    tf_abberaviation.text = lv_customerInfo.model.get(lv_customerInfo.currentIndex).abbreviation_
                }
                else{
                    bt_addFabricConfig.text = "Tạo mới"
                    bt_rewriteCustomerInfo.text = "Sửa"
                    tf_customerName.text = ""
                    tf_abberaviation.text = ""
                }

            }
        }

        Rectangle {
            id: rec4
            width: 40
            height: cb_subjectType.height
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 12
            anchors.topMargin: 232
            Label {
                id: label26
                x: 163
                y: 197
                width: label26.contentWidth
                height: 28
                color: "#ffffff"
                text: qsTr("STT:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                anchors.bottomMargin: 0
                font.pointSize: 11
            }
        }

        Rectangle {
            id: rec5
            width: 150
            height: cb_subjectType.height
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            anchors.left: rec4.right
            anchors.top: parent.top
            anchors.leftMargin: 3
            anchors.topMargin: 232
            Label {
                id: label27
                x: 163
                y: 197
                width: label27.contentWidth
                height: 28
                color: "#ffffff"
                text: qsTr("Đại từ xưng hô:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                anchors.bottomMargin: 0
                font.pointSize: 11
            }
        }

        Rectangle {
            id: rec6
            width: 498
            height: cb_subjectType.height
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            anchors.left: rec5.right
            anchors.top: parent.top
            anchors.topMargin: 232
            anchors.leftMargin: 3
            Label {
                id: label28
                x: 163
                y: 197
                width: label28.contentWidth
                height: 28
                color: "#ffffff"
                text: qsTr("Tên:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                anchors.bottomMargin: 0
                font.pointSize: 11
            }
        }

        Rectangle {
            id: rec7
            width: 257
            height: cb_subjectType.height
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            anchors.left: rec6.right
            anchors.top: parent.top
            anchors.leftMargin: 3
            anchors.topMargin: 232
            Label {
                id: label29
                x: 163
                y: 197
                width: label29.contentWidth
                height: 28
                color: "#ffffff"
                text: qsTr("Ký hiệu in đầu cây:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                anchors.bottomMargin: 0
                font.pointSize: 11
            }
        }

    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP
    PU_AddCustomerWithBlankText{
        id: pu_addCustomerWithBlankText
        x: rectangle.width/2 - pu_addCustomerWithBlankText.width/2
        y: rectangle.height/2 - pu_addCustomerWithBlankText.height/2
    }

    PU_AddCustomer{
        id: pu_addCustomer
        x: rectangle.width/2 - pu_addCustomer.width/2
        y: rectangle.height/2 - pu_addCustomer.height/2
    }

    PU_EditCustomer{
        id: pu_editCustomer
        x: rectangle.width/2 - pu_editCustomer.width/2
        y: rectangle.height/2 - pu_editCustomer.height/2
    }


    //

    Connections{
        target: customerPageBridge

        function onFill_lv_customerInfo(customerListData){
            lv_customerInfo.model.clear()
            customerListData.forEach(function (item, index) {
              lv_customerInfo.model.append({"id_": item[0], "subject_": item[1], "name_": item[2], "abbreviation_": item[3]})
            })
            lv_customerInfo.currentIndex = 0
        }

        function onFill_lv_fabricConfig(configData){
            if(configData.length != 0){
                lb_canNotChange.visible = true
                bt_rewriteCustomerInfo.enabled = false
            }
            else{
                lb_canNotChange.visible = false
                bt_rewriteCustomerInfo.enabled = true
            }
            lv_fabricConfig.model.clear()
            configData.forEach(function (item, index) {
              lv_fabricConfig.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                               "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9], "YarnLotId5_": item[10], "Yarn1Speed_": item[11], "Yarn2Speed_": item[12],
                                               "Yarn3Speed_": item[13], "Yarn4Speed_": item[14], "Yarn5Speed_": item[15], "Yarn1ConeNum_": item[16], "Yarn2ConeNum_": item[17], "Yarn3ConeNum_": item[18], "Yarn4ConeNum_": item[19], "Yarn5ConeNum_": item[20],
                                               "YarnRoundsPerRoll_": item[21], "Dia_": item[22], "G_": item[23], "CustomerId_": item[24]})
            })
        }

    }


}
















/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}
}
##^##*/
