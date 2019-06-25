import QtQuick 2.0
import Felgo 3.0

ManyTileEntityBase {
    id: platform
    entityType: "platform2"

    size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite

    Row {
        id: platformRow

        Tile {
            pos: "left"
            image: "../../assets/ground/mid.png"
        }
        Repeater {
            model: size-2
            Tile {
                pos: "mid"
                image: "../../assets/ground/mid.png"
            }
        }
        Tile {
            pos: "right"
            image: "../../assets/ground/mid.png"
        }
    }

    BoxCollider {
        id: collider
        anchors.fill: parent
        bodyType: Body.Static

        categories: Box.Category4
 //       collidesWith: Box.Category1

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "player") player.contacts++
        }
        fixture.onEndContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "player") player.contacts--
        }
    }
}
