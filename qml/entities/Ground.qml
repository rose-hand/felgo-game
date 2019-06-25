import QtQuick 2.0
import Felgo 3.0

ManyTileEntityBase {
    id: ground
    entityType: "ground"


    size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite

    Row {
        id: groundRow
        //    anchors.bottom: parent.bottom

        //    anchors.bottomMargin: 60
        Tile {
            pos: "left"
            image: "../../assets/ground/left.png"
        }
        Repeater {
            model: size-2
            Tile {
                pos: "mid"
                image: "../../assets/ground/top.png"
            }
        }
        Tile {
            pos: "right"
            image: "../../assets/ground/right.png"
        }
    }


    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "player") player.contacts++
        }
        fixture.onEndContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "player") player.contacts--
        }
        categories: Box.Category2
        collidesWith: Box.Category1 | Box.Category5 | Box.Category8
    }
}

