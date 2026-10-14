import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import FishUI 1.0 as FishUI
import Cutefish.Settings 1.0
import "../"

ItemPage {
    headerTitle: qsTr("General")

    About {
        id: about
    }

    Scrollable {
        anchors.fill: parent
        contentHeight: layout.implicitHeight + 40

        ColumnLayout {
            id: layout
            anchors.fill: parent
            spacing: 16

            Item {
                height: 10
            }

            // macOS Style Hardware Logo & System Header
            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 8

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    width: 72
                    height: 72
                    radius: 36
                    color: FishUI.Theme.darkMode ? Qt.rgba(1, 1, 1, 0.10) : Qt.rgba(0, 0, 0, 0.05)
                    border.width: 1 / FishUI.Dpi.ratio
                    border.color: FishUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.15) : Qt.rgba(0, 0, 0, 0.08)

                    Image {
                        anchors.centerIn: parent
                        width: 44
                        height: 44
                        sourceSize: Qt.size(44, 44)
                        source: "qrc:/images/sidebar/" + (FishUI.Theme.darkMode ? "dark/" : "light/") + "about.svg"
                    }
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: about.osName
                    font.bold: true
                    font.pointSize: 18
                    color: FishUI.Theme.textColor
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Version %1").arg(about.version)
                    font.pointSize: 9.5
                    color: FishUI.Theme.disabledTextColor
                }
            }

            Item {
                height: 6
            }

            // System Specifications Card
            RoundedItem {
                spacing: 0

                StandardItem {
                    key: qsTr("Processor")
                    value: about.cpuInfo
                }

                HorizontalDivider {}

                StandardItem {
                    key: qsTr("Memory")
                    value: about.memorySize
                }

                HorizontalDivider {}

                StandardItem {
                    key: qsTr("Architecture")
                    value: about.architecture
                }

                HorizontalDivider {}

                StandardItem {
                    key: qsTr("Kernel Version")
                    value: about.kernelVersion
                }

                HorizontalDivider {}

                StandardItem {
                    key: qsTr("Computer Name")
                    value: about.hostname
                }
            }

            // System Storage Overview Card
            RoundedItem {
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    RowLayout {
                        Layout.fillWidth: true

                        Label {
                            text: qsTr("System Storage Volume")
                            font.bold: true
                            font.pointSize: 9.5
                            color: FishUI.Theme.textColor
                        }

                        Item { Layout.fillWidth: true }

                        Label {
                            text: about.internalStorage
                            font.pointSize: 8.5
                            color: FishUI.Theme.disabledTextColor
                        }
                    }

                    // Storage Progress Bar
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 12
                        radius: 6
                        color: FishUI.Theme.darkMode ? Qt.rgba(1, 1, 1, 0.12) : Qt.rgba(0, 0, 0, 0.08)
                        clip: true

                        RowLayout {
                            anchors.fill: parent
                            spacing: 2

                            Rectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.40
                                color: "#007AFF"
                                radius: 4
                            }

                            Rectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.20
                                color: "#AF52DE"
                                radius: 4
                            }

                            Rectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.10
                                color: "#FF9500"
                                radius: 4
                            }

                            Item { Layout.fillWidth: true }
                        }
                    }

                    // Storage Legend
                    RowLayout {
                        spacing: 12
                        Layout.alignment: Qt.AlignHCenter

                        RowLayout {
                            spacing: 4
                            Rectangle { width: 8; height: 8; radius: 4; color: "#007AFF" }
                            Label { text: qsTr("System"); font.pointSize: 7.5; color: FishUI.Theme.disabledTextColor }
                        }
                        RowLayout {
                            spacing: 4
                            Rectangle { width: 8; height: 8; radius: 4; color: "#AF52DE" }
                            Label { text: qsTr("Apps"); font.pointSize: 7.5; color: FishUI.Theme.disabledTextColor }
                        }
                        RowLayout {
                            spacing: 4
                            Rectangle { width: 8; height: 8; radius: 4; color: "#FF9500" }
                            Label { text: qsTr("User Data"); font.pointSize: 7.5; color: FishUI.Theme.disabledTextColor }
                        }
                        RowLayout {
                            spacing: 4
                            Rectangle { width: 8; height: 8; radius: 4; color: FishUI.Theme.darkMode ? "#555558" : "#d0d0d5" }
                            Label { text: qsTr("Free Space"); font.pointSize: 7.5; color: FishUI.Theme.disabledTextColor }
                        }
                    }
                }
            }

            // Software Update Row
            RoundedItem {
                StandardItem {
                    title: qsTr("Software Update")
                    subtitle: qsTr("Check for system and application updates")
                    showChevron: true
                    onClicked: {
                        rootWindow.switchPageFromName("update")
                    }
                }
            }
        }
    }
}
