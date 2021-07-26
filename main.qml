import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MsgServer 1.0

Window {
    id: win_root

    property real win_width: 640
    property real win_height: 480
    property real win_minWidth: 200
    property real win_minHeight: 100
    property real origin_x: Screen.width/2-win_width/2
    property real origin_y: Screen.height/2-win_height/2

    width: win_width
    height: win_height
    x: origin_x
    y: origin_y
    visible: true
    title: active ? qsTr("监视器 (Ctrl+Q退出)") : qsTr("监视器")

    flags: Qt.WindowStaysOnTopHint

    Behavior on x{
        NumberAnimation {duration: 500}
    }
    Behavior on y{
        NumberAnimation {duration: 500}
    }

    Behavior on width{
        NumberAnimation {duration: 500}
    }
    Behavior on height{
        NumberAnimation {duration: 500}
    }
    Behavior on opacity {
        NumberAnimation {duration: 500}
    }

    onActiveChanged: {
        if(active) {
            win_root.x = origin_x
            win_root.y = origin_y
            win_root.width = 640
            win_root.height = 480
            win_root.opacity = 1.0
        }
        else{
            win_root.x = Screen.width-win_minWidth
            win_root.y = Screen.height/2-win_minHeight/2
            win_root.width = win_minWidth
            win_root.height = win_minHeight
            win_root.opacity = 0.75
        }
    }

    Server{
        id: server
        Component.onCompleted: start()
    }

    Text{
        id: msgText
        font.pixelSize: 20
        anchors.centerIn: parent
        text: qsTr(server.msg)
    }

    Action{
        shortcut: "Ctrl+Q"
        onTriggered: {
            Qt.quit()
        }
    }
}
