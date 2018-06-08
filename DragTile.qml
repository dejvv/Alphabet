import QtQuick 2.6
import QtMultimedia 5.0


Item {
    id: root
    property string colorKey

    width: 64; height: 64

    Audio {
            id: sound
            source: ""
            volume: 0.8
    }

    MouseArea {
        id: mouseArea

        width: 64; height: 64
        anchors.centerIn: parent
        drag.target: tile

        onReleased: { animateOpacity.stop(); tile.opacity = 1;
            if(tile.Drag.target !== null){
                if(crka.text.toUpperCase() !== globaldata.tekst.charAt(tile.Drag.target.indexDT).toUpperCase()){
                    parent = root
                    if (globaldata.sound){ //če so vklopljeni zvočni efekti
                        sound.source = "music/wrong_move.wav"
                        sound.play()
                    }
                }else{
                    parent = tile.Drag.target
                    if (globaldata.sound){
                        sound.source = "music/success_move.mp3"
                        sound.play()
                    }
                    tile.Drag.drop()
                    tile.color = "green"
                    parent.children[0].color ="green"
                }
                if(parent.children.length !== 2){ //da ne moreš dat dveh istih črk na eno mesto
                    parent = root
                    if (globaldata.sound){
                        sound.source = "music/wrong_move.wav"
                        sound.play()
                    }
                    tile.color = "red"
                }
            }else{
                parent.children[0].color ="red"
                parent = root;
                tile.color = "red"
            }
        }

        Rectangle {
            id: tile

            width: 64; height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            color: colorKey

            Drag.keys: [ colorKey ]
            Drag.active: mouseArea.drag.active
            Drag.hotSpot.x: 32
            Drag.hotSpot.y: 32
            Text {
                id: crka
                anchors.fill: parent
                color: "white"
                font.pixelSize: 48
                text: {
                    if(globaldata.nivo ==="4"){
                        if(globaldata.capsLock){
                            globaldata.abeceda.charAt(modelData).toUpperCase()
                        }else{
                            globaldata.abeceda.charAt(modelData).toLowerCase()
                        }
                    }else{ //shufflam črke da so random
                        if(globaldata.capsLock){
                            globaldata.shuffledTekst.charAt(modelData).toUpperCase()
                        }else{
                            globaldata.shuffledTekst.charAt(modelData).toLowerCase()
                        }
                    }
                }
                horizontalAlignment:Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            states: State {
                when: mouseArea.drag.active
                ParentChange { target: tile; parent: root }
                AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
            }

        }
    }

    NumberAnimation {
        id: animateOpacity
        target: tile
        properties: "opacity"
        from: 0.10
        to: 1.0
        duration: 1500
        loops: Animation.Infinite
    }

    Timer {
            interval: 10000; running: true
            onTriggered: {
                if(tile.children[0].text.charAt(0).toUpperCase() === globaldata.tekst.charAt(0).toUpperCase()){
                    if( ! tile.parent.parent.children[0].children[0].text){
                        if(globaldata.help){
                            animateOpacity.start()
                        }
                    }
                }
            }
    }
}
