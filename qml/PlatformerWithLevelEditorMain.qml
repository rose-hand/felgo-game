import Felgo 3.0
import QtQuick 2.0
import "scenes"
import JsonData 1.0
import "common"
GameWindow {
  id: gameWindow

  screenWidth: 960
  screenHeight: 640

  GameData{
      id:gameData
  }

  FontLoader{
      id:gameFont
      source: "../assets/PaybAck.ttf"
  }
  FontLoader{
      id:manuFont
      source:"../assets/fonts/DK Jambo.otf"
}

  MenuScene {
    id: menuScene
    onBackButtonPressed: {
      nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
   }
  }
  SelectScene{
    id: selectScene
  }
  GameScene{
     id:game1Scene
  }
  DesertScene{
      id:game2Scene
  }


 WinScene{
     id:winscene

 }
 BaseMusicals{
     id:music
 }

//  SelectScene{
//      id:selectscene

   state: "menu"


   //this state machine handles the transition between scenes
  states: [
    State {
      name: "menu"
      PropertyChanges {target: menuScene; opacity: 1}
      PropertyChanges {target: gameWindow; activeScene: menuScene}
      StateChangeScript{script: music.selectMusics()}
    },
      State {
        name: "select"
        PropertyChanges {target: selectScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: selectScene}
        StateChangeScript{script: music.selectMusics()}

      },
    State {
      name: "game1"
      PropertyChanges {target: game1Scene; opacity: 1}
      PropertyChanges {target: gameWindow; activeScene: game1Scene}
      StateChangeScript{script: music.selectMusics()}
    },
      State{
          name:"game2"
          PropertyChanges {target: game2Scene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: game2Scene}
          StateChangeScript{script: music.selectMusics()}
      },

      State{
          name:"win"
          PropertyChanges {target: winscene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: winscene}

      }
 ]

}
