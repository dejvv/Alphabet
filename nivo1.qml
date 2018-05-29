import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0


Rectangle {
    id: main
    color: "lightgrey"
    width: 1024
    height: 768

    ColumnLayout {
        anchors.fill: parent

        RowLayout {

            Rectangle { // Rectangle -> Item
                Layout.preferredHeight: main.height * 2/3
                Layout.preferredWidth: main.width / 3
                color: "white"

                Button {
                    id: nazajbtn
                    text: "Nazaj"
                    onClicked: { loader.source = "wordsGrid.qml" }
                    anchors.leftMargin: 10
                    height: 50

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


                Image {
                    source: globaldata.slika
                    width: main.width/3
                    fillMode: Image.PreserveAspectFit
                    anchors.top: nazajbtn.bottom
                }
            }
            ColumnLayout {
                Rectangle {
                    color: "white"
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Row {
                        id: redDestination

//                        anchors.left: redSource.right; anchors.top: parent.top;
//                        anchors.margins: 5
                        anchors.centerIn: parent
                        height: 64
                        opacity: 0.5

                        Repeater {
                            model: {globaldata.tekst.length}
                            delegate: DropTileNivo1 { colorKey: "red" }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.preferredHeight: main.height/3
            Layout.fillWidth: true
            color: "white"

            Row {
                id: redSource
                anchors.centerIn: parent
                width: {64 * globaldata.tekst.length} //zato da je row dolg toliko kot je črk in pravilno centrira

                Repeater {
                    model: {globaldata.tekst.length}
                    delegate: DragTile { colorKey: "red" }
                }
            }

        }
    }
    Loader
      {
        id: loader
        anchors.fill: parent
      }

}
