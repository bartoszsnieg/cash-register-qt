import QtQuick 2.15

Item {
    property string icon: "\uE8BB"
    Rectangle {
        id: rectangle
        color: "transparent"
        anchors.fill: parent
        TopBarSpliter {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 1
        }
        Text {
            id: text1
            color: "#ffffff"
            text: icon
            anchors.fill: parent
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Segoe MDL2 Assets"
        }
        MouseArea {
            anchors.fill: parent

            onClicked: console.log("works")
        }
        TopBarSpliter {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 1
        }
    }

}
