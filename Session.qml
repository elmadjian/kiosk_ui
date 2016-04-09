import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: screen2
    width: parent.width
    height: parent.height
    color: "#D2C9BF"
    property string movieTitle: ""
    property string session: ""
    property alias timeTable: timetable

    Column {
        width: parent.width - 36
        height: parent.height - 40
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: screen2.movieTitle
        }

        Text {
            width: parent.width/1.1
            wrapMode: Text.WordWrap
            text: "Lorem ipsum dolor sit amet, duo nisl magna cu. Aperiri "+
                  "efficiantur id eam, affert delicata similique te pro, sit agam "+
                  "accumsan et. Detracto intellegebat vix et, pri modus tempor omnium "+
                  "an. Ipsum euripidis qui in.<br><br>"
        }

        Text {
            text: "<h2>Sessões de hoje:</h2>"
        }

        Column {
            id: timetable
            width: screen2.width * 0.94
            height: screen2.height/1.4

            function highlightTime(current) {
                timetable.clearTime();
                current.border.color = "#428F9C";
                current.border.width = 6;
                current.radius = 5;
            }

            function clearTime() {
                for (var i = 0; i < timetable.children.length; i++) {
                    timetable.children[i].border.color = "";
                    timetable.children[i].border.width = "";
                    timetable.children[i].radius = 0;
                }
            }

            Rectangle {
                id: timetable1
                width: parent.width
                height: parent.height/8
                color:"#C4B6AB"
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    Text { text: "14:00"; font.pixelSize: 15; width: timetable1.width/4 }
                    Text { text: "Sala 2"; font.pixelSize: 15; width: timetable1.width/4 }
                    Text { text: "dublado"; font.pixelSize: 12; font.italic: true; width: timetable1.width/4 }
                    Button {
                        text: " Selecionar "
                        onClicked: {
                            timetable.highlightTime(timetable1);
                            screen2.session = "14:00 - Sala 2 - dublado";
                        }
                    }
                }
            }
            Rectangle {
                id: timetable2
                width: parent.width
                height: parent.height/8
                color:"#D2C9BF"
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    Text { text: "14:40"; font.pixelSize: 15; width: timetable2.width/4}
                    Text { text: "Sala 3 (3D)"; font.pixelSize: 15; width: timetable2.width/4}
                    Text { text: "legendado"; font.pixelSize: 12; font.italic: true; width: timetable2.width/4}
                    Button {
                        text: " Selecionar "
                        onClicked: {
                            timetable.highlightTime(timetable2);
                            screen2.session = "14:40 - Sala 3 (3D) - legendado";
                        }
                    }
                }
            }
            Rectangle {
                id: timetable3
                width: parent.width
                height: parent.height/8
                color:"#C4B6AB"
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    Text { text: "15:45"; font.pixelSize: 15;
                           color: "#999999"; width: timetable3.width/4 }
                    Text { text: "Sala 4 (3D)"; font.pixelSize: 15;
                           color: "#999999"; width: timetable3.width/4}
                    Text { text: "dublado"; font.pixelSize: 12; font.italic: true;
                           color: "#999999"; width: timetable3.width/4}
                    Text { text: "ESGOTADO"; color: "red" }
                }
            }
            Rectangle {
                id: timetable4
                width: parent.width
                height: parent.height/8
                color: "#D2C9BF"
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    Text { text: "17:00"; font.pixelSize: 15; width: timetable4.width/4}
                    Text { text: "Sala 2"; font.pixelSize: 15; width: timetable4.width/4}
                    Text { text: "dublado"; font.pixelSize: 12; font.italic: true; width: timetable4.width/4}
                    Button {
                        text: " Selecionar "
                        onClicked: {
                            timetable.highlightTime(timetable4);
                            screen2.session = "17:00 - Sala 2 - dublado";
                        }
                    }
                }
            }
            Rectangle {
                id: timetable5
                width: parent.width
                height: parent.height/8
                color: "#C4B6AB"
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    Text { text: "19:40"; font.pixelSize: 15; width: timetable5.width/4}
                    Text { text: "Sala 4"; font.pixelSize: 15; width: timetable5.width/4}
                    Text { text: "legendado"; font.pixelSize: 12; font.italic: true; width: timetable5.width/4}
                    Button {
                        text: " Selecionar "
                        onClicked: {
                            timetable.highlightTime(timetable5);
                            screen2.session = "19:40 - Sala 4 - legendado";
                        }
                    }
                }
            }
        }
    }
}
