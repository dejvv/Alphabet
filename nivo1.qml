import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtMultimedia 5.0
import QtQuick.Controls.Styles 1.2



Rectangle {
    id: main
    color: "white"
    width: 1024
    height: 768

    Audio {
            id: playMusic
            source: {
                if(globaldata.music === true){
                    "music/background_music.mp3"
                }else{
                    ""
                }
            }
            autoPlay: true
            volume: 0.1
            loops: Audio.Infinite
    }
    Audio {
            id: sound
            source: ""
            volume: 0.8
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {

            Rectangle { // Rectangle -> Item
                Layout.preferredHeight: main.height * 2/3
                Layout.preferredWidth: main.width / 3
                color: "white"

                Button {
                    id: nazajbtn
//                    text: "Nazaj"
                    anchors.leftMargin: 10
                    height: 50

                    Image {
                        source: "back-icon.png"
                        height: 50
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }

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
                        id: longPressTimerSettingsNivo1

                        interval: timerTime // interval, definiran zgoraj
                        repeat: false
                        running: false
                    }

                    // ko se spremeni pritisk
                    onPressedChanged: {
                        if ( pressed ) {
                            longPressTimerSettingsNivo1.running = true;
                        } else {
                            if(longPressTimerSettingsNivo1.running){
                                longPressTimerSettingsNivo1.running = false;
                            } else {
                                console.log("Action approved in nivo 1 on back button")
                                playMusic.source="";
                                loader.source = "wordsGrid.qml"
                            }
                        }
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
                        spacing: 5

                        Repeater {
                            model: {globaldata.tekst.length}
                            delegate: DropTileNivo1 { colorKey: "deepskyblue"; indexDT: index}
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
                spacing: 5
                width: {64 * globaldata.tekst.length} //zato da je row dolg toliko kot je črk in pravilno centrira

                Repeater {
                    model: {globaldata.tekst.length}
                    delegate: DragTile { colorKey: "deepskyblue" }
                }
            }

        }
    }
    Loader
      {
        id: loader
        anchors.fill: parent
      }

    Timer {
        id: timer
    }

    signal clicked(var mouse)

    function checkIfWordCompleted(){
        var counter = 0
        for (var i = 0; i < redDestination.children.length -1; i++){
            for(var j=0; j< redDestination.children[i].children.length; j++){
                if(!redDestination.children[i].children[j].color){ //če nima določene barve.. to je mal tak hacky
                    counter++
                    break
                }
            }
        }
        if(counter === globaldata.tekst.length){
            playMusic.source="";
            sound.source = "music/word_completed.wav"
            sound.play()
            delay(2000, function(){
                var rnd = Math.floor(Math.random() * mreza.count);
                mreza.currentIndex = rnd;
                var item = mreza.currentItem;
                var slikaSource = item.children[0].children[0].source
                var tekst = item.children[0].children[1].text
                console.log(slikaSource)
                console.log(tekst)
                mreza.visible = false;
                globaldata.shuffledTekst = wordsGrid.shuffelWord(tekst);
                globaldata.tekst = tekst;
                globaldata.slika = slikaSource;
                loader.source = "nivo1.qml"
            })
        }
    }
    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

}
