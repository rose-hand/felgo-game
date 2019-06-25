import QtQuick 2.0
import Felgo 3.0
import QtQuick.Particles 2.12
import "../common"

//游戏的开始界面

BaseScene {
  id: menuScene

  signal levelScenePressed

  // 背景颜色
  Rectangle {
    id: background//背景矩形填充

    anchors.fill: parent.gameWindowAnchorItem
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#a1c4fd" }
        GradientStop { position: 1.0; color: "#c2e9fb" }
    }


    //粒子效果
    ParticleSystem {
         id: particleSystem;
         ImageParticle {
             source: "../../assets/backgroundImage/hot1.png"
             colorVariation:0.2
             rotation:15
             rotationVariation:5
             rotationVelocity:45
             rotationVelocityVariation:15
             entryEffect:ImageParticle.Fade
             system: particleSystem;
         }

         Emitter {
             emitRate: 20; lifeSpan: 1000
             velocity: PointDirection { y:20; yVariation: 50; }
             acceleration: PointDirection { y: 4 }
             size: 30; sizeVariation: 10
             width: 3000; height: 500
         }
    }
  }

  // 顶部图片和形式
    Rectangle {
      id: header
      width:400
      height: 95

      anchors.top: menuScene.gameWindowAnchorItem.top
      anchors.horizontalCenter: menuScene.gameWindowAnchorItem.horizontalCenter
//      anchors.left: menuScene.gameWindowAnchorItem.left
//      anchors.right: menuScene.gameWindowAnchorItem.right
      anchors.margins: 5

      // background color
      color: "#c2e9fb"

      radius: height / 4
      Text {
          id: headertext
          font.family: manuFont.name
          color: "blue"
          text: "Super Mrio World"
          font.pixelSize: 25
          anchors.centerIn: parent
      }

      // header image
//      MultiResolutionImage {
//        anchors.fill:parent.gameWindowAnchorItem
//        anchors.top: parent.top
//        anchors.left: parent.left
//        anchors.right: parent.right

//        anchors.topMargin: 10

//        source: "../../assets/backgroundImage/header.png"
//      }
    }



    BaseButton {
      id: playButton

//      image.source: "../../assets/button/start.png"
      Text {
          id: myText
          font.family: gameFont.name
          font.pixelSize: 20

          text: qsTr("PLAY")
          anchors.centerIn: parent
          color:"YELLOW"
      }

      width: 150
      height: 40

      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: header.bottom
      anchors.topMargin: 40

      color: "#cce6ff"

      radius: height / 2
      borderColor: "transparent"

      onClicked: gameWindow.state="select"
    }



    BaseButton {
      id: recordButton
      Text {
          id: recoderText
          font.family: gameFont.name
          font.pixelSize: 20

          text: qsTr("RECORD")
          anchors.centerIn: parent
      }

//      image.source: "../../assets/button/record.png"

      width: 150
      height: 40

      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: playButton.bottom
      anchors.topMargin: 30

      color: "#cce6ff"

      radius: height / 4
      borderColor: "transparent"

      onClicked: gameWindow.state="level"
    }

    BaseButton {
      id: continueButton
      Text {
          id: continuText
          font.family: gameFont.name
          font.pixelSize: 20

          text: qsTr("Coninue")
          anchors.centerIn: parent
          color:"BLUE"
      }
//      image.source: "../../assets/button/continue.png"

      width: 150
      height: 40

      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: recordButton.bottom
      anchors.topMargin: 30

      color: "#cce6ff"

      radius: height / 4
      borderColor: "transparent"

      onClicked: {
          gameData.load();
          if(gameData.level === 1){
              gameWindow.state="game1"
          }
          if(gameData.level === 2){
              gameWindow.state="game2"
          }
      }
    }

    MultiResolutionImage {
      id: musicButton
      source: "../../assets/ui/music.png"
      opacity: settings.musicEnabled ? 0.9 : 0.4

      anchors.top: header.bottom
      anchors.topMargin: 60
      anchors.left: parent.left
      anchors.leftMargin: 30

      MouseArea {
        anchors.fill: parent

        onClicked: {
          // switch between enabled and disabled
          if(settings.musicEnabled)
            settings.musicEnabled = false
          else
            settings.musicEnabled = true
        }
      }
    }

    MultiResolutionImage {
      id: soundButton

      // show sound_on or sound_off icon, depending on if sound is enabled or not
      source: settings.soundEnabled ? "../../assets/ui/sound_on.png" : "../../assets/ui/sound_off.png"
      // reduce opacity, if sound is disabled
      opacity: settings.soundEnabled ? 0.9 : 0.4

      anchors.top: musicButton.bottom
      anchors.topMargin: 20
      anchors.left: parent.left
      anchors.leftMargin: 30

      MouseArea {
        anchors.fill: parent

//        onClicked: {
//          // switch between enabled and disabled
//          if(settings.soundEnabled) {
//            settings.soundEnabled = false
//          }
//          else {
//            settings.soundEnabled = true

//            // play sound to signal, that sound is now on
//            audioManager.playSound("playerJump")
//          }
//        }
      }
    }

    // Felgo logo with link to website
    MultiResolutionImage {
      source: "../../assets/felgo-logo/felgo-logo.png"

      anchors.right: parent.right
      anchors.rightMargin: 30
      anchors.top: header.bottom
      anchors.topMargin: 100

      MouseArea {
        anchors.fill: parent
        onClicked: {
          nativeUtils.displayMessageBox(qsTr("Felgo"), qsTr("This game is built with Felgo. The source code is available in the free Felgo SDK - so you can build your own platformer in minutes!\n\nVisit Felgo.net now? \n(It contains a tutorial how to use the Felgo Level Editor to create your own platform game and more details)"), 2)
        }
      }
    }

}




