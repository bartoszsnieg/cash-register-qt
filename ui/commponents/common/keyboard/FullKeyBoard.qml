import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Item {

    required  property QtObject handler
    property bool isVisible: handler.IsVisible
    

    id: root
    width: 1300
    height: row0.height + row1.height + row2.height + row3.height + 3 * 10 + 50
    visible: opacity >0
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


    readonly property var row0Model: ["1","2","3","4","5","6","7","8","9","0"]
    readonly property var row1Model: ["q","w","e","r","t","y","u","i","o","p"]
    readonly property var row2Model: ["a","s","d","f","g","h","j","k","l"]
    readonly property var row3Model: ["z","x","c","v","b","n","m"]

        Row {
            id: row0
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            height: 90
            spacing: 10
            Repeater {
                model: left.row0Model
                delegate: KeyboardButton {
                    button_text: modelData
                    width: parent.height
                    height: parent.height
                    onClick: handler.keyPress(button_code)
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
                model: left.row1Model
                delegate: KeyboardButton {
                    button_text: modelData
                    width: parent.height
                    height: parent.height
                    onClick: handler.keyPress(button_code)
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
                model: left.row2Model
                delegate: KeyboardButton {
                    button_text: modelData
                    width: parent.height
                    height: parent.height
                    onClick: handler.keyPress(button_code)
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
                model: left.row3Model
                delegate: KeyboardButton {
                    button_text: modelData
                    width: parent.height
                    height: parent.height
                    onClick: handler.keyPress(button_code)
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
            SequentialAnimation {
                NumberAnimation {
                    properties: "opacity"
                    duration: 200 // 500 ms
                    easing.type: Easing.InOutQuad
                }
            }
        },
        Transition {
            from: "hidden"
            to: "visible"
            SequentialAnimation {
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
