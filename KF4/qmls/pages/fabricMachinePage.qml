import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../contents"
import "../contents/fabricMachinePagePopUp"
import QtQuick.Extras 1.4
import Qt.labs.calendar 1.0
import "../labs/cadenlar"
import QtQuick.Layouts 1.12
import "../animations"
import QtMultimedia 5.4


Item {
    id: fabricMachinePage

    property var locale: Qt.locale()
    property date currentTime //: new Date()
    property date yesterdayTime
    property string timeString
    property string startTime
    property int m1
    property int m2
    property int m3
    property int m4
    property int m5
    property int m6
    property int m7
    property int m8
    property int m9
    property int m10
    property int m11
    property int m12
    property int m13
    property int m14
    property int m15
    property int m16
    property int m17
    property int m18
    property int m19
    property int m20
    property int m21
    property string day
    property int humanViewCurrentMonth: cadenlar.currentMonth + 1
    property int humanViewClickedMonth: cadenlar.clickedMonth + 1
    property var listConfigFabricIdOfMchn: []
    property int runVariable: 0
    property int modeEdit: 0
    property int modeView: 1
    property int mode: modeEdit

    property var listoffset: []    

    function initialAllComboBox() {
        fabricMachinePageBridge.initialAllModelAndStateOfComboBoxInEditMode()
    }

    Component.onCompleted: {
        for(runVariable = 0; runVariable < 21; runVariable ++){
//            listConfigFabricIdOfMchn.push(0)
//            listoffset.push(0)
            listConfigFabricIdOfMchn[runVariable] = '0'
            listoffset.push(0)
        }
    }

    width: 1920
    height: 985

    Rectangle {
        id: rectangle

        color: "#222222"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: -30
        anchors.leftMargin: 0
        anchors.topMargin: 0        


        Image {
            id: image
            width: 11
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/page_images/fabricMachinePage/verticalSeparate.svg"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 1495
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: img_shiftDateContainer

            width: 182
            height: 26
            anchors.left: parent.left
            anchors.top: parent.top
            source: "../../images/page_images/fabricMachinePage/monthYearFrame.svg"
            anchors.topMargin: 2
            anchors.leftMargin: -8
            sourceSize.width: 196
            sourceSize.height: 28

            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: lb_shiftDate
            property int humanViewMonth: cadenlar.clickedMonth + 1
            width: lb_shiftDate.contentWidth
            height: 17
            color: "#00ff00"
            text: qsTr("Ca " + lb_shiftValue.text + " - " + cadenlar.clickedDay + "/" + humanViewMonth + "/" + cadenlar.clickedYear)
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: -7
            anchors.horizontalCenter: img_shiftDateContainer.horizontalCenter
            anchors.topMargin: 7
            Behavior on text {
                FadeAnimation {
                    target: lb_shiftDate
                }
            }
        }

        Button {
            id: bt_refesh
            visible: bt_edit.activated
            x: 1516
            y: 676
            width: 182
            height: 44
            text: qsTr("Làm tươi")
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            onClicked: {
                cb_m1.currentIndex = cb_m1.lastestConfigFabricIndex
                cb_m2.currentIndex = cb_m2.lastestConfigFabricIndex
                cb_m3.currentIndex = cb_m3.lastestConfigFabricIndex
                cb_m4.currentIndex = cb_m4.lastestConfigFabricIndex
                cb_m5.currentIndex = cb_m5.lastestConfigFabricIndex
                cb_m6.currentIndex = cb_m6.lastestConfigFabricIndex
                cb_m7.currentIndex = cb_m7.lastestConfigFabricIndex
                cb_m8.currentIndex = cb_m8.lastestConfigFabricIndex
                cb_m9.currentIndex = cb_m9.lastestConfigFabricIndex
                cb_m10.currentIndex = cb_m10.lastestConfigFabricIndex
                cb_m11.currentIndex = cb_m11.lastestConfigFabricIndex
                cb_m12.currentIndex = cb_m12.lastestConfigFabricIndex
                cb_m13.currentIndex = cb_m13.lastestConfigFabricIndex
                cb_m14.currentIndex = cb_m14.lastestConfigFabricIndex
                cb_m15.currentIndex = cb_m15.lastestConfigFabricIndex
                cb_m16.currentIndex = cb_m16.lastestConfigFabricIndex
                cb_m17.currentIndex = cb_m17.lastestConfigFabricIndex
                cb_m18.currentIndex = cb_m18.lastestConfigFabricIndex
                cb_m19.currentIndex = cb_m19.lastestConfigFabricIndex
                cb_m20.currentIndex = cb_m20.lastestConfigFabricIndex
                cb_m21.currentIndex = cb_m21.lastestConfigFabricIndex

                numberRollOffset1.value = 0
                numberRollOffset2.value = 0
                numberRollOffset3.value = 0
                numberRollOffset4.value = 0
                numberRollOffset5.value = 0
                numberRollOffset6.value = 0
                numberRollOffset7.value = 0
                numberRollOffset8.value = 0
                numberRollOffset9.value = 0
                numberRollOffset10.value = 0
                numberRollOffset11.value = 0
                numberRollOffset12.value = 0
                numberRollOffset13.value = 0
                numberRollOffset14.value = 0
                numberRollOffset15.value = 0
                numberRollOffset16.value = 0
                numberRollOffset17.value = 0
                numberRollOffset18.value = 0
                numberRollOffset19.value = 0
                numberRollOffset20.value = 0
                numberRollOffset21.value = 0

                se_btnClicked.play()
            }

        }

        Button {
            id: bt_ok
            x: 1722
            y: 676
            width: 182
            height: 44
            visible: bt_edit.activated
            text: qsTr("Ok")
            background: Rectangle {
                color: parent.pressed ? "#d6d6d6" : "#e0e0e0"
                radius: 20
                anchors.fill: parent
            }
            onClicked: {
                fabricMachinePageBridge.updateNewMachineConfigFabric(listConfigFabricIdOfMchn, listoffset)
                numberRollOffset1.value = 0
                numberRollOffset2.value = 0
                numberRollOffset3.value = 0
                numberRollOffset4.value = 0
                numberRollOffset5.value = 0
                numberRollOffset6.value = 0
                numberRollOffset7.value = 0
                numberRollOffset8.value = 0
                numberRollOffset9.value = 0
                numberRollOffset10.value = 0
                numberRollOffset11.value = 0
                numberRollOffset12.value = 0
                numberRollOffset13.value = 0
                numberRollOffset14.value = 0
                numberRollOffset15.value = 0
                numberRollOffset16.value = 0
                numberRollOffset17.value = 0
                numberRollOffset18.value = 0
                numberRollOffset19.value = 0
                numberRollOffset20.value = 0
                numberRollOffset21.value = 0

                se_btnClicked.play()
            }
        }

        CustomButton {
            id: bt_shiftUp
            visible: false
            x: 1518
            y: 25
            width: 80
            height: 80
            buttonWidth: 80
            buttonHeight: 80
            btnIconSource: "../../images/page_images/fabricMachinePage/upBtn.svg"
            anchors.verticalCenterOffset: 0
            onClicked: {
                if(cadenlar.checkIsLastedShiftWorking() === false){
                    if(lb_shiftValue.text === "Ngày"){
                        lb_shiftValue.text = "Đêm"
                    }
                    else{
                        lb_shiftValue.text = "Ngày"
                        bt_dateUp.clicked()
                    }

                    // get time
                    day = cadenlar.clickedYear.toString() + "/"
                    if(humanViewClickedMonth < 10){
                        day = day + "0"
                    }
                    day = day + humanViewClickedMonth.toString() + "/"
                    if(cadenlar.clickedDay < 10){
                        day = day + "0"
                    }
                    day = day + cadenlar.clickedDay.toString()

                    fabricMachinePageBridge.retrieveInfomation(day, lb_shiftValue.text)
                }
            }
        }

        Rectangle {
            id: rec_shiftValueContainer
            x: 1534
            width: 60
            height: 60
            color: "#00ffffff"
            radius: 30
            border.color: "#6c6c6c"
            anchors.top: bt_shiftUp.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_shiftUp.horizontalCenter

            Label {
                id: lb_shiftValue
                x: 8
                y: 15
                color: "#00ff00"
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Ubuntu Mono"
                leftPadding: 0
                leftInset: 0
                topPadding: -2
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                font.pointSize: 17

                function resetValue(){
                    // reset value of Shitf
                    currentTime = new Date()
                    if(currentTime.getHours() < 16 && currentTime.getHours() >= 6 ){lb_shiftValue.text = "Ngày"}
                    else (lb_shiftValue.text = "Đêm")

                }
                Component.onCompleted: {
                    lb_shiftValue.resetValue()
                }
            }
        }

        ColumnLayout {
            id: cadenlarContainer
            width: 391
            height: 410
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1516
            anchors.topMargin: 259

            Rectangle{
                id: monthAndYear
                Layout.fillWidth: true
                height: 36
                color: "#00ffffff"
                border.color: "#6c6c6c"
                border.width: 0
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                Image {

                    width: 182
                    height: 26
                    anchors.left: parent.left
                    anchors.top: parent.top
                    source: "../../images/page_images/fabricMachinePage/monthYearFrame.svg"
                    anchors.leftMargin: -14
                    sourceSize.width: 196
                    sourceSize.height: 28

                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    id: label2
                    y: 343
                    color: "#00ff00"
                    text: "Tháng 10 Năm 2021"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pointSize: 11
                    anchors.verticalCenterOffset: 0
                    anchors.leftMargin: 5
                }
            }

            DayOfWeekRow {
                id: dayOfWeek
                Layout.topMargin: -10
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                locale: cadenlar.locale
                Layout.fillWidth: true
            }

            MonthGrid {
                id: cadenlar

                property int priorMonth
                property int priorYear
                property int currentHour
                //property date tomorrowTime

                function daysInMonth (month, year) {
                    return new Date(year, month + 1, 0).getDate();
                }

                //                function updateTomorrow(){
                //                    cadenlar.tomorrowTime.setDate(currentTime.getDate() - 1)
                //                    tomorrowTime = new Date(Date.now() + 86400000)
                //                }

                function updateDaysInMonth(){
                    cadenlar.numDaysPerTravelMonth = cadenlar.daysInMonth(cadenlar.travelMonth, cadenlar.travelYear)
                    if(cadenlar.travelMonth === 0){
                        priorMonth = 11
                        priorYear = cadenlar.travelYear - 1
                    }
                    else{
                        priorMonth = cadenlar.travelMonth - 1
                        priorYear = cadenlar.travelYear
                    }
                    cadenlar.numDaysPerPriorTravelMonth = cadenlar.daysInMonth(priorMonth, priorYear)
                }

                function checkIsLastedShiftWorking(){
                    currentTime = new Date()
                    if(currentTime.getHours() >= 6 && currentTime.getHours() < 24){
                        if(currentTime.getHours() >= 6 && currentTime.getHours() < 16){
                            if (parseInt(currentTime.toLocaleDateString(locale, 'dd')) === cadenlar.clickedDay && currentTime.getMonth() === cadenlar.clickedMonth && currentTime.getFullYear() == cadenlar.clickedYear){
                                if(lb_shiftValue.text == "Ngày"){return true}
                            }
                        }
                        else{
                            if (currentTime.getDay() == cadenlar.clickedDay && currentTime.getMonth() == cadenlar.clickedMonth && currentTime.getFullYear() == cadenlar.clickedYear){
                                if(lb_shiftValue.text == "Đêm"){return true}
                            }
                        }
                    }
                    else{
                        yesterdayTime = new Date()
                        yesterdayTime.setDate(currentTime.getDate() - 1)
                        if (yesterdayTime.getDay() == cadenlar.clickedDay && yesterdayTime.getMonth() == cadenlar.clickedMonth && yesterdayTime.getFullYear() == cadenlar.clickedYear){
                            if(lb_shiftValue.text == "Đêm"){return true}
                        }
                    }
                    return false
                }

                function resetClickedDayToCurrentDay(){
                    currentTime = new Date()

                    cadenlar.currentDay = parseInt(currentTime.toLocaleDateString(locale, 'dd'))
                    cadenlar.clickedDay = cadenlar.currentDay

                    cadenlar.currentMonth = parseInt(currentTime.toLocaleDateString(locale, 'MM')) - 1
                    cadenlar.clickedMonth = cadenlar.currentMonth
                    cadenlar.travelMonth = cadenlar.currentMonth

                    cadenlar.currentYear = parseInt(currentTime.toLocaleDateString(locale, 'yyyy'))
                    cadenlar.clickedYear = cadenlar.currentYear
                    cadenlar.travelYear = cadenlar.currentYear

                    cadenlar.updateDaysInMonth()
                }

                Component.onCompleted: {
                    cadenlar.resetClickedDayToCurrentDay()
                    initialAllComboBox()
                }

                height: 281
                Layout.topMargin: -15
                month: cadenlar.travelMonth //Calendar.October
                year: cadenlar.travelYear
                Layout.fillWidth: true
                onDateClickedChanged: {
                    cadenlar.numDaysPerTravelMonth = cadenlar.daysInMonth(cadenlar.travelMonth, cadenlar.travelYear)
                    cadenlar.numDaysPerPriorTravelMonth = cadenlar.daysInMonth(priorMonth, cadenlar.travelYear)

                    // get time
                    day = cadenlar.clickedYear.toString() + "/"
                    if(humanViewClickedMonth < 10){
                        day = day + "0"
                    }
                    day = day + humanViewClickedMonth.toString() + "/"
                    if(cadenlar.clickedDay < 10){
                        day = day + "0"
                    }
                    day = day + cadenlar.clickedDay.toString()

                    fabricMachinePageBridge.retrieveInfomation(day, lb_shiftValue.text)
                }
            }

        }

        CustomButton {
            id: bt_shiftDown
            visible: bt_shiftUp.visible
            x: 1524
            width: 80
            height: 80
            anchors.top: rec_shiftValueContainer.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_shiftUp.horizontalCenter
            buttonWidth: 80
            buttonHeight: 80
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/downBtn.svg"
            onClicked: {
                if(lb_shiftValue.text === "Đêm"){
                    lb_shiftValue.text = "Ngày"
                }
                else{
                    lb_shiftValue.text = "Đêm"
                    bt_dateDown.clicked()
                }

                // get time
                day = cadenlar.clickedYear.toString() + "/"
                if(humanViewClickedMonth < 10){
                    day = day + "0"
                }
                day = day + humanViewClickedMonth.toString() + "/"
                if(cadenlar.clickedDay < 10){
                    day = day + "0"
                }
                day = day + cadenlar.clickedDay.toString()

                fabricMachinePageBridge.retrieveInfomation(day, lb_shiftValue.text)
            }
        }

        CustomButton {
            id: bt_dateUp
            visible: bt_shiftUp.visible
            width: 80
            height: 80
            anchors.left: bt_shiftUp.right
            anchors.top: bt_shiftUp.top
            anchors.leftMargin: 22
            anchors.topMargin: 0
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/upBtn.svg"
            buttonWidth: 80
            buttonHeight: 80
            onClicked: {
                if(cadenlar.clickedDay === cadenlar.numDaysPerTravelMonth){
                    cadenlar.clickedDay = 1
                    if(cadenlar.travelMonth === 11){
                        cadenlar.travelMonth = 0
                        cadenlar.travelYear = cadenlar.travelYear + 1
                    }
                    else{
                        cadenlar.travelMonth = cadenlar.travelMonth + 1
                    }
                    cadenlar.clickedMonth = cadenlar.travelMonth
                    cadenlar.clickedYear = cadenlar.travelYear
                    cadenlar.updateDaysInMonth()
                }
                else{
                    cadenlar.clickedDay = cadenlar.clickedDay + 1
                }

                // get time
                day = cadenlar.clickedYear.toString() + "/"
                if(humanViewClickedMonth < 10){
                    day = day + "0"
                }
                day = day + humanViewClickedMonth.toString() + "/"
                if(cadenlar.clickedDay < 10){
                    day = day + "0"
                }
                day = day + cadenlar.clickedDay.toString()

                fabricMachinePageBridge.retrieveInfomation(day, lb_shiftValue.text)
            }
        }

        Rectangle {
            id: rec_DateValueContainer
            x: 1632
            width: 60
            height: 60
            color: "#00ffffff"
            radius: 30
            border.color: "#6c6c6c"
            anchors.top: bt_dateUp.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_dateUp.horizontalCenter
            Label {
                id: lb_dateValue
                x: 8
                y: 15
                color: "#00ff00"
                text: cadenlar.clickedDay
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftInset: 0
                topPadding: -2
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                font.pointSize: 17
                leftPadding: 0
                font.family: "Ubuntu Mono"
            }
        }

        CustomButton {
            id: bt_dateDown
            visible: bt_shiftUp.visible
            x: 1622
            width: 80
            height: 80
            anchors.top: rec_DateValueContainer.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_dateUp.horizontalCenter
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/downBtn.svg"
            buttonWidth: 80
            buttonHeight: 80
            onClicked: {
                if(cadenlar.clickedDay !== 1){
                    cadenlar.clickedDay = cadenlar.clickedDay - 1
                    cadenlar.clickedMonth = cadenlar.travelMonth
                    cadenlar.clickedYear = cadenlar.travelYear
                }
                else{
                    cadenlar.clickedDay = cadenlar.numDaysPerPriorTravelMonth
                    if(cadenlar.travelMonth === 0){
                        cadenlar.travelMonth = 11
                        cadenlar.travelYear = cadenlar.travelYear - 1
                    }
                    else{
                        cadenlar.travelMonth = cadenlar.travelMonth - 1
                    }
                    cadenlar.clickedMonth = cadenlar.travelMonth
                    cadenlar.clickedYear = cadenlar.travelYear
                    cadenlar.updateDaysInMonth()
                }

                // get time
                day = cadenlar.clickedYear.toString() + "/"
                if(humanViewClickedMonth < 10){
                    day = day + "0"
                }
                day = day + humanViewClickedMonth.toString() + "/"
                if(cadenlar.clickedDay < 10){
                    day = day + "0"
                }
                day = day + cadenlar.clickedDay.toString()

                fabricMachinePageBridge.retrieveInfomation(day, lb_shiftValue.text)
            }
        }

        CustomButton {
            id: bt_monthUp
            visible: bt_shiftUp.visible
            width: 80
            height: 80
            anchors.left: bt_dateUp.right
            anchors.top: bt_dateUp.top
            anchors.leftMargin: 22
            anchors.topMargin: 0
            anchors.verticalCenterOffset: 0
            buttonWidth: 80
            btnIconSource: "../../images/page_images/fabricMachinePage/upBtn.svg"
            buttonHeight: 80
            onClicked: {
                if(cadenlar.travelMonth !== Calendar.December){
                    cadenlar.travelMonth = cadenlar.travelMonth + 1
                }
                else{
                    cadenlar.travelYear = cadenlar.travelYear + 1
                    cadenlar.travelMonth = Calendar.January

                }
                cadenlar.updateDaysInMonth()
            }
        }

        Rectangle {
            id: rec_MonthValueContainer
            x: 1738
            width: 60
            height: 60
            color: "#00ffffff"
            radius: 30
            border.color: "#6c6c6c"
            anchors.top: bt_monthUp.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_monthUp.horizontalCenter
            Label {
                id: lb_monthValue
                x: 8
                y: 15
                color: "#00ff00"
                text: cadenlar.travelMonth + 1
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftInset: 0
                topPadding: -2
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                font.pointSize: 17
                leftPadding: 0
                font.family: "Ubuntu Mono"
            }
        }

        CustomButton {
            id: bt_monthDown
            visible: bt_shiftUp.visible
            x: 1728
            width: 80
            height: 80
            anchors.top: rec_MonthValueContainer.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_monthUp.horizontalCenter
            anchors.verticalCenterOffset: 0
            buttonWidth: 80
            btnIconSource: "../../images/page_images/fabricMachinePage/downBtn.svg"
            buttonHeight: 80
            onClicked: {
                if(cadenlar.travelMonth !== Calendar.January){
                    cadenlar.travelMonth = cadenlar.travelMonth - 1
                }
                else{
                    cadenlar.travelYear = cadenlar.travelYear - 1
                    cadenlar.travelMonth = Calendar.December
                }
                cadenlar.updateDaysInMonth()
            }
        }

        CustomButton {
            id: bt_yearUp
            visible: bt_shiftUp.visible
            width: 80
            height: 80
            anchors.left: bt_monthUp.right
            anchors.top: bt_monthUp.top
            anchors.leftMargin: 22
            anchors.topMargin: 0
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/upBtn.svg"
            buttonWidth: 80
            buttonHeight: 80
            onClicked: {cadenlar.travelYear = cadenlar.travelYear + 1}
        }

        Rectangle {
            id: rec_yearValueContainer
            x: 1836
            width: 60
            height: 60
            color: "#00ffffff"
            radius: 30
            border.color: "#6c6c6c"
            anchors.top: bt_yearUp.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_yearUp.horizontalCenter
            Label {
                id: lb_yearValue
                x: 8
                y: 15
                color: "#00ff00"
                text: cadenlar.travelYear
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftInset: 0
                topPadding: -2
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                font.pointSize: 17
                leftPadding: 0
                font.family: "Ubuntu Mono"
            }
        }

        CustomButton {
            id: bt_yearDown
            visible: bt_shiftUp.visible
            x: 1826
            width: 80
            height: 80
            anchors.top: rec_yearValueContainer.bottom
            anchors.topMargin: -2
            anchors.horizontalCenter: bt_yearUp.horizontalCenter
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/downBtn.svg"
            buttonWidth: 80
            buttonHeight: 80
            onClicked: {cadenlar.travelYear = cadenlar.travelYear - 1}
        }

        CustomButton {
            id: bt_view
            width: 182
            height: 182
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1722
            anchors.topMargin: 761
            buttonHeight: 182
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/viewBt.svg"
            buttonWidth: 182
            onClicked: {
                lb_shiftValue.resetValue()
                mode = modeView
                positionSign.x = bt_view.x + 1
                bt_edit.activated = false
                bt_shiftUp.visible = true
                t_info.text = '"Truy Xuất: Trạng Thái Sản Xuất Của Máy"'
                cadenlar.clickable = true

                // get time
                day = cadenlar.clickedYear.toString() + "/"
                if(humanViewClickedMonth < 10){
                    day = day + "0"
                }
                day = day + humanViewClickedMonth.toString() + "/"
                if(cadenlar.clickedDay < 10){
                    day = day + "0"
                }
                day = day + cadenlar.clickedDay.toString()

                fabricMachinePageBridge.retrieveInfomation(day, lb_shiftValue.text)
                numberRollOffset1.text = "0"
            }
        }

        CustomButton {
            id: bt_edit
            property bool activated: true
            width: 182
            height: 182
            anchors.left: parent.left
            anchors.top: bt_view.top
            anchors.leftMargin: 1518
            anchors.topMargin: 0
            buttonHeight: 182
            anchors.verticalCenterOffset: 0
            btnIconSource: "../../images/page_images/fabricMachinePage/editBt.svg"
            buttonWidth: 182
            onClicked: {
                lb_shiftValue.resetValue()
                mode = modeEdit
                positionSign.x = bt_edit.x + 8
                bt_edit.activated = true
                bt_shiftUp.visible = false
                t_info.text = '"Khai Báo: Trạng Thái Sản Xuất Của Máy"'
                cadenlar.clickable = false
                cadenlar.resetClickedDayToCurrentDay()

                initialAllComboBox()
                numberRollOffset1.text = "0"
            }
        }

        Image {
            id: positionSign
            source: "../../images/page_images/fabricMachinePage/positionIndicator.svg"
            sourceSize.height: 182
            sourceSize.width: 182
            property int x_: homeButton.x
            x: 1524
            y: 764
            //x: x_
            width: 182
            height: 182
            Behavior on x { PropertyAnimation {} }
        }

        Label {
            id: label
            x: 1581
            y: 738
            color: bt_edit.activated ? "#bdf9bd" : "#ffffff"
            text: qsTr("Khai báo")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: label1
            x: 1777
            y: 738
            color: bt_edit.activated ? "#ffffff" : "#bdf9bd"
            text: qsTr("Truy xuất")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: rectangle1
            property bool modeView_MutilConfig: false                        
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 31
            anchors.leftMargin: 4



            Rectangle {
                id: rec1of1
                x: 0
                y: 0
                width: 65
                height: 20
                color: rectangle1.recColor
                border.color: rectangle1.borderColor
                radius: 2                
                anchors.left: parent.left
                anchors.leftMargin: 0

                Label {
                    id: lb_m1
                    x: 934
                    y: 6
                    width: lb_m1.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M1:")
                    font.family:  "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    topPadding: -2
                    anchors.horizontalCenter: parent.horizontalCenter
                    //font.bold: true
                }
            }

            Rectangle {
                id: rec2of1
                x: -4
                width: 330
                height: 20
                color: rectangle1.recColor
                border.color: rectangle1.borderColor
                radius: 2                
                border.width: 1
                anchors.left: rec1of1.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 3
                Label {
                    id: lb_fabricName1
                    y: 6
                    width: lb_fabricName1.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    font.family:  "Ubuntu Mono"
                    font.pointSize: 13
                    verticalAlignment: Text.AlignVCenter
                    topPadding: -2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 6
                    //font.bold: true
                }
            }

            Rectangle {
                id: rec3of1
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of1.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                anchors.leftMargin: 1
                Label {
                    id: lb_fabricTime1
                    y: 6
                    width: lb_fabricName1.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    font.family:  "Ubuntu"
                    font.pointSize: 11
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                    topPadding: 4
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 3
                    //font.bold: true
                }
            }

            ComboBox {
                id: cb_m1
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of1.right
                font.family:  "Ubuntu Mono"
                font.pointSize: 13
                //font.weight: Font.Bold
                font.capitalization: Font.AllUppercase
                //font.bold: true
                anchors.leftMargin: 3
                textRole: "data1"
                popup.onOpened:{
                    cb_m1.currentIndex = 0
                }
                model: ListModel {
                    ListElement{
                        index_: ""  //FabricConfigId        1
                        data1: ""   //Code1                 2
                        data2: ""   //PrintCode             3
                        FabricType_FabricTypeId_: ""    //  4
                        MPKg_: ""                       //  5
                        Wide_: ""
                        YarnLotId1_: ""                //  7
                        YarnLotId2_: ""                //  8
                        YarnLotId3_: ""                //  9
                        YarnLotId4_: ""                //  10
                        Yarn1Speed_: ""                 //  11
                        Yarn2Speed_: ""                 //  12
                        Yarn3Speed_: ""                 //  13
                        Yarn4Speed_: ""                 //  14
                        Yarn1ConeNum_: ""               //  15
                        Yarn2ConeNum_: ""               //  16
                        Yarn3ConeNum_: ""               //  17
                        Yarn4ConeNum_: ""               //  18
                        YarnRoundsPerRoll_: ""           //  19
                        Dia_: ""
                        G_: ""

                        StartTime_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator1
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
                        context.fillStyle = rectangle1.idcColor //"white"//parent.pressed ? rectangle1.borderColor : "white" //"#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    text: parent.displayText
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                background: Rectangle {
                    color: rectangle1.recColor
                    border.color: rectangle1.borderColor
                    radius: 2                    
                }
                delegate: ItemDelegate {
                    id:itemDlgt1
                    width: cb_m1.width
                    height:40
                    contentItem: Item {
                        id: cti_ItemDelegate1
                        width: cb_m1.width
                        height: 40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        Rectangle{
                            id: rectIndex1
                            width: 40
                            height: 39
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            anchors.left: parent.left
                            color: mode === modeEdit ? index === cb_m1.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m1.currentIndex ? "green" : "#300a24"
                            radius: 2
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                horizontalAlignment: Text.AlignHCenter
                                text: index +1
                                //                                font.family: "Ubuntu Mono"
                                color: "white"
                                font: cb_m1.font
                                elide: Text.ElideRight
                            }
                        }
                        Rectangle{
                            width: cb_m1.width - rectIndex1.width
                            height: 39
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            anchors.left: rectIndex1.right
                            anchors.leftMargin: 1
                            color: mode === modeEdit ? index === cb_m1.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m1.currentIndex ? "green" : "#300a24"
                            radius: 2
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                text: data1
                                //                                font.family: "Ubuntu Mono"
                                font: cb_m1.font
                                color: "white"
                                elide: Text.ElideRight

                            }
                        }
                    }

                    background: Rectangle {
                        radius: 1
                        color: "#5c5c5c"//"#e6e6e6"//parent.hovered?"#507BF6":"white";
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width:parent.width
                    }
                    //onPressed: console.log(cb_yarnType.model.get(cb_yarnType.currentIndex).text_)//are not the same!
                }

                onCurrentIndexChanged: {
                    if(cb_m1.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m1.currentIndex !== cb_m1.lastestConfigFabricIndex){
                                lb_fabricName1.text =  cb_m1.model.get(cb_m1.currentIndex).data2
                                lb_fabricTime1.text = ""
                                listConfigFabricIdOfMchn[0] = cb_m1.model.get(cb_m1.currentIndex).index_
                                rectangle1.borderColor = rectangle1.borderColorWhenValueIsChanged
                                rectangle1.recColor = rectangle1.recColorWhenValueIsChanged
                                rectangle1.idcColor = rectangle1.idcColorWhenValueIsChanged
                                indicator1.requestPaint()
                            }
                            else{
                                lb_fabricName1.text =  cb_m1.model.get(cb_m1.currentIndex).data2
                                lb_fabricTime1.text = cb_m1.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[0] = "0"
                                rectangle1.borderColor = rectangle1.borderColorNormal
                                rectangle1.recColor = rectangle1.recColorNormal
                                rectangle1.idcColor = rectangle1.idcColorNormal
                                indicator1.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName1.text =  cb_m1.model.get(cb_m1.currentIndex).data2
                            if(cb_m1.model.get(cb_m1.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime1.text = cb_m1.model.get(cb_m1.currentIndex).StartTime_ + " >>> " +  cb_m1.model.get(cb_m1.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime1.text = cb_m1.model.get(cb_m1.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName1.text =  ""
                        lb_fabricTime1.text = ""
                    }
                }
            }

            Rectangle {
                id: rec_offset1
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m1.right
                anchors.leftMargin: 3

                CustomButton{
                    id: bt_decrease1
                    width: 38
                    height: 38
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    anchors.verticalCenterOffset: 0
                    onClicked: {
                        if(numberRollOffset1.value !== 0){
                            numberRollOffset1.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant1
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase1.right
                    anchors.leftMargin: 3
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    anchors.verticalCenterOffset: 0
                    buttonHeight: parent.height
                    buttonWidth: parent.height
                    onClicked: {
                        if(cb_m1.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m1.model.get(cb_m1.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase1
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of1.right
                    anchors.leftMargin: 3
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    anchors.verticalCenterOffset: 0
                    buttonHeight: parent.height
                    buttonWidth: parent.height
                    onClicked: {
                        numberRollOffset1.value ++
                    }
                }

                Rectangle {
                    id: rec4of1
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m1.currentIndex !== cb_m1.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m1.currentIndex !== cb_m1.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease1.right
                    anchors.leftMargin: 3

                    Label {
                        id: numberRollOffset1
                        property int value: 0
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: false
                        font.pointSize: 17
                        onTextChanged: {
                            listoffset[0] = parseInt(text)
                        }
                    }
                }
            }

            Rectangle {
                id: rec_numConfig1
                y: 0
                width: 22
                height: 22
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 332
                anchors.bottomMargin: 3
                visible: rectangle1.modeView_MutilConfig

                Label {
                    id: lb_numberConfig1
                    color: "#ffffff"
                    text: cb_m1.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    topPadding: -1
                    leftPadding: -1
                    font.weight: Font.Bold
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            CustomButton{
                id: bt_nextConfig1
                visible: rectangle1.modeView_MutilConfig
                width: 42
                height: 42
                opacity: 0.348
                buttonWidth: parent.height
                buttonHeight: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                anchors.verticalCenterOffset: 0
                onClicked: {
                    cb_m1.currentIndex = (cb_m1.currentIndex + 1)%cb_m1.count
                }
            }

        }

        Rectangle {
            id: rectangle2
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle1.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of2
                x: 0
                y: 0
                width: 65
                height: 20
                color: rectangle2.recColor
                border.color: rectangle2.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m2
                    x: 934
                    y: 6
                    width: lb_m2.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M2:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of2
                x: -4
                width: 330
                height: 20
                color: rectangle2.recColor
                border.color: rectangle2.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of2.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName2
                    y: 6
                    width: lb_fabricName2.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of2
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of2.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime2
                    y: 6
                    width: lb_fabricName2.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m2
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of2.right
                popup.onOpened:{
                    cb_m2.currentIndex = 0
                }
                background: Rectangle {
                    color: rectangle2.recColor
                    border.color: rectangle2.borderColor
                    radius: 2
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt2
                    width: cb_m2.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate2
                        width: cb_m2.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex2
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m2.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m2.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m2.font
                            }
                        }

                        Rectangle {
                            width: cb_m2.width - rectIndex2.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m2.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m2.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex2.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m2.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m2.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m2.currentIndex !== cb_m2.lastestConfigFabricIndex){
                                lb_fabricName2.text =  cb_m2.model.get(cb_m2.currentIndex).data2
                                lb_fabricTime2.text = ""
                                listConfigFabricIdOfMchn[1] = cb_m2.model.get(cb_m2.currentIndex).index_
                                rectangle2.borderColor = rectangle2.borderColorWhenValueIsChanged
                                rectangle2.recColor = rectangle2.recColorWhenValueIsChanged
                                rectangle2.idcColor = rectangle2.idcColorWhenValueIsChanged
                                indicator2.requestPaint()
                            }
                            else{
                                lb_fabricName2.text =  cb_m2.model.get(cb_m2.currentIndex).data2
                                lb_fabricTime2.text = cb_m2.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[1] = "0"
                                rectangle2.borderColor = rectangle2.borderColorNormal
                                rectangle2.recColor = rectangle2.recColorNormal
                                rectangle2.idcColor = rectangle2.idcColorNormal
                                indicator2.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName2.text =  cb_m2.model.get(cb_m2.currentIndex).data2
                            if(cb_m2.model.get(cb_m2.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime2.text = cb_m2.model.get(cb_m2.currentIndex).StartTime_ + " >>> " +  cb_m2.model.get(cb_m2.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime2.text = cb_m2.model.get(cb_m2.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName2.text =  ""
                        lb_fabricTime2.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator2
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
                        context.fillStyle = rectangle2.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset2
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m2.right
                CustomButton {
                    id: bt_decrease2
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset2.value !== 0){
                            numberRollOffset2.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant2
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase2.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m2.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m2.model.get(cb_m2.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase2
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of2.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset2.value ++
                    }
                }

                Rectangle {
                    id: rec4of2
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m2.currentIndex !== cb_m2.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m2.currentIndex !== cb_m2.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease2.right
                    Label {
                        id: numberRollOffset2
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[1] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig2
                y: 0
                width: 22
                height: 22
                visible: rectangle2.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig2
                    color: "#ffffff"
                    text: cb_m2.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig2
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle2.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m2.currentIndex = (cb_m2.currentIndex + 1)%cb_m2.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle3
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle2.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of3
                x: 0
                y: 0
                width: 65
                height: 20
                color: rectangle3.recColor
                border.color: rectangle3.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m3
                    x: 934
                    y: 6
                    width: lb_m3.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M3:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of3
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of3.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName3
                    y: 6
                    width: lb_fabricName3.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of3
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of3.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime3
                    y: 6
                    width: lb_fabricName3.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m3
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of3.right
                background: Rectangle {
                    color: rectangle3.recColor
                    border.color: rectangle3.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m3.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt3
                    width: cb_m3.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate3
                        width: cb_m3.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex3
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m3.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m3.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m3.font
                            }
                        }

                        Rectangle {
                            width: cb_m3.width - rectIndex3.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m3.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m3.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex3.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m3.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m3.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m3.currentIndex !== cb_m3.lastestConfigFabricIndex){
                                lb_fabricName3.text =  cb_m3.model.get(cb_m3.currentIndex).data2
                                lb_fabricTime3.text = ""
                                listConfigFabricIdOfMchn[2] = cb_m3.model.get(cb_m3.currentIndex).index_
                                rectangle3.borderColor = rectangle3.borderColorWhenValueIsChanged
                                rectangle3.recColor = rectangle3.recColorWhenValueIsChanged
                                rectangle3.idcColor = rectangle3.idcColorWhenValueIsChanged
                                indicator3.requestPaint()
                            }
                            else{
                                lb_fabricName3.text =  cb_m3.model.get(cb_m3.currentIndex).data2
                                lb_fabricTime3.text = cb_m3.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[2] = "0"
                                rectangle3.borderColor = rectangle3.borderColorNormal
                                rectangle3.recColor = rectangle3.recColorNormal
                                rectangle3.idcColor = rectangle3.idcColorNormal
                                indicator3.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName3.text =  cb_m3.model.get(cb_m3.currentIndex).data2
                            if(cb_m3.model.get(cb_m3.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime3.text = cb_m3.model.get(cb_m3.currentIndex).StartTime_ + " >>> " +  cb_m3.model.get(cb_m3.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime3.text = cb_m3.model.get(cb_m3.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName3.text =  ""
                        lb_fabricTime3.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator3
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
                        context.fillStyle = rectangle3.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset3
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m3.right
                CustomButton {
                    id: bt_decrease3
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset3.value !== 0){
                            numberRollOffset3.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant3
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase3.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m3.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m3.model.get(cb_m3.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase3
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of3.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset3.value ++
                    }
                }

                Rectangle {
                    id: rec4of3
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m3.currentIndex !== cb_m3.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m3.currentIndex !== cb_m3.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease3.right
                    Label {
                        id: numberRollOffset3
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[2] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig3
                y: 0
                width: 22
                height: 22
                visible: rectangle3.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig3
                    color: "#ffffff"
                    text: cb_m3.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig3
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle3.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m3.currentIndex = (cb_m3.currentIndex + 1)%cb_m3.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle4
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle3.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of4
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m4
                    x: 934
                    y: 6
                    width: lb_m4.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M4:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of4
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of4.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName4
                    y: 6
                    width: lb_fabricName4.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of4
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of4.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime4
                    y: 6
                    width: lb_fabricName4.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m4
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of4.right
                background: Rectangle {
                    color: rectangle4.recColor
                    border.color: rectangle4.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m4.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt4
                    width: cb_m4.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate4
                        width: cb_m4.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex4
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m4.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m4.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m4.font
                            }
                        }

                        Rectangle {
                            width: cb_m4.width - rectIndex4.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m4.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m4.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex4.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m4.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m4.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m4.currentIndex !== cb_m4.lastestConfigFabricIndex){
                                lb_fabricName4.text =  cb_m4.model.get(cb_m4.currentIndex).data2
                                lb_fabricTime4.text = ""
                                listConfigFabricIdOfMchn[3] = cb_m4.model.get(cb_m4.currentIndex).index_
                                rectangle4.borderColor = rectangle4.borderColorWhenValueIsChanged
                                rectangle4.recColor = rectangle4.recColorWhenValueIsChanged
                                rectangle4.idcColor = rectangle4.idcColorWhenValueIsChanged
                                indicator4.requestPaint()
                            }
                            else{
                                lb_fabricName4.text =  cb_m4.model.get(cb_m4.currentIndex).data2
                                lb_fabricTime4.text = cb_m4.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[3] = "0"
                                rectangle4.borderColor = rectangle4.borderColorNormal
                                rectangle4.recColor = rectangle4.recColorNormal
                                rectangle4.idcColor = rectangle4.idcColorNormal
                                indicator4.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName4.text =  cb_m4.model.get(cb_m4.currentIndex).data2
                            if(cb_m4.model.get(cb_m4.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime4.text = cb_m4.model.get(cb_m4.currentIndex).StartTime_ + " >>> " +  cb_m4.model.get(cb_m4.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime4.text = cb_m4.model.get(cb_m4.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName4.text =  ""
                        lb_fabricTime4.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator4
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
                        context.fillStyle = rectangle4.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset4
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m4.right
                CustomButton {
                    id: bt_decrease4
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset4.value !== 0){
                            numberRollOffset4.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant4
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase4.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m4.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m4.model.get(cb_m4.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase4
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of4.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset4.value ++
                    }
                }

                Rectangle {
                    id: rec4of4
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m4.currentIndex !== cb_m4.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m4.currentIndex !== cb_m4.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease4.right
                    Label {
                        id: numberRollOffset4
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[3] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig4
                y: 0
                width: 22
                height: 22
                visible: rectangle4.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig4
                    color: "#ffffff"
                    text: cb_m4.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig4
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle4.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m4.currentIndex = (cb_m4.currentIndex + 1)%cb_m4.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle5
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle4.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of5
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m5
                    x: 934
                    y: 6
                    width: lb_m5.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M5:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of5
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of5.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName5
                    y: 6
                    width: lb_fabricName5.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of5
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of5.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime5
                    y: 6
                    width: lb_fabricName5.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m5
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of5.right
                background: Rectangle {
                    color: rectangle5.recColor
                    border.color: rectangle5.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m5.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt5
                    width: cb_m5.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate5
                        width: cb_m5.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex5
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m5.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m5.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m5.font
                            }
                        }

                        Rectangle {
                            width: cb_m5.width - rectIndex5.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m5.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m5.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex5.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m5.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m5.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m5.currentIndex !== cb_m5.lastestConfigFabricIndex){
                                lb_fabricName5.text =  cb_m5.model.get(cb_m5.currentIndex).data2
                                lb_fabricTime5.text = ""
                                listConfigFabricIdOfMchn[4] = cb_m5.model.get(cb_m5.currentIndex).index_
                                rectangle5.borderColor = rectangle5.borderColorWhenValueIsChanged
                                rectangle5.recColor = rectangle5.recColorWhenValueIsChanged
                                rectangle5.idcColor = rectangle5.idcColorWhenValueIsChanged
                                indicator5.requestPaint()
                            }
                            else{
                                lb_fabricName5.text =  cb_m5.model.get(cb_m5.currentIndex).data2
                                lb_fabricTime5.text = cb_m5.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[4] = "0"
                                rectangle5.borderColor = rectangle5.borderColorNormal
                                rectangle5.recColor = rectangle5.recColorNormal
                                rectangle5.idcColor = rectangle5.idcColorNormal
                                indicator5.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName5.text =  cb_m5.model.get(cb_m5.currentIndex).data2
                            if(cb_m5.model.get(cb_m5.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime5.text = cb_m5.model.get(cb_m5.currentIndex).StartTime_ + " >>> " +  cb_m5.model.get(cb_m5.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime5.text = cb_m5.model.get(cb_m5.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName5.text =  ""
                        lb_fabricTime5.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator5
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
                        context.fillStyle = rectangle5.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset5
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m5.right
                CustomButton {
                    id: bt_decrease5
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset5.value !== 0){
                            numberRollOffset5.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant5
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase5.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m5.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m5.model.get(cb_m5.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase5
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of5.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset5.value ++
                    }
                }

                Rectangle {
                    id: rec4of5
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m5.currentIndex !== cb_m5.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m5.currentIndex !== cb_m5.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease5.right
                    Label {
                        id: numberRollOffset5
                        x: 8
                        y: 15
                        color: "white" // "#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[4] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig5
                y: 0
                width: 22
                height: 22
                visible: rectangle5.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig5
                    color: "#ffffff"
                    text: cb_m5.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig5
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle5.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m5.currentIndex = (cb_m5.currentIndex + 1)%cb_m5.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle6
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle5.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of6
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m6
                    x: 934
                    y: 6
                    width: lb_m6.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M6:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of6
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of6.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName6
                    y: 6
                    width: lb_fabricName6.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of6
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of6.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime6
                    y: 6
                    width: lb_fabricName6.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m6
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of6.right
                background: Rectangle {
                    color: rectangle6.recColor
                    border.color: rectangle6.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m6.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt6
                    width: cb_m6.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate6
                        width: cb_m6.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex6
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m6.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m6.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m6.font
                            }
                        }

                        Rectangle {
                            width: cb_m6.width - rectIndex6.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m6.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m6.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex6.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m6.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m6.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m6.currentIndex !== cb_m6.lastestConfigFabricIndex){
                                lb_fabricName6.text =  cb_m6.model.get(cb_m6.currentIndex).data2
                                lb_fabricTime6.text = ""
                                listConfigFabricIdOfMchn[5] = cb_m6.model.get(cb_m6.currentIndex).index_
                                rectangle6.borderColor = rectangle6.borderColorWhenValueIsChanged
                                rectangle6.recColor = rectangle6.recColorWhenValueIsChanged
                                rectangle6.idcColor = rectangle6.idcColorWhenValueIsChanged
                                indicator6.requestPaint()
                            }
                            else{
                                lb_fabricName6.text =  cb_m6.model.get(cb_m6.currentIndex).data2
                                lb_fabricTime6.text = cb_m6.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[5] = "0"
                                rectangle6.borderColor = rectangle6.borderColorNormal
                                rectangle6.recColor = rectangle6.recColorNormal
                                rectangle6.idcColor = rectangle6.idcColorNormal
                                indicator6.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName6.text =  cb_m6.model.get(cb_m6.currentIndex).data2
                            if(cb_m6.model.get(cb_m6.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime6.text = cb_m6.model.get(cb_m6.currentIndex).StartTime_ + " >>> " +  cb_m6.model.get(cb_m6.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime6.text = cb_m6.model.get(cb_m6.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName6.text =  ""
                        lb_fabricTime6.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator6
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
                        context.fillStyle = rectangle6.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset6
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m6.right
                CustomButton {
                    id: bt_decrease6
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset6.value !== 0){
                            numberRollOffset6.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant6
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase6.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m6.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m6.model.get(cb_m6.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase6
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of6.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset6.value ++
                    }
                }

                Rectangle {
                    id: rec4of6
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m6.currentIndex !== cb_m6.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m6.currentIndex !== cb_m6.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease6.right
                    Label {
                        id: numberRollOffset6
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[5] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig6
                y: 0
                width: 22
                height: 22
                visible: rectangle6.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig6
                    color: "#ffffff"
                    text: cb_m6.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig6
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle6.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m6.currentIndex = (cb_m6.currentIndex + 1)%cb_m6.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle7
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle6.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of7
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m7
                    x: 934
                    y: 6
                    width: lb_m7.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M7:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of7
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of7.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName7
                    y: 6
                    width: lb_fabricName7.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of7
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of7.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime7
                    y: 6
                    width: lb_fabricName7.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m7
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of7.right
                background: Rectangle {
                    color: rectangle7.recColor
                    border.color: rectangle7.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m7.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt7
                    width: cb_m7.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate7
                        width: cb_m7.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex7
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m7.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m7.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m7.font
                            }
                        }

                        Rectangle {
                            width: cb_m7.width - rectIndex7.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m7.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m7.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex7.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m7.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m7.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m7.currentIndex !== cb_m7.lastestConfigFabricIndex){
                                lb_fabricName7.text =  cb_m7.model.get(cb_m7.currentIndex).data2
                                lb_fabricTime7.text = ""
                                listConfigFabricIdOfMchn[6] = cb_m7.model.get(cb_m7.currentIndex).index_
                                rectangle7.borderColor = rectangle7.borderColorWhenValueIsChanged
                                rectangle7.recColor = rectangle7.recColorWhenValueIsChanged
                                rectangle7.idcColor = rectangle7.idcColorWhenValueIsChanged
                                indicator7.requestPaint()
                            }
                            else{
                                lb_fabricName7.text =  cb_m7.model.get(cb_m7.currentIndex).data2
                                lb_fabricTime7.text = cb_m7.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[6] = "0"
                                rectangle7.borderColor = rectangle7.borderColorNormal
                                rectangle7.recColor = rectangle7.recColorNormal
                                rectangle7.idcColor = rectangle7.idcColorNormal
                                indicator7.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName7.text =  cb_m7.model.get(cb_m7.currentIndex).data2
                            if(cb_m7.model.get(cb_m7.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime7.text = cb_m7.model.get(cb_m7.currentIndex).StartTime_ + " >>> " +  cb_m7.model.get(cb_m7.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime7.text = cb_m7.model.get(cb_m7.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName7.text =  ""
                        lb_fabricTime7.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator7
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
                        context.fillStyle = rectangle7.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset7
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m7.right
                CustomButton {
                    id: bt_decrease7
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset7.value !== 0){
                            numberRollOffset7.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant7
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase7.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m7.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m7.model.get(cb_m7.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase7
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of7.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset7.value ++
                    }
                }

                Rectangle {
                    id: rec4of7
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m7.currentIndex !== cb_m7.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m7.currentIndex !== cb_m7.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease7.right
                    Label {
                        id: numberRollOffset7
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[6] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig7
                y: 0
                width: 22
                height: 22
                visible: rectangle7.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig7
                    color: "#ffffff"
                    text: cb_m7.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig7
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle7.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m7.currentIndex = (cb_m7.currentIndex + 1)%cb_m7.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle8
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle7.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of8
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m8
                    x: 934
                    y: 6
                    width: lb_m8.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M8:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of8
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of8.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName8
                    y: 6
                    width: lb_fabricName8.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of8
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of8.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime8
                    y: 6
                    width: lb_fabricName8.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m8
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of8.right
                background: Rectangle {
                    color: rectangle8.recColor
                    border.color: rectangle8.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m8.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt8
                    width: cb_m8.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate8
                        width: cb_m8.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex8
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m8.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m8.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m8.font
                            }
                        }

                        Rectangle {
                            width: cb_m8.width - rectIndex8.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m8.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m8.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex8.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m8.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m8.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m8.currentIndex !== cb_m8.lastestConfigFabricIndex){
                                lb_fabricName8.text =  cb_m8.model.get(cb_m8.currentIndex).data2
                                lb_fabricTime8.text = ""
                                listConfigFabricIdOfMchn[7] = cb_m8.model.get(cb_m8.currentIndex).index_
                                rectangle8.borderColor = rectangle18.borderColorWhenValueIsChanged
                                rectangle8.recColor = rectangle8.recColorWhenValueIsChanged
                                rectangle8.idcColor = rectangle8.idcColorWhenValueIsChanged
                                indicator8.requestPaint()
                            }
                            else{
                                lb_fabricName8.text =  cb_m8.model.get(cb_m8.currentIndex).data2
                                lb_fabricTime8.text = cb_m8.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[7] = "0"
                                rectangle8.borderColor = rectangle8.borderColorNormal
                                rectangle8.recColor = rectangle8.recColorNormal
                                rectangle8.idcColor = rectangle8.idcColorNormal
                                indicator8.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName8.text =  cb_m8.model.get(cb_m8.currentIndex).data2
                            if(cb_m8.model.get(cb_m8.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime8.text = cb_m8.model.get(cb_m8.currentIndex).StartTime_ + " >>> " +  cb_m8.model.get(cb_m8.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime8.text = cb_m8.model.get(cb_m8.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName8.text =  ""
                        lb_fabricTime8.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator8
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
                        context.fillStyle = rectangle8.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset8
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m8.right
                CustomButton {
                    id: bt_decrease8
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset8.value !== 0){
                            numberRollOffset8.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant8
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase8.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m8.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m8.model.get(cb_m8.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase8
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of8.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset8.value ++
                    }
                }

                Rectangle {
                    id: rec4of8
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m8.currentIndex !== cb_m8.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m8.currentIndex !== cb_m8.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease8.right
                    Label {
                        id: numberRollOffset8
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[7] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig8
                y: 0
                width: 22
                height: 22
                visible: rectangle8.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig8
                    color: "#ffffff"
                    text: cb_m8.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig8
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle8.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m8.currentIndex = (cb_m8.currentIndex + 1)%cb_m8.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle9
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle8.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            property string startTimeOfLifeTime: ""
            anchors.topMargin: 5
            Rectangle {
                id: rec1of9
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m9
                    x: 934
                    y: 6
                    width: lb_m9.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M9:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of9
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of9.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName9
                    y: 6
                    width: lb_fabricName9.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of9
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of9.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime9
                    y: 6
                    width: lb_fabricName9.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m9
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of9.right
                background: Rectangle {
                    color: rectangle9.recColor
                    border.color: rectangle9.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m9.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt9
                    width: cb_m9.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate9
                        width: cb_m9.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex9
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m9.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m9.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m9.font
                            }
                        }

                        Rectangle {
                            width: cb_m9.width - rectIndex9.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m9.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m9.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex9.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m9.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m9.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m9.currentIndex !== cb_m9.lastestConfigFabricIndex){
                                lb_fabricName9.text =  cb_m9.model.get(cb_m9.currentIndex).data2
                                lb_fabricTime9.text = ""
                                listConfigFabricIdOfMchn[8] = cb_m9.model.get(cb_m9.currentIndex).index_
                                rectangle9.borderColor = rectangle9.borderColorWhenValueIsChanged
                                rectangle9.recColor = rectangle9.recColorWhenValueIsChanged
                                rectangle9.idcColor = rectangle9.idcColorWhenValueIsChanged
                                indicator9.requestPaint()
                            }
                            else{
                                lb_fabricName9.text =  cb_m9.model.get(cb_m9.currentIndex).data2
                                lb_fabricTime9.text = cb_m9.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[8] = "0"
                                rectangle9.borderColor = rectangle9.borderColorNormal
                                rectangle9.recColor = rectangle9.recColorNormal
                                rectangle9.idcColor = rectangle9.idcColorNormal
                                indicator9.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName9.text =  cb_m9.model.get(cb_m9.currentIndex).data2
                            if(cb_m9.model.get(cb_m9.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime9.text = cb_m9.model.get(cb_m9.currentIndex).StartTime_ + " >>> " +  cb_m9.model.get(cb_m9.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime9.text = cb_m9.model.get(cb_m9.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName9.text =  ""
                        lb_fabricTime9.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator9
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
                        context.fillStyle = rectangle9.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset9
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m9.right
                CustomButton {
                    id: bt_decrease9
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset9.value !== 0){
                            numberRollOffset9.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant9
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase9.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m9.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m9.model.get(cb_m9.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase9
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of9.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset9.value ++
                    }
                }

                Rectangle {
                    id: rec4of9
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m9.currentIndex !== cb_m9.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m9.currentIndex !== cb_m9.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease9.right
                    Label {
                        id: numberRollOffset9
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[8] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig9
                y: 0
                width: 22
                height: 22
                visible: rectangle9.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig9
                    color: "#ffffff"
                    text: cb_m9.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig9
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle9.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m9.currentIndex = (cb_m9.currentIndex + 1)%cb_m9.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle10
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle9.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of10
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m10
                    x: 934
                    y: 6
                    width: lb_m10.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M10:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of10
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of10.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName10
                    y: 6
                    width: lb_fabricName10.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of10
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of10.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime10
                    y: 6
                    width: lb_fabricName10.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m10
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of10.right
                background: Rectangle {
                    color: rectangle10.recColor
                    border.color: rectangle10.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m10.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt10
                    width: cb_m10.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate10
                        width: cb_m10.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex10
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m10.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m10.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m10.font
                            }
                        }

                        Rectangle {
                            width: cb_m10.width - rectIndex10.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m10.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m10.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex10.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m10.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m10.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m10.currentIndex !== cb_m10.lastestConfigFabricIndex){
                                lb_fabricName10.text =  cb_m10.model.get(cb_m10.currentIndex).data2
                                lb_fabricTime10.text = ""
                                listConfigFabricIdOfMchn[9] = cb_m10.model.get(cb_m10.currentIndex).index_
                                rectangle10.borderColor = rectangle10.borderColorWhenValueIsChanged
                                rectangle10.recColor = rectangle10.recColorWhenValueIsChanged
                                rectangle10.idcColor = rectangle10.idcColorWhenValueIsChanged
                                indicator10.requestPaint()
                            }
                            else{
                                lb_fabricName10.text =  cb_m10.model.get(cb_m10.currentIndex).data2
                                lb_fabricTime10.text = cb_m10.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[9] = "0"
                                rectangle10.borderColor = rectangle10.borderColorNormal
                                rectangle10.recColor = rectangle10.recColorNormal
                                rectangle10.idcColor = rectangle10.idcColorNormal
                                indicator10.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName10.text =  cb_m10.model.get(cb_m10.currentIndex).data2
                            if(cb_m10.model.get(cb_m10.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime10.text = cb_m10.model.get(cb_m10.currentIndex).StartTime_ + " >>> " +  cb_m10.model.get(cb_m10.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime10.text = cb_m10.model.get(cb_m10.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName10.text =  ""
                        lb_fabricTime10.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator10
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
                        context.fillStyle = rectangle10.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset10
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m10.right
                CustomButton {
                    id: bt_decrease10
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset10.value !== 0){
                            numberRollOffset10.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant10
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase10.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m10.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m10.model.get(cb_m10.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase10
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of10.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset10.value ++
                    }
                }

                Rectangle {
                    id: rec4of10
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m10.currentIndex !== cb_m10.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m10.currentIndex !== cb_m10.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease10.right
                    Label {
                        id: numberRollOffset10
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[9] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig10
                y: 0
                width: 22
                height: 22
                visible: rectangle10.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig10
                    color: "#ffffff"
                    text: cb_m10.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig10
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle10.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m10.currentIndex = (cb_m10.currentIndex + 1)%cb_m10.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle11
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle10.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of11
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m11
                    x: 934
                    y: 6
                    width: lb_m11.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M11:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of11
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of11.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName11
                    y: 6
                    width: lb_fabricName11.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of11
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of11.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime11
                    y: 6
                    width: lb_fabricName11.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m11
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of11.right
                background: Rectangle {
                    color: rectangle11.recColor
                    border.color: rectangle11.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m11.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt11
                    width: cb_m11.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate11
                        width: cb_m11.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex11
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m11.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m11.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m11.font
                            }
                        }

                        Rectangle {
                            width: cb_m11.width - rectIndex11.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m11.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m11.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex11.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m11.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m11.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m11.currentIndex !== cb_m11.lastestConfigFabricIndex){
                                lb_fabricName11.text =  cb_m11.model.get(cb_m11.currentIndex).data2
                                lb_fabricTime11.text = ""
                                listConfigFabricIdOfMchn[10] = cb_m11.model.get(cb_m11.currentIndex).index_
                                rectangle11.borderColor = rectangle11.borderColorWhenValueIsChanged
                                rectangle11.recColor = rectangle11.recColorWhenValueIsChanged
                                rectangle11.idcColor = rectangle11.idcColorWhenValueIsChanged
                                indicator11.requestPaint()
                            }
                            else{
                                lb_fabricName11.text =  cb_m11.model.get(cb_m11.currentIndex).data2
                                lb_fabricTime11.text = cb_m11.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[10] = "0"

                                rectangle11.borderColor = rectangle11.borderColorNormal
                                rectangle11.recColor = rectangle11.recColorNormal
                                rectangle11.idcColor = rectangle11.idcColorNormal
                                indicator11.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName11.text =  cb_m11.model.get(cb_m11.currentIndex).data2
                            if(cb_m11.model.get(cb_m11.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime11.text = cb_m11.model.get(cb_m11.currentIndex).StartTime_ + " >>> " +  cb_m11.model.get(cb_m11.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime11.text = cb_m11.model.get(cb_m11.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName11.text =  ""
                        lb_fabricTime11.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator11
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
                        context.fillStyle = rectangle11.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset11
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m11.right
                CustomButton {
                    id: bt_decrease11
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset11.value !== 0){
                            numberRollOffset11.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant11
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase11.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m11.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m11.model.get(cb_m11.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase11
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of11.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset11.value ++
                    }
                }

                Rectangle {
                    id: rec4of11
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m11.currentIndex !== cb_m11.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m11.currentIndex !== cb_m11.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease11.right
                    Label {
                        id: numberRollOffset11
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[10] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig11
                y: 0
                width: 22
                height: 22
                visible: rectangle11.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig11
                    color: "#ffffff"
                    text: cb_m11.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig11
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle11.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m11.currentIndex = (cb_m11.currentIndex + 1)%cb_m11.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle12
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle11.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of12
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m12
                    x: 934
                    y: 6
                    width: lb_m12.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M12:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of12
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of12.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName12
                    y: 6
                    width: lb_fabricName12.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of12
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of12.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime12
                    y: 6
                    width: lb_fabricName12.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m12
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of12.right
                background: Rectangle {
                    color: rectangle12.recColor
                    border.color: rectangle12.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m12.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt12
                    width: cb_m12.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate12
                        width: cb_m12.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex12
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m12.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m12.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m12.font
                            }
                        }

                        Rectangle {
                            width: cb_m12.width - rectIndex12.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m12.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m12.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex12.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m12.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m12.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m12.currentIndex !== cb_m12.lastestConfigFabricIndex){
                                lb_fabricName12.text =  cb_m12.model.get(cb_m12.currentIndex).data2
                                lb_fabricTime12.text = ""
                                listConfigFabricIdOfMchn[11] = cb_m12.model.get(cb_m12.currentIndex).index_
                                rectangle12.borderColor = rectangle12.borderColorWhenValueIsChanged
                                rectangle12.recColor = rectangle12.recColorWhenValueIsChanged
                                rectangle12.idcColor = rectangle12.idcColorWhenValueIsChanged
                                indicator12.requestPaint()
                            }
                            else{
                                lb_fabricName12.text =  cb_m12.model.get(cb_m12.currentIndex).data2
                                lb_fabricTime12.text = cb_m12.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[11] = "0"
                                rectangle12.borderColor = rectangle12.borderColorNormal
                                rectangle12.recColor = rectangle12.recColorNormal
                                rectangle12.idcColor = rectangle12.idcColorNormal
                                indicator12.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName12.text =  cb_m12.model.get(cb_m12.currentIndex).data2
                            if(cb_m12.model.get(cb_m12.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime12.text = cb_m12.model.get(cb_m12.currentIndex).StartTime_ + " >>> " +  cb_m12.model.get(cb_m12.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime12.text = cb_m12.model.get(cb_m12.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName12.text =  ""
                        lb_fabricTime12.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator12
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
                        context.fillStyle = rectangle12.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset12
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m12.right
                CustomButton {
                    id: bt_decrease12
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset12.value !== 0){
                            numberRollOffset12.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant12
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase12.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m12.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m12.model.get(cb_m12.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase12
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of12.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset12.value ++
                    }
                }

                Rectangle {
                    id: rec4of12
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m12.currentIndex !== cb_m12.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m12.currentIndex !== cb_m12.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease12.right
                    Label {
                        id: numberRollOffset12
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[11] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig12
                y: 0
                width: 22
                height: 22
                visible: rectangle12.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig12
                    color: "#ffffff"
                    text: cb_m12.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig12
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle12.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m12.currentIndex = (cb_m12.currentIndex + 1)%cb_m12.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle13
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle12.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of13
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m13
                    x: 934
                    y: 6
                    width: lb_m13.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M13:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of13
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of13.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName13
                    y: 6
                    width: lb_fabricName13.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of13
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of13.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime13
                    y: 6
                    width: lb_fabricName13.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m13
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of13.right
                background: Rectangle {
                    color: rectangle13.recColor
                    border.color: rectangle13.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m13.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt13
                    width: cb_m13.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate13
                        width: cb_m13.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex13
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m13.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m13.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m13.font
                            }
                        }

                        Rectangle {
                            width: cb_m13.width - rectIndex13.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m13.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m13.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex13.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m13.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m13.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m13.currentIndex !== cb_m13.lastestConfigFabricIndex){
                                lb_fabricName13.text =  cb_m13.model.get(cb_m13.currentIndex).data2
                                lb_fabricTime13.text = ""
                                listConfigFabricIdOfMchn[12] = cb_m13.model.get(cb_m13.currentIndex).index_
                                rectangle13.borderColor = rectangle13.borderColorWhenValueIsChanged
                                rectangle13.recColor = rectangle13.recColorWhenValueIsChanged
                                rectangle13.idcColor = rectangle13.idcColorWhenValueIsChanged
                                indicator13.requestPaint()
                            }
                            else{
                                lb_fabricName13.text =  cb_m13.model.get(cb_m13.currentIndex).data2
                                lb_fabricTime13.text = cb_m13.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[12] = "0"

                                rectangle13.borderColor = rectangle13.borderColorNormal
                                rectangle13.recColor = rectangle13.recColorNormal
                                rectangle13.idcColor = rectangle13.idcColorNormal
                                indicator13.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName13.text =  cb_m13.model.get(cb_m13.currentIndex).data2
                            if(cb_m13.model.get(cb_m13.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime13.text = cb_m13.model.get(cb_m13.currentIndex).StartTime_ + " >>> " +  cb_m13.model.get(cb_m13.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime13.text = cb_m13.model.get(cb_m13.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName13.text =  ""
                        lb_fabricTime13.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator13
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
                        context.fillStyle = rectangle13.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset13
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m13.right
                CustomButton {
                    id: bt_decrease13
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset13.value !== 0){
                            numberRollOffset13.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant13
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase13.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m13.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m13.model.get(cb_m13.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase13
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of13.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset13.value ++
                    }
                }

                Rectangle {
                    id: rec4of13
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m13.currentIndex !== cb_m13.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m13.currentIndex !== cb_m13.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease13.right
                    Label {
                        id: numberRollOffset13
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[12] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig13
                y: 0
                width: 22
                height: 22
                visible: rectangle13.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig13
                    color: "#ffffff"
                    text: cb_m13.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig13
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle13.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m13.currentIndex = (cb_m13.currentIndex + 1)%cb_m13.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle14
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle13.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of14
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m14
                    x: 934
                    y: 6
                    width: lb_m14.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M14:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of14
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of14.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName14
                    y: 6
                    width: lb_fabricName14.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of14
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of14.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime14
                    y: 6
                    width: lb_fabricName14.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m14
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of14.right
                background: Rectangle {
                    color: rectangle14.recColor
                    border.color: rectangle14.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m14.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt14
                    width: cb_m14.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate14
                        width: cb_m14.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex14
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m14.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m14.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m14.font
                            }
                        }

                        Rectangle {
                            width: cb_m14.width - rectIndex14.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m14.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m14.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex14.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m14.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m14.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m14.currentIndex !== cb_m14.lastestConfigFabricIndex){
                                lb_fabricName14.text =  cb_m14.model.get(cb_m14.currentIndex).data2
                                lb_fabricTime14.text = ""
                                listConfigFabricIdOfMchn[13] = cb_m14.model.get(cb_m14.currentIndex).index_
                                rectangle14.borderColor = rectangle14.borderColorWhenValueIsChanged
                                rectangle14.recColor = rectangle14.recColorWhenValueIsChanged
                                rectangle14.idcColor = rectangle14.idcColorWhenValueIsChanged
                                indicator14.requestPaint()
                            }
                            else{
                                lb_fabricName14.text =  cb_m14.model.get(cb_m14.currentIndex).data2
                                lb_fabricTime14.text = cb_m14.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[13] = "0"
                                rectangle14.borderColor = rectangle14.borderColorNormal
                                rectangle14.recColor = rectangle14.recColorNormal
                                rectangle14.idcColor = rectangle14.idcColorNormal
                                indicator14.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName14.text =  cb_m14.model.get(cb_m14.currentIndex).data2
                            if(cb_m14.model.get(cb_m14.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime14.text = cb_m14.model.get(cb_m14.currentIndex).StartTime_ + " >>> " +  cb_m14.model.get(cb_m14.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime14.text = cb_m14.model.get(cb_m14.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName14.text =  ""
                        lb_fabricTime14.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator14
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
                        context.fillStyle = rectangle14.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset14
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m14.right
                CustomButton {
                    id: bt_decrease14
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset14.value !== 0){
                            numberRollOffset14.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant14
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase14.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m14.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m14.model.get(cb_m14.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase14
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of14.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset14.value ++
                    }
                }

                Rectangle {
                    id: rec4of14
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m14.currentIndex !== cb_m14.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m14.currentIndex !== cb_m14.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease14.right
                    Label {
                        id: numberRollOffset14
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[13] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig14
                y: 0
                width: 22
                height: 22
                visible: rectangle14.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig14
                    color: "#ffffff"
                    text: cb_m14.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig14
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle14.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m14.currentIndex = (cb_m14.currentIndex + 1)%cb_m14.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle15
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle14.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of15
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m15
                    x: 934
                    y: 6
                    width: lb_m15.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M15:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of15
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of15.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName15
                    y: 6
                    width: lb_fabricName15.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of15
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of15.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime15
                    y: 6
                    width: lb_fabricName15.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m15
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of15.right
                background: Rectangle {
                    color: rectangle15.recColor
                    border.color: rectangle15.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m15.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt15
                    width: cb_m15.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate15
                        width: cb_m15.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex15
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m15.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m15.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m15.font
                            }
                        }

                        Rectangle {
                            width: cb_m15.width - rectIndex15.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m15.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m15.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex15.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m15.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m15.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m15.currentIndex !== cb_m15.lastestConfigFabricIndex){
                                lb_fabricName15.text =  cb_m15.model.get(cb_m15.currentIndex).data2
                                lb_fabricTime15.text = ""
                                listConfigFabricIdOfMchn[14] = cb_m15.model.get(cb_m15.currentIndex).index_
                                rectangle15.borderColor = rectangle15.borderColorWhenValueIsChanged
                                rectangle15.recColor = rectangle15.recColorWhenValueIsChanged
                                rectangle15.idcColor = rectangle15.idcColorWhenValueIsChanged
                                indicator15.requestPaint()
                            }
                            else{
                                lb_fabricName15.text =  cb_m15.model.get(cb_m15.currentIndex).data2
                                lb_fabricTime15.text = cb_m15.startTimeOfLifeTime+ " >>> hiện tại"
                                listConfigFabricIdOfMchn[14] = "0"

                                rectangle15.borderColor = rectangle15.borderColorNormal
                                rectangle15.recColor = rectangle15.recColorNormal
                                rectangle15.idcColor = rectangle15.idcColorNormal
                                indicator15.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName15.text =  cb_m15.model.get(cb_m15.currentIndex).data2
                            if(cb_m15.model.get(cb_m15.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime15.text = cb_m15.model.get(cb_m15.currentIndex).StartTime_ + " >>> " +  cb_m15.model.get(cb_m15.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime15.text = cb_m15.model.get(cb_m15.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName15.text =  ""
                        lb_fabricTime15.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator15
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
                        context.fillStyle = rectangle15.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset15
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m15.right
                CustomButton {
                    id: bt_decrease15
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset15.value !== 0){
                            numberRollOffset15.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant15
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase15.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m15.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m15.model.get(cb_m15.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase15
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of15.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset15.value ++
                    }
                }

                Rectangle {
                    id: rec4of15
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m15.currentIndex !== cb_m15.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m15.currentIndex !== cb_m15.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease15.right
                    Label {
                        id: numberRollOffset15
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[14] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig15
                y: 0
                width: 22
                height: 22
                visible: rectangle15.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig15
                    color: "#ffffff"
                    text: cb_m15.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig15
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle15.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m15.currentIndex = (cb_m15.currentIndex + 1)%cb_m15.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle16
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle15.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of16
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m16
                    x: 934
                    y: 6
                    width: lb_m16.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M16:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of16
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of16.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName16
                    y: 6
                    width: lb_fabricName16.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of16
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of16.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime16
                    y: 6
                    width: lb_fabricName16.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m16
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of16.right
                background: Rectangle {
                    color: rectangle16.recColor
                    border.color: rectangle16.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m16.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt16
                    width: cb_m16.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate16
                        width: cb_m16.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex16
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m16.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m16.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m16.font
                            }
                        }

                        Rectangle {
                            width: cb_m16.width - rectIndex16.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m16.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m16.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex16.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m16.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m16.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m16.currentIndex !== cb_m16.lastestConfigFabricIndex){
                                lb_fabricName16.text =  cb_m16.model.get(cb_m16.currentIndex).data2
                                lb_fabricTime16.text = ""
                                listConfigFabricIdOfMchn[15] = cb_m16.model.get(cb_m16.currentIndex).index_
                                rectangle16.borderColor = rectangle16.borderColorWhenValueIsChanged
                                rectangle16.recColor = rectangle16.recColorWhenValueIsChanged
                                rectangle16.idcColor = rectangle16.idcColorWhenValueIsChanged
                                indicator16.requestPaint()
                            }
                            else{
                                lb_fabricName16.text =  cb_m16.model.get(cb_m16.currentIndex).data2
                                lb_fabricTime16.text = cb_m16.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[15] = "0"
                                rectangle16.borderColor = rectangle16.borderColorNormal
                                rectangle16.recColor = rectangle16.recColorNormal
                                rectangle16.idcColor = rectangle16.idcColorNormal
                                indicator16.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName16.text =  cb_m16.model.get(cb_m16.currentIndex).data2
                            if(cb_m16.model.get(cb_m16.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime16.text = cb_m16.model.get(cb_m16.currentIndex).StartTime_ + " >>> " +  cb_m16.model.get(cb_m16.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime16.text = cb_m16.model.get(cb_m16.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName16.text =  ""
                        lb_fabricTime16.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator16
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
                        context.fillStyle = rectangle16.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset16
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m16.right
                CustomButton {
                    id: bt_decrease16
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset16.value !== 0){
                            numberRollOffset16.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant16
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase16.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m16.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m16.model.get(cb_m16.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase16
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of16.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset16.value ++
                    }
                }

                Rectangle {
                    id: rec4of16
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m16.currentIndex !== cb_m16.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m16.currentIndex !== cb_m16.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease16.right
                    Label {
                        id: numberRollOffset16
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[15] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig16
                y: 0
                width: 22
                height: 22
                visible: rectangle16.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig16
                    color: "#ffffff"
                    text: cb_m16.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig16
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle16.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m16.currentIndex = (cb_m16.currentIndex + 1)%cb_m16.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle17
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle16.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of17
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m17
                    x: 934
                    y: 6
                    width: lb_m17.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M17:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of17
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of17.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName17
                    y: 6
                    width: lb_fabricName17.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of17
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of17.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime17
                    y: 6
                    width: lb_fabricName17.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m17
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of17.right
                background: Rectangle {
                    color: rectangle17.recColor
                    border.color: rectangle17.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m17.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt17
                    width: cb_m17.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate17
                        width: cb_m17.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex17
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m17.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m17.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m17.font
                            }
                        }

                        Rectangle {
                            width: cb_m17.width - rectIndex17.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m17.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m17.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex17.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m17.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m17.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m17.currentIndex !== cb_m17.lastestConfigFabricIndex){
                                lb_fabricName17.text =  cb_m17.model.get(cb_m17.currentIndex).data2
                                lb_fabricTime17.text = ""
                                listConfigFabricIdOfMchn[16] = cb_m17.model.get(cb_m17.currentIndex).index_
                                rectangle17.borderColor = rectangle17.borderColorWhenValueIsChanged
                                rectangle17.recColor = rectangle17.recColorWhenValueIsChanged
                                rectangle17.idcColor = rectangle17.idcColorWhenValueIsChanged
                                indicator17.requestPaint()
                            }
                            else{
                                lb_fabricName17.text =  cb_m17.model.get(cb_m17.currentIndex).data2
                                lb_fabricTime17.text = cb_m17.startTimeOfLifeTime+ " >>> hiện tại"
                                listConfigFabricIdOfMchn[16] = "0"

                                rectangle17.borderColor = rectangle17.borderColorNormal
                                rectangle17.recColor = rectangle17.recColorNormal
                                rectangle17.idcColor = rectangle17.idcColorNormal
                                indicator17.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName17.text =  cb_m17.model.get(cb_m17.currentIndex).data2
                            if(cb_m17.model.get(cb_m17.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime17.text = cb_m17.model.get(cb_m17.currentIndex).StartTime_ + " >>> " +  cb_m17.model.get(cb_m17.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime17.text = cb_m17.model.get(cb_m17.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName17.text =  ""
                        lb_fabricTime17.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator17
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
                        context.fillStyle = rectangle17.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset17
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m17.right
                CustomButton {
                    id: bt_decrease17
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset17.value !== 0){
                            numberRollOffset17.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant17
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase17.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m17.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m17.model.get(cb_m17.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase17
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of17.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset17.value ++
                    }
                }

                Rectangle {
                    id: rec4of17
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m17.currentIndex !== cb_m17.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m17.currentIndex !== cb_m17.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease17.right
                    Label {
                        id: numberRollOffset17
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[16] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig17
                y: 0
                width: 22
                height: 22
                visible: rectangle17.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig17
                    color: "#ffffff"
                    text: cb_m17.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig17
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle17.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m17.currentIndex = (cb_m17.currentIndex + 1)%cb_m17.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle18
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle17.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of18
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m18
                    x: 934
                    y: 6
                    width: lb_m18.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M18:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of18
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of18.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName18
                    y: 6
                    width: lb_fabricName18.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of18
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of18.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime18
                    y: 6
                    width: lb_fabricName18.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m18
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of18.right
                background: Rectangle {
                    color: rectangle18.recColor
                    border.color: rectangle18.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m18.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt18
                    width: cb_m18.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate18
                        width: cb_m18.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex18
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m18.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m18.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m18.font
                            }
                        }

                        Rectangle {
                            width: cb_m18.width - rectIndex18.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m18.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m18.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex18.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m18.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m18.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m18.currentIndex !== cb_m18.lastestConfigFabricIndex){
                                lb_fabricName18.text =  cb_m18.model.get(cb_m18.currentIndex).data2
                                lb_fabricTime18.text = ""
                                listConfigFabricIdOfMchn[17] = cb_m18.model.get(cb_m18.currentIndex).index_
                                rectangle18.borderColor = rectangle18.borderColorWhenValueIsChanged
                                rectangle18.recColor = rectangle18.recColorWhenValueIsChanged
                                rectangle18.idcColor = rectangle18.idcColorWhenValueIsChanged
                                indicator18.requestPaint()
                            }
                            else{
                                lb_fabricName18.text =  cb_m18.model.get(cb_m18.currentIndex).data2
                                lb_fabricTime18.text = cb_m18.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[17] = "0"

                                rectangle18.borderColor = rectangle18.borderColorNormal
                                rectangle18.recColor = rectangle18.recColorNormal
                                rectangle18.idcColor = rectangle18.idcColorNormal
                                indicator18.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName18.text =  cb_m18.model.get(cb_m18.currentIndex).data2
                            if(cb_m18.model.get(cb_m18.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime18.text = cb_m18.model.get(cb_m18.currentIndex).StartTime_ + " >>> " +  cb_m18.model.get(cb_m18.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime18.text = cb_m18.model.get(cb_m18.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName18.text =  ""
                        lb_fabricTime18.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator18
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
                        context.fillStyle = rectangle18.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset18
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m18.right
                CustomButton {
                    id: bt_decrease18
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset18.value !== 0){
                            numberRollOffset18.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant18
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase18.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m18.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m18.model.get(cb_m18.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase18
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of18.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset18.value ++
                    }
                }

                Rectangle {
                    id: rec4of18
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m18.currentIndex !== cb_m18.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m18.currentIndex !== cb_m18.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease18.right
                    Label {
                        id: numberRollOffset18
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[17] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig18
                y: 0
                width: 22
                height: 22
                visible: rectangle18.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig18
                    color: "#ffffff"
                    text: cb_m18.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig18
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle18.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m18.currentIndex = (cb_m18.currentIndex + 1)%cb_m18.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle19
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle18.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of19
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m19
                    x: 934
                    y: 6
                    width: lb_m19.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M19:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of19
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of19.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName19
                    y: 6
                    width: lb_fabricName19.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of19
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of19.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime19
                    y: 6
                    width: lb_fabricName19.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m19
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of19.right
                background: Rectangle {
                    color: rectangle19.recColor
                    border.color: rectangle19.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m19.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt19
                    width: cb_m19.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate19
                        width: cb_m19.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex19
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m19.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m19.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m19.font
                            }
                        }

                        Rectangle {
                            width: cb_m19.width - rectIndex19.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m19.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m19.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex19.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m19.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m19.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m19.currentIndex !== cb_m19.lastestConfigFabricIndex){
                                lb_fabricName19.text =  cb_m19.model.get(cb_m19.currentIndex).data2
                                lb_fabricTime19.text = ""
                                listConfigFabricIdOfMchn[18] = cb_m19.model.get(cb_m19.currentIndex).index_
                                rectangle19.borderColor = rectangle19.borderColorWhenValueIsChanged
                                rectangle19.recColor = rectangle19.recColorWhenValueIsChanged
                                rectangle19.idcColor = rectangle19.idcColorWhenValueIsChanged
                                indicator19.requestPaint()
                            }
                            else{
                                lb_fabricName19.text =  cb_m19.model.get(cb_m19.currentIndex).data2
                                lb_fabricTime19.text = cb_m19.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[18] = "0"

                                rectangle19.borderColor = rectangle19.borderColorNormal
                                rectangle19.recColor = rectangle19.recColorNormal
                                rectangle19.idcColor = rectangle19.idcColorNormal
                                indicator19.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName19.text =  cb_m19.model.get(cb_m19.currentIndex).data2
                            if(cb_m19.model.get(cb_m19.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime19.text = cb_m19.model.get(cb_m19.currentIndex).StartTime_ + " >>> " +  cb_m19.model.get(cb_m19.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime19.text = cb_m19.model.get(cb_m19.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName19.text =  ""
                        lb_fabricTime19.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator19
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
                        context.fillStyle = rectangle19.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset19
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m19.right
                CustomButton {
                    id: bt_decrease19
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset19.value !== 0){
                            numberRollOffset19.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant19
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase19.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m19.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m19.model.get(cb_m19.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase19
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of19.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset19.value ++
                    }
                }

                Rectangle {
                    id: rec4of19
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m19.currentIndex !== cb_m19.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m19.currentIndex !== cb_m19.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease19.right
                    Label {
                        id: numberRollOffset19
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[18] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig19
                y: 0
                width: 22
                height: 22
                visible: rectangle19.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig19
                    color: "#ffffff"
                    text: cb_m19.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig19
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle19.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m19.currentIndex = (cb_m19.currentIndex + 1)%cb_m19.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle20
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle19.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#1100ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of20
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m20
                    x: 934
                    y: 6
                    width: lb_m20.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M20:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of20
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of20.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName20
                    y: 6
                    width: lb_fabricName20.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of20
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of20.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime20
                    y: 6
                    width: lb_fabricName20.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m20
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of20.right
                background: Rectangle {
                    color: rectangle20.recColor
                    border.color: rectangle20.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m20.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt20
                    width: cb_m20.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate20
                        width: cb_m20.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex20
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m20.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m20.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m20.font
                            }
                        }

                        Rectangle {
                            width: cb_m20.width - rectIndex20.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m20.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m20.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex20.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m20.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                    if(cb_m20.currentIndex !== -1){
                        if(mode === modeEdit){
                            if(cb_m20.currentIndex !== cb_m20.lastestConfigFabricIndex){
                                lb_fabricName20.text =  cb_m20.model.get(cb_m20.currentIndex).data2
                                lb_fabricTime20.text = ""
                                listConfigFabricIdOfMchn[19] = cb_m20.model.get(cb_m20.currentIndex).index_
                                rectangle20.borderColor = rectangle20.borderColorWhenValueIsChanged
                                rectangle20.recColor = rectangle20.recColorWhenValueIsChanged
                                rectangle20.idcColor = rectangle20.idcColorWhenValueIsChanged
                                indicator20.requestPaint()

                            }
                            else{
                                lb_fabricName20.text =  cb_m20.model.get(cb_m20.currentIndex).data2
                                lb_fabricTime20.text = cb_m20.startTimeOfLifeTime + " >>> hiện tại"
                                listConfigFabricIdOfMchn[19] = "0"

                                rectangle20.borderColor = rectangle20.borderColorNormal
                                rectangle20.recColor = rectangle20.recColorNormal
                                rectangle20.idcColor = rectangle20.idcColorNormal
                                indicator20.requestPaint()
                            }
                        }
                        else if(mode === modeView){
                            lb_fabricName20.text =  cb_m20.model.get(cb_m20.currentIndex).data2
                            if(cb_m20.model.get(cb_m20.currentIndex).EndTime_ !== "None"){
                                lb_fabricTime20.text = cb_m20.model.get(cb_m20.currentIndex).StartTime_ + " >>> " +  cb_m20.model.get(cb_m20.currentIndex).EndTime_
                            }
                            else{
                                lb_fabricTime20.text = cb_m20.model.get(cb_m20.currentIndex).StartTime_ + " >>> hiện tại"
                            }
                        }
                    }
                    else{
                        lb_fabricName20.text =  ""
                        lb_fabricTime20.text = ""
                    }
                }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    color: "#ffffff"
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator20
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
                        context.fillStyle = rectangle20.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                        context.fill();
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset20
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m20.right
                CustomButton {
                    id: bt_decrease20
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                        if(numberRollOffset20.value !== 0){
                            numberRollOffset20.value --
                        }
                    }
                }

                CustomButton {
                    id: bt_createVariant20
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase20.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                        if(cb_m20.currentText !== ""){
                            stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m20.model.get(cb_m20.currentIndex)})
                        }
                    }
                }

                CustomButton {
                    id: bt_increase20
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of20.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                        numberRollOffset20.value ++
                    }
                }

                Rectangle {
                    id: rec4of20
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m20.currentIndex !== cb_m20.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m20.currentIndex !== cb_m20.lastestConfigFabricIndex ? "#ff0000": "#00ff00"
                    anchors.left: bt_decrease20.right
                    Label {
                        id: numberRollOffset20
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                            listoffset[19] = parseInt(text)
                        }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig20
                y: 0
                width: 22
                height: 22
                visible: rectangle20.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig20
                    color: "#ffffff"
                    text: cb_m20.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig20
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle20.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m20.currentIndex = (cb_m20.currentIndex + 1)%cb_m20.count
                }
            }
            anchors.leftMargin: 4
        }

        Rectangle {
            id: rectangle21
            width: 1494
            height: 40
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.top: rectangle20.bottom
            property bool modeView_MutilConfig: false
            property color borderColorNormal: "#00ff00"
            property color recColorNormal: "#5500ff00"
            property color idcColorNormal: "#21be2b"

            property color borderColorWhenValueIsChanged: "#ff0000"
            property color recColorWhenValueIsChanged: "#55ff0000"
            property color idcColorWhenValueIsChanged: "#be2121"

            property color borderColor: borderColorNormal
            property color recColor: recColorNormal
            property color idcColor: idcColorNormal
            anchors.topMargin: 5
            Rectangle {
                id: rec1of21
                x: 0
                y: 0
                width: 65
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                anchors.left: parent.left
                Label {
                    id: lb_m21
                    x: 934
                    y: 6
                    width: lb_m21.contentWidth
                    height: 28
                    color: "#ff0000"
                    text: qsTr("M21:")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 13
                    topPadding: -2
                    //font.bold: true
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: rec2of21
                x: -4
                width: 330
                height: 20
                color: parent.recColor
                border.color: parent.borderColor
                radius: 2
                border.width: 1
                anchors.left: rec1of21.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Label {
                    id: lb_fabricName21
                    y: 6
                    width: lb_fabricName21.contentWidth
                    height: 28
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    anchors.leftMargin: 6
                    topPadding: -2
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec3of21
                x: -4
                width: 330
                height: 20
                color: "#006c6c6c"
                border.width: 0
                anchors.left: rec1of21.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1
                Label {
                    id: lb_fabricTime21
                    y: 6
                    width: lb_fabricName21.contentWidth
                    height: 28
                    color: "#ececec"
                    text: qsTr("16h00 26/20/21 đến 6h00 27/10/21")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.pointSize: 11
                    anchors.leftMargin: 3
                    font.italic: false
                    topPadding: 4
                }
                anchors.leftMargin: 1
            }

            ComboBox {
                id: cb_m21
                x: 501
                y: 0
                width: 923
                height: 40
                anchors.left: rec2of21.right
                background: Rectangle {
                    color: rectangle21.recColor
                    border.color: rectangle21.borderColor
                    radius: 2
                }
                popup.onOpened:{
                    cb_m21.currentIndex = 0
                }
                font.family: "Ubuntu Mono"
                textRole: "data1"
                delegate: ItemDelegate {
                    id: itemDlgt21
                    width: cb_m21.width
                    height: 40
                    background: Rectangle {
                        width: parent.width
                        color: "#5c5c5c"
                        radius: 1
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    contentItem: Item {
                        id: cti_ItemDelegate21
                        width: cb_m21.width
                        height: 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        Rectangle {
                            id: rectIndex21
                            width: 40
                            height: 39
                            color: mode === modeEdit ? index === cb_m21.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m21.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: index +1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font: cb_m21.font
                            }
                        }

                        Rectangle {
                            width: cb_m21.width - rectIndex21.width
                            height: 39
                            color: mode === modeEdit ? index === cb_m21.lastestConfigFabricIndex ? "green" : "#300a24" : index === cb_m21.currentIndex ? "green" : "#300a24"
                            radius: 2
                            anchors.left: rectIndex21.right
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            Text {
                                color: "#ffffff"
                                text: data1
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                font: cb_m21.font
                                anchors.leftMargin: 10
                            }
                            anchors.leftMargin: 1
                        }
                    }
                }
                onCurrentIndexChanged: {
                            if(cb_m21.currentIndex !== -1){
                                if(mode === modeEdit){
                                    if(cb_m21.currentIndex !== cb_m21.lastestConfigFabricIndex){
                                        lb_fabricName21.text =  cb_m21.model.get(cb_m21.currentIndex).data2
                                        lb_fabricTime21.text = ""
                                        listConfigFabricIdOfMchn[20] = cb_m21.model.get(cb_m21.currentIndex).index_
                                        rectangle21.borderColor = rectangle21.borderColorWhenValueIsChanged
                                        rectangle21.recColor = rectangle21.recColorWhenValueIsChanged
                                        rectangle21.idcColor = rectangle21.idcColorWhenValueIsChanged
                                        indicator21.requestPaint()

                                    }
                                    else{
                                        lb_fabricName21.text =  cb_m21.model.get(cb_m21.currentIndex).data2
                                        lb_fabricTime21.text = cb_m21.startTimeOfLifeTime + " >>> hiện tại"
                                        listConfigFabricIdOfMchn[20] = "0"

                                        rectangle21.borderColor = rectangle21.borderColorNormal
                                        rectangle21.recColor = rectangle21.recColorNormal
                                        rectangle21.idcColor = rectangle21.idcColorNormal
                                        indicator21.requestPaint()
                                    }
                                }
                                else if(mode === modeView){
                                    lb_fabricName21.text =  cb_m21.model.get(cb_m21.currentIndex).data2
                                    if(cb_m21.model.get(cb_m21.currentIndex).EndTime_ !== "None"){
                                        lb_fabricTime21.text = cb_m21.model.get(cb_m21.currentIndex).StartTime_ + " >>> " +  cb_m21.model.get(cb_m21.currentIndex).EndTime_
                                    }
                                    else{
                                        lb_fabricTime21.text = cb_m21.model.get(cb_m21.currentIndex).StartTime_ + " >>> hiện tại"
                                    }
                                }
                            }
                            else{
                                lb_fabricName21.text =  ""
                                lb_fabricTime21.text = ""
                            }
                        }
                font.pointSize: 13
                anchors.leftMargin: 3
                contentItem: Text {
                    color: "#ffffff"
                    font.family: "Ubuntu Mono"
                    font.pointSize: 13
                    text: parent.displayText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }
                property int lastestConfigFabricIndex: -1
                property string startTimeOfLifeTime: ""
                model: ListModel {
                    ListElement {
                        FabricType_FabricTypeId_: ""
                        YarnLotId2_: ""
                        Yarn1Speed_: ""
                        YarnLotId4_: ""
                        Yarn4ConeNum_: ""
                        Dia_: ""
                        index_: ""
                        StartTime_: ""
                        Yarn2Speed_: ""
                        Yarn4Speed_: ""
                        G_: ""
                        YarnRoundsPerRoll_: ""
                        Wide_: ""
                        YarnLotId3_: ""
                        Yarn2ConeNum_: ""
                        Yarn3ConeNum_: ""
                        data2: ""
                        Yarn3Speed_: ""
                        data1: ""
                        YarnLotId1_: ""
                        MPKg_: ""
                        Yarn1ConeNum_: ""
                        EndTime_: ""
                    }
                }
                indicator: Canvas {
                    id:indicator21
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
                                context.fillStyle = rectangle21.idcColor //parent.pressed ? "#17a81a" : "#21be2b";
                                context.fill();
                            }
                }
                font.capitalization: Font.AllUppercase
            }

            Rectangle {
                id: rec_offset21
                y: 0
                width: 164
                height: 40
                color: "#00ffffff"
                radius: 0
                border.color: "#0dffe6"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: cb_m21.right
                CustomButton {
                    id: bt_decrease21
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/decreaseBtn.svg"
                    onClicked: {
                                if(numberRollOffset21.value !== 0){
                                    numberRollOffset21.value --
                                }
                            }
                }

                CustomButton {
                    id: bt_createVariant21
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: bt_increase21.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/createVariant.svg"
                    onClicked: {
                                if(cb_m21.currentText !== ""){
                                    stackView_contenPage.replace(Qt.resolvedUrl("../pages/fabricPage.qml"), {"fabricMachinePageMessage": cb_m21.model.get(cb_m21.currentIndex)})
                                }
                            }
                }

                CustomButton {
                    id: bt_increase21
                    width: 38
                    height: 38
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rec4of21.right
                    anchors.leftMargin: 3
                    anchors.verticalCenterOffset: 0
                    buttonWidth: parent.height
                    buttonHeight: parent.height
                    btnIconSource: "../../images/page_images/fabricMachinePage/increaseBtn.svg"
                    onClicked: {
                                numberRollOffset21.value ++
                            }
                }

                Rectangle {
                    id: rec4of21
                    y: 1
                    width: 40
                    height: 40
                    radius: 2
                    color: mode === modeEdit && cb_m21.currentIndex !== cb_m21.lastestConfigFabricIndex ? "#55ff0000" : "#5500ff00"
                    border.color: mode === modeEdit && cb_m21.currentIndex !== cb_m21.lastestConfigFabricIndex ? "#ff0000" : "#00ff00"
                    anchors.left: bt_decrease21.right
                    Label {
                        id: numberRollOffset21
                        x: 8
                        y: 15
                        color: "white" //"#00ff00"
                        text: value
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Ubuntu Mono"
                        font.bold: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int value: 0
                        font.pointSize: 17
                        leftPadding: 0
                        leftInset: 0
                        topPadding: -2
                        onTextChanged: {
                                    listoffset[20] = parseInt(text)
                                }
                    }
                    anchors.leftMargin: 3
                }
                anchors.leftMargin: 3
            }

            Rectangle {
                id: rec_numConfig21
                y: 0
                width: 22
                height: 22
                visible: rectangle21.modeView_MutilConfig
                color: "#ff0000"
                radius: 11
                border.width: 0
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                Label {
                    id: lb_numberConfig21
                    color: "#ffffff"
                    text: cb_m21.currentIndex + 1
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Monofonto"
                    anchors.horizontalCenter: parent.horizontalCenter
                    leftPadding: -1
                    topPadding: -1
                    font.weight: Font.Bold
                }
                anchors.leftMargin: 332
            }

            CustomButton {
                id: bt_nextConfig21
                width: 42
                height: 42
                opacity: 0.348
                visible: rectangle21.modeView_MutilConfig
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 355
                anchors.verticalCenterOffset: 0
                buttonWidth: parent.height
                buttonHeight: parent.height
                btnIconSource: "../../images/page_images/fabricMachinePage/fingerPrint.svg"
                onClicked: {
                    cb_m21.currentIndex = (cb_m21.currentIndex + 1)%cb_m21.count
                }
            }
            anchors.leftMargin: 4
        }


    }

    SoundEffect {
        id: se_btnClicked
        source: "../../soundEffects/button_click.wav"
    }

    //===================================================== POPUP

    // end

    Connections{
        target: fabricMachinePageBridge

        function onFill_allCbModels(configData, selectedRowDataForAllMachines){
            /*
                configData: list of FabricConfig Row
                selectedRowDataForAllMachines: list of list of list [fabricConfigID, startTime, endtime] direct to each machine
            */
            const lastConfigRowID = [] // list of 21 list. each element is the list of [fabricConfigID, startTime, endtime] ex: [8,2021-11-09 09:37:40,None] direct to knitting machine
            //const currentIndexList = []// list 21 element. to store current index to set to each combo box at the end


            //find lastest configData Row for mch 1
            selectedRowDataForAllMachines.forEach(function (machineFabricConfigRowList, index) { //machineFabricConfigRow = [fabricConfigID, startime, endtime]
                if(machineFabricConfigRowList.length === 0){
                    lastConfigRowID.push(-1) // this meaning: this machine don't have any fabricConfig
                }
                else{
                    lastConfigRowID.push(machineFabricConfigRowList[machineFabricConfigRowList.length - 1]) // store lastest element
                }
            })

            cb_m1.model.clear()
            cb_m2.model.clear()
            cb_m3.model.clear()
            cb_m4.model.clear()
            cb_m5.model.clear()
            cb_m6.model.clear()
            cb_m7.model.clear()
            cb_m8.model.clear()
            cb_m9.model.clear()
            cb_m10.model.clear()
            cb_m11.model.clear()
            cb_m12.model.clear()
            cb_m13.model.clear()
            cb_m14.model.clear()
            cb_m15.model.clear()
            cb_m16.model.clear()
            cb_m17.model.clear()
            cb_m18.model.clear()
            cb_m19.model.clear()
            cb_m20.model.clear()
            cb_m21.model.clear()

            configData.forEach(function (item, index) {
                if(item[0] === lastConfigRowID[0][0]){ // machine 1: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m1.lastestConfigFabricIndex = index
                    cb_m1.startTimeOfLifeTime = lastConfigRowID[0][1]
                }
                if(item[0] === lastConfigRowID[1][0]){ // machine 2: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m2.lastestConfigFabricIndex = index
                    cb_m2.startTimeOfLifeTime = lastConfigRowID[1][1]
                }
                if(item[0] === lastConfigRowID[2][0]){ // machine 3: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m3.lastestConfigFabricIndex = index
                    cb_m3.startTimeOfLifeTime = lastConfigRowID[2][1]
                }
                if(item[0] === lastConfigRowID[3][0]){ // machine 4: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m4.lastestConfigFabricIndex = index
                    cb_m4.startTimeOfLifeTime = lastConfigRowID[3][1]
                }
                if(item[0] === lastConfigRowID[4][0]){ // machine 5: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m5.lastestConfigFabricIndex = index
                    cb_m5.startTimeOfLifeTime = lastConfigRowID[4][1]
                }
                if(item[0] === lastConfigRowID[5][0]){ // machine 6: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m6.lastestConfigFabricIndex = index
                    cb_m6.startTimeOfLifeTime = lastConfigRowID[5][1]
                }
                if(item[0] === lastConfigRowID[6][0]){ // machine 7: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m7.lastestConfigFabricIndex = index
                    cb_m7.startTimeOfLifeTime = lastConfigRowID[6][1]
                }
                if(item[0] === lastConfigRowID[7][0]){ // machine 8: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m8.lastestConfigFabricIndex = index
                    cb_m8.startTimeOfLifeTime = lastConfigRowID[7][1]
                }
                if(item[0] === lastConfigRowID[8][0]){ // machine 9: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m9.lastestConfigFabricIndex = index
                    cb_m9.startTimeOfLifeTime = lastConfigRowID[8][1]
                }
                if(item[0] === lastConfigRowID[9][0]){ // machine 10: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m10.lastestConfigFabricIndex = index
                    cb_m10.startTimeOfLifeTime = lastConfigRowID[9][1]
                }
                if(item[0] === lastConfigRowID[10][0]){ // machine 11: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m11.lastestConfigFabricIndex = index
                    cb_m11.startTimeOfLifeTime = lastConfigRowID[10][1]
                }
                if(item[0] === lastConfigRowID[11][0]){ // machine 12: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m12.lastestConfigFabricIndex = index
                    cb_m12.startTimeOfLifeTime = lastConfigRowID[11][1]
                }
                if(item[0] === lastConfigRowID[12][0]){ // machine 13: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m13.lastestConfigFabricIndex = index
                    cb_m13.startTimeOfLifeTime = lastConfigRowID[12][1]
                }
                if(item[0] === lastConfigRowID[13][0]){ // machine 14: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m14.lastestConfigFabricIndex = index
                    cb_m14.startTimeOfLifeTime = lastConfigRowID[13][1]
                }
                if(item[0] === lastConfigRowID[14][0]){ // machine 15: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m15.lastestConfigFabricIndex = index
                    cb_m15.startTimeOfLifeTime = lastConfigRowID[14][1]
                }
                if(item[0] === lastConfigRowID[15][0]){ // machine 16: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m16.lastestConfigFabricIndex = index
                    cb_m16.startTimeOfLifeTime = lastConfigRowID[15][1]
                }
                if(item[0] === lastConfigRowID[16][0]){ // machine 17: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m17.lastestConfigFabricIndex = index
                    cb_m17.startTimeOfLifeTime = lastConfigRowID[16][1]
                }
                if(item[0] === lastConfigRowID[17][0]){ // machine 18: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m18.lastestConfigFabricIndex = index
                    cb_m18.startTimeOfLifeTime = lastConfigRowID[17][1]
                }
                if(item[0] === lastConfigRowID[18][0]){ // machine 19: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m19.lastestConfigFabricIndex = index
                    cb_m19.startTimeOfLifeTime = lastConfigRowID[18][1]
                }
                if(item[0] === lastConfigRowID[19][0]){ // machine 20: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m20.lastestConfigFabricIndex = index
                    cb_m20.startTimeOfLifeTime = lastConfigRowID[19][1]
                }
                if(item[0] === lastConfigRowID[20][0]){ // machine 21: lastConfigRowID[x][0] ; x is machine number - 1
                    cb_m21.lastestConfigFabricIndex = index
                    cb_m21.startTimeOfLifeTime = lastConfigRowID[20][1]
                }

                cb_m1.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m2.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m3.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m4.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m5.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m6.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m7.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m8.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m9.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m10.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m11.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m12.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m13.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m14.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m15.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m16.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m17.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m18.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m19.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m20.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
                cb_m21.model.append({"index_": item[0], "data1": item[1], "data2": item[2], "FabricType_FabricTypeId_": item[3], "MPKg_": item[4], "Wide_": item[5],
                                       "YarnLotId1_": item[6], "YarnLotId2_": item[7], "YarnLotId3_": item[8], "YarnLotId4_": item[9],
                                       "Yarn1Speed_": item[10], "Yarn2Speed_": item[11], "Yarn3Speed_": item[12], "Yarn4Speed_": item[13],
                                       "Yarn1ConeNum_": item[14], "Yarn2ConeNum_": item[15], "Yarn3ConeNum_": item[16], "Yarn4ConeNum_": item[17],
                                       "YarnRoundsPerRoll_": item[18], "Dia_": item[19], "G_": item[20], "StartTime_": "", "EndTime_": ""})
            })

            cb_m1.currentIndex = cb_m1.lastestConfigFabricIndex
            cb_m2.currentIndex = cb_m2.lastestConfigFabricIndex
            cb_m3.currentIndex = cb_m3.lastestConfigFabricIndex
            cb_m4.currentIndex = cb_m4.lastestConfigFabricIndex
            cb_m5.currentIndex = cb_m5.lastestConfigFabricIndex
            cb_m6.currentIndex = cb_m6.lastestConfigFabricIndex
            cb_m7.currentIndex = cb_m7.lastestConfigFabricIndex
            cb_m8.currentIndex = cb_m8.lastestConfigFabricIndex
            cb_m9.currentIndex = cb_m9.lastestConfigFabricIndex
            cb_m10.currentIndex = cb_m10.lastestConfigFabricIndex
            cb_m11.currentIndex = cb_m11.lastestConfigFabricIndex
            cb_m12.currentIndex = cb_m12.lastestConfigFabricIndex
            cb_m13.currentIndex = cb_m13.lastestConfigFabricIndex
            cb_m14.currentIndex = cb_m14.lastestConfigFabricIndex
            cb_m15.currentIndex = cb_m15.lastestConfigFabricIndex
            cb_m16.currentIndex = cb_m16.lastestConfigFabricIndex
            cb_m17.currentIndex = cb_m17.lastestConfigFabricIndex
            cb_m18.currentIndex = cb_m18.lastestConfigFabricIndex
            cb_m19.currentIndex = cb_m19.lastestConfigFabricIndex
            cb_m20.currentIndex = cb_m20.lastestConfigFabricIndex
            cb_m21.currentIndex = cb_m21.lastestConfigFabricIndex

            rectangle1.modeView_MutilConfig = false
            rectangle2.modeView_MutilConfig = false
            rectangle3.modeView_MutilConfig = false
            rectangle4.modeView_MutilConfig = false
            rectangle5.modeView_MutilConfig = false
            rectangle6.modeView_MutilConfig = false
            rectangle7.modeView_MutilConfig = false
            rectangle8.modeView_MutilConfig = false
            rectangle9.modeView_MutilConfig = false
            rectangle10.modeView_MutilConfig = false
            rectangle11.modeView_MutilConfig = false
            rectangle12.modeView_MutilConfig = false
            rectangle13.modeView_MutilConfig = false
            rectangle14.modeView_MutilConfig = false
            rectangle15.modeView_MutilConfig = false
            rectangle16.modeView_MutilConfig = false
            rectangle17.modeView_MutilConfig = false
            rectangle18.modeView_MutilConfig = false
            rectangle19.modeView_MutilConfig = false
            rectangle20.modeView_MutilConfig = false
            rectangle21.modeView_MutilConfig = false

        }

        function onFill_allCbModelsViewMode(configData, selectedRowDataForAllMachines){
            /*
                configData: list of FabricConfig Row
                selectedRowDataForAllMachines: list of list ( fabric config row id, starttime, endtime) direct to each machine
            */            
            selectedRowDataForAllMachines.forEach(function (MachineFabricConfigList, index1) {
                if(index1 === 0){ // machine 1
                    cb_m1.model.clear()
                    rectangle1.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m1.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m1.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle1.modeView_MutilConfig = true
                        }
                        else{
                            rectangle1.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName1.text =  ""
                        lb_fabricTime1.text = ""
                    }
                }
                else if(index1 === 1){ // machine 2
                    cb_m2.model.clear()
                    rectangle2.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m2.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m2.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle2.modeView_MutilConfig = true
                        }
                        else{
                            rectangle2.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName2.text =  ""
                        lb_fabricTime2.text = ""
                    }
                }
                else if(index1 === 2){ // machine 3
                    cb_m3.model.clear()
                    rectangle3.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m3.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m3.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle3.modeView_MutilConfig = true
                        }
                        else{
                            rectangle3.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName3.text =  ""
                        lb_fabricTime3.text = ""
                    }
                }
                else if(index1 === 3){ // machine 4
                    cb_m4.model.clear()
                    rectangle4.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m4.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m4.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle4.modeView_MutilConfig = true
                        }
                        else{
                            rectangle4.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName4.text =  ""
                        lb_fabricTime4.text = ""
                    }
                }
                else if(index1 === 4){ // machine 5
                    cb_m5.model.clear()
                    rectangle5.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m5.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m5.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle5.modeView_MutilConfig = true
                        }
                        else{
                            rectangle5.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName5.text =  ""
                        lb_fabricTime5.text = ""
                    }
                }
                else if(index1 === 5){ // machine 6
                    cb_m6.model.clear()
                    rectangle6.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m6.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m6.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle6.modeView_MutilConfig = true
                        }
                        else{
                            rectangle6.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName6.text =  ""
                        lb_fabricTime6.text = ""
                    }
                }
                else if(index1 === 6){ // machine 7
                    cb_m7.model.clear()
                    rectangle7.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m7.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m7.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle7.modeView_MutilConfig = true
                        }
                        else{
                            rectangle7.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName7.text =  ""
                        lb_fabricTime7.text = ""
                    }
                }
                else if(index1 === 7){ // machine 8
                    cb_m8.model.clear()
                    rectangle8.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m8.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m8.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle8.modeView_MutilConfig = true
                        }
                        else{
                            rectangle8.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName8.text =  ""
                        lb_fabricTime8.text = ""
                    }
                }
                else if(index1 === 8){ // machine 9
                    cb_m9.model.clear()
                    rectangle9.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m9.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m9.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle9.modeView_MutilConfig = true
                        }
                        else{
                            rectangle9.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName9.text =  ""
                        lb_fabricTime9.text = ""
                    }
                }
                else if(index1 === 9){ // machine 10
                    cb_m10.model.clear()
                    rectangle10.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m10.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m10.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle10.modeView_MutilConfig = true
                        }
                        else{
                            rectangle10.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName10.text =  ""
                        lb_fabricTime10.text = ""
                    }
                }
                else if(index1 === 10){ // machine 11
                    cb_m11.model.clear()
                    rectangle11.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m11.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m11.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle11.modeView_MutilConfig = true
                        }
                        else{
                            rectangle11.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName11.text =  ""
                        lb_fabricTime11.text = ""
                    }
                }
                else if(index1 === 11){ // machine 12
                    cb_m12.model.clear()
                    rectangle12.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m12.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m12.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle12.modeView_MutilConfig = true
                        }
                        else{
                            rectangle12.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName12.text =  ""
                        lb_fabricTime12.text = ""
                    }
                }
                else if(index1 === 12){ // machine 13
                    cb_m13.model.clear()
                    rectangle13.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m13.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m13.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle13.modeView_MutilConfig = true
                        }
                        else{
                            rectangle13.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName13.text =  ""
                        lb_fabricTime13.text = ""
                    }
                }
                else if(index1 === 13){ // machine 14
                    cb_m14.model.clear()
                    rectangle14.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m14.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m14.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle14.modeView_MutilConfig = true
                        }
                        else{
                            rectangle14.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName14.text =  ""
                        lb_fabricTime14.text = ""
                    }
                }
                else if(index1 === 14){ // machine 15
                    cb_m15.model.clear()
                    rectangle15.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m15.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m15.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle15.modeView_MutilConfig = true
                        }
                        else{
                            rectangle15.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName15.text =  ""
                        lb_fabricTime15.text = ""
                    }
                }
                else if(index1 === 15){ // machine 16
                    cb_m16.model.clear()
                    rectangle16.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m16.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m16.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle16.modeView_MutilConfig = true
                        }
                        else{
                            rectangle16.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName16.text =  ""
                        lb_fabricTime16.text = ""
                    }
                }
                else if(index1 === 16){ // machine 17
                    cb_m17.model.clear()
                    rectangle17.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m17.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m17.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle17.modeView_MutilConfig = true
                        }
                        else{
                            rectangle17.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName17.text =  ""
                        lb_fabricTime17.text = ""
                    }
                }
                else if(index1 === 17){ // machine 18
                    cb_m18.model.clear()
                    rectangle18.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m18.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m18.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle18.modeView_MutilConfig = true
                        }
                        else{
                            rectangle18.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName18.text =  ""
                        lb_fabricTime18.text = ""
                    }
                }
                else if(index1 === 18){ // machine 19
                    cb_m19.model.clear()
                    rectangle19.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m19.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m19.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle19.modeView_MutilConfig = true
                        }
                        else{
                            rectangle19.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName19.text =  ""
                        lb_fabricTime19.text = ""
                    }
                }
                else if(index1 === 19){ // machine 20
                    cb_m20.model.clear()
                    rectangle20.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m20.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m20.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle20.modeView_MutilConfig = true
                        }
                        else{
                            rectangle20.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName20.text =  ""
                        lb_fabricTime20.text = ""
                    }
                }
                else if(index1 === 20){ // machine 21
                    cb_m21.model.clear()
                    rectangle21.modeView_MutilConfig = false
                    if(MachineFabricConfigList.length !== 0){
                        MachineFabricConfigList.forEach(function (MachinefabricConfigRow, index2){
                            configData.forEach(function (fabricConfigRow, index3) {
                                if(MachinefabricConfigRow[0] === fabricConfigRow[0]){
                                    cb_m21.model.append({"index_": fabricConfigRow[0], "data1": fabricConfigRow[1], "data2": fabricConfigRow[2], "FabricType_FabricTypeId_": fabricConfigRow[3], "MPKg_": fabricConfigRow[4], "Wide_": fabricConfigRow[5],
                                                           "YarnLotId1_": fabricConfigRow[6], "YarnLotId2_": fabricConfigRow[7], "YarnLotId3_": fabricConfigRow[8], "YarnLotId4_": fabricConfigRow[9],
                                                           "Yarn1Speed_": fabricConfigRow[10], "Yarn2Speed_": fabricConfigRow[11], "Yarn3Speed_": fabricConfigRow[12], "Yarn4Speed_": fabricConfigRow[13],
                                                           "Yarn1ConeNum_": fabricConfigRow[14], "Yarn2ConeNum_": fabricConfigRow[15], "Yarn3ConeNum_": fabricConfigRow[16], "Yarn4ConeNum_": fabricConfigRow[17],
                                                           "YarnRoundsPerRoll_": fabricConfigRow[18], "Dia_": fabricConfigRow[19], "G_": fabricConfigRow[20], "StartTime_": MachinefabricConfigRow[1], "EndTime_": MachinefabricConfigRow[2]})
                                }
                            })
                        })
                        cb_m21.currentIndex = MachineFabricConfigList.length - 1
                        if(MachineFabricConfigList.length !== 1){
                            rectangle21.modeView_MutilConfig = true
                        }
                        else{
                            rectangle21.modeView_MutilConfig = false
                        }
                    }
                    else{
                        lb_fabricName21.text =  ""
                        lb_fabricTime21.text = ""
                    }
                }
            })
        }
    }
}












/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:958;width:1920}
}
##^##*/
