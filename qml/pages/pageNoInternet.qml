import QtQuick 2.0
import "../components"
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15

Item {
    id: item1

    Rectangle{
        id: rectangle
        anchors.fill: parent
        radius: 10
        color: "#27273a"

        CircularProgressBar {
            id: circularProgressBar
            width: 200
            height: 200
            opacity: 0
            text: "loading..."
            anchors.verticalCenter: parent.verticalCenter
            textShowValue: false
            anchors.horizontalCenter: parent.horizontalCenter
            value: 0
            textColor: "#ffffff"
            progressColor: "#55aaff"
            strokeBgWidth: 2
            enableDropShadow: false
            progressWidth: 4
            bgStrokeColor: "#33334c"
        }

        Label {
            id: labelNoInternet
            x: 348
            y: 215
            opacity: 1
            color: "#ffffff"
            text: qsTr("There is no Internet connection")
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
            font.bold: true
            font.pointSize: 16
            font.family: "Segoe UI"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: label1
            x: 342
            y: 206
            opacity: 0
            color: "#ffffff"
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:10pt; font-weight:600;\">Tente</span><span style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:10pt;\">:</span></p>\n<ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; -qt-list-indent: 1;\"><li style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:10pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Check internet cable</li>\n<li style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:10pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Reset the modem or router</li>\n<li style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:10pt;\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Connect to the Wi-Fi network again</li></ul></body></html>"
            anchors.verticalCenter: labelNoInternet.verticalCenter
            verticalAlignment: Text.AlignTop
            textFormat: Text.RichText
            anchors.horizontalCenterOffset: -28
            font.pointSize: 16
            font.family: "Segoe UI"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 50
            font.bold: false
        }

        Image {
            id: image
            x: 350
            y: 155
            width: 100
            height: 100
            opacity: 0
            anchors.verticalCenter: parent.verticalCenter
            source: "../../images/images/logo_white_100x100.png"
            anchors.verticalCenterOffset: -80
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 3000
                to: 3000
                from: 0
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 3000

        KeyframeGroup {
            target: circularProgressBar
            property: "value"
            Keyframe {
                value: 100
                frame: 1397
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: circularProgressBar
            property: "opacity"
            Keyframe {
                value: 1
                frame: 1299
            }

            Keyframe {
                value: 0
                frame: 1601
            }
        }

        KeyframeGroup {
            target: image
            property: "opacity"
            Keyframe {
                value: 0
                frame: 1499
            }

            Keyframe {
                value: 1
                frame: 1996
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: labelNoInternet
            property: "opacity"
            Keyframe {
                value: 0
                frame: 1697
            }

            Keyframe {
                value: 1
                frame: 2198
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: label1
            property: "opacity"
            Keyframe {
                value: 0
                frame: 1899
            }

            Keyframe {
                value: 1
                frame: 2396
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
    D{i:0;autoSize:true;formeditorColor:"#c0c0c0";height:580;width:800}D{i:19;property:"opacity";target:"labelNoInternet"}
D{i:6}
}
##^##*/
