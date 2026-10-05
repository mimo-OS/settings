/*
 * Copyright (C) 2021-2026 CutefishOS Team.
 *
 * macOS Inset Grouped Card Container
 */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import FishUI 1.0 as FishUI

Rectangle {
    id: cardRoot
    Layout.fillWidth: true

    default property alias content: _mainLayout.data
    property alias spacing: _mainLayout.spacing
    property alias layout: _mainLayout

    color: FishUI.Theme.darkMode ? "#28282A" : "#FFFFFF"
    radius: 10
    antialiasing: true

    border.width: 1 / FishUI.Dpi.ratio
    border.color: FishUI.Theme.darkMode ? Qt.rgba(1, 1, 1, 0.08) : Qt.rgba(0, 0, 0, 0.06)

    Behavior on color {
        ColorAnimation {
            duration: 150
            easing.type: Easing.Linear
        }
    }

    implicitHeight: _mainLayout.implicitHeight +
                    _mainLayout.anchors.topMargin +
                    _mainLayout.anchors.bottomMargin

    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        spacing: 8
    }
}
