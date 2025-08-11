import QtQuick 2.15

Item {
    width: 700
    height: 300
    Rectangle {
        id: rectangle
        width: children.width
        height: parent.height
        color: "transparent"

        Rectangle {
            id: rectangle1
            width: height
            radius: height
            color: "#a1a6ac"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10

            Text {
                id: text1
                color: "#cdcdcd"
                text: qsTr("BS")
                anchors.fill: parent
                font.pixelSize: rectangle1.height * 0.6
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        Column {
            id: column
            anchors.left: rectangle1.right
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 5
            anchors.right: parent.right
            spacing: 4
            Text {
                id: text2
                text: qsTr("Bartosz")
                font.pixelSize: rectangle1.height * 0.25
                color: "#cdcdcd"
            }

            Text {
                id: text3
                text: qsTr("Snieg")
                color: "#cdcdcd"
                font.pixelSize: rectangle1.height * 0.25
            }

            Row {
                spacing: 15
                Text {
                    id: text4
                    text: qsTr("10:30")
                    color: "#cdcdcd"
                    font.pixelSize: rectangle1.height * 0.25
                    font.family: "Arial"
                    font.bold: true
                }

                Text {
                    id: wifi
                    text: "\uEC3F"
                    color: "#cdcdcd"
                    font.pixelSize: rectangle1.height * 0.25
                    font.family: "Segoe MDL2 Assets"
                    font.bold: true
                }

                Text {
                    id: bat
                    text: "\uECBF"
                    color: "#cdcdcd"
                    font.pixelSize: rectangle1.height * 0.25
                    font.family: "Segoe MDL2 Assets"
                    font.bold: true
                }
            }
        }
    }
}
