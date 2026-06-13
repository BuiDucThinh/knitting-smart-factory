import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import "../contents/editUserPagePopUp"
import QtQuick.Layouts 1.0
import QtMultimedia 5.4

Item {
    id: editUserPage
    // data for show user
    property string idRow: ""
    property string cardUID: ""
    property string firstName: ""
    property string lastName: ""
    property string phone: ""
    property string position: ""
    property string workInCompany: ""
    property string joinCompanyDay: ""
    property string outCompanyDay: ""

    property string faceImgURL: ""
    property string idttCardFrontImgURL: ""
    property string idttCardBackImgURL: ""

    width: 1920
    height: 985
    Rectangle {
        id: rectangle
        color: "#222222"
        radius: 3
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0

        Component.onCompleted: {
        }


        ListView {
            id: lv_user
            width: 1372
            height: 525
            anchors.left: parent.left
            anchors.top: tf_search.bottom
            anchors.topMargin: 3
            anchors.leftMargin: 12
            spacing: 3
            model: ListModel {
//                ListElement{
//                    id_ : "1"
//                    cardid_ : "1"
//                    text1_: "NAM"
//                    text2_: "NGUYEN VAN"
//                    text3_: "0987 034 766"
//                    text4_: "KỸ THUẬT"
//                    text5_: "DANG LAM"
//                    text6_: "2021/11/31 14:20:20"
//                    text7_: ""
//                    text8_: "" // IMG URL
//                    text9_: "" // IMG URL
//                    text10_: "" // IMG URL
//                }
            }
            delegate: DLG_7Text{rowWidth: 1372
                rowHeigh :40 }

            Component.onCompleted: {
                editUserPageBridge.requestFillUserListView()
            }

            onCurrentIndexChanged: {
                if(lv_user.currentIndex !== -1){
                    idRow = lv_user.model.get(lv_user.currentIndex).id_
                    cardUID = lv_user.model.get(lv_user.currentIndex).cardid_
                    firstName = lv_user.model.get(lv_user.currentIndex).text1_
                    lastName = lv_user.model.get(lv_user.currentIndex).text2_
                    phone = lv_user.model.get(lv_user.currentIndex).text3_
                    position = lv_user.model.get(lv_user.currentIndex).text4_
                    workInCompany = lv_user.model.get(lv_user.currentIndex).text5_
                    joinCompanyDay = lv_user.model.get(lv_user.currentIndex).text6_
                    outCompanyDay = lv_user.model.get(lv_user.currentIndex).text7_

                    img_faceUser.source = lv_user.model.get(lv_user.currentIndex).text8_
                    img_citizenIndetifyFront.source = lv_user.model.get(lv_user.currentIndex).text9_
                    img_citizenIndetifyBack.source = lv_user.model.get(lv_user.currentIndex).text10_
                }
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

        TextField {
            id: tf_search
            width: 1372
            height: 40
            anchors.left: parent.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            topPadding: 8
            font.pointSize: 13
            anchors.topMargin: 44
            font.weight: Font.Normal
            font.capitalization: Font.AllUppercase
            anchors.leftMargin: 12
            placeholderText: qsTr("Nhập tên nhân sự muốn tìm...")

            onTextChanged: {
                editUserPageBridge.tf_searchChanged(tf_search.text)
            }
        }

        Rectangle {
            id: rectangle2
            x: 518
            width: 341
            height: 24
            color: "#a5d4a5"
            radius: 13
            anchors.top: parent.top
            anchors.topMargin: 12
            anchors.horizontalCenterOffset: 0
            Label {
                id: label4
                width: label4.contentWidth
                height: 28
                color: "#222222"
                text: qsTr("Bảng các thông tin nhân sự công ty:")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
            anchors.horizontalCenter: tf_search.horizontalCenter
        }

        // VERTICAL SPARATE
        Image {
            id: img_vericalSeparate
            width: 11
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 1390
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: lb_name
            x: 1407
            y: 94
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Họ và tên:")
            font.pointSize: 11
        }

        Label {
            id: lb_joinDay
            x: 1407
            y: 232
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Thời điểm vào làm:")
            font.pointSize: 11
        }

        Label {
            id: lb_phone
            x: 1407
            y: 140
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Số điện thoại:")
            font.pointSize: 11
        }

        Label {
            id: lb_position
            x: 1407
            y: 186
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Vị trí công tác:")
            font.pointSize: 11
        }

        Label {
            id: lb_name_Value
            x: 1560
            y: 94
            width: 177
            height: 28
            color: "#ffffff"
            text: lastName + " " + firstName
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_joinDay_Value
            x: 1560
            y: 232
            width: 177
            height: 28
            color: "#ffffff"
            text: joinCompanyDay
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_phone_Value
            x: 1560
            y: 140
            width: 177
            height: 28
            color: "#ffffff"
            text: phone
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_position_Value
            x: 1560
            y: 186
            width: 177
            height: 28
            color: "#ffffff"
            text: position
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_outDay
            x: 1407
            y: 278
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Thời điểm nghỉ:")
            font.pointSize: 11
        }

        Label {
            id: lb_outDay_Value
            x: 1560
            y: 278
            width: 177
            height: 28
            color: "#ffffff"
            text: outCompanyDay != "" ? outCompanyDay : "Chưa nghỉ"
            font.pointSize: 11
            font.bold: true
        }

        Label {
            id: lb_wellCome
            x: 1475
            y: 26
            width: 366
            height: 28
            color: "#ffffff"
            text: qsTr("Thông tin chi tiết.")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 16
        }

        Button {
            id: bt_userOutCompany
            x: 1456
            y: 348
            width: 404
            height: 98

            onClicked: {
                if(outCompanyDay === ""){
//                    editUserPageBridge.userOutCompany(idRow)
                    se_btnClicked.play()
                    pu_userOutCompany.open()
                    se_pop.play()                    
                }
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 100
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/editUserPage/userOutCompanyBtn.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 180
                    height: 90
                }

            }
        }

        TextField {
            id: tf_cardUid
            enabled: false
            x: 1419
            y: 644
            width: 479
            height: 40
            placeholderText: qsTr("")
            placeholderTextColor: "#00ff00"
            color: "white"
            onTextChanged: {
                cardUID = tf_cardUid.text
                if (cardUID != ""){editUserPageBridge.checkUsed(cardUID)}
            }
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: tf_cardUid.text === "" ? "#ff0000" : "#00ff00"
            }
        }


        SoundEffect {
            id: se_cameraShutter
            source: "../../soundEffects/cameraShutter.wav"
        }

        SoundEffect {
            id: se_pop
            source: "../../soundEffects/pop1.wav"
        }

        SoundEffect {
            id: se_beep
            source: "../../soundEffects/beep.wav"
        }

        Button {
            id: bt_overWriteCardUID
            x: 1456
            y: 741
            width: 404
            height: 98
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 100
                anchors.fill: parent
                Image {
                    width: 180
                    height: 90
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/editUserPage/overWriteCardUID.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            onClicked:{
                se_btnClicked.play()
                pu_overWriteCardUID.open()
                se_pop.play()
            }
        }

// FACE IMG
        Rectangle {
            id: rec_faceUserIMG
            y: 645
            width: 440
            height: 332
            color: "#00000000"
            radius: 2
            border.color: "#ffffff"
            border.width: 1
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.leftMargin: 18
            Image {
                id: img_faceUser
                width: 432
                height: 324
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }
// IDTT CARD FRONT
        Rectangle {
            id: rec_idttCardFrontIMG
            y: 645
            width: 440
            height: 332
            color: "#00000000"
            radius: 2
            border.color: "#ffffff"
            border.width: 1
            anchors.left: rec_faceUserIMG.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 8
            Image {
                id: img_citizenIndetifyFront
                width: 432
                height: 324
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }
// IDTT CARD BACK
        Rectangle {
            id: rec_idttCardBackIMG
            y: 645
            width: 440
            height: 332
            color: "#00000000"
            radius: 2
            border.color: "#ffffff"
            border.width: 1
            anchors.left: rec_idttCardFrontIMG.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 8
            Image {
                id: img_citizenIndetifyBack
                width: 432
                height: 324
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }

    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

//===================================================== POPUP
    PU_UserOutCompany{
        id: pu_userOutCompany
        x: rectangle.width/2 - pu_userOutCompany.width/2
        y: rectangle.height/2 - pu_userOutCompany.height/2
    }

    PU_OverWriteCardUID{
        id: pu_overWriteCardUID
        x: rectangle.width/2 - pu_overWriteCardUID.width/2
        y: rectangle.height/2 - pu_overWriteCardUID.height/2
    }

    PU_WarningCardUsed{
        id: pu_wariningCardUsed
        x: rectangle.width/2 - pu_wariningCardUsed.width/2
        y: rectangle.height/2 - pu_wariningCardUsed.height/2
    }


// ================================================= CONNECTIONS
    Connections{
        target: editUserPageBridge

        function onNewCardInfo(cardUID_){
            se_beep.play()
            tf_cardUid.text = cardUID_
        }

        function onAnswerCheckCardUsed(answer_){
            if(answer_ === true){
                pu_wariningCardUsed.open()
                se_pop.play()
            }
        }

        function onFillUserListView(listUser_){
            lv_user.model.clear()
            if(listUser_.length !== 0){
                listUser_.forEach(function (item, index) {
                        lv_user.model.append({"id_": item[0], "cardid_": item[1], "text1_": item[2], "text2_": item[3], "text3_": item[4], "text4_": item[5], "text5_": item[6], "text6_": item[7], "text7_": item[8] !== "None" ? item[8] : "", "text8_": item[9], "text9_": item[10], "text10_": item[11]})
                })
                lv_user.currentIndex = -1
                lv_user.currentIndex = 0
            }
        }

        function onUpdateOutCompanyDayOfModelOfListView(newDay_){
            lv_user.model.get(lv_user.currentIndex).text7_ = newDay_
            lv_user.model.get(lv_user.currentIndex).text5_ = "ĐÃ NGHỈ"
            outCompanyDay = newDay_

        }
    }

}






/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
