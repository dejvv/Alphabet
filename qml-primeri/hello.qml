import QtQuick 2.0


Rectangle {
    id: page
    width: 500; height: 400
    color: "gray"

    Text {
        id: uv
        text: "Uporabniški vmesniki"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true

        MouseArea { id: mouseArea; anchors.fill: parent }

        states: State {
            name: "down"
            when: mouseArea.pressed == true
            PropertyChanges {
                target: uv
                y: 160
                rotation: 180
                color: "red"
            }
        }

        transitions: Transition {
            from: ""
            to: "down"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y,rotation"
                    duration: 1000
                    easing.type: Easing.InOutBounce // InOutQuad
                }
                ColorAnimation {duration: 1000 }
            }
        }
    }

    Grid {
        id: colorPicker
        rows: 2; columns: 3; spacing: 3
        anchors.bottom: page.bottom
        anchors.bottomMargin: 4
        //anchors.horizontalCenter: page.horizontalCenter
        anchors.left: page.left
        anchors.right: page.right

        Cell { cellColor: "red"; onClicked: uv.color = cellColor }
        Cell { cellColor: "green"; onClicked: uv.color = cellColor }
        Cell { cellColor: "blue"; onClicked: uv.color = cellColor }
        Cell { cellColor: "yellow"; onClicked: uv.color = cellColor }
        Cell { cellColor: "steelblue"; onClicked: uv.color = cellColor }
        Cell { cellColor: "black"; onClicked: uv.color = cellColor }
    }
}