import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    width: 1024;
    height: 768

    Model{  //ta model mora bit tu ker pride drugače do konfilkt in se prepisujejo nastavitve
        id:globaldata
    }
    Loader
      {
        source: "main.qml"
        anchors.fill: parent
      }
}
