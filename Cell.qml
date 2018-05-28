import QtQuick 2.0

Item {
    id: container
    property alias cellColor: rectangle.color
    property alias cellText: textGumb.text

    width: main.width/3
    height: 50

    Rectangle {
        id: rectangle
        border.color: "white"
        anchors.fill: parent

        Text {
            Text {
                id: textGumb
                text: ""
                y: 15
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20; font.bold: true
            }
        }
    }
}
