import Felgo 3.0
import QtQuick 2.0

// EMPTY SCENE

Rectangle{
    id:timeRectangle
    color: "grey"
    radius: 5
    property int size: 0

    property alias timeNumber:timeNumber
    Text {
       id: timeText
       text:"timer:"
       font.pixelSize: 10

    }
    Text{
        id:timeNumber
        anchors.left: timeText.right
        font.pixelSize: 10
        text: size
    }

}
