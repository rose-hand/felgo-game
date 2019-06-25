//ManyTileEntityBase.qml
import Felgo 3.0
import QtQuick 2.0

EntityBase {
    id: tiledEntity
    property int column: 0
    property int row: 0
    property int size

    x: (row-2)*game1Scene.gridSize
    y: level.height - (column+1)*game1Scene.gridSize
    width: game1Scene.gridSize * size
    height: game1Scene.gridSize
}

