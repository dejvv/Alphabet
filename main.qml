import QtQuick 2.6
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0



Rectangle {
    property int timerTime: 1000
    id: main
    width: 1024;
    height: 768
//    color: "black"
    Text {
        id: naslov
        text: "Alphabet"
//        y: main.height/4
        anchors.verticalCenter: main.verticalCenter
        anchors.verticalCenterOffset: -100
        anchors.horizontalCenter: main.horizontalCenter
        font.pointSize: 120;
        font.bold: true
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
            id: playButton
            text: "Igraj"

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
            Timer {
                id: longPressTimerPlay

                interval: timerTime // interval, definiran zgoraj
                repeat: false
                running: false
            }

            // ko se spremeni pritisk
            onPressedChanged: {
                if ( pressed ) {
                    longPressTimerPlay.running = true;
                } else {
                    if(longPressTimerPlay.running){
                        longPressTimerPlay.running = false;
                    } else {
                        console.log("Action approved on playButton")
                        loader.source = "wordsGrid.qml"
                    }
                }
            }
        }
        Button {
            id: settingsButton
            text: "Nastavitve"

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

            Timer {
                id: longPressTimerSettings

                interval: timerTime // interval, definiran zgoraj
                repeat: false
                running: false
            }

            // ko se spremeni pritisk
            onPressedChanged: {
                if ( pressed ) {
                    longPressTimerSettings.running = true;
                } else {
                    if(longPressTimerSettings.running){
                        longPressTimerSettings.running = false;
                    } else {
                        console.log("Action approved on settingsButton")
                        loader.source = "settings.qml"
                    }
                }
            }
        }

        Button {
            id: exitButton
            text: "Izhod"

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

            Timer {
                id: longPressTimerExit

                interval: timerTime // interval, definiran zgoraj
                repeat: false
                running: false
            }

            // ko se spremeni pritisk
            onPressedChanged: {
                if ( pressed ) {
                    longPressTimerExit.running = true;
                } else {
                    if(longPressTimerExit.running){
                        longPressTimerExit.running = false;
                    } else {
                        console.log("Action approved on exitButton")
                        Qt.quit()
                    }
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
