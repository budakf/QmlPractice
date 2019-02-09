import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2

Page {
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight

    title: qsTr("Page 2")

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
