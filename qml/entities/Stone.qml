import QtQuick 2.0
import Felgo 3.0
import "../editorElements"


ManyTileEntityBase {
    id: stone
    entityType: "stone"

    width: image.width
    height: image.height
    signal contact2

    // set image
    Image {
        id:image
        source: "../../assets/spikes/stone.png"
    }

    BoxCollider {
        id: collider

        anchors.centerIn: parent
        width: parent.width
        height: parent.height

        // set position
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        // the bodyType is static
        bodyType: Body.Static

        categories: Box.Category8
        collidesWith: Box.Category1 | Box.Category2 | Box.Category3

        fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          // if the player hits the sensor, we emit a signal which will be used to reset the player
          if(otherEntity.entityType === "player") {
            // we could also directly modify the player position here, but the signal approach is a bit cleaner and helps separating the components
            stone.contact2()
          }
        }
    }
}
