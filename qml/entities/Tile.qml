import Felgo 3.0
import QtQuick 2.0
import"../scenes"
Item {
  width: game1Scene.gridSize
  height: game1Scene.gridSize
  property alias image: sprite.source
  property string pos: "mid"
  MultiResolutionImage {
    id: sprite
    anchors.left: pos == "right" ? parent.left : undefined
    anchors.right: pos == "left" ? parent.right : undefined
  }
}
