import QtQuick 2.15
import QtQuick.Controls 2.15
import "../common/controls"

Item {
    Rectangle {
        anchors.fill: parent
        color: "#ffffff"
        opacity: 0.99
        MouseArea {
            anchors.fill: parent
        }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        color: "#eaeaea"
        width: 400
        height: 300
        radius: 3
        // Label { text: "Login:" }

        Rectangle {
            width: parent.width*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            height: loginInput.height+passwordInput.height+30 + 50
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            color: "transparent"
            VkTextField {
                id: loginInput
                placeholderText: "Wpisz login"
                width: parent.width
                onTextChanged: console.log("Nowy tekst:", text)
                onActiveFocusChanged: {
                    console.log(activeFocus)
                }
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 30
                onAccepted: passwordInput.focus = true
            }

            VkTextField {
                id: passwordInput
                placeholderText: "Wpisz pin"
                echoMode: TextInput.Password   // 🔹 ukrywa znaki
                width: parent.width
                font.pixelSize: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: loginInput.bottom
                anchors.topMargin: 30
                vk_handler: virtual_keyboard_handler_numeric
                onAccepted: passwordInput.focus = false
            }

            Text {
                text: qsTr("Niepoprawny login lub pin")
                anchors.bottom:  parent.bottom
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                color: "Red"

            }

        }
        Rectangle {
            id: rectangle3
            height: 100
            color: "#8bc052"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10

            Text {
                id: text2
                color: "#ffffff"
                text: qsTr("Zaloguj")
                font.pixelSize: 30
                styleColor: "#ffffff"
                anchors.centerIn: parent
            }
        }
    }
    }
}
