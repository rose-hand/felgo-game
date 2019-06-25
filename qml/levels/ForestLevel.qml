import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "../scenes"
import "." as Levels

Levels.LevelBase {
    id: level
    // we need to specify the width to get correct debug draw for our physics
    // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
    // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
    width: 960 // 42 because our last tile is a size 30 Ground at row 12
    height: 640
    // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size
    Ground {
        row: 0
        column: 0
        size: 30
    }
    Ground {
        row: 40
        column: 0
        size: 20
    }

    Groundflower {
        row: 8
        column: 1
        size: 3
    }
    Groundflower {
        row: 15
        column: 1
        size: 2
    }
    Groundflower {
        row: 18
        column: 1
        size: 1
    }
    Groundflower {
        row: 20
        column: 1
        size: 3
    }

    Platform {
        row: 2
        column: 3
        size: 4
    }
    Platform {
        row: 8
        column: 5
        size: 3
    }
    Platform {
        row: 13
        column: 4
        size: 2
    }
    Platform {
        row: 17
        column: 3
        size: 3
    }
    Platform {
        row: 23
        column: 3
        size: 3
    }
    Platform {
        row: 31
        column: 4
        size: 3
    }
    Platform {
        row: 36
        column: 3
        size: 4
    }
    Platform {
        row: 40
        column: 5
        size: 3
    }
    Platform {
        row: 45
        column: 4
        size: 3
    }
    Platform {
        row: 50
        column: 3
        size: 3
    }
    Platform {
        row: 54
        column: 5
        size: 3
    }

    Background {
        row: 0
        column: 0
        size: 60
    }

    Background1 {
        row: 1
        column: 2
        size: 7
    }
    Background1 {
        row: 12
        column: 2
        size: 3
    }
    Background1 {
        row: 17
        column: 2
        size: 1
    }
    Background1 {
        row: 25
        column: 2
        size: 4
    }
//    Spikes {
//        id: spikes
//        row: 12
//        column: 3
//        size: 3
//    }
//    Stone {
//        id: stone
//        row: 5
//        column: 1
//    }
//    Monster {
//        id: monster
//        x: 500
//        y: 576  //(32*18)

//    }

}
