/*import QtQuick 2.0

Item {
    id: container
    width: 200; height: 200

    Rectangle {
        id: myRect
        width: 100; height: 100
        color: "red"
    }

    states: State {
        name: "reanchored"
        AnchorChanges { target: myRect; anchors.right: container.right }
    }

    transitions: Transition {
        // smoothly reanchor myRect and move into new position
        AnchorAnimation { duration: 1000 }
    }

    Component.onCompleted: container.state = "reanchored"
}*/

import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle {
    id: moder
    color: "blue"
    
    width: 700
    height: 300

    Rectangle {
        id: rdec
        color: "red"

        width: 100; height: 100

        anchors.left: parent.left
        //anchors.right: parent.right

        //MouseArea { id: mouseArea; anchors.fill: parent }

        states: State {
            name: "anchorRight"
            //when: mouseArea.pressed == true
            AnchorChanges {
                target: rdec
                anchors.right: parent.right
                //anchors.left: undefined  //remove the left anchor
            }
        }

        transitions: Transition {
            AnchorAnimation {duration: 3000}
        }

    }

    Component.onCompleted: rdec.state = "anchorRight"
}