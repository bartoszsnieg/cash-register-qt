import QtQuick 2.15

Item {
    id: root
    required  property QtObject handler
    property bool isVisible: handler.IsVisible
    
    width: 500
    height: 440
    visible: opacity > 0

    Rectangle {
        id: keys

        color: "#afafaf"
        radius: 30
        anchors.fill: parent

        Rectangle {
            id: left
            color: "transparent"
            anchors.left: parent.left
            anchors.margins: 10
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 290

            ListModel {
                id: modelRow1

                ListElement {
                    value: "7"
                }
                ListElement {
                    value: "8"
                }
                ListElement {
                    value: "9"
                }
            }

            ListModel {
                id: modelRow2

                ListElement {
                    value: "4"
                }
                ListElement {
                    value: "5"
                }
                ListElement {
                    value: "6"
                }
            }

            ListModel {
                id: modelRow3

                ListElement {
                    value: "1"
                }
                ListElement {
                    value: "2"
                }
                ListElement {
                    value: "3"
                }
            }
            ListModel {
                id: modelRow4

                ListElement {
                    value: "0"
                }
            }

            Row {
                id: row1
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 90
                spacing: 10
                Repeater {
                    model: modelRow1
                    delegate: KeyboardButton {
                        anchors.verticalCenter: parent.verticalCenter
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

            Row {
                id: row4
                anchors.top: row3.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                height: 90
                spacing: 10

                Repeater {
                    model: modelRow4
                    delegate: KeyboardButton {
                        button_text: value
                        width: parent.height
                        height: parent.height
                        onClick: button_code => handler.keyPress(button_code)
                    }
                }
            }
        }

        Rectangle {
            id: right
            anchors.top: left.top
            anchors.bottom: left.bottom
            anchors.right: parent.right
            anchors.left: left.right
            anchors.margins: 20
            anchors.leftMargin: 10
            color: "transparent"
            Column {
                anchors.fill: parent
                spacing: 10
                KeyboardButton {
                    button_text: "\uF78A"
                    background_color: "#e53935"
                    width: 90 * 2
                    height: 90
                    onClick: handler.cancelValue()
                }

                KeyboardButton {
                    button_text: "\uE750"
                    width: 90 * 2
                    height: 90
                    onClick: handler.backspacePress()
                }

                KeyboardButton {
                    button_text: "\uF78C"
                    background_color: "#8bc052"
                    width: 90 * 2
                    height: 90
                    onClick: handler.acceptValue()
                }
            }
        }
    }

    states: [
        State {
            name: "visible"
            PropertyChanges {
                target: root
                opacity: 1
            }
        },
        State {
            name: "hidden"
            PropertyChanges {
                target: root
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            from: "visible"
            to: "hidden"
            NumberAnimation {
                properties: "opacity"
                duration: 200 // 500 ms
                easing.type: Easing.InOutQuad
            }
        },
        Transition {
            from: "hidden"
            to: "visible"
            NumberAnimation {
                properties: "opacity"
                duration: 200
                // easing.type: Easing.InOutQuad
            }
        }
    ]

    state: isVisible ? "visible" : "hidden"
}
