import QtQuick 2.0
import Felgo 3.0

EntityBase {
  id: finish
  entityType: "finish"
  width: 50
  height: 520

  // set image

  Image {
        source: "../../assets/finish/finish.png"
  }


  BoxCollider {
    id: collider
    width: parent.width/2
    height: parent.height/2

    anchors.fill: parent
    bodyType: Body.Static
    categories: Box.Category5
    collidesWith: Box.Category1


    fixture.onBeginContact: {
      gameWindow.state="win"


      }
    }
  }

