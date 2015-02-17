import QtQuick 2.3
import "."



Box {
    id: footer

    property alias message: _message
    
    // 0 = Default; 1 = Publishing
    property int mode: 0
    property bool paused: false

    signal publish
    signal pause
    signal stop
    signal reset

    implicitWidth: 200
    height: Constant.footerHeight

    Message {
        id: _message
        anchors.verticalCenter: parent.verticalCenter
    }

    Row {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            margins: Constant.marginMain
        }

        spacing: Constant.marginAlt


        Button {
            source: Constant.imageStop
            visible: mode === 1 ? true : false
            onClicked: footer.stop()
        }

        // Button {
        //     source: Constant.imagePause
        //     visible: mode === 1 ? true : false
        //     onClicked: footer.pause()
        // }

        Button {
            source: Constant.imageReset
            visible: mode == 0 ? true : false
            onClicked: footer.reset()
        }

        Button {
            source: Constant.imagePublish

            onClicked: footer.publish()

            /*
             * Disable publish-button
            */
            Rectangle {
                anchors.fill: parent
                color: "gray"
                opacity: 0.5
                visible: mode === 0 || paused ? false : true

                MouseArea {
                    // Steal focus from default button
                    anchors.fill: parent
                }
            }
        }
    }
}