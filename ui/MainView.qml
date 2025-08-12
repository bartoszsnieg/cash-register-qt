import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15
import "commponents"

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
