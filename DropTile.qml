import QtQuick 2.5
import QtQuick.Controls 1.4


DropArea {
    id: dragTarget

    property string colorKey
    property int indexDT
    property alias dropProxy: dragTarget

    width: 64; height: 64
    keys: [ colorKey, indexDT ]

    Rectangle {
        id: dropRectangle

        anchors.fill: parent
        color: colorKey

        states: [
            State {
                when: dragTarget.containsDrag
                PropertyChanges {
                    target: dropRectangle
                    color: "grey"
                }
            }
        ]
    }
}
