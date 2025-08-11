import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.4

Item {
    property string button_text: "\uE80A"
    property var background_color: Material.White
    signal click(string button_code)
    Button {
        focusPolicy: Qt.NoFocus
        anchors.fill: parent
        text: button_text
        font.pixelSize: parent.height*0.5
        font.family: "Segoe MDL2 Assets"
        onClicked: click(button_text)
        Material.background: background_color
    }
}
