import Felgo 3.0
import QtQuick 2.0
import JsonData 1.0
import"../gameElements"
EntityBase{
       id:coin
       width: 32
       height: 32
       entityType: "coin"
       Image {
           id: coinimage
           anchors.fill: parent
           source: "../../assets/coin/coin.png"
       }


        function show(){
            scoreRectangle.coinNumber=gameData.score
        }
       CircleCollider{
       id:collider
       radius: parent.width/2
       x:3
       y:3
       bodyType: Body.Static
       collisionTestingOnlyMode: true
       categories: Box.Category6
       collidesWith: Box.Category1
       fixture.onBeginContact: {
           console.log("ssdfg")
           startY.restart()

       console.log(gameData.score)
        scoreRectangle.coinNumber++
        gameData.addScore()
        console.log(scoreRectangle.coinNumber)
       //gameData.score=scoreRectangle.coinNumber
        console.log(gameData.score)

   }

   }
   NumberAnimation on y{
             id:startY
             to:540
                 running: false
                 duration: 1000
                 onStarted: {
                     console.log("11111")
                 }
                 onStopped: {
                     coin.visible = false
                 }
          }



}

