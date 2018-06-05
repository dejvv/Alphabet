import QtQuick 2.0

//ta file je namenjen dostopanju do globalnih spremenljivk iz različnih datotek

Item {
    property string tekst
    property string slika
    property string shuffledTekst
    property string abeceda: "abcčdefghijklmnoprsštuvzž"

    //spremenljivke za nastavitve
    property string nivo: "1" //1,2,3,4
    property bool music: true
    property bool capsLock: true
    property bool sound: true
}
