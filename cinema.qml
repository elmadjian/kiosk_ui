import QtQuick 2.5

Rectangle {
    id: base
    width: 600
    height: 800
    color: "white"

    Column {
        anchors.fill: parent

        Rectangle {
            width: parent.width
            height: parent.height/18
            color: "#E35630"

            Text {
                text: "Super Kiosk"
                anchors.centerIn: parent
                font.family: "Deja Vu Sans"
                font.pixelSize: parent.height - parent.height/2
                font.bold: true
                color: "white"
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height/6
            color: "#FA6900"

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height/20
                color: "#EA5900"
            }
        }
    }

}
