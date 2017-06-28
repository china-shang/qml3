import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import QtWebEngine 1.0
import com.mycompany.qmlcomponents 1.0
import QtQuick.Particles 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: root

    Image {
        anchors.centerIn: parent
        id: ba
        fillMode: Image.PreserveAspectCrop
        source: "/image/bg.png"
        Image {
            property int xwill
            property int ywill
            id: ball1
            x: 0
            y: 120
            height: 30
            width: 30
            source: "/image/baseball.png"
            rotation: 0
            ParallelAnimation {
                id: anim
                SequentialAnimation {

                    NumberAnimation {
                        target: ball1
                        property: "y"
                        to: 20
                        duration: 400
                        easing.type: Easing.OutElastic
                    }
                    NumberAnimation {
                        target: ball1
                        property: "y"
                        to: ball1.ywill
                        duration: 600
                        easing.type: Easing.OutBounce
                    }
                }
                RotationAnimation {
                    target: ball1
                    properties: "rotation"
                    from: 0
                    to: 720
                    duration: 1200
                }

                NumberAnimation {
                    target: ball1
                    property: "x"
                    to: ball1.xwill
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: {
                ball1.xwill = mouseX - 15
                ball1.ywill = mouseY - 15
                anim.start()
            }
        }
    }

    Emitter {
        anchors.centerIn: parent
        system: mysystem
        enabled: false
        width: 100
        group: "item1"
        height: 100
        emitRate: 4
        lifeSpan: 5000
        size: 30
        endSize: 10

        velocity: AngleDirection {
            angle: 0
            magnitude: 20
            magnitudeVariation: 0
        }
    }

    ParticleSystem {
        id: mysystem
        enabled: false
    }

    ItemParticle {
        system: mysystem
        groups: "item3"
        delegate: Rectangle {
            width: 10
            height: 10
            radius: 5
            border.color: "#cf4242"
            color: "green"
        }
    }
    Image {
        width: 50
        height: 50
        fillMode: Image.PreserveAspectFit
        focus: true
        source: "/image/baseball.png"
        id: ball
        rotation: (x + y)
        Keys.onRightPressed: {
            ball.x = ball.x + 300
            ball.rotation = ball.rotation - 120
        }
        Keys.onLeftPressed: {
            ball.x = ball.x - 300
        }

        Behavior on rotation {
            RotationAnimation {
                duration: 2000
            }
        }

        Behavior on x {
            enabled: true
            NumberAnimation {
                id: uncebehavior
                easing {
                    type: Easing.InOutElastic
                    amplitude: 100
                    period: 20
                }
                duration: 2000
            }
        }
        Behavior on y {
            animation: bouncebehavior
        }
        Behavior {
            ColorAnimation {
                target: ball
                duration: 1000
            }
        }
    }
    ItemParticle {
        system: mysystem
        groups: "item2"
        delegate: Rectangle {

            width: 10
            height: 10
            radius: 5
            color: "green"
        }
    }
    ImageParticle {
        id: ball_image
        system: mysystem
        source: "image/baseball.png"
        groups: "item1"
    }
    //    TrailEmitter {
    //        system: mysystem
    //        anchors.fill: parent
    //        group: "item2"
    //        follow: "item1"
    //        lifeSpan: 100
    //        emitRatePerParticle: 100
    //        velocity: AngleDirection{
    //            angle: 0
    //            magnitude: 40

    //        }

    //    }

    //    Attractor {
    //        system: mysystem
    //        anchors.fill: parent
    //        pointX: parent.width/2
    //        pointY: parent.height/2
    //        affectedParameter: Attractor.Velocity
    //        proportionalToDistance: Attractor.Quadratic
    //        strength: 0.01
    //    }

    ////    Attractor {
    ////        system: mysystem
    ////        anchors.fill: parent
    ////        pointX: parent.width/3
    ////        pointY: parent.height/2
    ////        affectedParameter: Attractor.Velocity
    ////        proportionalToDistance: Attractor.Quadratic
    ////        strength: 0.01
    ////    }
    ////    Friction {
    ////        anchors.fill: parent
    ////        system: mysystem
    ////        factor: 0.3
    ////        threshold: 20
    ////    }
    ////    Gravity { system: mysystem
    ////        anchors.fill: parent
    ////        magnitude: 50
    ////        angle: 90
    ////    }
    //    Turbulence {
    //        anchors.fill: parent
    //        system: particleSystem
    //        strength: 10000
    //    }

    //    Age {
    //        system: mysystem
    //        lifeLeft: 300

    //    }

    //    WebEngineView {
    //    anchors.fill: parent
    //    url: "http://www.baidu.com"
}
