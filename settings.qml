import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Rectangle {
    id: settings
    width: 900; height: 600
    color: "white"

    RowLayout {
        anchors.fill: parent

        Rectangle {  //zgornji navigacijski bar
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

            Text {
                id: naslov
                text: "Nastavitve"
                y: 5
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 30; font.bold: true
                color: "white"
            }
        }

        Flickable {  //sem notri dodajaj nastavitve - ta seznam nastavitev
                id:list
                contentWidth: parent.width
                contentHeight: 1200
                clip: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topnav.bottom
                anchors.bottom: parent.bottom

                ColumnLayout {
                    spacing: 20

                    Rectangle {
                        height: 50
                        width: parent.width

                        RowLayout {
                            Text {
                                text: "Glasba:"
                                font.pointSize: 30
                            }
                            Switch {
                                checked: true
                            }
                        }

                    }

                    Rectangle {
                        height: 50
                        width: parent.width

                        RowLayout {
                            Text {
                                text: "Velike črke:"
                                font.pointSize: 30
                            }
                            Switch {
                                checked: true
                            }
                        }

                    }
                }

        }
    }

}
