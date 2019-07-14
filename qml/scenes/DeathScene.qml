import Felgo 3.0
import QtQuick 2.0
import "../common"
BaseScene{
    id:deathscene
    Rectangle{
        id:backgroundImage
        anchors.fill: parent.gameWindowAnchorItem
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#a1c4fd" }
            GradientStop { position: 1.0; color: "#c2e9fb" }
        }
        BaseButton {
          id: backButton
          Image {
              id: back
              source: "../../assets/ui/undo.png"
              anchors.fill: parent
          }
          width: 40
          height: 30

          anchors.top: parent.top
          anchors.right: parent.right
          anchors.rightMargin: 5

          // go back to MenuScene
          onClicked: gameWindow.state="menu"
        }

        Text{
            id:winText
            text: "You have dead!"
            anchors.centerIn: parent
        }



    }
}
