import QtQuick 2.0

Rectangle {
    width: 400
    height: 200

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
                    width: 200
                    height: 200
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
        }
    }

    GridView {
        id: mreza
        anchors.fill: parent
        cellWidth: 250; cellHeight: 250

        model: besedaModel
        delegate: besedaDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
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
