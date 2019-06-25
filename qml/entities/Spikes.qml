import QtQuick 2.0
import Felgo 3.0
import "../editorElements"

ManyTileEntityBase {
    id: spikes
    entityType: "spikes"
    signal contact3
    Image {
        id: spikesImage
        source: "../../assets/spikes/spikeball.png"
    }


//    Row {
//        id: spikesRow
////        Repeater {
////            model: size
////            Tile {
////                image: "../../assets/spikes/spikeball.png"
//            }
//        }
//    }

    CircleCollider {
        id: collider

        radius: game1Scene.gridSize-18

        // set position
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        // the bodyType is static
        bodyType: Body.Static

        categories: Box.Category5
        collidesWith: Box.Category1 | Box.Category2 | Box.category3

        fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          // if the player hits the sensor, we emit a signal which will be used to reset the player
          if(otherEntity.entityType === "player") {
             //we could also directly modify the player position here, but the signal approach is a bit cleaner and helps separating the components
            spikes.contact3()
          }
        }
    }
}

