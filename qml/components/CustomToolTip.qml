import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

ToolTip{
    id: control
    visible: parent.hovered
    delay: 500
    timeout: 3000
    text: qsTr("")
    rightPadding: 10
    leftPadding: 10
    contentItem: Text{
        text: control.text
        font: control.font
        color: "#d9dce1"
    }

    background: Rectangle{
        color: "#222327"
        border.color: "#36373d"
        border.width: 1
        radius: 5
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
