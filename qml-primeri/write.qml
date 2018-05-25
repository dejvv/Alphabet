import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: main
    color: "lightgrey"
    width: 1024
    height: 768

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            ColumnLayout {
                Rectangle {
                    color: "blue"
                    Layout.preferredHeight: main.height/3
                    Layout.fillWidth: true
                    /*
                    Text {
                        anchors.centerIn: parent
                        text: "RACA"
                        font.pointSize: 24
                        font.capitalization: Font.AllUppercase
                    }*/
                }
                Rectangle {
                    color: "green"
                    Layout.preferredHeight: main.height/3
                    Layout.fillWidth: true
                }
            }

            Rectangle { // Rectangle -> Item
                Layout.preferredHeight: main.height * 2/3
                Layout.preferredWidth: main.width / 3
                color: "red"
                /*Image {
                    source: "./images/raca.png"
                    width: main.width/3
                    fillMode: Image.PreserveAspectFit
                }*/
            }
        }

        Rectangle {
            Layout.preferredHeight: main.height/3
            Layout.fillWidth: true
            color: "yellow"
            anchors.left: main.left 
            anchors.right: main.right
        }
    }

}