import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import "../contents/yarnPagePopUp"

Item {

    width: 1920
    height: 985

    property var locale: Qt.locale()
    property date currentTime //: new Date()
    property string timeString
    property int yarnCountInput: 0
    property int yarnEditCountInput: 0

    property int run: 0
    property int offsetPosition: 0
    property string code

    property bool producerAlreadyUsed: true
    property bool yarnAlreadyUsed: true

    Rectangle {
        id: rectangle
        color: "#222222"
        anchors.fill: parent
        //===============================================================================================================================================
        ListView {
            id: lv_yarnLot
            width: 934
            anchors.left: tf_search.left
            anchors.top: tf_search.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 3
            anchors.bottomMargin: 16
            anchors.leftMargin: 0
            spacing: 3
            model: ListModel {
                ListElement{
                    index_: ""
                    text_: ""
                    yarnType_: ""
                    producer_: ""
                    lot_: ""
                }
            }
            delegate: DLG_OneText{rowWidth: 932
                rowHeigh :40 }

            Component.onCompleted: {
                yarnPageBridge.lv_yarnLotCompleted(cb_yarnType.currentIndex.toString() ,cb_producer.currentIndex.toString())

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
                height: 18
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
        ListView {
            id: lv_yarnType
            width: 469
            anchors.left: tf_addYarnType.left
            anchors.top: parent.top
            anchors.bottom: bt_DeleteYarnType.top
            anchors.leftMargin: 0
            anchors.bottomMargin: 12
            anchors.topMargin: 315
            spacing: 3
            model: ListModel {
                ListElement{
                    index_: " "
                    text_: " "
                    d_: " "
                }
            }
            delegate: DLG_TwoText{rowWidth: lv_yarnType.width
                rowHeigh :40 }
            Component.onCompleted: {
                yarnPageBridge.lv_yarnTypeCompleted()
                if(lv_yarnType.count != 0){
                    lv_yarnType.currentIndex = 1
                    lv_yarnType.currentIndex = 0
                }
            }
            onCurrentIndexChanged: {
                tf_editD.text = lv_yarnType.model.get(lv_yarnType.currentIndex).d_
                tf_editNe.text = (5314.87/parseFloat(tf_editD.text)).toFixed(2).toString()
                tf_editDtex.text = ((10*parseFloat(tf_editD.text))/9).toFixed(2).toString()
                tf_editYarnType.text = lv_yarnType.model.get(lv_yarnType.currentIndex).text_
                yarnPageBridge.tf_editYarnTypeChangedNeedToUpdateAlreadyUseVariable(lv_yarnType.model.get(lv_yarnType.currentIndex).text_)
            }

            Rectangle {
                width: lv_yarnType.width
                height: 40
                color: "#222222"
                anchors.left: parent.left
                anchors.bottom: parent.top
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                width: lv_yarnType.width
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

        //====================================================================================================== LISTVIEW PRODUCER
        ListView {
            id: lv_producer
            x: 1460
            width: 464
            anchors.right: tf_addProducer.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 71
            anchors.rightMargin: 0
            anchors.topMargin: 315
            spacing: 3
            model: ListModel {
                ListElement{
                    index_: ""
                    text_: ""
                }
            }
            delegate: DLG_OneText{rowWidth: 462
                rowHeigh :40 }
            Component.onCompleted: {
                yarnPageBridge.lv_producerCompleted()
                if(lv_producer.count != 0){
                    lv_producer.currentIndex = 1
                    lv_producer.currentIndex = 0
                }
            }
            onCurrentIndexChanged: {
                tf_editProducer.text = lv_producer.model.get(lv_producer.currentIndex).text_
                yarnPageBridge.tf_editProducerChangedNeedToUpdateAlreadyUseVariable(lv_producer.model.get(lv_producer.currentIndex).text_)
            }

            Rectangle {
                width: 464
                height: 40
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
        //====================================================================================================== END LISTVIEW PRODUCER
        Rectangle {
            x: 266
            width: 341
            height: 24
            color: "#00ff00"
            radius: 13
            anchors.top: parent.top
            anchors.topMargin: 12
            anchors.horizontalCenter: rectangle1.horizontalCenter
            Label {
                id: label1
                width: label1.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Tạo mới 1 mã lô sợi:")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 12

            }
        }
        Rectangle {
            id: rectangle1
            width: 932
            height: 40
            color: "#00ffffff"
            radius: 2
            border.color: "#6c6c6c"
            anchors.left: tf_search.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 46

            Label {
                id: lb_yarnLotCode
                y: 5
                width: 907
                height: 28
                color: "#ffffff"
                text: qsTr("Mã lô sợi ...")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                font.family: "Ubuntu Mono"
                anchors.verticalCenterOffset: -1
                anchors.leftMargin: 8
                font.pointSize: 13
                font.bold: false
            }
        }
//======================================================================= COMBOBOX YARN TYPE==================================================================
        ComboBox {
            id: cb_yarnType
            width: 306
            height: 40
            anchors.left: tf_search.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 120
            transformOrigin: Item.Center
            model: lv_yarnType.model
            textRole: "text_"
            font.family: "Ubuntu Mono"
            font.pointSize: 13
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
                width: parent.width
                height:40
                contentItem: Item {
                    id: cti_ItemDelegate
                      width: parent.width
                      height: 40
                      anchors.top: parent.top
                      anchors.left: parent.left
                      Rectangle{
                          id: rectIndex
                          width: 40
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
                              font: cb_yarnType.font
                              elide: Text.ElideRight
                          }
                      }
                      Rectangle{
                          width: cb_yarnType.width - rectIndex.width
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
                              //color: hovered?"black":"red"
                              font: cb_yarnType.font
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
                 //onPressed: console.log(cb_yarnType.model.get(cb_yarnType.currentIndex).text_)//are not the same!
            }
            onCurrentTextChanged: {
                //if(cb_yarnType.currentText == "")
                if(cb_yarnType.currentText === "" && cb_producer.currentText === ""){
                    lb_yarnLotCode.text = ""
                }else{                    
                    currentTime = new Date()
                    //timeString = currentTime.toLocaleTimeString(locale, 'hmm') + currentTime.toLocaleDateString(locale, 'ddMMyy')
                    timeString = currentTime.toLocaleTimeString(locale, 'hh:mm') + " " + currentTime.toLocaleDateString(locale, 'dd/MM/yy')

                    code = cb_yarnType.currentText
                    offsetPosition = 12 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + cb_producer.currentText
                    offsetPosition = 24 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + tf_lot.text.toUpperCase()
                    offsetPosition = 36 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + timeString
                    lb_yarnLotCode.text = code
                }
            }
        }
//======================================================================= end COMBOBOX YARN TYPE
        Label {
            id: label2
            width: label2.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Chủng loại sợi:")
            anchors.left: cb_yarnType.left
            anchors.top: parent.top
            anchors.leftMargin: 5
            anchors.topMargin: 96
            font.pointSize: 12
            font.bold: false
        }

        ComboBox {
            id: cb_producer
            width: 306
            height: 40
            anchors.left: cb_yarnType.right
            anchors.top: parent.top
            transformOrigin: Item.Center
            anchors.leftMargin: 6
            anchors.topMargin: 120
            textRole: "text_"
            font.family: "Ubuntu Mono"
            font.pointSize: 13
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
            model: lv_producer.model
            delegate: ItemDelegate {
                id:itemDlgt2
                width: parent.width
                height:40
                contentItem: Item {
                    id: cti_ItemDelegate2
                      width: parent.width
                      height: 40
                      anchors.top: parent.top
                      anchors.left: parent.left
                      Rectangle{
                          id: rectIndex2
                          width: 40
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
                              font: cb_producer.font
                              elide: Text.ElideRight
                          }
                      }
                      Rectangle{
                          width: cb_producer.width - rectIndex2.width
                          height: 39
                          anchors.top: parent.top
                          anchors.topMargin: 1
                          anchors.left: rectIndex2.right
                          anchors.leftMargin: 1
                          color: "white"
                          radius: 2
                          Text {
                              anchors.verticalCenter: parent.verticalCenter
                              anchors.left: parent.left
                              anchors.leftMargin: 10
                              text: text_
                              //color: hovered?"black":"red"
                              font: cb_producer.font
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
                 //onPressed: console.log(cb_yarnType.model.get(cb_yarnType.currentIndex).text_)//are not the same!
            }
            onCurrentTextChanged: {
                if(cb_yarnType.currentText === "" && cb_producer.currentText === ""){
                    lb_yarnLotCode.text = ""
                }else{                    
                    currentTime = new Date()
                    //timeString = currentTime.toLocaleTimeString(locale, 'hmm') + currentTime.toLocaleDateString(locale, 'ddMMyy')
                    timeString = currentTime.toLocaleTimeString(locale, 'hh:mm') + " " + currentTime.toLocaleDateString(locale, 'dd/MM/yy')
                    code = cb_yarnType.currentText
                    offsetPosition = 12 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + cb_producer.currentText
                    offsetPosition = 24 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + tf_lot.text.toUpperCase()
                    offsetPosition = 36 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + timeString
                    lb_yarnLotCode.text = code
                }
            }
        }

        Label {
            id: label3
            width: label3.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Thương hiệu:")
            anchors.left: cb_producer.left
            anchors.top: parent.top
            font.pointSize: 12
            font.bold: false
            anchors.leftMargin: 5
            anchors.topMargin: 96
        }

        Label {
            id: label4
            width: label4.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Mã lô ( Lot ):")
            anchors.left: tf_lot.left
            anchors.top: parent.top
            font.pointSize: 12
            font.bold: false
            anchors.leftMargin: 5
            anchors.topMargin: 96
        }

        TextField {
            id: tf_lot
            width: 308
            height: 40
            anchors.left: cb_producer.right
            anchors.top: parent.top
            anchors.leftMargin: 6
            anchors.topMargin: 120
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            onTextChanged: {
                if((cb_yarnType.currentIndex != -1) && (cb_producer.currentIndex != -1)){
                    currentTime = new Date()
                    //timeString = currentTime.toLocaleTimeString(locale, 'hmm') + currentTime.toLocaleDateString(locale, 'ddMMyy')
                    timeString = currentTime.toLocaleTimeString(locale, 'hh:mm') + " " + currentTime.toLocaleDateString(locale, 'dd/MM/yy')
                    code = cb_yarnType.currentText
                    offsetPosition = 12 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + cb_producer.currentText
                    offsetPosition = 24 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + tf_lot.text.toUpperCase()
                    offsetPosition = 36 - code.length
                    for(run = 1; run <= offsetPosition; run++){
                        code = code + " "
                    }
                    code = code + timeString
                    lb_yarnLotCode.text = code
                }
            }
        }

        Button {
            id: bt_addYarnLot
            width: 460
            height: 40
            text: qsTr("Tạo mới")
            anchors.left: tf_search.left
            anchors.top: parent.top
            anchors.topMargin: 170
            anchors.leftMargin: 0
            font.pointSize: 11
            background: Rectangle{
                anchors.fill: parent
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
            }
            onClicked: {                
                if(cb_yarnType.currentText == "" || cb_producer.currentText == ""){
                    pu_addYarnLotWithNoText.open()
                }else{
                    pu_addYarnLot.open()                    
                }
                se_btnClicked.play()
            }
        }

        TextField {
            id: tf_search
            width: 932
            height: 40
            anchors.left: parent.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            topPadding: 8
            font.pointSize: 13
            anchors.topMargin: 272
            font.weight: Font.Normal
            font.capitalization: Font.AllUppercase
            anchors.leftMargin: 12
            placeholderText: qsTr("Nhập mã lô sợi muốn tìm...")

            onTextChanged: {
                yarnPageBridge.tf_searchChanged(tf_search.text)
            }

        }

        TextField {
            id: tf_addYarnType
            x: 964
            width: 346
            height: 40
            text: ""
            anchors.right: tf_addProducer.left
            anchors.top: parent.top
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 46
            font.capitalization: Font.AllUppercase
            font.pointSize: 16
            placeholderText: qsTr("")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            anchors.rightMargin: 136
            onTextChanged: {
                tf_addYarnType.text = tf_addYarnType.text.replace(/[^a-zA-Z0-9 ]/g, "").replace(/\s/g, '')
            }
        }

        TextField {
            id: tf_addProducer
            x: 1440
            width: 464
            height: 40
            anchors.right: parent.right
            anchors.top: parent.top
            font.bold: false
            font.family: "Ubuntu Mono"
            font.pointSize: 16
            color: "white"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            font.capitalization: Font.AllUppercase
            anchors.rightMargin: 12
            anchors.topMargin: 46
            onTextChanged: {
                tf_addProducer.text = tf_addProducer.text.replace(/[^a-zA-Z0-9 ]/g, "").replace(/\s/g, '')
            }
        }
//=================================================================================== bt_AddYarnType
        Button {
            id: bt_AddYarnType
            width: 114
            height: 40
            text: qsTr("Tạo mới")
            anchors.left: tf_addYarnType.right
            anchors.top: parent.top
            anchors.leftMargin: 6
            anchors.topMargin: 46
            enabled: true
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            onClicked: {
                if(tf_addYarnType.text !== "" && tf_D.text !== ""){
                    var x = false
                    for (let i = 0; i < lv_yarnType.model.count; i++) {
                        if(lv_yarnType.model.get(i).text_ === tf_addYarnType.text.toUpperCase())
                        {
                            x = true;
                            break;
                        }
                    }
                    if(x === true ){pu_addYarnTypeAlreadyExist.open()}
                    else{pu_addYarnType.open()}

                }
                else{
                    pu_addYarnTypeWithNoText.open()
                }
                se_btnClicked.play()
            }
        }
//=========================================================================================================== Button Add ProducerProducer
        Button {
            id: bt_AddProducer
            x: 1440
            width: 107
            height: 40
            text: qsTr("Tạo mới")
            anchors.right: tf_addProducer.right
            anchors.top: parent.top
            anchors.topMargin: 94
            anchors.rightMargin: 0
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11

            onClicked: {
                if(tf_addProducer.text !== ""){
                    var x = new Boolean(false);
                    for (let i = 0; i < lv_producer.model.count; i++) {
                        if(lv_producer.model.get(i).text_ === tf_addProducer.text.toUpperCase())
                        {
                            x = true;
                            break;
                        }
                    }
                    if(x === true ){pu_addProducerAlreadyExist.open()}
                    else{pu_addProducer.open()}

                }
                else{
                    pu_addProducerWithNoText.open()
                }
                se_btnClicked.play()
            }
        }

        Button {
            id: bt_EditYarnType
            width: 114
            height: 40
            text: qsTr("Sửa")
            anchors.left: tf_editYarnType.right
            anchors.top: parent.top
            anchors.leftMargin: 6
            anchors.topMargin: 173
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            onClicked: {
                if(tf_editYarnType.text !== "" && tf_editD.text !== ""){ // 2 filled -> work
//                    print("click")
                    if (yarnAlreadyUsed === true){
                        if (parseFloat(lv_yarnType.model.get(lv_yarnType.currentIndex).d_) === parseFloat(tf_editD.text)){
                            pu_editYarnButAlreadyUsedAndDNoChanged.open()
                        }
                        else{
                            pu_editYarnType.open()
                        }
                    }
                    else{
                        if (lv_yarnType.model.get(lv_yarnType.currentIndex).text_ === tf_editYarnType.text &&
                            parseFloat(lv_yarnType.model.get(lv_yarnType.currentIndex).d_) === parseFloat(tf_editD.text)    ){
//                            print("else1")
                            pu_editYarnTypeWithNoChange.open()
                        }
                        else{
//                            print("else2")
                            var x = new Boolean(false);
                            for (run = 0; run < lv_yarnType.model.count; run++) {
                                if(lv_yarnType.model.get(run).text_ === tf_editYarnType.text.toUpperCase())
                                {
                                    x = true;
                                    break;
                                }
                            }
                            if(x === true && run !== lv_yarnType.currentIndex){
//                                print("else2")
                                pu_editYarnToAlreadyExist.open()
                            }
                            else{
//                                print("else3")
                                pu_editYarnType.open()
                            }
                        }
                    }
                    se_btnClicked.play()
                }
            }
        }

        Button {
            id: bt_DeleteProducer
            height: 40
            text: qsTr("Xóa")
            anchors.left: lv_producer.left
            anchors.right: lv_producer.right
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 929
            anchors.rightMargin: 0
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11

            onClicked: {
                if(producerAlreadyUsed === false){
                    pu_deleteProducer.open()
                    se_btnClicked.play()
                }
            }
        }

        Button {
            id: bt_DeleteYarnType
            width: 466
            height: 40
            text: qsTr("Xóa")
            anchors.left: lv_yarnType.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 929
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            onClicked: {
                if(yarnAlreadyUsed == false){
                    pu_deleteYarnType.open()
                    se_btnClicked.play()
                }
            }
        }

        TextField {
            id: tf_editYarnType
            enabled: yarnAlreadyUsed ? false : true
            width: 346
            height: 40
            anchors.left: tf_addYarnType.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 173
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.capitalization: Font.AllUppercase
            font.pointSize: 16
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            font.weight: Font.Normal
        }

        Label {
            id: label8
            x: 964
            width: label8.contentWidth
            height: 28
            color: yarnAlreadyUsed ? "#ff0000" : "#ffffff"
            text: yarnAlreadyUsed ? "Đã được dùng - không thể xóa - sửa tên - chỉ có thể sửa mật độ!" : "Sửa tên loại sợi:"
            anchors.left: tf_editYarnType.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.leftMargin: 0
            anchors.topMargin: 150
            font.pointSize: 12
            font.bold: false
        }

        Label {
            id: label9
            width: label9.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Tạo mới loại sợi:")
            anchors.left: tf_addYarnType.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 23
            anchors.leftMargin: 0
            font.pointSize: 12
            font.bold: false
        }

        Label {
            id: label10
            width: label10.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Tạo mới thương hiệu / nhà sản xuất sợi:")
            anchors.left: tf_addProducer.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 23
            anchors.leftMargin: 0
            font.pointSize: 12
            font.bold: false
        }

        Button {
            id: bt_EditProducer
            x: 1797
            width: 107
            height: 40
            text: qsTr("Sửa")
            anchors.right: tf_editProducer.right
            anchors.top: parent.top
            onClicked: {               
                if(tf_editProducer.text !== ""){
                    if(producerAlreadyUsed === true){
                        pu_editProducerButAlreadyUsed.open()
                        //pu_editProducerWithNoChange.open()
                    }
                    else if(lv_producer.model.get(lv_producer.currentIndex).text_ === tf_editProducer.text.toUpperCase()){
                        pu_editProducerWithNoChange.open()
                    }
                    else{
                        var x = new Boolean(false);
                        for (let i = 0; i < lv_producer.model.count; i++) {
                            if(lv_producer.model.get(i).text_ === tf_editProducer.text.toUpperCase())
                            {
                                x = true;
                                break;
                            }
                        }
                        if(x === true ){pu_editProducerToAlreadyExist.open()}
                        else{
                            pu_editProducer.open()
                        }
                    }
                    se_btnClicked.play()
                }
            }
            anchors.topMargin: 221
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            anchors.rightMargin: 0
            font.bold: false
        }

        TextField {
            id: tf_editProducer
            enabled: producerAlreadyUsed ? false : true
            x: 1440
            width: 464
            height: 40
            anchors.right: tf_addProducer.left
            anchors.top: parent.top
            font.bold: false
            font.family: "Ubuntu Mono"
            font.pointSize: 16
            anchors.topMargin: 173
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            anchors.rightMargin: -464
            font.capitalization: Font.AllUppercase          
        }

        Label {
            id: label11
            x: 1440
            width: label11.contentWidth
            height: 28
            color: producerAlreadyUsed ? "red" : "#ffffff"
            text: producerAlreadyUsed ? "Đã được dùng - không thể xóa - sửa tên!" : "Sửa tên thương hiệu / nhà sản xuất sợi:"
            anchors.left: tf_editProducer.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 150
            anchors.leftMargin: 0
            font.pointSize: 12
            font.bold: false
        }

        Label {
            id: label12
            width: 28
            height: 28
            color: "#ff0d0d"
            text: qsTr("(*)")
            anchors.left: label2.right
            anchors.top: parent.top
            anchors.topMargin: 97
            font.pointSize: 12
            font.bold: true
            anchors.leftMargin: 5
        }

        Label {
            id: label13
            width: 28
            height: 28
            color: "#ff0d0d"
            text: qsTr("(*)")
            anchors.left: label3.right
            anchors.top: parent.top
            anchors.topMargin: 97
            font.pointSize: 12
            font.bold: true
            anchors.leftMargin: 5
        }

        Label {
            id: label14
            width: 28
            height: 28
            color: "#ff0d0d"
            text: qsTr("(*)")
            anchors.left: label9.right
            anchors.top: parent.top
            anchors.topMargin: 23
            font.pointSize: 12
            font.bold: true
            anchors.leftMargin: 5
        }

        Label {
            id: label15
            width: 28
            height: 28
            color: "#ff0d0d"
            text: qsTr("(*)")
            anchors.left: label10.right
            anchors.top: label10.bottom
            anchors.topMargin: -29
            font.pointSize: 12
            font.bold: true
            anchors.leftMargin: 5
        }

        Button {
            id: bt_searchByCb
            width: 459
            height: 40
            text: qsTr("Tìm kiếm")
            anchors.left: bt_addYarnLot.right
            anchors.top: parent.top
            anchors.topMargin: 170
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            font.pointSize: 11
            anchors.leftMargin: 12
            onClicked: {
                tf_search.text = ""
                yarnPageBridge.bt_searchByCbClicked(cb_yarnType.currentText, cb_producer.currentText)
                cb_yarnType.currentIndex = -1
                cb_producer.currentIndex = -1
                se_btnClicked.play()
            }
        }

        TextField {
            id: tf_D            
            width: 102
            height: 40
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            anchors.leftMargin: 41
            rightPadding: 3
            leftPadding: 5
            anchors.topMargin: 8
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            inputMethodHints: Qt.ImhDigitsOnly
            onFocusChanged: {
                if(tf_D.focus === true){yarnCountInput = 1}
            }
            onTextChanged: {
                if(tf_D.text !== ""){
                    if (yarnCountInput == 1){
                        tf_Ne.text = (5314.87/parseFloat(tf_D.text)).toFixed(2).toString()
                        tf_Dtex.text = ((10*parseFloat(tf_D.text))/9).toFixed(2).toString()
                    }
                }
            }
        }

        Label {
            id: label16
            x: 964
            width: label16.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("NeB:")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            anchors.topMargin: 30
            anchors.leftMargin: 163
            font.pointSize: 12
        }

        Label {
            id: label17
            x: 964
            width: label17.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("D:")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            anchors.topMargin: 30
            font.pointSize: 12
            anchors.leftMargin: 0
        }

        TextField {
            id: tf_Ne
            width: 102
            height: 40
            text: ""
            anchors.left: tf_D.right
            anchors.top: tf_addYarnType.bottom
            anchors.leftMargin: 61
            leftInset: 0
            rightPadding: 3
            leftPadding: 5
            anchors.topMargin: 8
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            inputMethodHints: Qt.ImhDigitsOnly
            onFocusChanged: {
                if(tf_Ne.focus === true){yarnCountInput = 2}
            }
            onTextChanged: {
                if(tf_Ne.text !== ""){
                    if (yarnCountInput == 2){
                        tf_D.text = (5314.87/parseFloat(tf_Ne.text)).toFixed(2).toString()
                        tf_Dtex.text = ((10*parseFloat(tf_D.text))/9).toFixed(2).toString()
                    }
                }
            }
        }

        Label {
            id: label18
            x: 964
            width: label18.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Dtex:")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            anchors.topMargin: 30
            font.pointSize: 12
            anchors.leftMargin: 318
        }

        TextField {
            id: tf_Dtex
            x: 1338
            width: 102
            height: 40
            anchors.right: bt_AddYarnType.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            rightPadding: 3
            leftPadding: 5
            anchors.topMargin: 94
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            inputMethodHints: Qt.ImhDigitsOnly
            onFocusChanged: {
                if(tf_Dtex.focus === true){yarnCountInput = 3}
            }
            onTextChanged: {
                if(tf_Dtex.text !== ""){
                    if (yarnCountInput == 3){
                        tf_D.text = (parseFloat(tf_Dtex.text)*0.9).toFixed(2).toString()
                        tf_Ne.text = (5315/parseFloat(tf_D.text)).toFixed(2).toString()
                    }
                }
            }
        }

        Label {
            id: label19
            width: 28
            height: 28
            color: "#ff0d0d"
            text: qsTr("(*)")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            anchors.leftMargin: 17
            font.bold: true
            anchors.topMargin: 28
            font.pointSize: 12
        }

        TextField {
            id: tf_editD
            width: 102
            height: 40
            anchors.left: tf_D.left
            anchors.top: tf_addYarnType.bottom
            anchors.leftMargin: 0
            font.weight: Font.Normal
            anchors.topMargin: 135
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            inputMethodHints: Qt.ImhDigitsOnly
            leftPadding: 5
            rightPadding: 3
            onFocusChanged: {
                if(tf_editD.focus === true){yarnEditCountInput = 1}
            }
            onTextChanged: {
                if(tf_editD.text !== ""){
                    if (yarnEditCountInput == 1){
                        tf_editNe.text = (5314.87/parseFloat(tf_editD.text)).toFixed(2).toString()
                        tf_editDtex.text = ((10*parseFloat(tf_editD.text))/9).toFixed(2).toString()
                    }
                }
            }
        }

        Label {
            id: label20
            x: 964
            width: label20.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("D:")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 158
            font.pointSize: 12
            anchors.leftMargin: 0
            font.bold: false
        }

        Label {
            id: label21
            width: 28
            height: 28
            color: "#ff0d0d"
            text: qsTr("(*)")
            anchors.left: tf_addYarnType.right
            anchors.top: tf_addYarnType.bottom
            anchors.leftMargin: -330
            anchors.topMargin: 155
            font.pointSize: 12
            font.bold: true
        }

        Label {
            id: label22
            x: 964
            width: label22.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("NeB:")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 158
            font.pointSize: 12
            anchors.leftMargin: 163
            font.bold: false
        }

        TextField {
            id: tf_editNe
            width: 102
            height: 40
            text: ""
            anchors.left: tf_editD.right
            anchors.top: tf_addYarnType.bottom
            anchors.leftMargin: 61
            font.weight: Font.Normal
            anchors.topMargin: 135
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            inputMethodHints: Qt.ImhDigitsOnly
            leftPadding: 5
            rightPadding: 3
            onFocusChanged: {
                if(tf_editNe.focus === true){yarnEditCountInput = 2}
            }
            onTextChanged: {
                if(tf_editNe.text !== ""){
                    if (yarnEditCountInput == 2){
                        tf_editD.text = (5314.78/parseFloat(tf_editNe.text)).toFixed(2).toString()
                        tf_editDtex.text = ((10*parseFloat(tf_editD.text))/9).toFixed(2).toString()
                    }
                }
            }
            leftInset: 0
        }

        Label {
            id: label23
            x: 964
            width: label23.contentWidth
            height: 28
            color: "#ffffff"
            text: qsTr("Dtex:")
            anchors.left: tf_addYarnType.left
            anchors.top: tf_addYarnType.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 158
            font.pointSize: 12
            anchors.leftMargin: 318
            font.bold: false
        }

        TextField {
            id: tf_editDtex
            x: 1338
            width: 102
            height: 40
            anchors.right: bt_EditYarnType.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            font.weight: Font.Normal
            anchors.topMargin: 221
            font.family: "Ubuntu Mono"
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.capitalization: Font.AllUppercase
            font.pointSize: 14
            placeholderText: qsTr("?")
            color: "white"
            placeholderTextColor: "#00ff00"
            background: Rectangle {
                    color: "#00ffffff"
                    radius: 2
                    border.color: "#00ff00"
            }
            inputMethodHints: Qt.ImhDigitsOnly
            leftPadding: 5
            rightPadding: 3
            onFocusChanged: {
                if(tf_editDtex.focus === true){yarnEditCountInput = 3}
            }
            onTextChanged: {
                if(tf_editDtex.text !== ""){
                    if (yarnEditCountInput == 3){
                        tf_editD.text = (parseFloat(tf_editDtex.text)*0.9).toFixed(2).toString()
                        tf_editNe.text = (5315/parseFloat(tf_editD.text)).toFixed(2).toString()
                    }
                }
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
            anchors.leftMargin: 949
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image1
            width: 11
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            fillMode: Image.PreserveAspectFit
            anchors.leftMargin: 1431
        }

        Rectangle {
            x: 309
            width: 194
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.top: parent.top
            anchors.horizontalCenter: tf_search.horizontalCenter
            anchors.topMargin: 238
            Label {
                id: label25
                width: label25.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng thông tin lô sợi")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Rectangle {
            x: 952
            width: 183
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.top: parent.top
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: lv_yarnType.horizontalCenter
            anchors.topMargin: 281
            Label {
                id: label26
                width: label26.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng chủng loại sợi")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Rectangle {
            x: 1600
            width: 300
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.top: parent.top
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: lv_producer.horizontalCenter
            anchors.topMargin: 281
            Label {
                id: label27
                width: label27.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng thương hiệu / nhà sản xuất sợi")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

    }

    //===================================================== POPUP
    PU_DeleteProducer{
        id: pu_deleteProducer
        x: rectangle.width/2 - pu_deleteProducer.width/2
        y: rectangle.height/2 - pu_deleteProducer.height/2
    }

    PU_EditProducer{
        id: pu_editProducer
        x: rectangle.width/2 - pu_editProducer.width/2
        y: rectangle.height/2 - pu_editProducer.height/2
    }

    PU_EditProducerWithNoChange{
        id: pu_editProducerWithNoChange
        x: rectangle.width/2 - pu_editProducerWithNoChange.width/2
        y: rectangle.height/2 - pu_editProducerWithNoChange.height/2
    }

    PU_EditProducerToAlreadyExist{
        id: pu_editProducerToAlreadyExist
        x: rectangle.width/2 - pu_editProducerToAlreadyExist.width/2
        y: rectangle.height/2 - pu_editProducerToAlreadyExist.height/2
    }

    PU_EditProducerButAlreadyUsed{
        id: pu_editProducerButAlreadyUsed
        x: rectangle.width/2 - pu_editProducerButAlreadyUsed.width/2
        y: rectangle.height/2 - pu_editProducerButAlreadyUsed.height/2
    }

    PU_AddProducer{
        id: pu_addProducer
        x: rectangle.width/2 - pu_addProducer.width/2
        y: rectangle.height/2 - pu_addProducer.height/2
    }

    PU_AddProducerWithNoText{
        id: pu_addProducerWithNoText
        x: rectangle.width/2 - pu_addProducerWithNoText.width/2
        y: rectangle.height/2 - pu_addProducerWithNoText.height/2
    }

    PU_AddProducerAlreadyExist{
        id: pu_addProducerAlreadyExist
        x: rectangle.width/2 - pu_addProducerAlreadyExist.width/2
        y: rectangle.height/2 - pu_addProducerAlreadyExist.height/2
    }        

    //======================================================
    PU_DeleteYarnType{
        id: pu_deleteYarnType
        x: rectangle.width/2 - pu_deleteYarnType.width/2
        y: rectangle.height/2 - pu_deleteYarnType.height/2
    }

    PU_EditYarnType{
        id: pu_editYarnType
        x: rectangle.width/2 - pu_editYarnType.width/2
        y: rectangle.height/2 - pu_editYarnType.height/2
    }

    PU_EditYarnButAlreadyUsedAndDNoChanged{
        id: pu_editYarnButAlreadyUsedAndDNoChanged
        x: rectangle.width/2 - pu_editYarnButAlreadyUsedAndDNoChanged.width/2
        y: rectangle.height/2 - pu_editYarnButAlreadyUsedAndDNoChanged.height/2
    }

    PU_EditYarnTypeWithNoChange{
        id: pu_editYarnTypeWithNoChange
        x: rectangle.width/2 - pu_editYarnTypeWithNoChange.width/2
        y: rectangle.height/2 - pu_editYarnTypeWithNoChange.height/2
    }

    PU_EditYarnTypeToAlreadyExist{
        id: pu_editYarnToAlreadyExist
        x: rectangle.width/2 - pu_editYarnToAlreadyExist.width/2
        y: rectangle.height/2 - pu_editYarnToAlreadyExist.height/2
    }

    PU_AddYarnType{
        id: pu_addYarnType
        x: rectangle.width/2 - pu_addYarnType.width/2
        y: rectangle.height/2 - pu_addYarnType.height/2
    }

    PU_AddYarnTypeWithNoText{
        id: pu_addYarnTypeWithNoText
        x: rectangle.width/2 - pu_addYarnTypeWithNoText.width/2
        y: rectangle.height/2 - pu_addYarnTypeWithNoText.height/2
    }

    PU_AddYarnTypeAlreadyExist{
        id: pu_addYarnTypeAlreadyExist
        x: rectangle.width/2 - pu_addYarnTypeAlreadyExist.width/2
        y: rectangle.height/2 - pu_addYarnTypeAlreadyExist.height/2
    }

    PU_AddYarnLot{
        id: pu_addYarnLot
        x: rectangle.width/2 - pu_addYarnLot.width/2
        y: rectangle.height/2 - pu_addYarnLot.height/2
    }

    PU_AddYarnLotWithNoText{
        id: pu_addYarnLotWithNoText
        x: parent.width/2 - pu_addYarnLotWithNoText.width/2
        y: parent.height/2 - pu_addYarnLotWithNoText.height/2
        message: "xinchoa"
    }

    // end
    Connections{
        target: yarnPageBridge
        function onFill_lv_yarnType(yarnListData){
            lv_yarnType.model.clear()
            yarnListData.forEach(function (item, index) {
              lv_yarnType.model.append({"index_": item[0], "text_": item[1], "d_": item[2]})
            })
        }
        function onFill_lv_producer(producerListData){
            lv_producer.model.clear()
            producerListData.forEach(function (item, index) {
              lv_producer.model.append({"index_": item[0], "text_": item[1]})
              //lv_producer.currentIndex = 1
                //lv_producer.currentIndex = 0
            })
        }        
        function onFill_lv_yarnLot(yarnLotListData){
            lv_yarnLot.model.clear()
            yarnLotListData.forEach(function (item, index) {
              lv_yarnLot.model.append({"index_": item[0], "text_": item[1], "yarnType_": item[2], "producer_": item[3], "lot_": item[4]})

            })
        }

        function onUpdateProducerAlreadyUsedVariable(flag){
            producerAlreadyUsed = flag
        }

        function onUpdateYarnAlreadyUsedVariable(flag){
            yarnAlreadyUsed = flag
        }

    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
