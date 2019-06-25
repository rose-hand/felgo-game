import QtQuick 2.0
import Felgo 3.0
import QtQuick.Particles 2.12
import "../common"


BaseScene {
  id: selectScene

  // 背景颜色
  Rectangle {
    id: background//背景矩形填充

    anchors.fill: parent.gameWindowAnchorItem
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#a1c4fd" }
        GradientStop { position: 1.0; color: "#c2e9fb" }
    }
  }
  Rectangle {
    id: mainBar

    width: parent.gameWindowAnchorItem.width
    height: 40

    anchors.top: parent.gameWindowAnchorItem.top
    anchors.left: parent.gameWindowAnchorItem.left

    // background gradient
    gradient: Gradient {
      GradientStop { position: 0.0; color: "transparent" }
      GradientStop { position: 0.5; color: "#80ffffff" }
      GradientStop { position: 1.0; color: "transparent" }
    }
    BaseButton {
          id: game1Button
          MultiResolutionImage{
              id:selectImage
              source: "../../assets/backgroundImage/forest.jpg"
              anchors.fill: parent
          }
//          Text {
//              id: game1Text
//              font.family: gameFont.name
//              font.pixelSize: 30

//              text: qsTr("FOREST")
//              anchors.centerIn: parent
//          }
          width: 150
          height: 90

          anchors.horizontalCenter: parent.horizontalCenter
          anchors.top: parent.bottom
          anchors.topMargin: 40
          onClicked:
          {
              gameWindow.state="game1"
              gameData.level = 1
              gameData.save();
          }

      }

      BaseButton {
          id: game2Button
          MultiResolutionImage{
              id:selectImage2
              source: "../../assets/backgroundImage/solid.jpg"
              anchors.fill: parent
          }
//          Text {
//              id: game2Text
//              font.family: gameFont.name
//              font.pixelSize: 30

//              text: qsTr("DESERT")
//              anchors.centerIn: parent

          width: 150
          height: 90

          anchors.horizontalCenter: parent.horizontalCenter
          anchors.top: game1Button.bottom
          anchors.topMargin: 40
          onClicked: {
              gameWindow.state="game2"
              gameData.level = 2
              gameData.save();
          }

      }

    // back to menu button
    BaseButton {
      id: backButton
      Image {
          id: back
          source: "../../assets/ui/undo.png"
          anchors.fill: parent
      }
      width: 40
      height: 30

      anchors.verticalCenter: parent.verticalCenter
      anchors.right: parent.right
      anchors.rightMargin: 5

      // go back to MenuScene
      onClicked: {
          gameWindow.state="menu"
      }
    }

  }


}
