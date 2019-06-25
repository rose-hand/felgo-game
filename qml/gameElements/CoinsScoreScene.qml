import Felgo 3.0
import QtQuick 2.0

Rectangle{
    id:colorRectangle
    anchors.left: TimeScene.right
    anchors.margins: 15
    radius: 5
    color: "blue"
    property int score: 0

    property alias coinNumber: scoreCoins.text

    Text{
        id:scoreText
        text: "Score:"
        font.pixelSize: 10

    }
    Text {
        id: scoreCoins
        text:score
        anchors.right: parent.right
        anchors.margins: 5
        font.pixelSize: 10
    }
}

