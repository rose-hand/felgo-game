import QtQuick 2.0
import Felgo 3.0

ManyTileEntityBase {
    id: background
    entityType: "background"

    size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite

    Row {
        id: waterRow
        Repeater {
            model: size
            Tile {
                image: "../../assets/backgroundImage/water1.png"
            }
        }

    }
}
