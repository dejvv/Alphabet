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

        onReleased: {if(tile.Drag.target !== null){
//                        if( tile.Drag.target.containsDrag ){
//                            parent = root
//                        }
                if(crka.text.toUpperCase() !== globaldata.tekst.charAt(tile.Drag.target.indexDT).toUpperCase() ){
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
                        tile.Drag.drop()
                    }
                }
            }else{
                parent = root;
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
}
