import QtQuick 2.0

Rectangle {
    id: banner
    width: 300
    height: 400
    border.color: "black"

    // Column
    Row {
        anchors.centerIn: parent
        Text {
            id: ena
            text: "Ena."
            opacity: 0.01
            font.pointSize: 24
        }
        Text {
            id: dva
            text: "Dva."
            opacity: 0.01
            font.pointSize: 24
        }
        Text {
            id: tri
            text: "Tri."
            opacity: 0.01
            font.pointSize: 24
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: playbanner.start()
    }

    SequentialAnimation {
        id: playbanner
        running: false
        NumberAnimation { target: ena; property: "opacity"; to: 1.0; duration: 400}
        NumberAnimation { target: dva; property: "opacity"; to: 1.0; duration: 400}
        NumberAnimation { target: tri; property: "opacity"; to: 1.0; duration: 400}
    }
}