import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components"
import "pages"

Window {
    width: 1200
    height: 720
    minimumWidth: 1100
    minimumHeight: 650
    visible: true
    color: "#00000000"
    id: mainWindow
    title: qsTr("WM BANK")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Text Edit Properties
    property alias actualPage: stackView.currentItem
    property bool isValueVisible: true
    property int windowStatus: 0
    property int windowMargin: 10
    property int bgRadius: 20

    // Internal functions
    QtObject{
        id: internal

        function resetResizeBorders(){
            // Resize visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeApp.visible = true
            bg.radius = bgRadius
            bg.border.width = 3
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                // Resize visibility
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeApp.visible = false
                bg.radius = 0
                bg.border.width = 0
                btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                bg.border.width = 3
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                bg.border.width = 3
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            bg.radius = bgRadius
            // Resize visibility
            internal.resetResizeBorders()
            bg.border.width = 3
            btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        opacity: 0
        color: "#1d1d2b"
        radius: 20
        border.color: "#33334c"
        border.width: 3
        anchors.fill: parent
        anchors.margins: windowMargin
        clip: true
        z: 1

        TopBarButton {
            id: btnClose
            x: 1140
            visible: true
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 8
            btnColorClicked: "#55aaff"
            btnColorMouseOver: "#ff007f"
            anchors.topMargin: 8
            btnIconSource: "../images/svg_images/close_icon.svg"
            CustomToolTip {
                text: "Sair"
            }
            onPressed: mainWindow.close()
        }

        TopBarButton {
            id: btnMaximizeRestore
            x: 1105
            visible: true
            anchors.right: btnClose.left
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.topMargin: 8
            btnColorMouseOver: "#40405f"
            btnColorClicked: "#55aaff"
            btnIconSource: "../images/svg_images/maximize_icon.svg"
            CustomToolTip {
                text: "Maximizar"
            }
            onClicked: internal.maximizeRestore()
        }

        TopBarButton {
            id: btnMinimize
            x: 1070
            visible: true
            anchors.right: btnMaximizeRestore.left
            anchors.top: parent.top
            btnRadius: 17
            anchors.rightMargin: 0
            btnColorClicked: "#55aaff"
            btnColorMouseOver: "#40405f"
            anchors.topMargin: 8
            btnIconSource: "../images/svg_images/minimize_icon.svg"
            CustomToolTip {
                text: "Minimizar"
            }
            onClicked: {
                mainWindow.showMinimized()
                internal.restoreMargins()
            }
        }

        Rectangle {
            id: titleBar
            height: 40
            color: "#33334c"
            radius: 14
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 120
            anchors.leftMargin: 8
            anchors.topMargin: 8

            DragHandler { onActiveChanged: if(active){
                   mainWindow.startSystemMove()
                   internal.ifMaximizedWindowRestore()
                }
            }

            Image {
                id: iconTopLogo
                y: 5
                width: 20
                height: 20
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: "../images/images/logo_white_30x30.png"
                sourceSize.height: 20
                sourceSize.width: 20
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: labelTitleBar
                y: 14
                color: "#ffffff"
                text: qsTr("WM Bank - Hi, Wanderson")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: iconTopLogo.right
                font.pointSize: 12
                font.family: "Segoe UI"
                anchors.leftMargin: 15
            }
        }

        Flickable {
            id: flickable
            height: 106
            contentWidth: gridLayoutBottom.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 15
            anchors.leftMargin: 15
            anchors.bottomMargin: 4
            clip: true

            GridLayout {
                id: gridLayoutBottom
                columns: 100
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                columnSpacing: 10
                rows: 0

                CustomAppButton{
                    text: "Pix"
                    setIcon: "../images/svg_images/pix_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Pay"
                    setIcon: "../images/svg_images/codebar_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Send Friends"
                    setIcon: "../images/svg_images/indicar_amigos_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Send Money"
                    setIcon: "../images/svg_images/transferir_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Values"
                    setIcon: "../images/svg_images/depositar_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Loan"
                    setIcon: "../images/svg_images/emprestimos_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Virtual Card"
                    setIcon: "../images/svg_images/virtual_cart_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Cell Phone Credits"
                    setIcon: "../images/svg_images/smartphone_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Limits"
                    setIcon: "../images/svg_images/adjustments_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Block Card"
                    setIcon: "../images/svg_images/lock_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Demand"
                    setIcon: "../images/svg_images/cobrar_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Installment"
                    setIcon: "../images/svg_images/dividir_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Donate"
                    setIcon: "../images/svg_images/emprestimos_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                CustomAppButton{
                    text: "Help"
                    setIcon: "../images/svg_images/help_icon.svg"
                    font.pointSize: 9
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }
            }
            ScrollBar.horizontal: ScrollBar {
                id: control
                size: 0.3
                position: 0.2
                orientation: Qt.Horizontal
                visible: flickable.moving || flickable.moving

                contentItem: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 6
                    radius: height / 2
                    color: control.pressed ? "#55aaff" : "#40405f"
                }
            }
        }

        Column {
            id: columnCircularButtons
            width: 50
            anchors.left: parent.left
            anchors.top: titleBar.bottom
            anchors.bottom: flickable.top
            spacing: 5
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.leftMargin: 15

            CustomCircularButton {
                id: btnHome
                width: 50
                height: 50
                visible: true
                CustomToolTip {
                    text: "Página inicial"
                }
                btnIconSource: "../images/svg_images/home_icon.svg"
                onClicked: {
                    stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                    actualPage.showValue = isValueVisible
                }
            }
            CustomCircularButton {
                id: btnSettings
                width: 50
                height: 50
                visible: true
                CustomToolTip {
                    id: settingsTooltip
                    text: "Configurações da conta"
                }
                btnIconSource: "../images/svg_images/settings_icon.svg"
                onClicked: {
                    animationMenu.running = true
                    if(leftMenu.width == 0){
                        btnSettings.btnIconSource = "../images/svg_images/close_icon_2.svg"
                        settingsTooltip.text = "Ocultar configurações"
                    } else {
                        btnSettings.btnIconSource = "../images/svg_images/settings_icon.svg"
                        settingsTooltip.text = "Configurações da conta"
                    }
                }
            }
            CustomCircularButton {
                id: btnShowHide
                visible: true
                width: 50
                height: 50
                CustomToolTip {
                    text: "Ocultar valores da conta"
                }
                btnIconSource: "../images/svg_images/eye_open_icon.svg"
                onClicked: {
                    if(isValueVisible == true){
                        isValueVisible = false
                        if(typeof actualPage.showValue !== 'undefined'){
                            actualPage.showValue = isValueVisible
                        }
                        btnShowHide.btnIconSource = "../images/svg_images/eye_close_icon.svg"
                    } else{
                        isValueVisible = true
                        if(typeof actualPage.showValue !== 'undefined'){
                            actualPage.showValue = isValueVisible
                        }
                        btnShowHide.btnIconSource = "../images/svg_images/eye_open_icon.svg"
                    }
                }
            }
        }

        Rectangle {
            id: leftMenu
            width: 0
            color: "#00000000"
            border.color: "#00000000"
            border.width: 0
            anchors.left: columnCircularButtons.right
            anchors.top: titleBar.bottom
            anchors.bottom: flickable.top
            clip: true
            anchors.bottomMargin: 10
            anchors.leftMargin: 5
            anchors.topMargin: 10

            PropertyAnimation{
                id: animationMenu
                target: leftMenu
                property: "width"
                to: if(leftMenu.width == 0) return 240; else return 0
                duration: 800
                easing.type: Easing.InOutQuint
            }

            Image {
                id: imageQrCode
                width: 110
                height: 110
                source: "../images/svg_images/qr-code.svg"
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.width: 110
                sourceSize.height: 110
            }

            Label {
                id: labelContaInfo
                x: 39
                opacity: 1
                color: "#55aaff"
                text: "WM BANK - BY: WANDERSON"
                anchors.top: imageQrCode.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                textFormat: Text.RichText
                anchors.horizontalCenterOffset: 0
                font.family: "Segoe UI"
                anchors.topMargin: 10
                font.bold: false
                font.weight: Font.Normal
                font.pointSize: 8
            }

            Column {
                id: columnMenus
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelContaInfo.bottom
                anchors.bottom: parent.bottom
                LeftButton {
                    text: "Help"
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                LeftButton {
                    text: "Profile"
                    btnIconSource: "../images/svg_images/user_icon.svg"
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                LeftButton {
                    text: "Settings"
                    btnIconSource: "../images/svg_images/moeda_icon.svg"
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                LeftButton {
                    text: "Credit Card"
                    btnIconSource: "../images/svg_images/cart_icon.svg"
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                LeftButton {
                    text: "Business"
                    btnIconSource: "../images/svg_images/home_PJ_icon.svg"
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }

                LeftButton {
                    text: "Messages"
                    btnIconSource: "../images/svg_images/message_icon.svg"
                    onClicked: stackView.push("pages/pageNoInternet.qml")
                }
                anchors.topMargin: 10
            }

            CustomButton {
                width: 220
                height: 30
                text: "DESCONECTAR"
                anchors.bottom: parent.bottom
                colorPressed: "#55aaff"
                colorMouseOver: "#40405f"
                colorDefault: "#33334c"
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: contentPages
            color: "#00000000"
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.top: titleBar.bottom
            anchors.bottom: flickable.top
            anchors.rightMargin: 15
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10

            StackView {
                id: stackView
                anchors.fill: parent
                clip: true
                initialItem: Qt.resolvedUrl("pages/homePage.qml")
            }
        }

    }

    DropShadow{
        id: dropShadowBG
        opacity: 0
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#40000000"
        z: 0
    }


    MouseArea {
        id: resizeLeft
        width: 12
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.leftMargin: 0
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: resizeRight
        width: 12
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 25
        anchors.leftMargin: 6
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 12
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeVerCursor
        anchors.rightMargin: 25
        anchors.leftMargin: 15
        anchors.bottomMargin: 0
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.BottomEdge) }
        }
    }

    MouseArea {
        id: resizeApp
        x: 1176
        y: 697
        width: 25
        height: 25
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        cursorShape: Qt.SizeFDiagCursor
        DragHandler{
            target: null
            onActiveChanged: if (active){
                                 mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
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
            target: bg
            property: "opacity"
            Keyframe {
                frame: 949
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: dropShadowBG
            property: "opacity"
            Keyframe {
                frame: 949
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }
    }
}
