import Felgo 3.0
import QtQuick 2.0
import "../scenes"

BaseScene{
    id:winscene
    Rectangle{
        id:backgroundImage
        anchors.fill: parent.gameWindowAnchorItem
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#a1c4fd" }
            GradientStop { position: 1.0; color: "#c2e9fb" }
        }

        Text{
            id:winText
            text: "You   win!"
            anchors.centerIn: parent
        }



    }




}
