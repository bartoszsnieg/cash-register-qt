import QtQuick 2.15
import "TopBar"

Item {
    width: 1080
    height: 88
    Rectangle {
        id: rectangle
        color: "#3b434a"
        anchors.fill: parent

        Row {
            id: row
            width: 87
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            ListModel {
                id: leftModel

                ListElement {
                    icon: "\uE77B"
                }
                ListElement {
                    icon: "\uE737"
                }
                ListElement {
                    icon: "\uE8BD"
                }
                ListElement {
                    icon: "\uE898"
                }
                ListElement {
                    icon: "\uEC5B"
                }
                ListElement {
                    icon: "\uE712"
                }
            }

            Repeater {
                model: leftModel
                TopBarButton {
                    width: row.height
                    height: row.height
                    icon: model.icon
                }
            }
        }

        Row {
            id: row1
            width: children.width
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            ListModel {
                id: rightModel

                ListElement {
                    icon: "\uE721"
                }
                ListElement {
                    icon: "\uF140"
                }
            }

            Repeater {
                model: rightModel
                TopBarButton {
                    width: row1.height
                    height: row1.height
                    icon: model.icon
                }
            }
            TopBarUser {
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                width: 2.5* row1.height
            }
            TopBarButton {
                width: row.height
                height: row.height
                icon: "\uE72E"
            }
        }
    }
}
