import QtQuick 2.0

Rectangle {
    id: root

    width: 320
    height: 480

    color: "azure"

    Grid {
        id: redDestination

        anchors.left: redSource.right; anchors.top: parent.top;
        anchors.margins: 5
        width: 64*3
        height: 64*3
        opacity: 0.5
        columns: 3

        Repeater {
            model: 9;
            delegate: DropTile { colorKey: "red" }
        }
    }

    Row {
        id: redSource

        anchors.left: parent.left; anchors.top: redDestination.bottom
        anchors.margins: 5
        width: 64

        Repeater {
            model: 9
            delegate: DragTile { colorKey: "red" }
        }
    }

}