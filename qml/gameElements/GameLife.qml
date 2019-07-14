import Felgo 3.0
import QtQuick 2.0

Rectangle{
    id:gamelife
    color: "#CAE1FF"
    radius: 5

    property int number: 3
    property alias text:lifeNumber.text
    signal deathSceneChanged
    Text {
        id: lifeText
        text:"Lives:"
        font.pixelSize: 10

    }
    Text {
        id: lifeNumber
        text:number
        anchors.left: lifeText.right
        font.pixelSize: 10
    }

    onNumberChanged: {
        if(number == 0){
            console.log(number)
            gameWindow.state="lost"
            //处理数据初始化
            number = 3

            //销毁实体


        }
    }


}

