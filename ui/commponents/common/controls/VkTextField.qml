import QtQuick 2.15
import QtQuick.Controls 2.15
TextField {
    property QtObject vk_handler: virtual_keyboard_handler_classic
    Component.onCompleted: vk_handler.addTextField(this)
}
