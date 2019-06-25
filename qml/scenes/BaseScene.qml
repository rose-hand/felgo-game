import QtQuick 2.0
import Felgo 3.0

Scene {
  // the "logical size" - the scene content is auto-scaled to match
  // the gameWindow's size (逻辑大小” - 场景内容自动缩放以匹配游戏窗口的大小)
  width: 480
  height: 320

  // by default, set the opacity to 0
  // We handle this property from PlatformerMain via PropertyChanges (默认情况下，将不透明度设置为0，我们通过PropertyChanges从PlatformerMain处理此属性)
  opacity: 0

  // the scene is only visible if the opacity is > 0
  // this improves the performance
  visible: opacity > 0

  // only enable scene if it is visible
  enabled: visible
}
