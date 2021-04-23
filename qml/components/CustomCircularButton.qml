import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnTopBar
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/settings_icon.svg"
    property color btnColorDefault: "#33334c"
    property color btnColorMouseOver: "#40405f"
    property color btnColorClicked: "#55aaff"
    property int btnRadius: 25

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    width: 50
    height: 50

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: btnRadius
        anchors.fill: parent
        anchors.margins: 3

        Image {
            id: iconBtn
            source: btnIconSource
            sourceSize.height: 22
            sourceSize.width: 22
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: true
        }
    }
}



/*##^##
Designer {
    D{i:0;height:50;width:50}
}
##^##*/
