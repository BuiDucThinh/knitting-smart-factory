/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Labs Calendar module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/


import Qt.labs.calendar 1.0

import QtQuick 2.15

AbstractMonthGrid {

    id: control

    property int currentDay
    property int currentMonth
    property int currentYear

    property int clickedDay
    property int clickedMonth
    property int clickedYear

    property int travelMonth
    property int travelYear
    property int numDaysPerTravelMonth
    property int numDaysPerPriorTravelMonth

    property bool clickable: false

    signal dateClickedChanged()

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)

    spacing: 6

    //! [delegate]
    delegate: Rectangle{
        id: delegate
        width: 50
        height: 50
        color: (model.day === control.clickedDay) && (model.month === control.month)&& (control.travelMonth === control.clickedMonth) && (control.travelYear === control.clickedYear) ? "#5500ff00" : "#00ffffff" //"#5500ff00" : "#00ffffff"
        border.color: (model.day === control.clickedDay) && (model.month === control.month)&& (control.travelMonth === control.clickedMonth) && (control.travelYear === control.clickedYear) ? "#00ff00" : "#a5d4a5" //"#6c6c6c"
        border.width: 1
        radius: 2

        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: delegate.width - 4
            height: delegate.height - 4
            opacity: (model.day === control.currentDay) && (model.month === control.month) && (control.travelMonth === control.currentMonth) && (control.travelYear === control.currentYear) ? 1 : 0
            color: "#00ffffff"
            border.color: "#00ff00"
            border.width: 1
            radius: 2
        }

        Text {
            id: textDay
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            opacity: model.month === control.month ? 1 : 0
            text: model.day
            font.family:  "Ubuntu Mono"
            font.pointSize: 13
            color: (model.day === control.clickedDay) && (model.month === control.month)&& (control.travelMonth === control.clickedMonth) && (control.travelYear === control.clickedYear) ? "white" : "#a5d4a5"//"white" //(model.day === control.clickedDay)  && (model.month === control.month) && (control.travelMonth === control.clickedMonth) && (control.travelYear === control.clickedYear) ? "white" : "white"
        }
        MouseArea {
            id: mouseArea
            anchors.fill: delegate
            onClicked: {
                if(control.clickable === true){
                    if(textDay.opacity === 1){
                        control.clickedDay = parseInt(textDay.text)
                        control.clickedMonth = control.travelMonth
                        control.clickedYear = control.travelYear
                        control.dateClickedChanged()
                    }
                }
            }
        }
    }
    //! [delegate]

    //! [contentItem]
    contentItem: Grid {
        width: 391
        height: 330
        rows: 6
        columns: 7
        rowSpacing: control.spacing
        columnSpacing: control.spacing

        Repeater {
            model: control.source
            delegate: control.delegate
        }
    }
    //! [contentItem]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2;height:281;width:391}
}
##^##*/
