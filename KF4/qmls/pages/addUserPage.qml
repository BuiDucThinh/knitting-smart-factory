import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents/addUserPagePopUp"
import QtQuick.Layouts 1.0
//import QtMultimedia 5.4
import QtMultimedia
import QtQuick3D


Item {
    // data for add new user
    property string firstName: ""
    property string lastName: ""
    property string phone: ""
    property string position: ""
    property string cardUID: ""

    property string faceImgUrl: ""
    property string idttCardFrontUrl: ""
    property string idttCardBackUrl: ""

    //
    property var locale: Qt.locale()
    property date currentTime //: new Date()

    property string userFaceImgName: ""
    property string indentityCardFrontImgName: ""
    property string indentityCardBackImgName: ""
    property string imgFoderName: ""
    property string userImagesLocation: "/../../../home/thinh/Desktop/Qt_project/KF4/userImages/"

    property string imgName: ""
    property string imgLocation: ""
    property int indicatorSignValue: 1

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

        Rectangle {
            id : cameraUI

            width: 640
            height: 480
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 395
            anchors.leftMargin: 12

            Camera {
                id: camera
                captureMode: Camera.CaptureStillImage
                imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
                exposure {
                    exposureCompensation: -1.0
                    exposureMode: Camera.ExposurePortrait
                }
                imageCapture {
                    id: imgCapture
                    onImageCaptured: {
                        if(indicatorSignValue === 1)     {
                            img_faceUser.source = preview
                        }
                        else if(indicatorSignValue === 2){
                            img_citizenIndetifyFront.source = preview
                        }
                        else if(indicatorSignValue === 3){
                            img_citizenIndetifyBack.source = preview
                        }
                    }
                    onImageSaved: {
                        if(indicatorSignValue === 1)     {
                            //                            img_faceUser.source = ""
                            //                            img_faceUser.source = userImagesLocation + imgFoderName + "/" + userFaceImgName + ".jpg"
                            faceImgUrl = userImagesLocation + imgFoderName + "/" + userFaceImgName + ".jpg"
                            bt_indentityCardFrontCapture.clicked()
                        }
                        else if(indicatorSignValue === 2){
                            //                            img_citizenIndetifyFront.source = ""
                            //                            img_citizenIndetifyFront.source = userImagesLocation + imgFoderName + "/" + indentityCardFrontImgName + ".jpg"
                            idttCardFrontUrl = userImagesLocation + imgFoderName + "/" + indentityCardFrontImgName + ".jpg"
                            bt_indentityCardBackCapture.clicked()
                        }
                        else if(indicatorSignValue === 3){
                            //                            img_citizenIndetifyBack.source = ""
                            //                            img_citizenIndetifyBack.source = userImagesLocation + imgFoderName + "/" + indentityCardBackImgName + ".jpg"
                            idttCardBackUrl = userImagesLocation + imgFoderName + "/" + indentityCardBackImgName + ".jpg"
                            bt_userFaceCapture.clicked()
                        }
                    }
                }
            }

            VideoOutput {
                width: 640
                height: 480
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: camera
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                focus : visible // to receive focus and capture key events when visible
            }
        }

        Rectangle{
            id: rec_faceUserImage
            anchors.left: cameraUI.right
            anchors.leftMargin: 12
            anchors.bottom: rec_citizenIndetifyFrontImage.top
            anchors.bottomMargin: 12
            width: 328
            height: 248
            color: "#00000000"
            border.color: faceImgUrl == "" ?  "#ff0000" : "#00ff00"
            border.width: 1
            radius: 2

            Image {
                id: img_faceUser
                width: 320
                height: 240
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }
        //2
        Rectangle{
            id: rec_citizenIndetifyFrontImage
            anchors.left: cameraUI.right
            anchors.leftMargin: 12
            anchors.bottom: rec_citizenIndetifyBackImage.top
            anchors.bottomMargin: 12
            width: 328
            height: 248
            color: "#00000000"
            border.color:  idttCardFrontUrl == "" ?  "#ff0000" : "#00ff00"
            border.width: 1
            radius: 2

            Image {
                id: img_citizenIndetifyFront
                width: 320
                height: 240
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }
        //3
        Rectangle{
            id: rec_citizenIndetifyBackImage
            anchors.left: cameraUI.right
            anchors.leftMargin: 12
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 12
            width: 328
            height: 248
            color: "#00000000"
            border.color: idttCardBackUrl == "" ?  "#ff0000" : "#00ff00"
            border.width: 1
            radius: 2

            Image {
                id: img_citizenIndetifyBack
                width: 320
                height: 240
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }

        TextField {
            id: tf_firstName
            x: 139
            y: 22
            width: 513
            height: 40
            font.capitalization: Font.AllUppercase
            placeholderText: qsTr("Ví dụ: NAM")
            color: "white"
            placeholderTextColor: "white"
            onTextChanged: {
                firstName = tf_firstName.text
                userFaceImgName = tf_firstName.text + "Face"
                indentityCardFrontImgName = tf_firstName.text + "IDTCFront"
                indentityCardBackImgName = tf_firstName.text + "IDTCBack"
                currentTime = new Date()
                imgFoderName = tf_firstName.text + currentTime.toLocaleDateString(locale, 'ddMMyy') + currentTime.toLocaleTimeString(locale, 'hhmmss')
            }
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: tf_firstName.text === "" ? "#ff0000" : "#00ff00"
            }
        }

        Label {
            id: lb_name
            x: 22
            y: 34
            width: 161
            height: 28
            color: "#ffffff"
            text: qsTr("Tên:")
            font.pointSize: 11
        }

        Label {
            id: lb_name1
            x: 22
            y: 80
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("Họ và tên đệm:")
            font.pointSize: 11
        }

        TextField {
            id: tf_lastName
            x: 139
            width: 513
            height: 40
            font.capitalization: Font.AllUppercase
            placeholderText: qsTr("Ví dụ: NGUYEN VAN")
            placeholderTextColor: "white"
            color: "white"
            anchors.top: tf_firstName.bottom
            anchors.topMargin: 6
            onTextChanged: {
                lastName = tf_lastName.text
            }
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: tf_lastName.text === "" ? "#ff0000" : "#00ff00"
            }
        }

        Label {
            id: lb_phone
            x: 22
            y: 126
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("Số điện thoại:")
            font.pointSize: 11

        }

        TextField {
            id: tf_phone
            property int oldLength: 0
            x: 139
            width: 513
            height: 40
            font.capitalization: Font.AllUppercase
            placeholderText: qsTr("Ví dụ: 0989 999 999")
            placeholderTextColor: "white"
            color: "white"
            anchors.top: tf_lastName.bottom
            anchors.topMargin: 6
            inputMethodHints: Qt.ImhDigitsOnly
            onTextChanged: {
                if(tf_phone.text.length > oldLength){
                    if(tf_phone.text.length == 4){tf_phone.text = tf_phone.text + " "}
                    else if(tf_phone.text.length == 5 && tf_phone.text[4] !== ' '){tf_phone.text = tf_phone.text.substring(0,4) + " " + tf_phone.text[4]}
                    else if(tf_phone.text.length == 8){tf_phone.text = tf_phone.text + " "}
                    else if(tf_phone.text.length == 9 && tf_phone.text[8] !== ' '){tf_phone.text = tf_phone.text.substring(0,8) + " " + tf_phone.text[8]}
                    phone  = tf_phone.text
                }
                oldLength = tf_phone.text.length
            }
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: tf_phone.text === "" ? "#ff0000" : "#00ff00"
            }
        }

        ComboBox {
            id: cb_position
            x: 139
            width: 513
            height: 40
            anchors.top: tf_phone.bottom
            anchors.topMargin: 6
            textRole: "position"
            model: ListModel {
                ListElement {
                    position: "NGHỆ NHÂN DỆT"
                }
                ListElement {
                    position: "KỸ THUẬT"
                }
                ListElement {
                    position: "QUẢN LÝ"
                }
                ListElement {
                    position: "CEO"
                }
            }
            onCurrentTextChanged: {
                position = cb_position.currentText
            }
            Component.onCompleted: {
                position = cb_position.currentText
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
        }

        Label {
            id: lb_phone1
            x: 22
            y: 172
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("Vị trí công tác:")
            font.pointSize: 11
        }

        Label {
            id: lb_phone2
            x: 22
            y: 218
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("Mã thẻ:")
            font.pointSize: 11
        }

        TextField {
            id: tf_cardUid
            enabled: false
            x: 139
            width: 513
            height: 40
            placeholderText: qsTr("")
            placeholderTextColor: "#00ff00"
            color: "white"
            anchors.top: cb_position.bottom
            anchors.topMargin: 6
            onTextChanged: {
                cardUID = tf_cardUid.text
                if (cardUID != ""){addUserPageBridge.checkUsed(cardUID)}
            }
            background: Rectangle {
                color: "#00ffffff"
                radius: 2
                border.color: tf_cardUid.text === "" ? "#ff0000" : "#00ff00"
            }
        }

        Button {
            id: bt_userFaceCapture
            width: 140
            height: 85
            anchors.left: cameraUI.left
            anchors.bottom: cameraUI.top
            anchors.bottomMargin: 13
            anchors.leftMargin: 6
            onClicked: {
                img_indicatorSign.x = bt_userFaceCapture.x + 30
                indicatorSignValue = 1
                se_btnClicked.play()
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 100
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/addUserPage/captureFace.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 76
                    height: 76
                }
            }
        }

        Button {
            id: bt_indentityCardFrontCapture
            width: 140
            height: 85
            anchors.bottom: cameraUI.top
            anchors.horizontalCenter: cameraUI.horizontalCenter
            anchors.bottomMargin: 13
            onClicked: {
                img_indicatorSign.x = bt_indentityCardFrontCapture.x + 30
                indicatorSignValue = 2
                se_btnClicked.play()
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 100
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/addUserPage/captureIDTTCFont.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 76
                    height: 76
                }
            }
        }

        Button {
            id: bt_indentityCardBackCapture
            width: 140
            height: 85
            anchors.right: cameraUI.right
            anchors.bottom: cameraUI.top
            anchors.rightMargin: 6
            anchors.bottomMargin: 13
            onClicked: {
                img_indicatorSign.x = bt_indentityCardBackCapture.x + 30
                indicatorSignValue = 3
                se_btnClicked.play()
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 100
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/addUserPage/captureIDTTCBack.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 76
                    height: 76
                }
            }
        }

        Image {
            id: img_indicatorSign
            source: "../../images/page_images/addUserPage/positionSignBg.svg"
            x: 48
            width: 80
            height: 80
            anchors.top: parent.top
            anchors.topMargin: 267
            Behavior on x { PropertyAnimation {} }
        }

        Button {
            id: bt_capture
            y: 885
            height: 85
            anchors.left: cameraUI.left
            anchors.right: cameraUI.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            onClicked: {
                if(tf_firstName.text !== ""){
                    if(indicatorSignValue === 1){
                        addUserPageBridge.checkAndCreateFolderIfNotExists(imgFoderName, userFaceImgName)
                    }
                    else if(indicatorSignValue === 2){
                        addUserPageBridge.checkAndCreateFolderIfNotExists(imgFoderName, indentityCardFrontImgName)
                    }
                    else if(indicatorSignValue === 3){
                        addUserPageBridge.checkAndCreateFolderIfNotExists(imgFoderName, indentityCardBackImgName)
                    }
                    se_cameraShutter.play()
                }
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 50
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/addUserPage/cameraCapture.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 80
                    height: 80
                }
            }
        }

        Button {
            id: bt_addUser
            y: 22
            width: 326
            height: 170
            anchors.left: cameraUI.right
            anchors.leftMargin: 12

            onClicked: {
                print(firstName)
                print(lastName)
                print(phone)
                print(position)
                print(cardUID)
                print(faceImgUrl)
                print(idttCardFrontUrl)
                print(idttCardBackUrl)
                //                if (firstName !== "" && lastName !== "" && phone !== "" && position !== "" && cardUID !== "" && faceImgUrl !== "" && idttCardFrontUrl !== "" && idttCardBackUrl !== ""){
                //                    addUserPageBridge.addNewUser(firstName, lastName, phone, position, cardUID, faceImgUrl, idttCardFrontUrl, idttCardBackUrl)
                //                }
                if (firstName !== "" && lastName !== "" && phone !== "" && position !== "" && cardUID !== "" && faceImgUrl !== "" && idttCardFrontUrl !== "" && idttCardBackUrl !== ""){
                    se_btnClicked.play()
                    pu_addUer.open()
                    se_pop.play()
                }
            }
            background: Rectangle{
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                anchors.fill: parent
                radius: 100
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/page_images/addUserPage/addUserBg.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 310
                    height: 155
                }

            }
        }

        Image {
            id: img_vericalSeparate
            width: 11
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 997
            fillMode: Image.PreserveAspectFit
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

        Rectangle {
            id: rec_idttCardFrontIMG_AfterAddUser
            x: 1011
            width: 440
            height: 332
            color: "#00000000"
            radius: 2
            border.color: "#ffffff"
            border.width: 1
            anchors.right: parent.right
            anchors.top: rec_faceUserIMG_AfterAddUser.top
            anchors.topMargin: 0
            anchors.rightMargin: 12
            Image {
                id: img_citizenIndetifyFront_AfterAddUser
                width: 432
                height: 324
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }

        Rectangle {
            id: rec_idttCardBackIMG_AfterAddUser
            width: 440
            height: 332
            color: "#00000000"
            radius: 2
            border.color: "#ffffff"
            border.width: 1
            anchors.left: rec_faceUserIMG_AfterAddUser.left
            anchors.top: rec_faceUserIMG_AfterAddUser.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 16
            Image {
                id: img_citizenIndetifyBack_AfterAddUser
                width: 432
                height: 324
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }

        Rectangle {
            id: rec_faceUserIMG_AfterAddUser
            width: 440
            height: 332
            color: "#00000000"
            radius: 2
            border.color: "#ffffff"
            border.width: 1
            anchors.left: img_vericalSeparate.right
            anchors.top: parent.top
            anchors.topMargin: 293
            anchors.leftMargin: 6
            Image {
                id: img_faceUser_AfterAddUser
                width: 432
                height: 324
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }
        }

        Label {
            id: lb_name_AfterAddUser
            x: 1016
            y: 80
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Họ và tên:")
            font.pointSize: 11
        }

        Label {
            id: lb_joinDay_AfterAddUser
            x: 1016
            y: 218
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Thời điểm vào làm:")
            font.pointSize: 11
        }

        Label {
            id: lb_phone_AfterAddUser
            x: 1016
            y: 126
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Số điện thoại:")
            font.pointSize: 11
        }

        Label {
            id: lb_position_AfterAddUser
            x: 1016
            y: 172
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("- Vị trí công tác:")
            font.pointSize: 11
        }

        Label {
            id: lb_name_AfterAddUser_Value
            x: 1169
            y: 80
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("..................................................................")
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_joinDay_AfterAddUser_Value
            x: 1169
            y: 218
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("..................................................................")
            font.bold: true
            font.pointSize: 11
        }

        Image {
            id: img_faceCapture_Mask
            visible: indicatorSignValue === 1 ? true : false
            width: 640
            height: 480
            opacity: 0.762
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/addUserPage/faceCaptureMask.svg"
            anchors.leftMargin: 12
            anchors.topMargin: 395
            fillMode: Image.PreserveAspectCrop
        }

        Label {
            id: lb_phone_AfterAddUser_Value
            x: 1169
            y: 126
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("..................................................................")
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_position_AfterAddUser_Value
            x: 1169
            y: 172
            width: 177
            height: 28
            color: "#ffffff"
            text: qsTr("..................................................................")
            font.bold: true
            font.pointSize: 11
        }

        Label {
            id: lb_wellCome
            x: 1280
            y: 22
            width: 366
            height: 28
            color: "#ffffff"
            text: qsTr("Chào mừng thành viên mới.")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 16
        }


    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP
    PU_AddUser{
        id: pu_addUer
        x: rectangle.width/2 - pu_addUer.width/2
        y: rectangle.height/2 - pu_addUer.height/2
    }

    PU_WarningCardUsed{
        id: pu_wariningCardUsed
        x: rectangle.width/2 - pu_wariningCardUsed.width/2
        y: rectangle.height/2 - pu_wariningCardUsed.height/2
    }


    // ================================================= CONNECTIONS
    Connections{
        target: addUserPageBridge

        function onCatupeImg(folder_, imgName_){
            camera.imageCapture.captureToLocation(userImagesLocation + folder_ + "/" + imgName_)
        }

        function onNewCardInfo(cardUID_){
            se_beep.play()
            tf_cardUid.text = cardUID_
        }

        function onFillNewUserUI(dataListofList_){
            lb_name_AfterAddUser_Value.text = dataListofList_[0][1] + dataListofList_[0][0]
            lb_phone_AfterAddUser_Value.text = dataListofList_[0][2]
            lb_position_AfterAddUser_Value.text = dataListofList_[0][3]
            lb_joinDay_AfterAddUser_Value.text = dataListofList_[0][4]
            img_faceUser_AfterAddUser.source = dataListofList_[0][5]
            img_citizenIndetifyFront_AfterAddUser.source = dataListofList_[0][6]
            img_citizenIndetifyBack_AfterAddUser.source = dataListofList_[0][7]
        }

        function onAnswerCheckCardUsed(answer_){
            if(answer_ === true){
                pu_wariningCardUsed.open()
                se_pop.play()
            }
        }
    }

}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:65}
}
##^##*/
