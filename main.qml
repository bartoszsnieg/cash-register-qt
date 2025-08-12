import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Timeline 1.0
import "ui/commponents"
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
    Loader {
        id: viewLoader
        anchors.fill: parent
        source: page_controllere.pageUrl
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
