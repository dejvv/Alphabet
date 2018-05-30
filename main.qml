import QtQuick 2.6
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0



Rectangle {
    id: main
    width: 1024;
    height: 768

    Text {
        id: naslov
        text: "Alphabet"
//        y: main.height/4
        anchors.verticalCenter: main.verticalCenter
        anchors.verticalCenterOffset: -100
        anchors.horizontalCenter: main.horizontalCenter
        font.pointSize: 100; font.bold: true        
    }
    LinearGradient  {
        anchors.fill: naslov
        source: naslov
        gradient: Gradient {
            GradientStop { position: 1; color: "blue" }
            GradientStop { position: 0; color: "aqua" }
        }
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:  parent.verticalCenter
        visible: true

        Button {
            text: "Igraj"
            onClicked: { loader.source = "wordsGrid.qml" }

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
        Button {
            text: "Nastavitve"
            onClicked: { loader.source = "settings.qml" }

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

    Loader
      {
        id: loader
        anchors.fill: parent
      }
}
