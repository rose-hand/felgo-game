import QtQuick 2.0
import Felgo 3.0


ManyTileEntityBase {
        id: groundflower
    entityType: "groundflower"

    size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite

    Row {
        id: flowerRow
        Repeater {
            model: size
            Tile {
                image: "../../assets/backgroundImage/flower.png"
            }
        }
    }


}
