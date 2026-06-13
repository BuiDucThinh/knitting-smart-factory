import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.4
import "../animations"

Rectangle {

    //CUSTOM PROPERTIES
    property bool visible_: true
    property bool userLogin: false

    // for controlling inside
    property color  colorCheck                  :   "#FFFFFF"
    property color  colorOk                     :   "#00FF00"
    property color  colorErr                    :   "#FF0000"
    property color  colorBorderOffline          :   "#000000"
    property color  colorTextOnline             :   "#FFFFFF"
    property color  colorTextOffline            :   "#333333"

    property color  colorTimeMetterPause                  :   "#FFFFFF"
    property color  colorTimeMetterRun                    :   "#FF0000"

    property var locale: Qt.locale()
    property date currentTime //: new Date()
    property date oldTime //: new Date()
    property real deltaTime_: 1

    // for controlling from outside
    property bool   online                      :   false
    property bool   editAble                    :   false

    property int    machineNumber               :   1
    property int roundPerRoll: 1
    property string fabricTypeLine1             :   ""
    property string fabricTypeLine2             :   ""

    property bool   smartWatch                  :   true
    property int userID: 0
    property  url   workerImageSource           :   "../../userImages/noUser.svg"
    property string workerName                  :   "Trống"

    property int    sliderValue                 :   1 //1: request checking; 2: check ok; 3: error

    property real speedMch                      : 1
    property int roundsRun                  : 0
    property real caculatedRollsPerShift        : 0.00
    property string realRollsStr                : "NA"

    property bool   blinkCheckQLT               :   false
    property bool   blinkYellowLight            :   false
    property bool   blinkRedLight               :   false
    property bool   blinkGreenLight             :   false

    property int  qltCTimeMetterH : 0
    property int  qltCTimeMetterM : 0
    property int  qltCTimeMetterS : 0

    property int  yellowRedTimeMetterH : 0
    property int  yellowRedTimeMetterM : 0
    property int  yellowRedTimeMetterS : 0

    property int  greenTimeMetterH : 0
    property int  greenTimeMetterM : 0
    property int  greenTimeMetterS : 0

    // for control color of 3 time metter. Which time metter is colored by 'red' colour, must have below variable === true
    property bool   qltCTimeMetterRising               :   false
    property bool   yellowRedTimeMetterRising            :   false
    property bool   greenTimeMetterRising               :   false

    property int  btnCheckedPressedCount_num  : 0//0
    property int  checkedCount_num  : 0    
    property int  yellowRedCount_num      : 0
    property int  greenCount_num    : 0

    property bool   ordinalButtonVisible        :   false
    property int    ordinalFabricNumber         :   1

    property int    watchNumber: 0
    property int    colorCodeNumber: 0
    property color  colorNoUser                 :   "#00B7FF"

    property color  colorUser1                 :   "#9145B6"
    property color  colorUser2                 :   "#FFE400"
    property color  colorUser3                 :   "#06FF00"
    property color  colorUser4                 :   "#7CD1B8"
    property color  colorUser5                 :   "#C84B31"
    property color  colorUser6                 :   "#F2789F"
    property color  colorUser7                 :   "#FF8E00"
    property color  colorUser8                 :   "#FF5677"
    property color  colorUser9                 :   "#84DFFF"
    property color  colorUser10                :   "#519259"
    property color  colorUser11                :   "#FBFFE2"
    property color  colorUser12                :   "#EC255A"
    property color  colorUser13                :   "#D47AE8"
    property color  colorUser14                :   "#FDFF8F"
    property color  colorUser15                :   "#FF7800"
    property color  colorUser16                :   "#EBE645"
    property color  colorUser17                :   "#71DFE7"
    property color  colorUser18                :   "#9AE66E"
    property color  colorUser19                :   "#AA14F0"
    property color  colorUser20                :   "#49FF00"
    property color  colorUser21                :   "#E1578A"
    property color  colorUser22                :   "#FF0075"
    property color  colorUser23                :   "#A03C78"
    property color  colorUser24                :   "#78DEC7"
    property color  colorUser25                :   "#F55C47"


    id: machineInfoRect
    visible: visible_
    color: "#8d222222"
    radius: 2
    border.width: online === false ? 1 : sliderValue === 3 ? 2 : 1 //borderWidth_
    border.color: online === false ? colorBorderOffline : sliderValue === 1 ? colorCheck : sliderValue === 2 ? colorOk : colorErr //color_

    Timer {
        id: timer1Sencond
//            interval: 1000; running: true; repeat: true
            interval: 1000; repeat: true
            onTriggered: {
                if(blinkCheckQLT === true){
                    qltCTimeMetterRising = true
                    qltCTimeMetterS = qltCTimeMetterS + 1
                    if(qltCTimeMetterS == 60){
                        qltCTimeMetterS = 0
                        qltCTimeMetterM = qltCTimeMetterM + 1
                        if (qltCTimeMetterM == 60){
                            qltCTimeMetterM = 0
                            qltCTimeMetterH = qltCTimeMetterH + 1
                        }
                    }
                }
                else if(blinkYellowLight === true){
                    yellowRedTimeMetterRising = true
                    yellowRedTimeMetterS = yellowRedTimeMetterS + 1
                    if(yellowRedTimeMetterS == 60){
                        yellowRedTimeMetterS = 0
                        yellowRedTimeMetterM = yellowRedTimeMetterM + 1
                        if (yellowRedTimeMetterM == 60){
                            yellowRedTimeMetterM = 0
                            yellowRedTimeMetterH = yellowRedTimeMetterH + 1
                        }
                    }
                }
                else if(blinkRedLight === true){
                    yellowRedTimeMetterRising = true
                    yellowRedTimeMetterS = yellowRedTimeMetterS + 1
                    if(yellowRedTimeMetterS == 60){
                        yellowRedTimeMetterS = 0
                        yellowRedTimeMetterM = yellowRedTimeMetterM + 1
                        if (yellowRedTimeMetterM == 60){
                            yellowRedTimeMetterM = 0
                            yellowRedTimeMetterH = yellowRedTimeMetterH + 1
                        }
                    }
                }
                else if(blinkGreenLight === true){
                    greenTimeMetterRising = true
                    greenTimeMetterS = greenTimeMetterS + 1
                    if(greenTimeMetterS == 60){
                        greenTimeMetterS = 0
                        greenTimeMetterM = greenTimeMetterM + 1
                        if (greenTimeMetterM == 60){
                            greenTimeMetterM = 0
                            greenTimeMetterH = greenTimeMetterH + 1
                        }
                    }
                }
                else {
                    qltCTimeMetterRising = false
                    yellowRedTimeMetterRising = false
                    greenTimeMetterRising = false
                }
            }
        }

    Timer {
        // after worker confirm condition of product good or bad. 1 minitue slider will be disable update. This for keeping worker's process working in discipline.
        id: updateEditAble
        interval: 60000; running: false; repeat: false
        onTriggered: {
            //print("Set to false")
            machineInfoRect.editAble = false
        }
    }

    function setUserLoginFlag(flag_){
        userLogin = flag_
    }

    function setVisible(vsb){
        visible_ = vsb
    }

    function getSliderValue(){
        return sliderValue
    }

    function setBlinkState(dataList){
        blinkCheckQLT = dataList[0]
        blinkYellowLight = dataList[1]
        blinkRedLight = dataList[2]
        blinkGreenLight = dataList[3]
        if (blinkCheckQLT || blinkYellowLight || blinkRedLight || blinkGreenLight){timer1Sencond.running = true}
    }

    function fillFabricSpecInfo(dataList){
//        dataList[0]: fabricName_
//        dataList[1]: numberOfRoll_
        let i = 0
        if (dataList[0].length < 18){
            fabricTypeLine1 = dataList[0]
            roundPerRoll = parseInt(dataList[1])
        }
        else{
            if (dataList[0].charAt(17) === ' '){
                fabricTypeLine1 = dataList[0].substring(0, 18)
                fabricTypeLine2 = dataList[0].substring(19,)
                roundPerRoll = parseInt(dataList[1])
            }
            else{
                for (i = 16; i > 0; i--) {
                  if (dataList[0].charAt(i) === ' '){break}
                }
                fabricTypeLine1 = dataList[0].substring(0, i)
                fabricTypeLine2 = dataList[0].substring(i+1,)
                roundPerRoll = parseInt(dataList[1])
            }
        }
    }
    function fillPerformanceIndex(dataList){
        //print("machine NUm:", machineNumber)
        //print("dataList", dataList)
//                #        self.faceName_ = ""            0
//                #        self.faceImgUrl_ = ""          1
//                #        self.sliderValue_ = 2          2
//                #        self.rounds = 0                3
//                #        self.caculatedRolls = 0.0      4
//                #        self.realRolls = 0             5
//                #        self.pressTimeCounter = 0      6

//                #        self.qLTCheckTimeMetterH = 0   7
//                #        self.qLTCheckTimeMetterM = 0   8
//                #        self.qLTCheckTimeMetterS = 0   9
//                #        self.qLTCheckCounter = 0       10

//                #        self.yellowRedTimeMetterH = 0  11
//                #        self.yellowRedTimeMetterM = 0  12
//                #        self.yellowRedTimeMetterS = 0  13
//                #        self.yellowRedCounter = 0      14

//                #        self.greenTimeMetterH = 0      15
//                #        self.greenTimeMetterM = 0      16
//                #        self.greenTimeMetterS = 0      17
//                #        self.greenTimeConter = 0       18
//                          watchNumber                 19
// color code                                           20

        workerName = dataList[0]
        workerImageSource = dataList[1]
        sliderValue = parseInt(dataList[2])
        slider.value = sliderValue
        if(sliderValue === 1){
            machineInfoRect.editAble = true
        }
        roundsRun = parseInt(dataList[3])
        caculatedRollsPerShift = parseFloat(dataList[4])

        // for realRolls -> must implement print hand jet machine to update dataList[5] from model.py side.

        btnCheckedPressedCount_num = parseInt(dataList[6])

        qltCTimeMetterH = parseInt(dataList[7])
        qltCTimeMetterM = parseInt(dataList[8])
        qltCTimeMetterS = parseInt(dataList[9])
//        if(qltCTimeMetterS === 60){ // for sync reason: for need time to get data from model.py to ui need plus 1 second to sync.
//            qltCTimeMetterS = 1
//            qltCTimeMetterM = qltCTimeMetterM + 1
//            if (qltCTimeMetterM === 60){
//                qltCTimeMetterM = 1
//                qltCTimeMetterH = qltCTimeMetterM + 1
//            }
//        }
        checkedCount_num = parseInt(dataList[10])

        yellowRedTimeMetterH = parseInt(dataList[11])
        yellowRedTimeMetterM = parseInt(dataList[12])
        yellowRedTimeMetterS = parseInt(dataList[13])
        yellowRedCount_num = parseInt(dataList[14])

        greenTimeMetterH = parseInt(dataList[15])
        greenTimeMetterM = parseInt(dataList[16])
        greenTimeMetterS = parseInt(dataList[17])
        greenCount_num = parseInt(dataList[18])
        watchNumber = parseInt(dataList[19])
        colorCodeNumber = parseInt(dataList[20])
    }

    function onlinedChange(){
//        if( !se_mchOnline.playing){
//            print("machine onlined -> playmusic onlined: ", machineInfoRect.machineNumber)
//            se_mchOnline.play()
//        }

        machineInfoRect.online = true
        //slider.value = 2
        //editAble = false
    }

    function offlinedChange(){
        se_mchOffline.play()
        machineInfoRect.online = false
        timer1Sencond.running = false
        blinkCheckQLT = false
        blinkYellowLight = false
        blinkRedLight = false
        blinkGreenLight = false
    }

    function updateFabricType(fabricName_, numberOfRoll_){
        let i = 0
        if (fabricName_.length < 18){
            fabricTypeLine1 = fabricName_            
            roundPerRoll = parseInt(numberOfRoll_)
        }
        else{
            if (fabricName_.charAt(17) === ' '){
                fabricTypeLine1 = fabricName_.substring(0, 18)
                fabricTypeLine2 = fabricName_.substring(19,)                
                roundPerRoll = parseInt(numberOfRoll_)
            }
            else{
                for (i = 16; i > 0; i--) {
                  if (fabricName_.charAt(i) === ' '){break}
                }
                fabricTypeLine1 = fabricName_.substring(0, i)
                fabricTypeLine2 = fabricName_.substring(i+1,)                
                roundPerRoll = parseInt(numberOfRoll_)
            }
        }
    }

    function setSliderValue(value_){
        print("set Slider Value")
        slider.value = value_
        sliderValue = value_
        if(value_ === 1){
            machineInfoRect.editAble = true
        }
    }

    function incrRPS(speed_){
        print("new ROund")
        roundsRun = roundsRun + 1
        print(roundsRun)

        caculatedRollsPerShift = roundsRun/roundPerRoll

        /* THIS IS OLD CODE WITH IDEA: ESP32 JUST ACKNOWLEDGE NEW ROUND
        currentTime = new Date()
        //print("currentTime: ", currentTime)
        //print("oldTime: ", oldTime)
        deltaTime_ = currentTime - oldTime
        oldTime = currentTime
        //print("deltaTime_: ", deltaTime_)

        speedMch = 60000/deltaTime_
        */

        // THIS IS NEW CODE WITH IDEA: ESP32 SEND ROTATE SPEED
        speedMch = parseFloat(speed_)/100
    }

    function updateRPS(rps_){
        roundsRun = rps_
        caculatedRollsPerShift = roundsRun/roundPerRoll
        oldTime = new Date()
    }

    function yellowYarnBreakStart(){
        timer1Sencond.running = true
        se_mchStop.play()
        blinkYellowLight = true
        yellowRedCount_num = yellowRedCount_num + 1
    }
    function yellowYarnBreakEnd(){        
        yellowRedTimeMetterRising = false
        blinkYellowLight = false
        if(!blinkYellowLight && !blinkRedLight && !blinkGreenLight && !blinkCheckQLT){timer1Sencond.running = false}
    }

    function redYarnBreakStart(){
        timer1Sencond.running = true
        se_mchStop.play()
        blinkRedLight = true
        yellowRedCount_num = yellowRedCount_num + 1
    }
    function redYarnBreakEnd(){        
        yellowRedTimeMetterRising = false
        blinkRedLight = false
        if(!blinkYellowLight && !blinkRedLight && !blinkGreenLight && !blinkCheckQLT){timer1Sencond.running = false}
    }

    function greenRollFullStart(){
        timer1Sencond.running = true
        se_mchStop.play()
        blinkGreenLight = true
        greenCount_num = greenCount_num + 1
    }
    function greenRollFullEnd(){        
        greenTimeMetterRising = false
        blinkGreenLight = false
        if(!blinkYellowLight && !blinkRedLight && !blinkGreenLight && !blinkCheckQLT){timer1Sencond.running = false}
    }

    function qltRequestCheckStart(){
        timer1Sencond.running = true
        se_mchStop.play()
        blinkCheckQLT = true
        checkedCount_num = checkedCount_num + 1
    }
    function qltRequestCheckEnd(){        
        qltCTimeMetterRising = false
        blinkCheckQLT = false
        if(!blinkYellowLight && !blinkRedLight && !blinkGreenLight && !blinkCheckQLT){timer1Sencond.running = false}
    }



    function updateTimeMetters(checkTimes_, yellowTimes_, redTimes_, greenTimes_){
        let i = 0
        let postion1 = 0
        let postion2 = 0
        for(i = 0; i < checkTimes_.length; i++){
            if(checkTimes_.charAt(i) === ':'){
                if(postion1 == 0){postion1 = i}
                else{postion2 = i}
            }
        }
        qltCTimeMetterH = parseInt(checkTimes_.substring(0, postion1))
        qltCTimeMetterM = parseInt(checkTimes_.substring(postion1 + 1, postion2))
        qltCTimeMetterS = parseInt(checkTimes_.substring(postion2 + 1, ))

        i = 0
        postion1 = 0
        postion2 = 0
        for(i = 0; i < yellowTimes_.length; i++){
            if(yellowTimes_.charAt(i) === ':'){
                if(postion1 == 0){postion1 = i}
                else{postion2 = i}
            }
        }
        yellowTimeMetterH = parseInt(yellowTimes_.substring(0, postion1))
        yellowTimeMetterM = parseInt(yellowTimes_.substring(postion1 + 1, postion2))
        yellowTimeMetterS = parseInt(yellowTimes_.substring(postion2 + 1, ))

        i = 0
        postion1 = 0
        postion2 = 0
        for(i = 0; i < redTimes_.length; i++){
            if(redTimes_.charAt(i) === ':'){
                if(postion1 == 0){postion1 = i}
                else{postion2 = i}
            }
        }
        yellowRedTimeMetterH = parseInt(redTimes_.substring(0, postion1))
        yellowRedTimeMetterM = parseInt(redTimes_.substring(postion1 + 1, postion2))
        yellowRedTimeMetterS = parseInt(redTimes_.substring(postion2 + 1, ))

        i = 0
        postion1 = 0
        postion2 = 0
        for(i = 0; i < greenTimes_.length; i++){
            if(greenTimes_.charAt(i) === ':'){
                if(postion1 == 0){postion1 = i}
                else{postion2 = i}
            }
        }
        greenTimeMetterH = parseInt(greenTimes_.substring(0, postion1))
        greenTimeMetterM = parseInt(greenTimes_.substring(postion1 + 1, postion2))
        greenTimeMetterS = parseInt(greenTimes_.substring(postion2 + 1, ))
    }

    function incrBtnClick(){
        btnCheckedPressedCount_num = btnCheckedPressedCount_num + 1
    }

    function updateCountNums(checkNum_, yellowNum_, redNum_, greenNum_){
        checkedCount_num = checkNum_
        yellowRedCount_num = yellowNum_ + redNum_
        greenCount_num = greenNum_
    }

    Component.onCompleted: {
        //MACHINE OFFLINE: EFFECT TO BORDER COLOR AND APPEARANCE OF ALL CHILL
    }

    QtObject{
        id: internal

        property  var dynamicColor: if(colorCodeNumber === 0){
                                        colorNoUser
                                    }
                                    else if(colorCodeNumber === 1){
                                        colorUser1
                                    }
                                    else if(colorCodeNumber === 2){
                                        colorUser2
                                    }
                                    else if(colorCodeNumber === 3){
                                        colorUser3
                                    }
                                    else if(colorCodeNumber === 4){
                                        colorUser4
                                    }
                                    else if(colorCodeNumber === 5){
                                        colorUser5
                                    }
                                    else if(colorCodeNumber === 6){
                                        colorUser6
                                    }
                                    else if(colorCodeNumber === 7){
                                        colorUser7
                                    }
                                    else if(colorCodeNumber === 8){
                                        colorUser8
                                    }
                                    else if(colorCodeNumber === 9){
                                        colorUser9
                                    }
                                    else if(colorCodeNumber === 10){
                                        colorUser10
                                    }
                                    else if(colorCodeNumber === 11){
                                        colorUser11
                                    }
                                    else if(colorCodeNumber === 12){
                                        colorUser12
                                    }
                                    else if(colorCodeNumber === 13){
                                        colorUser13
                                    }
                                    else if(colorCodeNumber === 14){
                                        colorUser14
                                    }
                                    else if(colorCodeNumber === 15){
                                        colorUser15
                                    }
                                    else if(colorCodeNumber === 16){
                                        colorUser16
                                    }
                                    else if(colorCodeNumber === 17){
                                        colorUser17
                                    }
                                    else if(colorCodeNumber === 18){
                                        colorUser18
                                    }

                                    else if(colorCodeNumber === 19){
                                        colorUser19
                                    }
                                    else if(colorCodeNumber === 20){
                                        colorUser20
                                    }
                                    else if(colorCodeNumber === 21){
                                        colorUser21
                                    }

    }

    //------------------------------------------------------------------------------------------------------- MACHINE RUNNING'S PROPERTY

    Label {
        id: machine_number
        width: machine_number.advance.width
        height: 28
        color: online === false ? colorTextOffline : colorTextOnline //colorText_
        text: "M" + machineNumber.toString()
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 39
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 2
        anchors.topMargin: 2
        font.italic: false
        font.weight: Font.Black
        font.family: "Ubuntu Mono"
        font.bold: true
        renderType: Text.QtRendering
        textFormat: Text.AutoText
    }

    Label {
        id: name_fabric
        width: name_fabric.contentWidth
        visible: online
        color: "#ffffff"
        text: fabricTypeLine1
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 2
        anchors.topMargin: 30
        font.weight: Font.Bold
        font.family: "Ubuntu Mono"
        renderType: Text.QtRendering
        font.bold: true
        textFormat: Text.AutoText
    }

    Label {
        id: name_fabric2
        visible: online
        color: "#ffffff"
        text: fabricTypeLine2
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Bold
        anchors.leftMargin: 2
        textFormat: Text.AutoText
        font.bold: true
        font.family: "Ubuntu Mono"
        renderType: Text.QtRendering
        anchors.topMargin: 45
    }

    Label {
        id: worker_name
        visible: online
        width: worker_name.advance.width
        color: internal.dynamicColor //"#ffffff"
        text: workerName
        anchors.top: parent.top
        font.pixelSize: 14
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: rectangle.horizontalCenter
        font.family: "Ubuntu Mono"
        font.weight: Font.Normal
        renderType: Text.QtRendering
        anchors.topMargin: 48
        font.bold: true
        textFormat: Text.AutoText
    }

    Rectangle{
        id: rec_border
        visible: online
        width: 42
        height: 42
        color: "#00000000"
        radius: 30
        border.width: 1
        border.color: internal.dynamicColor //"#999999"//"#00FF00"
        anchors.verticalCenter: rectangle.verticalCenter
        anchors.horizontalCenter: rectangle.horizontalCenter
    }

    Glow {
        visible: online
        anchors.fill: rec_border
        radius: 10 //6 //8
        samples: 15 //10 //17
        color: internal.dynamicColor //"#00FF00"
        source: rec_border
    }

    // worker face image
    Rectangle {
        id: rectangle
        visible: online
        width: 38
        height: 38
        color: "#00000000"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 5
        anchors.topMargin: 5
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }

        Image {
            id: worker_img
            width: 56
            height: 42
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.height: 56
            sourceSize.width: 42
            fillMode: Image.PreserveAspectFit
            source: workerImageSource
        }

        Rectangle {
            id: mask
            radius: 30
            width: rectangle.width
            height: rectangle.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
        }
    }


    Label {
        id: round_per_roll
        visible: online
        color: "#ffffff"
        text: ":" + roundPerRoll.toString()
        anchors.left: machine_number.right
        anchors.top: parent.top
        font.pixelSize: 15
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: -1
        anchors.topMargin: 16
        font.family: "Ubuntu Mono"
        renderType: Text.QtRendering
        font.bold: false
        textFormat: Text.AutoText
    }

    Image {
        id: watch
        visible: {online && smartWatch}
        x: 145
        width: 43
        height: 43
        opacity: 0.725
        anchors.right: parent.right
        anchors.top: parent.top
        source: "../../images/svg_images/watch.svg"
        anchors.topMargin: 3
        anchors.rightMargin: 42
    }
    Image {
        id: noWatch
        visible: {online && !smartWatch}
        x: 136
        width: 43
        height: 43
        opacity: 0.725
        anchors.right: parent.right
        anchors.top: parent.top
        source: "../../images/svg_images/no_watch.svg"
        anchors.topMargin: 3
        anchors.rightMargin: 42
    }

    //------------------------------------------------------------------------------------------------------- SLIDER
    Image {
        id: check_img
        visible: online === false ? false : sliderValue === 1 ? true : false //cheImgVisible
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../images/svg_images/check_img.svg"
        anchors.leftMargin: 8
        anchors.topMargin: 61
    }


    Image {
        id: ok_img
        visible: online === false ? false : sliderValue !== 3 ? true : false //okImgVisible
        width: 40
        height: 40
        anchors.top: parent.top
        source: "../../images/svg_images/ok_img.svg"
        anchors.horizontalCenter: slider.horizontalCenter
        anchors.topMargin: 61
    }

    Rectangle { //------------------------------------------------------------------------------------- WARNING TEXT
        id: errorRect
        visible: online === false ? false : sliderValue === 3 ? true : false //errMsgVisible
        width: 157
        height: 42
        opacity: 1
        color: "#00000000"
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 67
        anchors.leftMargin: 12

        Label {
            id: msg_1
            color: "#ff2e2e"
            text: "CẢNH BÁO LỖI"
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 4
            anchors.leftMargin: 0
            font.weight: Font.Bold
            textFormat: Text.AutoText
            font.bold: true
            font.family: "Ubuntu"
            renderType: Text.QtRendering
            ColorAnimation on color {
                running: true
                from: "#ff2e2e"
                to: "#00000000"
                duration: 1000
                loops: Animation.Infinite
            }
        }

        Label {
            id: msg_2
            color: "#ff2e2e"
            //text: "Có lỗi để lại từ ca trước !"
            text: "Cần kiểm hàng ca trước !"
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 13
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            anchors.leftMargin: 1
            textFormat: Text.AutoText
            font.bold: true
            font.family: "Ubuntu"
            anchors.topMargin: 20
            renderType: Text.QtRendering
        }
    }

    Image {
        id: error_img
        visible: online === false ? false : sliderValue !== 2 ? true : false  //errImgVisible
        width: 40
        height: 40
        anchors.right: parent.right
        anchors.top: parent.top
        source: "../../images/svg_images/error_img.svg"
        anchors.rightMargin: 7
        anchors.topMargin: 61
    }
    Slider {
        id: slider
        visible: online
        x: 12
        width: 204
        anchors.top: parent.top
        wheelEnabled: false
        anchors.topMargin: 93
        anchors.horizontalCenter: parent.horizontalCenter
        value: 1
        from: 1
        to: 3
        stepSize: 1
        enabled: machineInfoRect.editAble && machineInfoRect.userLogin
        onValueChanged: {
            //print("on slider value change 1")
            sliderValue = slider.value
            if(online && editAble){
                //print("on slider value change 2")
                nwManagerBridge.mchInfoRectSliderValueChange(machineNumber , sliderValue)
                homePageBridge.mchInfoRectSliderValueChangeNeedToUpdateDTB(machineNumber , sliderValue)
                if (sliderValue === 1){
                    //print("stop")
                    updateEditAble.stop()
                }
                else if (sliderValue === 2){
                    //print("restart")
                    updateEditAble.running = true
                    updateEditAble.restart()
                }
                else if (sliderValue === 3){
                    //print("restart")
                    updateEditAble.running = true
                    updateEditAble.restart()
                }
            }
        }
        ColorOverlay{
            //id: colorOL
            anchors.fill: parent //slider
            source: parent //slider
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: online === false ? colorBorderOffline : sliderValue === 1 ? colorCheck : sliderValue === 2 ? colorOk : colorErr
            antialiasing: true
        }
    }

    //------------------------------------------------------------------------------------------------------- MACHINE STATES
    Label {
        id: speed
        visible: online
        width: speed.advance.width
        color: "#ffffff"
        text: speedMch.toFixed(2)
        anchors.top: parent.top
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: pressed_img.horizontalCenter
        anchors.topMargin: 136
        font.family: "Ubuntu"
        renderType: Text.QtRendering
        font.bold: false
        textFormat: Text.AutoText

        Behavior on text {
            FadeAnimation {
                target: speed
            }
        }
    }

    Label {
        id: rounds
        visible: online
        width: rounds.advance.width
        color: "#ffffff"
        text: roundsRun
        //.toString()//roundsStr
        anchors.top: parent.top
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: check_qlt.horizontalCenter
        anchors.topMargin: 136
        font.family: "Ubuntu"
        renderType: Text.QtRendering
        font.bold: false
        textFormat: Text.AutoText
        Behavior on text {
            FadeAnimation {
                target: rounds
            }
        }
    }

    Label {
        id: computed_rolls
        visible: online
        color: "#ffffff"
        text: caculatedRollsPerShift.toFixed(2) //.toString() + "C" //caculatedRollsStr
        anchors.top: parent.top
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu"
        anchors.horizontalCenter: red_light.horizontalCenter
        anchors.topMargin: 136
        renderType: Text.QtRendering
        font.bold: false
        textFormat: Text.AutoText

        Behavior on text {
            FadeAnimation {
                target: computed_rolls
            }
        }
    }

    Label {
        id: real_rolls
        visible: online
        color: "#00afff"
        text: realRollsStr
        anchors.top: parent.top
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu"
        anchors.horizontalCenter: green_light.horizontalCenter
        renderType: Text.QtRendering
        anchors.topMargin: 136
        font.bold: false
        textFormat: Text.AutoText
    }

    //---------------------------------------------------------------------------------------------- LIGHT TIMES IMAGE
    Image {
        id: check_qlt
        visible: online
        width: 20
        height: 20
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../images/svg_images/check_button.svg"
        anchors.topMargin: 160
        anchors.leftMargin: 74
        SequentialAnimation {
            alwaysRunToEnd: true
            running: blinkCheckQLT
            loops: Animation.Infinite
            PropertyAnimation {
                target: check_qlt
                property: "opacity"
                to: "1.0"
                duration: 600
            }
            PropertyAnimation {
                target: check_qlt
                property: "opacity"
                to: "0.0"
                duration: 600
            }
            PropertyAnimation {
                target: check_qlt
                property: "opacity"
                to: "1.0"
                duration: 600
            }
        }
    }

    Image {
        id: yellow_light
        visible: online
        width: 20
        height: 20
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../images/svg_images/yellow_light.svg"
        anchors.leftMargin: 126
        anchors.topMargin: 160

        SequentialAnimation {
            alwaysRunToEnd: true
            running: blinkYellowLight
            loops: Animation.Infinite
            PropertyAnimation {
                target: yellow_light
                property: "opacity"
                to: "1.0"
                duration: 600
            }
            PropertyAnimation {
                target: yellow_light
                property: "opacity"
                to: "0.0"
                duration: 600
            }
            PropertyAnimation {
                target: yellow_light
                property: "opacity"
                to: "1.0"
                duration: 600
            }
        }
    }


    Image {
        id: red_light
        visible: online
        width: 20
        height: 20
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../images/svg_images/red_light.svg"
        anchors.leftMargin: 126
        anchors.topMargin: 160

        SequentialAnimation {
            alwaysRunToEnd: true
            running: blinkRedLight
            loops: Animation.Infinite
            PropertyAnimation {
                target: red_light
                property: "opacity"
                to: "1.0"
                duration: 600
            }
            PropertyAnimation {
                target: red_light
                property: "opacity"
                to: "0.0"
                duration: 600
            }
            PropertyAnimation {
                target: red_light
                property: "opacity"
                to: "1.0"
                duration: 600
            }
        }
    }


    Image {
        id: green_light
        visible: online
        width: 20
        height: 20
        anchors.left: red_light.right
        anchors.top: parent.top
        source: "../../images/svg_images/green_light.svg"
        anchors.leftMargin: 32
        anchors.topMargin: 160

        SequentialAnimation {
            alwaysRunToEnd: true
            running: blinkGreenLight
            loops: Animation.Infinite
            PropertyAnimation {
                target: green_light
                property: "opacity"
                to: "1.0"
                duration: 600
            }
            PropertyAnimation {
                target: green_light
                property: "opacity"
                to: "0.0"
                duration: 600
            }
            PropertyAnimation {
                target: green_light
                property: "opacity"
                to: "1.0"
                duration: 600
            }
        }
    }

    //------------------------------------------------------------------------------------------------------LIGHT EVENTS TIME METTER
    Label {
        id: requestTime
        width: requestTime.advance.width
        visible: online
        color: qltCTimeMetterRising === true ? colorTimeMetterRun : colorTimeMetterPause //"#ffffff"
        text: qltCTimeMetterH === 0 ? qltCTimeMetterM.toString() + ":" + qltCTimeMetterS.toString() : qltCTimeMetterH.toString() + ":" + qltCTimeMetterM.toString() + ":" + qltCTimeMetterS.toString()
        anchors.top: parent.top
        font.pixelSize: (qltCTimeMetterH !== 0 || yellowRedTimeMetterH !== 0 || greenTimeMetterH !== 0 ) === true ? 14 : 15
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: check_qlt.horizontalCenter
        textFormat: Text.AutoText
        font.family: "Ubuntu"
        renderType: Text.QtRendering
        anchors.topMargin: 183
        font.bold: false
    }

    Label {
        id: yellowRedLightTime
        visible: online
        color: yellowRedTimeMetterRising === true ? colorTimeMetterRun : colorTimeMetterPause //"#ffffff"
        text: yellowRedTimeMetterH == 0 ? yellowRedTimeMetterM.toString() + ":" + yellowRedTimeMetterS.toString() : yellowRedTimeMetterH.toString() + ":" + yellowRedTimeMetterM.toString() + ":" + yellowRedTimeMetterS.toString()
        anchors.top: parent.top
        font.pixelSize: (qltCTimeMetterH !== 0 || yellowRedTimeMetterH !== 0 || greenTimeMetterH !== 0 ) === true ? 14 : 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: red_light.horizontalCenter
        textFormat: Text.AutoText
        renderType: Text.QtRendering
        anchors.topMargin: 183
        font.bold: false
    }


    Label {
        id: greenLightTime
        visible: online
        color: greenTimeMetterRising === true ? colorTimeMetterRun : colorTimeMetterPause //"#ffffff"
        text: greenTimeMetterH === 0 ? greenTimeMetterM.toString() + ":" + greenTimeMetterS.toString() : greenTimeMetterH.toString() + ":" + greenTimeMetterM.toString() + ":" + greenTimeMetterS.toString()
        anchors.top: parent.top
        font.pixelSize: (qltCTimeMetterH !== 0 || yellowRedTimeMetterH !== 0 || greenTimeMetterH !== 0 ) === true ? 14 : 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: green_light.horizontalCenter
        textFormat: Text.AutoText
        renderType: Text.QtRendering
        anchors.topMargin: 183
        font.bold: false
    }

    //------------------------------------------------------------------------------------------------------NUMBER BUTTON AND LIGHT EVENTS
    Label {
        id: btnPressed_label
        visible: online
        color: "#ffffff"
        text: btnCheckedPressedCount_num
        //checkedTimes_text
        anchors.top: parent.top
        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: pressed_img.horizontalCenter
        font.family: "Ubuntu"
        font.weight: Font.ExtraBold
        renderType: Text.QtRendering
        anchors.topMargin: 199
        font.bold: true
        textFormat: Text.AutoText

        Behavior on text {
            FadeAnimation {
                target: btnPressed_label
            }
        }
    }

    Label {
        id: check_label
        visible: online
        color: "#ffffff"
        text: checkedCount_num
        anchors.top: parent.top
        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: check_qlt.horizontalCenter
        font.family: "Ubuntu"
        font.weight: Font.ExtraBold
        renderType: Text.QtRendering
        anchors.topMargin: 199
        textFormat: Text.AutoText
        font.bold: true

        Behavior on text {
            FadeAnimation {
                target: check_label
            }
        }
    }

    Label {
        id: yellowRed_label
        visible: online
        color: "#ffffff"
        text: yellowRedCount_num
        anchors.top: parent.top
        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 0
        anchors.horizontalCenterOffset: 0
        font.family: "Ubuntu"
        font.weight: Font.ExtraBold
        renderType: Text.QtRendering
        anchors.topMargin: 199
        anchors.horizontalCenter: red_light.horizontalCenter
        font.bold: true
        textFormat: Text.AutoText

        Behavior on text {
            FadeAnimation {
                target: yellowRed_label
            }
        }
    }

    Label {
        id: green_label
        visible: online
        color: "#ffffff"
        text: greenCount_num
        anchors.top: parent.top
        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 0
        anchors.leftMargin: 0
        font.family: "Ubuntu"
        font.weight: Font.ExtraBold
        renderType: Text.QtRendering
        anchors.topMargin: 199
        anchors.horizontalCenter: green_light.horizontalCenter
        textFormat: Text.AutoText
        font.bold: true

        Behavior on text {
            FadeAnimation {
                target: green_label
            }
        }
    }

    Rectangle {
        id: fabric_ordinal
        visible: ordinalButtonVisible
        y: 34
        width: 19
        height: 19
        color: "#00000000"
        radius: 0
        border.color: "#00000000"
        border.width: 0
        anchors.verticalCenter: name_fabric.verticalCenter
        anchors.left: name_fabric.right
        anchors.verticalCenterOffset: 1
        anchors.leftMargin: 4

        OrdinalFabricButton{
            width: fabric_ordinal.width
            height: fabric_ordinal.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                //modelBridge.ordBttClicked(mchNum, ordinalFabricNumber)
            }
        }

        Label {
            id: ordNum
            x: -5
            y: 170
            visible: online
            color: "#ffffff"
            text: "2"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -1
            font.weight: Font.Bold
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "San Francisco Display"
            renderType: Text.QtRendering
            textFormat: Text.AutoText
            anchors.horizontalCenterOffset: 0
            anchors.leftMargin: 0
        }
    }

    Connections{
        target: nwManagerBridge
    }

    Connections{
        target: homePageBridge
    }

    Rectangle {
        id: rectangle1
        visible: online
        x: 0
        width: 220
        height: 1
        color: "#999999"
        anchors.top: parent.top
        anchors.topMargin: 155
    }

    Rectangle {
        id: rectangle2
        visible: online
        x: 0
        width: 220
        height: 1
        color: "#999999"
        anchors.top: parent.top
        anchors.topMargin: 134
    }

    Image {
        id: pressed_img
        width: 40
        height: 40
        visible: online
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../images/svg_images/btnPressed.svg"
        sourceSize.height: 40
        sourceSize.width: 40
        anchors.leftMargin: 12
        anchors.topMargin: 158
    }

    SoundEffect {
        id: se_mchStop
        source: "../../soundEffects/machine_stop_sound.wav"
    }

    SoundEffect {
        id: se_mchOnline
        source: "../../soundEffects/online.wav"
    }

    SoundEffect {
        id: se_mchOffline
        source: "../../soundEffects/offline.wav"
    }

    Label {
        id: lb_watchNumber
        width: lb_watchNumber.advance.width
        visible: online ? (lb_watchNumber.text === "0" ? false: true ): false
        color: "#ffffff"
        text: watchNumber
        anchors.top: parent.top
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu Mono"
        anchors.topMargin: 48
        renderType: Text.QtRendering
        textFormat: Text.AutoText
        font.weight: Font.Normal
        anchors.horizontalCenter: noWatch.horizontalCenter
        anchors.horizontalCenterOffset: 0
        font.bold: true
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:220;width:220}
}
##^##*/
