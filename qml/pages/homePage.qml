import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../components"
import QtQuick.Timeline 1.0

Item {

    property bool showValue: true

    Flickable {
        id: flickable
        opacity: 0
        anchors.fill: parent
        contentHeight: gridLayout.height
        clip: true

        GridLayout {
            id: gridLayout
            columns: 1
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            columnSpacing: 10
            rows: 3

            Rectangle{
                id: card
                color: "#27273a"
                height: 220
                width: flickable.width
                radius: 10

                Rectangle {
                    id: whiteCard_1
                    width: 340
                    color: "#ffffff"
                    radius: 10
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10

                    Image {
                        id: iconCart
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.topMargin: 15
                        anchors.leftMargin: 15
                        height: 30
                        width: 30
                        visible: false
                        anchors.left: parent.left
                        anchors.top: parent.top
                        source: "../../images/svg_images/cart_icon.svg"
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }

                    ColorOverlay{
                        anchors.fill: iconCart
                        source: iconCart
                        color: "#7f7f7f"
                        antialiasing: false
                    }

                    Label {
                        id: labelTitleBar
                        x: 58
                        y: 20
                        color: "#767676"
                        text: qsTr("Credit Card")
                        font.bold: true
                        font.pointSize: 11
                        font.family: "Segoe UI"
                    }

                    Label {
                        id: labelTitleBar1
                        x: 15
                        y: 129
                        color: "#767676"
                        text: qsTr("Current")
                        font.pointSize: 10
                        font.family: "Segoe UI"
                    }

                    Label {
                        id: labelTitleBar2
                        x: 13
                        y: 138
                        color: "#55aaff"
                        text: qsTr("$ 3.605")
                        font.bold: true
                        font.pointSize: 20
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: labelTitleBar3
                        x: 14
                        y: 170
                        color: "#767676"
                        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Limit: <span style=\" font-weight:600; color:#55aa00;\">$ 6.500</span></p></body></html>"
                        textFormat: Text.RichText
                        font.pointSize: 10
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    CustomButton {
                        x: 227
                        y: 153
                        width: 108
                        height: 30
                        text: "ACCESS"
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 15
                        colorMouseOver: "#40405f"
                        colorPressed: "#55aaff"
                        colorDefault: "#33334c"
                        anchors.bottomMargin: 17
                    }

                    Rectangle {
                        id: hideValue_1
                        x: 8
                        y: 146
                        width: 187
                        height: 44
                        color: "#ebfcff"
                        radius: 5
                        visible: !showValue
                    }
                }

                Label {
                    id: labelContaInfo
                    y: 140
                    height: 50
                    opacity: 1
                    color: "#b907ff"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt; color:#ffffff;\">Gastos</span><span style=\" font-size:10pt; color:#da7dff;\">: gastos referentes ao mês de Dezembro </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt; color:#ffffff;\">Cartão final</span><span style=\" font-size:10pt; color:#da7dff;\">: XXX XXX XXX 1510 </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt; color:#ffffff;\">Bandeira</span><span style=\" font-size:10pt; color:#da7dff;\">: Master Card Platinium</span></p></body></html>"
                    anchors.left: whiteCard_1.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    verticalAlignment: Text.AlignBottom
                    anchors.rightMargin: 15
                    anchors.bottomMargin: 30
                    anchors.leftMargin: 40
                    font.bold: false
                    font.pointSize: 10
                    font.family: "Segoe UI"
                    font.weight: Font.Normal
                    textFormat: Text.RichText
                    anchors.topMargin: 5
                }

                Rectangle {
                    id: greenBar
                    height: 10
                    opacity: 0
                    color: "#55ff7f"
                    radius: 5
                    anchors.left: whiteCard_1.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    clip: true
                    anchors.topMargin: 30
                    anchors.rightMargin: 15
                    anchors.leftMargin: 400

                    Rectangle {
                        id: blueBar
                        x: 395
                        width: parent.width / 2
                        height: 10
                        color: "#55aaff"
                        radius: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 1
                        clip: true
                    }

                    Rectangle {
                        id: orangeBar
                        x: 10
                        y: 0
                        width: parent.width / 4
                        height: 10
                        color: "#ff5500"
                        radius: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        clip: true
                    }
                }

                GridLayout {
                    id: textsFatura
                    x: 402
                    y: 52
                    anchors.left: whiteCard_1.right
                    anchors.right: parent.right
                    anchors.top: greenBar.bottom
                    anchors.topMargin: 10
                    anchors.rightMargin: 15
                    anchors.leftMargin: 40
                    rows: 2
                    columns: 3

                    Label {
                        id: textValue_1
                        color: "#55ff7f"
                        text: qsTr("$ 6.500")
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.pointSize: 14
                        font.bold: true
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: textValue_2
                        color: "#55aaff"
                        text: qsTr("$ 3.605")
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.pointSize: 14
                        font.bold: true
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: textValue_3
                        color: "#ff5500"
                        text: qsTr("$ 2.805")
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.pointSize: 14
                        font.bold: true
                        font.family: "Segoe UI"
                        visible:  showValue
                    }

                    Label {
                        id: labelTitleBar20
                        color: "#ffffff"
                        text: qsTr("available")
                        font.pointSize: 9
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: false
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: labelTitleBar21
                        color: "#ffffff"
                        text: qsTr("current")
                        font.pointSize: 9
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: false
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: labelTitleBar22
                        color: "#ffffff"
                        text: qsTr("next")
                        font.pointSize: 9
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: false
                        font.family: "Segoe UI"
                        visible: showValue
                    }
                }

            }
            Rectangle{
                id: rectangle
                color: "#27273a"
                height: 220
                width: flickable.width
                radius: 10

                Rectangle {
                    id: whiteCard_2
                    width: 340
                    color: "#ffffff"
                    radius: 10
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    Image {
                        id: iconCart1
                        width: 30
                        height: 30
                        visible: false
                        anchors.left: parent.left
                        anchors.top: parent.top
                        source: "../../images/svg_images/moeda_icon.svg"
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.topMargin: 15
                        anchors.leftMargin: 15
                        antialiasing: false
                    }

                    ColorOverlay {
                        color: "#7f7f7f"
                        anchors.fill: iconCart1
                        source: iconCart1
                        antialiasing: false
                    }

                    Label {
                        id: labelTitleBar4
                        x: 58
                        y: 20
                        color: "#767676"
                        text: qsTr("WM Bank")
                        font.bold: true
                        font.family: "Segoe UI"
                        font.pointSize: 11
                    }

                    Label {
                        id: labelTitleBar5
                        x: 15
                        y: 129
                        width: 155
                        height: 17
                        color: "#767676"
                        text: qsTr("Balance")
                        font.family: "Segoe UI"
                        font.pointSize: 10
                    }

                    Label {
                        id: labelTitleBar6
                        x: 14
                        y: 137
                        color: "#55aaff"
                        text: qsTr("$ 5.605")
                        font.family: "Segoe UI"
                        font.pointSize: 20
                        font.bold: true
                        visible: showValue
                    }

                    Label {
                        id: labelTitleBar7
                        x: 15
                        y: 169
                        color: "#767676"
                        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Investiment: <span style=\" font-weight:600; color:#55aa00;\">$ 49.500</span></p></body></html>"
                        textFormat: Text.RichText
                        font.family: "Segoe UI"
                        font.pointSize: 10
                        visible: showValue
                    }

                    CustomButton {
                        x: 227
                        y: 153
                        width: 108
                        height: 30
                        text: "ACCESS"
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        colorMouseOver: "#40405f"
                        colorDefault: "#33334c"
                        anchors.rightMargin: 15
                        anchors.bottomMargin: 17
                        colorPressed: "#55aaff"
                    }

                    Rectangle {
                        id: hideValue_2
                        x: 8
                        y: 146
                        width: 187
                        height: 44
                        color: "#ebfcff"
                        radius: 5
                        visible: !showValue
                    }
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Label {
                    id: labelContaInfo1
                    height: 39
                    opacity: 1
                    color: "#b907ff"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt; color:#ffffff;\">Em azul</span><span style=\" font-size:10pt; color:#da7dff;\">: representa o valor atual em sua conta corrente </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt; color:#ffffff;\">Em verde</span><span style=\" font-size:10pt; color:#da7dff;\">: representa todos os seus investimentos</span></p></body></html>"
                    anchors.left: whiteCard_2.right
                    anchors.bottom: parent.bottom
                    verticalAlignment: Text.AlignBottom
                    anchors.bottomMargin: 30
                    font.family: "Segoe UI"
                    textFormat: Text.RichText
                    font.pointSize: 8
                    font.bold: false
                    font.weight: Font.Normal
                    anchors.leftMargin: 40
                    anchors.topMargin: 5
                }

                Rectangle {
                    id: greenBar1
                    height: 10
                    opacity: 0
                    color: "#55aaff"
                    radius: 5
                    anchors.left: whiteCard_2.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    clip: true
                    anchors.rightMargin: 15
                    anchors.leftMargin: 400
                    anchors.topMargin: 30
                    Rectangle {
                        id: blueBar1
                        x: 395
                        width: parent.width / 2 + parent.width / 3
                        height: 10
                        color: "#55ff7f"
                        radius: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        clip: true
                    }
                }

                GridLayout {
                    id: textsFatura1
                    anchors.left: whiteCard_2.right
                    anchors.right: parent.right
                    anchors.top: greenBar1.bottom
                    columns: 2
                    rows: 2
                    anchors.rightMargin: 15
                    anchors.leftMargin: 40
                    anchors.topMargin: 12
                    Label {
                        id: textValue_4
                        color: "#55aaff"
                        text: qsTr("$ 5.605")
                        font.pointSize: 14
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: true
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: textValue_5
                        color: "#55ff7f"
                        text: qsTr("$ 49.500")
                        font.pointSize: 14
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: true
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: labelTitleBar27
                        color: "#ffffff"
                        text: qsTr("balance")
                        font.pointSize: 9
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: false
                        font.family: "Segoe UI"
                        visible: showValue
                    }

                    Label {
                        id: labelTitleBar28
                        color: "#ffffff"
                        text: qsTr("investiment")
                        font.pointSize: 9
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.bold: false
                        font.family: "Segoe UI"
                        visible: showValue
                    }
                }
            }
            Rectangle{
                id: rectangle1
                color: "#27273a"
                height: 220
                width: flickable.width
                radius: 10

                Rectangle {
                    id: whiteCard_3
                    width: 340
                    color: "#ffffff"
                    radius: 10
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    Image {
                        id: iconCart2
                        width: 30
                        height: 30
                        visible: false
                        anchors.left: parent.left
                        anchors.top: parent.top
                        source: "../../images/svg_images/moeda_icon.svg"
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.leftMargin: 15
                        anchors.topMargin: 15
                        antialiasing: false
                    }

                    ColorOverlay {
                        color: "#33334c"
                        anchors.fill: iconCart2
                        source: iconCart2
                        antialiasing: false
                    }

                    Label {
                        id: labelTitleBar8
                        x: 58
                        y: 20
                        color: "#33334c"
                        text: qsTr("Rewards")
                        font.bold: true
                        font.family: "Segoe UI"
                        font.pointSize: 11
                    }

                    Label {
                        id: labelTitleBar9
                        x: 15
                        y: 129
                        width: 190
                        height: 17
                        color: "#767676"
                        text: qsTr("My points")
                        font.family: "Segoe UI"
                        font.pointSize: 10
                    }

                    Label {
                        id: textValue_6
                        x: 15
                        y: 169
                        color: "#767676"
                        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Points: <span style=\" font-weight:600; color:#55aa00;\">55.530</span></p></body></html>"
                        font.family: "Segoe UI"
                        textFormat: Text.RichText
                        font.pointSize: 10
                        visible: showValue
                    }

                    CustomButton {
                        x: 227
                        y: 153
                        width: 108
                        height: 30
                        text: "ACCESS"
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        colorMouseOver: "#40405f"
                        colorDefault: "#33334c"
                        anchors.bottomMargin: 17
                        anchors.rightMargin: 15
                        colorPressed: "#55aaff"
                    }

                    Label {
                        id: labelTitleBar10
                        x: 15
                        y: 146
                        width: 190
                        height: 17
                        color: "#767676"
                        text: qsTr("Rewards")
                        font.family: "Segoe UI"
                        font.pointSize: 10
                    }
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }

                Label {
                    id: labelTitleBar12
                    y: 60
                    color: "#ffffff"
                    text: qsTr("$ 1,00 = 1 Point")
                    anchors.left: whiteCard_3.right
                    font.bold: true
                    anchors.leftMargin: 37
                    font.family: "Segoe UI"
                    font.pointSize: 11
                }

                Label {
                    id: labelTitleBar13
                    x: 387
                    y: 86
                    color: "#ffffff"
                    text: qsTr("Buy and receive points")
                    anchors.left: whiteCard_3.right
                    font.bold: true
                    font.family: "Segoe UI"
                    font.pointSize: 11
                    anchors.leftMargin: 37
                }

                Label {
                    id: labelTitleBar14
                    x: 387
                    y: 105
                    color: "#ffffff"
                    text: qsTr("Some text here")
                    anchors.left: whiteCard_3.right
                    font.family: "Segoe UI"
                    font.pointSize: 10
                    anchors.leftMargin: 37
                }

                Label {
                    id: labelTitleBar15
                    x: 387
                    y: 124
                    color: "#ffffff"
                    text: qsTr("Another text")
                    anchors.left: whiteCard_3.right
                    font.family: "Segoe UI"
                    font.pointSize: 10
                    anchors.leftMargin: 37
                }

                Label {
                    id: labelTitleBar16
                    x: 387
                    y: 147
                    color: "#da7dff"
                    text: qsTr("Access now")
                    anchors.left: whiteCard_3.right
                    font.underline: true
                    font.family: "Segoe UI"
                    font.pointSize: 10
                    anchors.leftMargin: 37
                }
            }
        }
        ScrollBar.vertical: ScrollBar {
            id: control
            size: 0.3
            position: 0.2
            orientation: Qt.Vertical
            visible: flickable.moving || flickable.moving

            contentItem: Rectangle {
                implicitWidth: 6
                implicitHeight: 100
                radius: width / 2
                color: control.pressed ? "#55aaff" : "#40405f"
            }
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: flickable
            property: "opacity"
            Keyframe {
                frame: 550
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: greenBar
            property: "anchors.leftMargin"
            Keyframe {
                easing.bezierCurve: [0.254,0.00129,0.235,0.999,1,1]
                value: 40
                frame: 850
            }

            Keyframe {
                value: 400
                frame: 399
            }

            Keyframe {
                value: 400
                frame: 0
            }
        }

        KeyframeGroup {
            target: greenBar
            property: "opacity"
            Keyframe {
                value: 1
                frame: 650
            }

            Keyframe {
                value: 0
                frame: 399
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: greenBar1
            property: "anchors.leftMargin"
            Keyframe {
                easing.bezierCurve: [0.254,0.00129,0.235,0.999,1,1]
                value: 40
                frame: 998
            }

            Keyframe {
                value: 400
                frame: 548
            }

            Keyframe {
                value: 400
                frame: 0
            }
        }

        KeyframeGroup {
            target: greenBar1
            property: "opacity"
            Keyframe {
                value: 1
                frame: 749
            }

            Keyframe {
                value: 0
                frame: 547
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorColor:"#c0c0c0";height:800;width:800}D{i:65;property:"anchors.leftMargin";target:"greenBar"}
D{i:69;property:"opacity";target:"greenBar"}D{i:73;property:"anchors.leftMargin";target:"greenBar1"}
D{i:77;property:"opacity";target:"greenBar1"}D{i:58}
}
##^##*/
