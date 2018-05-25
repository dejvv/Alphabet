import QtQuick 2.0

Rectangle {
    width: 400
    height: 200

    ListModel {
        id: besedaModel
    }

    Component {
        id: besedaDelegate
        Row {
            spacing: 100
            Text {
                text: tekst
                font.pointSize: 24
                font.capitalization: Font.AllUppercase
            }
            Image {
                fillMode: Image.PreserveAspectFit
                source: slika
            }
        }
    }

    ListView {
        anchors.fill: parent
        model: besedaModel
        delegate: besedaDelegate
    }

    Component.onCompleted: {
        var request = new XMLHttpRequest()
        request.open('GET', './words.json');
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
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