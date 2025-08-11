import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15


Item {
    id: item1

    Rectangle {
        id: rectangle1
        // color: "#4c4c4c"
        anchors.left: rectangle.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        clip: true
        Rectangle {
            x: parent.height/-2
            y: parent.height/2 - 5
            width: parent.height
            height: parent.width
            rotation: 90
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#fefefe" }
                GradientStop { position: 0.5; color: "#eaeaea" }
                GradientStop { position: 1.0; color: "#fefefe" }
            }
        }
    }

    Rectangle {
        id: rectangle
        color: "#fefefe"
        anchors.fill: parent
        anchors.rightMargin: 10
        width: children.width
        height: children.height
        ListView {
            id: listView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: rectangle4.top
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            flickableDirection: Flickable.VerticalFlick
            model: ListModel {
                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "White"
                    colorCode: "white"
                }
            }
            delegate: Row {
                spacing: 5
                Rectangle {
                    width: 100
                    height: 20
                    color: colorCode
                }

                Text {
                    width: 100
                    text: name
                }
            }
        }

        Rectangle {
            id: bottomButtonBox
            y: 392
            height: 88
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0

            Rectangle {
                id: rectangle2
                width: 0.5 * parent.width
                color: "#2e95cf"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Zapisz")
                    font.pixelSize: 30
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: rectangle3
                width: 0.5 * parent.width
                color: "#8bc052"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Text {
                    id: text2
                    color: "#ffffff"
                    text: qsTr("Zapłać")
                    font.pixelSize: 30
                    styleColor: "#ffffff"
                    anchors.centerIn: parent
                }
            }
        }

        Rectangle {
            id: rectangle4
            y: 230
            height: 162
            color: "#eaeaea"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: bottomButtonBox.top
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0

            Text {
                id: text3
                text: qsTr("Razem")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 30
                anchors.bottomMargin: 30
                font.pixelSize: 30
                font.bold: true
            }

            Text {
                id: currency
                text: qsTr("PLN")
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 30
                anchors.bottomMargin: 30
                font.pixelSize: 30
            }

            Text {
                id: sumValue
                text: qsTr("0,00")
                anchors.verticalCenter: currency.verticalCenter
                anchors.left: text3.right
                anchors.right: currency.left
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                font.pixelSize: 30
                horizontalAlignment: Text.AlignRight
                font.bold: true
            }

            Text {
                id: text4
                text: qsTr("Zniżka")
                anchors.bottom: text3.top
                anchors.bottomMargin: 34
                font.pixelSize: 30
                anchors.horizontalCenter: text3.horizontalCenter
                font.bold: true
            }

            Text {
                id: discountValue
                text: qsTr("0,00")
                anchors.verticalCenter: text4.verticalCenter
                anchors.left: text4.right
                anchors.leftMargin: 20
                font.pixelSize: 30
                horizontalAlignment: Text.AlignRight
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: sumValue.horizontalCenter
                font.bold: true
                color: "#f23737"
            }

            Text {
                id: currency1
                color: "#f23737"
                text: qsTr("PLN")
                anchors.verticalCenter: discountValue.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 30
                font.pixelSize: 30
            }
        }
    }
}
