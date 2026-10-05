/*
 * Copyright (C) 2021-2026 CutefishOS Team.
 *
 * macOS Inset Card Divider
 */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import FishUI 1.0 as FishUI

Item {
    id: control
    height: 1
    Layout.fillWidth: true

    Rectangle {
        anchors.fill: parent
        color: FishUI.Theme.darkMode ? Qt.rgba(1, 1, 1, 0.07) : Qt.rgba(0, 0, 0, 0.06)
    }
}
