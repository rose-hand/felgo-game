import Felgo 3.0
import QtQuick 2.0
import "../gameElements"

EntityBase{
    id: player
    entityType: "player"
    width: 32
    height: 32

    property bool isBig: false
    property alias image: image
    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
    property int contacts: 0
    signal deathresenstor

    state: contacts > 0 ? "walking" : "jumping"
    onStateChanged: console.debug("player.state " + state)
//    AnimatedImage
    MultiResolutionImage {
        id: image
        anchors.fill: parent
        source: "../../assets/player/playerright.png"
    }
    scale: isBig? 1.2:1
    BoxCollider {

      id: collider
      height: 32
      width: 32/2
      anchors.horizontalCenter: parent.horizontalCenter
      bodyType: Body.Dynamic

      categories:Box.Category1
//      collidesWith: Box.Category2 | Box.category3

      fixedRotation: false // 设置为跑不是滚
      bullet: true
      sleepingAllowed: false
      force: Qt.point(controller.xAxis*170*32,0)
      onLinearVelocityChanged: {
        if(linearVelocity.x > 150) linearVelocity.x = 150
        if(linearVelocity.x < -150) linearVelocity.x = -150
      }

      fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          if(otherEntity.entityType === "spikes") {
              gameLife.number--
              if(gameLife.number == 0){
                  console.log("adf")
                  gameWindow.state="lost"
              }
          }
          if(otherEntity.entityType === "stone") {
              if(gameLife.number <= 0){
                  return
              }
              gameLife.number--
              console.log("gameLife.number"+gameLife.number)
              if(gameLife.number == 0){
                  console.log("123")
                   onDeathresenstor:death()
              }
          }
          if(otherEntity.entityType==="mushroom"){
              player.isBig=true
              player.y++==32
          }
          if(otherEntity.entityType === "monster") {
              gameLife.number--
          }
      }
    Timer {
      id: updateTimer

      interval: 60
      repeat: true
      //如果向左向右停止了 就有一个阻力降下来；
      onTriggered: {
        var xAxis = controller.xAxis;
        if(xAxis == 0) {
          if(Math.abs(player.horizontalVelocity) > 10) player.horizontalVelocity /= 1.5
          else player.horizontalVelocity = 0
        }
      }
    }

}

    function jump() {
      console.debug("jump requested at player.state " + state)
      if(player.state == "walking") {
        console.debug("do the jump")
        //规定一个速度朝上平衡速度
        collider.linearVelocity.y = -420
      }
    }
}
