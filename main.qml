import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Timeline 1.0
import "ui/commponents"
import "ui/commponents/LogInDialog"
import "ui/commponents/common/keyboard"

Window {
    id: window
    width: 1500
    height: 844
    visible: true
    title: qsTr("Hello World")
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height

        Frame {
            anchors.fill: parent
            rightPadding: 0
            bottomPadding: 0
            // visible: false
            TopBar {
                id: topBar
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
            }

            Row {
                id: row
                anchors {
                    top: topBar.bottom
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }

                RecipeView {
                    id: rec1
                    width: 400
                    height: parent.height
                }
            }
        }
    LogInDialog {
        anchors.fill: parent
    }



    FullKeyBoard {
        id: vk
        anchors.centerIn: parent
        anchors.bottomMargin: 30
        handler: virtual_keyboard_handler_classic
    }

    NumericKeyboard {
        id: vk2
        anchors.centerIn: parent
        handler: virtual_keyboard_handler_numeric
    }
}
