import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../entities"
import "../levels"
import "../gameElements"

BaseScene {   
    id: game1Scene
    gridSize: 32


    property int offsetBeforeScrollingStarts: 240

    Rectangle {
        id:background
        anchors.fill: gameWindowAnchorItem
        Image {
            id: backgroundimage
            source: "../../assets/backgroundImage/bg_forest.png"
            anchors.fill: parent
        }
        Rectangle {
            id:insidebackground1
            //            anchors.fill: game1Sence.gameWindowAnchorItem
            Row {
                MultiResolutionImage {
                    id: soft1

                    source: "../../assets/backgroundImage/soft.png"
                    width: 80
                    height: 50
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                }
                MultiResolutionImage {
                    id: soft2

                    source: "../../assets/backgroundImage/soft.png"
                    width: 70
                    height: 50
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.left: soft1.right
                    anchors.leftMargin: 50
                }
                MultiResolutionImage {
                    id: soft3

                    source: "../../assets/backgroundImage/soft.png"
                    width: 90
                    height: 60
                    anchors.top: parent.top
                    anchors.topMargin: 70
                    anchors.left: soft2.right
                    anchors.leftMargin: 50
                }
                MultiResolutionImage {
                    id: soft4

                    source: "../../assets/backgroundImage/soft.png"
                    width: 90
                    height: 60
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    anchors.left: soft3.right
                    anchors.leftMargin: 60
                }
                MultiResolutionImage {
                    id: soft5

                    source: "../../assets/backgroundImage/soft.png"
                    width: 90
                    height: 60
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.left: soft4.right
                    anchors.leftMargin: 80
                }
                MultiResolutionImage {
                    id: soft6

                    source: "../../assets/backgroundImage/soft.png"
                    width: 90
                    height: 60
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    anchors.left: soft5.right
                    anchors.leftMargin: 80
                }
            }
        }
    }


    Item {
        id: viewPort
        height: level.height
        width: level.width
        anchors.bottom: game1Scene.gameWindowAnchorItem.bottom
        x: player.x > offsetBeforeScrollingStarts ? offsetBeforeScrollingStarts-player.x : 0

        PhysicsWorld {
            id: physicsWorld
            gravity: Qt.point(0, 25)
            debugDrawVisible: false
            z: 1000

        }

        // 加载你的组件
        ForestLevel {
            id: level
        }

        Player {
            id: player
            x: -10
            y: 10
        }


        Finish {
            id: finish
            x:1900
            y:565
        }
        Stone {
            id:stone
            x:  160 //(32*9)
            y: 576  //(32*18)
            onContact2: {
                player.x = 0
                player.y = 0
                music.selectSound("playdiesound")
            }
        }
        Mushroom{
            id:mushroom
            x:0
            y:576
        }
        Monster {
            id: monster
            x: 600
            y: 576  //(32*18)
            onMonstercontact: {
                player.x = 0
                player .y =0
            }

        }
        Monster{
            id:monster2
            x:800
            y:320
            onMonstercontact: {
                player.x=0
                player.y=0

            }
        }
        Monster{
            id:monster3
            x:1600
            y:550
            onMonstercontact: {
                player.x=0
                player.y=0

            }
        }
        Spikes {
            id: spikes
            x: 288
            y: 576  //(32*18)
            size: 3
            onContact3: {
                player.x = 0
                player.y = 0
            }
        }
        Spikes {
            id: spikes2
            x: 320
            y: 576  //(32*18)
            size: 3
            onContact3: {
                player.x = 0
                player.y = 0
            }
        }
        Spikes {
            id: spikes3
            x: 1000
            y: 576  //(32*18)
            size: 3
            onContact3: {
                player.x = 0
                player.y = 0
            }
        }
        Spikes {
            id: spikes4
            x: 1400
            y: 565  //(32*18)
            size: 3
            onContact3: {
                player.x = 0
                player.y = 0
            }
        }
        Coins{
            id:coin1
            x:100
            y:580

        }
        Coins{
            id:coin2
            x:160
            y:550

        }
        Coins{
            id:coin3
            x:220
            y:350


        }
        Coins{
            id:coin4
            x:1370
            y:370}
        Coins{
            id:coin5
            x:1420
            y:380}
        Coins{
            id:coin6
            x:350
            y:350}
        Coins{
            id:coin7
            x:400
            y:420}
        Coins{
            id:coin8
            x:1500
            y:460}
        Coins{
            id:coin9
            x:1550
            y:450}
        Coins{
            id:coin10
            x:490
            y:490}
        Coins{
            id:coin11
            x:580
            y:460}
        Coins{
            id:coin11a
            x:690
            y:430}
        Coins{
            id:coin12
            x:760
            y:520}
        Coins{
            id:coin13
            x:880
            y:350}
        Coins{
            id:coin14
            x:1050
            y:400}
        Coins{
            id:coin15
            x:1660
            y:350}
        Coins{
            id:coin16
            x:1750
            y:350}
        Coins{
            id:coin18
            x:1200
            y:380}
        Coins{
            id:coin19
            x:1770
            y:400}
        Coins{
            id:coin20
            x:300
            y:420}






        ResetSensors {
            width: player.width
            height: 10
            x: player.x
            anchors.bottom: viewPort.bottom
            // if the player collides with the reset sensor, he goes back to the start
            onContact: {
                player.x = 0
                player.y = 0
                music.selectSound("playdiesound")
            }
        }


    }
    Rectangle {

        anchors.right: parent.right

        anchors.bottom: parent.bottom
        height: 50
        width: 150
        color: "#CAE1FF"
        Image {
            id: left
            height: 32
            width: 64
            source: "../../assets/right_left/left.jpg"
            anchors.left: parent.left
            anchors.verticalCenter: parent

        }
        Image {
            id: right
            height: 32
            width: 64
            source: "../../assets/right_left/right.jpg"
            anchors.right: parent.right
            anchors.verticalCenter: parent

        }
        opacity: 0.5

        Rectangle {
            anchors.centerIn: parent
            width: 1
            height: parent.height
            color: "white"
            visible: false
        }
        MultiPointTouchArea {
            anchors.fill: parent
            onPressed: {
                if(touchPoints[0].x < width/2)
                    controller.xAxis = -1
                else
                    controller.xAxis = 1
            }
            onUpdated: {
                if(touchPoints[0].x < width/2)
                    controller.xAxis = -1
                else
                    controller.xAxis = 1
            }
            onReleased: controller.xAxis = 0
        }

    }
    TimeScene{
        id:timeScene
        width:40
        height:18
        opacity: 0.2
    }

    CoinsScoreScene{
        id:scoreRectangle
        width: 40
        height: 18
        opacity: 0.2
        anchors.left: timeScene.right

    }
    GameLife{
        id:gameLife
        width: 32
        height: 27
        opacity: 1
        anchors.left: scoreRectangle.right
        anchors.margins: 20
    }
    Timer {
        id: updateTimer

        interval: 2000

        running: true
        repeat: true

        onTriggered:{
            timeScene.size++

        }
    }
    BaseButton {
        id: backButton
        Image {
            id: back
            source: "../../assets/ui/home.png"
            anchors.fill: parent
        }
        width: 40
        height: 30

        anchors.top: parent.gameWindowAnchorItem.top
        anchors.right: parent.gameWindowAnchorItem.right
        anchors.rightMargin: 5

        // go back to MenuScene
        onClicked: gameWindow.state="menu"
    }
    Rectangle {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        height: 100
        width: 100
        color: "green"
        opacity: 0.2

        Text {
            anchors.centerIn: parent
            text: "jump"
            color: "white"
            font.pixelSize: 15
        }
        MouseArea {
            anchors.fill: parent
            onPressed: player.jump()
        }
    }

    Keys.forwardTo: controller
    TwoAxisController {
        id: controller
        onInputActionPressed: {
            console.debug("key pressed actionName " + actionName)
            if(actionName == "up") {
                player.jump()
            }
            if(actionName=="left"){
                player.image.source="../../assets/player/playerleft.png"
            }
            if(actionName=="right"){
                player.image.source="../../assets/player/playerright.png"
            }
        }
    }
}

