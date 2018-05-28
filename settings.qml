import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Rectangle {
    id: settings
    width: 900; height: 600
    color: "white"

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: topnav
            height: 50
            width: parent.width
            color: "lightskyblue"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            Button {
                text: "Nazaj"
                onClicked: { loader.source = "main.qml" }
                anchors.leftMargin: 10

                contentItem: Text {
                        text: parent.text
                        font.pointSize: 20
                        opacity: enabled ? 1.0 : 0.3
                        color: parent.down ? "aqua" : "deepskyblue"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                background: Rectangle {
                    implicitWidth: 120
                    implicitHeight: 48
                    opacity: enabled ? 1 : 0.3
                    border.color: parent.down ? "aqua" : "deepskyblue"
                    border.width: 1.5
                    radius: 5
                }
            }

        }

        Rectangle {
            id:content
            clip: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: topnav.bottom
            anchors.bottom: parent.bottom
        }
    }

}
