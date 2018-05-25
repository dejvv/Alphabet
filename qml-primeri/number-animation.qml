//http://zetcode.com/gui/qtquick/
import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {

    width: 500
    height: 500
    title: "Number animation"

    Rectangle {
        x: 20
        y: 20
        width: 10; height: 10
        color: "forestgreen"

        NumberAnimation on x { to: 250; duration: 1000 }
        NumberAnimation on y { to: 250; duration: 1000 }
        NumberAnimation on width  { to: 100; duration: 1000 }
        NumberAnimation on height { to: 100; duration: 1000 }
    }

    Button {
        x: 0
        y: 0
        text: "Konec"
        onClicked: Qt.quit()
    }
}