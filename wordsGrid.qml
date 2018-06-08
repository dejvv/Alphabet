import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Rectangle {
    id:wordsGrid
    width: 1024
    height: 768

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: topnav
            height: 50
            width: parent.width
            color: "lightskyblue"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            z: 1

            Button {
//                text: "Nazaj"
                anchors.leftMargin: 10

                Image {
                    source: "back-icon.png"
                    height: 50
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                contentItem:
                    Text {
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
                    id: longPressTimerPlayWordsGridBack

                    interval: timerTime // interval, definiran zgoraj
                    repeat: false
                    running: false

                    onTriggered: {
                        console.log("Action approved in wordsGrid on back button")
                        mreza.visible = false; loader.source = "main.qml"
                    }
                }

                // ko se spremeni pritisk
                onPressedChanged: {
                    if ( pressed ) {
                        longPressTimerPlayWordsGridBack.running = true;
                    } else {
                        if(longPressTimerPlayWordsGridBack.running){
                            longPressTimerPlayWordsGridBack.running = false;
                        } else {
//                            console.log("Action approved in wordsGrid on back button")
//                            mreza.visible = false; loader.source = "main.qml"
                        }
                    }
                }
            }

            Text {
                id: naslov
                text: "Izberi besedo"
                y: 5
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 30; font.bold: true
                color: "white"
            }

        }

        ListModel {
            id: besedaModel
        }

        Component {
            id: besedaDelegate
            Item {
                width: mreza.cellWidth; height: mreza.cellHeight

                Column {
                    anchors.fill: parent

                    Image {
                        width: mreza.cellWidth -30
                        height: mreza.cellHeight -30
                        fillMode: Image.PreserveAspectFit
                        source: slika
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: tekst
                        font.pointSize: 24
                        font.capitalization: Font.AllUppercase
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // skrijem mrezo, premesam besedo in pokazem tekst & sliko
                        mreza.visible = false;
                        globaldata.shuffledTekst = wordsGrid.shuffelWord(tekst);
                        globaldata.tekst = tekst;
                        globaldata.slika = slika;
                        switch(globaldata.nivo) {
                            case "1":
                                loader.source = "nivo1.qml"
                                break;
                            case "2":
                                loader.source = "nivo2.qml"
                                break;
                            case "3":
                                loader.source = "nivo3.qml"
                                break;
                            case "4":
                                loader.source = "nivo4.qml"
                                break;
                            default:
                                loader.source = "nivo1.qml"
                                break;
                        }
                    }
                }
            }
        }

        GridView {
            id: mreza
//            anchors.fill: parent
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: topnav.bottom
            anchors.bottom: parent.bottom
            cellWidth: main.width/4; cellHeight: main.width/4
            visible: true

            model: besedaModel
            delegate: besedaDelegate
//            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        }

        Component.onCompleted: {
            var request = new XMLHttpRequest()
            request.open('GET', './words.json');
            request.onreadystatechange = function() {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status && request.status === 200) {
                        //console.log("response", request.responseText)
                        var result = JSON.parse(request.responseText)
                        var list = result["slike"];
                        for (var i in list) {
                            besedaModel.append({
                                "slika": list[i].slika,
                                "tekst": list[i].tekst
                            })
                        }
                    } else {
                        console.log("HTTP:", request.status, request.statusText)
                    }
                }
            }
            request.send()
        }
    }

    Loader
      {
        id: loader
        anchors.fill: parent
      }

    function shuffelWord (word){
        var shuffledWord = '';
        word = word.split('');
        while (word.length > 0) {
          shuffledWord +=  word.splice(word.length * Math.random() << 0, 1);
        }
        return shuffledWord;
    }
}
