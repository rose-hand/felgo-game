import Felgo 3.0
import QtQuick 2.0
import JsonData 1.0
import "../entities"
Rectangle{

    anchors.left: TimeScene.right
    anchors.margins: 15
    radius: 5
    color: "blue"

    property alias coinNumber: scoreCoins.text
    property int  score:0
    Text{
        id:scoreText
        text: "Score:"
        font.pixelSize: 10

    }

  //  property int score:gameData.score
//    GameData{
//        id:coin
//        score: score
//    }
    Text {
        text:score
        id: scoreCoins
        anchors.right: parent.right
        anchors.margins: 5
        font.pixelSize: 10
    }
}


