import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

TextField {
    id: textField

    // Custom Properties
    property color colorDefault: "#1d1d2b"
    property color colorOnFocus: "#40405f"
    property color colorMouseOver: "#33334c"
    property color borderColor: "#33334c"
    property int borderWidth: 3

    QtObject{
        id: internal

        property var dynamicColor: if(textField.focus){
                                        textField.focus ? colorOnFocus : colorDefault
                                   }else{
                                       textField.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 300
    implicitHeight: 40
    placeholderText: qsTr("Type something")
    color: "#ffffff"
    background: Rectangle {
        color: internal.dynamicColor
        radius: 10
        border.color: borderColor
        border.width: borderWidth
    }

    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#55aaff"
    placeholderTextColor: "#55aaff"
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:640}
}
##^##*/
