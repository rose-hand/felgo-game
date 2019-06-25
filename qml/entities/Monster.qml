import QtQuick 2.0
import Felgo 3.0
import "../editorElements"

EntityBase {
    id: monster
    entityType: "monster"

    width: image.width
    height: image.height
    signal monstercontact

    // set image
    Image {
        id:image
        source: "../../assets/opponent/monster.png"
    }

    BoxCollider {
        id: collider

        // set the collider's size to fit to the sprite
        width: parent.width
        height: parent.height / 2 + 1

        // set position
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        // the bodyType is static
        bodyType: Body.Dynamic
        collisionTestingOnlyMode: false

        categories: Box.Category8
        collidesWith: Box.Category1 | Box.Category2 | Box.Category3
        fixture.onBeginContact: {
         monster.monstercontact()
    }
  }

    property int count: 0
    Timer{
        id: timer
        running: true
        repeat: true
        interval: 60
        onTriggered: {
            count++
            if(count%50>25)monster.x+=5
            else monster.x-=5
        }
    }
}
