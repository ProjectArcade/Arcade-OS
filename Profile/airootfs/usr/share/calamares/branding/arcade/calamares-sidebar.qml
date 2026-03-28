import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Layouts 1.3
import io.calamares.ui 1.0

Rectangle {
    id: sidebar
    color: "#111111"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Logo area
        Rectangle {
            color: "#111111"
            Layout.fillWidth: true
            height: 120

            Column {
                anchors.centerIn: parent
                spacing: 10

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 64
                    height: 64
                    radius: 16
                    color: "#1A1A1A"
                    border.color: "#2A2A2A"
                    border.width: 1

                    Image {
                        anchors.centerIn: parent
                        source: "logo.png"
                        width: 42
                        height: 42
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Arcade Linux"
                    color: "#FFFFFF"
                    font.pixelSize: 12
                    font.bold: true
                    font.family: "JetBrains Mono"
                    font.letterSpacing: 0.5
                }
            }
        }

        // Divider
        Rectangle {
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            height: 1
            color: "#2A2A2A"
        }

        Item { Layout.fillWidth: true; height: 12 }

        // Steps
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            model: ViewManager
            clip: true
            spacing: 2

            delegate: Rectangle {
                width: ListView.view.width
                height: 46
                radius: 10
                color: index === ViewManager.currentStepIndex ? "#1A2A1A" : "transparent"
                border.color: index === ViewManager.currentStepIndex ? "#2A3A2A" : "transparent"
                border.width: 1

                // Active indicator
                Rectangle {
                    visible: index === ViewManager.currentStepIndex
                    width: 3
                    height: 24
                    radius: 2
                    color: "#00FF00"
                    anchors.left: parent.left
                    anchors.leftMargin: 6
                    anchors.verticalCenter: parent.verticalCenter
                }

                // Step number
                Text {
                    id: stepNum
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 18
                    text: (index + 1) + "."
                    color: index === ViewManager.currentStepIndex ? "#00FF00" : "#444444"
                    font.pixelSize: 10
                    font.family: "JetBrains Mono"
                }

                // Step name
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: stepNum.right
                    anchors.leftMargin: 8
                    text: display
                    color: index === ViewManager.currentStepIndex
                        ? "#00FF00"
                        : index < ViewManager.currentStepIndex
                            ? "#444444"
                            : "#AAAAAA"
                    font.pixelSize: 12
                    font.bold: index === ViewManager.currentStepIndex
                    font.family: "JetBrains Mono"
                }

                // Completed dot
                Rectangle {
                    visible: index < ViewManager.currentStepIndex
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 14
                    width: 6
                    height: 6
                    radius: 3
                    color: "#00FF00"
                    opacity: 0.4
                }
            }
        }

        Item { Layout.fillWidth: true; height: 8 }

        // Bottom
        Rectangle {
            color: "#111111"
            Layout.fillWidth: true
            height: 48

            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                height: 1
                color: "#2A2A2A"
            }

            Text {
                anchors.centerIn: parent
                text: "Made with ❤️ by thakurabhinav22"
                color: "#FFFFFF"
                font.pixelSize: 9
                font.family: "JetBrains Mono"
            }
        }
    }
}
