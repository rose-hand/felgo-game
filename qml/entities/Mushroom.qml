import Felgo 3.0
import QtQuick 2.0

EntityBase{
    id:mushroom
    entityType: "mushroom"
    width: 32
    height: 32

    property alias image:image

    Image {
        id: image
        source: "../../assets/powerups/star.png"
        visible: true
        anchors.fill: parent
    }
    BoxCollider{
        id:collider
        width: parent.width/2
        height: parent.height/2
        anchors.centerIn: parent
        bodyType:  Body.Static
        categories:Box.Category10
        fixture.onBeginContact: {
            var otherEntity=other.getBody().target
            if(otherEntity.entityType ==="player"){

                startY.restart()
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
                      mushroom.visible = false
                  }
           }
    }


}
