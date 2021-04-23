import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button

    // Custom Properties
    property color colorDefault: "#1d1d2b"
    property color colorMouseOver: "#40405f"
    property color colorPressed: "#55aaff"
    property url btnIconSource: "../../images/svg_images/help_icon.svg"

    QtObject{
        id: internal

        property var dynamicColor: if(button.down){
                                       button.down ? colorPressed : colorDefault
                                   }else{
                                       button.hovered ? colorMouseOver : colorDefault
                                   }
    }
    implicitWidth: 240
    implicitHeight: 40
    text: qsTr("Button")
    font.pointSize: 9
    font.family: "Segoe UI"
    contentItem: Item{
        id: item1
        Text {
            id: name
            text: button.text
            font: button.font
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 37
        }
        Image {
            id: iconBtn
            sourceSize.height: 24
            sourceSize.width: 24
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: btnIconSource
            anchors.leftMargin: 5
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }
        Image {
            id: iconArrow
            sourceSize.height: 18
            sourceSize.width: 18
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            source: "../../images/svg_images/arrow_left_menu.svg"
            anchors.rightMargin: 3
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }

    }

    background: Rectangle{
        color: "#00000000"
        radius: 0
        border.color: "#33334c"

        Rectangle{
            anchors.fill: parent
            anchors.bottomMargin: 1
            anchors.topMargin: 0
            color: internal.dynamicColor
        }
    }
}
/*##^##
Designer {
    D{i:0;height:40;width:240}
}
##^##*/
