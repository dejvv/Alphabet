import QtQuick 2.0

DropArea {  //to sm naredu posebi file ker rabiš v prvem nivoju tudoi črke v DropTile
    id: dragTarget

    property string colorKey
    property alias dropProxy: dragTarget

    width: 64; height: 64
    keys: [ colorKey ]

    Rectangle {
        id: dropRectangle

        anchors.fill: parent
        color: colorKey

        states: [
            State {
                when: dragTarget.containsDrag
                PropertyChanges {
                    target: dropRectangle
                    color: "grey"
                }
            }
        ]

        Text {
            anchors.fill: parent
            color: "white"
            font.pixelSize: 48
            text: {
                if(globaldata.capsLock){
                    globaldata.tekst.charAt(modelData).toUpperCase()
                }else{
                    globaldata.tekst.charAt(modelData).toLowerCase()
                }
            }
            horizontalAlignment:Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
