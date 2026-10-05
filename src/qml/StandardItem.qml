/*
 * Copyright (C) 2021-2026 CutefishOS Team.
 *
 * macOS Inset Grouped Row Item (Authentic macOS Ventura / Sonoma styling)
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import FishUI 1.0 as FishUI

Item {
    id: rootItem

    implicitHeight: Math.max(44, mainLayout.implicitHeight + 8)

    property alias key: keyLabel.text
    property alias title: keyLabel.text
    property alias value: valueLabel.text
    property alias description: descLabel.text
    property alias subtitle: descLabel.text
    property bool showChevron: false
    property alias showArrow: rootItem.showChevron
    property bool showSwitch: false
    property bool checked: false
    property var control: null

    signal clicked()

    Layout.fillWidth: true

    Rectangle {
        id: background
        anchors.fill: parent
        color: itemMouse.containsMouse && (rootItem.showChevron || rootItem.showSwitch)
               ? (FishUI.Theme.darkMode ? Qt.rgba(1, 1, 1, 0.05) : Qt.rgba(0, 0, 0, 0.03))
               : "transparent"
        radius: 6
    }

    MouseArea {
        id: itemMouse
        anchors.fill: parent
        hoverEnabled: rootItem.showChevron || rootItem.showSwitch
        enabled: rootItem.showChevron || rootItem.showSwitch
        onClicked: {
            if (rootItem.showSwitch) {
                switchControl.checked = !switchControl.checked
                rootItem.checked = switchControl.checked
            }
            rootItem.clicked()
        }
    }

    RowLayout {
        id: mainLayout
        anchors.fill: parent
        spacing: 10

        ColumnLayout {
            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            spacing: 2

            Label {
                id: keyLabel
                color: FishUI.Theme.textColor
                font.pointSize: FishUI.Theme.fontSize
                font.weight: Font.Medium
                elide: Text.ElideRight
            }

            Label {
                id: descLabel
                text: ""
                visible: text.length > 0
                color: FishUI.Theme.disabledTextColor
                font.pointSize: FishUI.Theme.smallFont.pointSize
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }

        Item {
            Layout.fillWidth: true
            visible: !customLoader.visible && valueLabel.text.length === 0
        }

        Label {
            id: valueLabel
            color: FishUI.Theme.disabledTextColor
            font.pointSize: FishUI.Theme.fontSize
            Layout.alignment: Qt.AlignVCenter
            elide: Text.ElideRight
            visible: text.length > 0
        }

        // Custom control embedded if provided
        Loader {
            id: customLoader
            Layout.alignment: Qt.AlignVCenter
            sourceComponent: rootItem.control ? null : undefined
            visible: rootItem.control !== null
            onLoaded: {
                if (item)
                    item.parent = customLoader
            }
            Component.onCompleted: {
                if (rootItem.control && rootItem.control.parent !== customLoader) {
                    rootItem.control.parent = customLoader
                }
            }
        }

        Switch {
            id: switchControl
            Layout.alignment: Qt.AlignVCenter
            visible: rootItem.showSwitch
            checked: rootItem.checked
            padding: 0
            onToggled: {
                rootItem.checked = checked
                rootItem.clicked()
            }
        }

        // Authentic macOS Chevron
        Text {
            text: "›"
            font.pixelSize: 16
            font.weight: Font.DemiBold
            color: FishUI.Theme.darkMode ? "#636366" : "#C7C7CC"
            visible: rootItem.showChevron && !rootItem.showSwitch
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
