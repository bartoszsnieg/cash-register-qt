import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Item {

    property bool isVisible: handler.IsVisible
    property QtObject handler

    id: root
    width: 1300
    height: row0.height + row1.height + row2.height + row3.height + 3 * 10 + 50

    Rectangle {
        id: keys

        color: "#afafaf"
        radius: 30
        anchors.fill: parent

        Rectangle {
            id: left
            width: 1200
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: "transparent"

        ListModel {
            id: modelRow0

            ListElement {
                value: "1"
            }
            ListElement {
                value: "2"
            }
            ListElement {
                value: "3"
            }
            ListElement {
                value: "4"
            }
            ListElement {
                value: "5"
            }
            ListElement {
                value: "6"
            }
            ListElement {
                value: "7"
            }
            ListElement {
                value: "8"
            }
            ListElement {
                value: "9"
            }
            ListElement {
                value: "0"
            }
        }
        ListModel {
            id: modelRow1

            ListElement {
                value: "q"
            }
            ListElement {
                value: "w"
            }
            ListElement {
                value: "e"
            }
            ListElement {
                value: "r"
            }
            ListElement {
                value: "t"
            }
            ListElement {
                value: "y"
            }
            ListElement {
                value: "u"
            }
            ListElement {
                value: "i"
            }
            ListElement {
                value: "o"
            }
            ListElement {
                value: "p"
            }
        }
        ListModel {
            id: modelRow2
            ListElement {
                value: "a"
            }
            ListElement {
                value: "s"
            }
            ListElement {
                value: "d"
            }
            ListElement {
                value: "f"
            }
            ListElement {
                value: "g"
            }
            ListElement {
                value: "h"
            }
            ListElement {
                value: "j"
            }
            ListElement {
                value: "k"
            }
            ListElement {
                value: "l"
            }
        }
        ListModel {
            id: modelRow3
            ListElement {
                value: "z"
            }
            ListElement {
                value: "x"
            }
            ListElement {
                value: "c"
            }
            ListElement {
                value: "v"
            }
            ListElement {
                value: "b"
            }
            ListElement {
                value: "n"
            }
            ListElement {
                value: "m"
            }
        }


        Row {
            id: row0
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            height: 90
            spacing: 10
            Repeater {
                model: modelRow0
                delegate: KeyboardButton {
                    button_text: value
                    width: parent.height
                    height: parent.height
                    onClick: button_code => handler.keyPress(button_code)
                }
            }
        }



        Row {
            id: row1
            anchors.top: row0.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            height: 90
            spacing: 10
            Repeater {
                model: modelRow1
                delegate: KeyboardButton {
                    button_text: value
                    width: parent.height
                    height: parent.height
                    onClick: button_code => handler.keyPress(button_code)
                }
            }
        }

        Row {
            id: row2
            anchors.top: row1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            height: 90
            spacing: 10
            Repeater {
                model: modelRow2
                delegate: KeyboardButton {
                    button_text: value
                    width: parent.height
                    height: parent.height
                    onClick: button_code => handler.keyPress(button_code)
                }
            }
        }
        KeyboardButton {
            button_text: "\uF78A"
            background_color: "#e53935"
            height: 80
            anchors.verticalCenter: row3.verticalCenter
            anchors.left: parent.left
            anchors.right: row3.left
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            onClick: handler.cancelValue()
        }

        Row {
            id: row3
            anchors.top: row2.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            height: 90
            spacing: 10

            Repeater {
                model: modelRow3
                delegate: KeyboardButton {
                    button_text: value
                    width: parent.height
                    height: parent.height
                    onClick: button_code => handler.keyPress(button_code)
                }
            }
        }

        KeyboardButton {
            button_text: "\uF78C"
            background_color:  "#8bc052"
            height: 80
            anchors.verticalCenter: row3.verticalCenter
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.left: row3.right
            anchors.right: parent.right
            onClick: handler.acceptValue()
        }


        }

        KeyboardButton {
            button_text: "\uE750"
            width: 90 * 2
            height: 90
            onClick: handler.backspacePress()
            anchors.right: parent.right
            anchors.top: left.top
            anchors.topMargin: 20
            anchors.rightMargin: 10
        }

    }

    states: [
        State {
            name: "visible"
            PropertyChanges {
                target: root
                opacity: 1
                visible: true
            }
        },
        State {
            name: "hidden"
            PropertyChanges {
                target: root
                opacity: 0
                visible: false
            }
        }
    ]

    transitions: [
        Transition {
            from: "visible"
            to: "hidden"
            SequentialAnimation {
                NumberAnimation {
                    properties: "opacity"
                    duration: 200 // 500 ms
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    properties: "visible"
                    duration: 0
                    // easing.type: Easing.InOutQuad
                }
            }
        },
        Transition {
            from: "hidden"
            to: "visible"
            SequentialAnimation {
                NumberAnimation {
                    properties: "visible"
                    duration: 0
                    // easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    properties: "opacity"
                    duration: 200
                    // easing.type: Easing.InOutQuad
                }
            }
        }
    ]

    state: isVisible ? "visible" : "hidden"
}
