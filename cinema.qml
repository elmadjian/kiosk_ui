import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle {
    id: base
    width: 600
    height: 800
    color: "white"
    property string previousState: ""
    property string nextState: ""

    Column {
        anchors.fill: parent

        //Título da aplicação
        //-------------------
        Rectangle {
            width: parent.width
            height: parent.height/18
            color: "#246B7D"

            Text {
                text: "Super Kiosk"
                anchors.centerIn: parent
                font.family: "Deja Vu Sans"
                font.pixelSize: parent.height - parent.height/2
                font.bold: true
                color: "white"
            }
        }

        //Cabeçalho para indicar onde o usuário se encontra
        //-------------------------------------------------
        Rectangle {
            width: parent.width
            height: parent.height/8
            color: "#428F9C"

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height/20
                color: "#246B7D"
            }
        }

        //Conteúdo principal
        //------------------
        Rectangle {
            id: container
            width: base.width
            height: parent.height/1.35

            MovieList {
                id: screen1
            }

            Rectangle {
                id: screen2
                width: parent.width
                height: parent.height
                color: "#D2C9BF"
                property string movieTitle: ""

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
                        width: screen2.width * 0.94
                        height: screen2.height/1.4

                        Rectangle {
                            width: parent.width
                            height: parent.height/8
                            color:"#C4B6AB"
                            Row {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                spacing: 50
                                Text { text: "14:00"; font.pixelSize: 15}
                                Text { text: "Sala 2"; font.pixelSize: 15}
                            }
                        }
                        Rectangle {
                            width: parent.width
                            height: parent.height/8
                            color:"#D2C9BF"
                            Row {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                spacing: 50
                                Text { text: "14:40"; font.pixelSize: 15}
                                Text { text: "Sala 3"; font.pixelSize: 15}
                            }
                        }
                        Rectangle {
                            width: parent.width
                            height: parent.height/8
                            color:"#C4B6AB"
                            Row {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                spacing: 50
                                Text { text: "15:45"; font.pixelSize: 15; color: "#CCCCCC"}
                                Text { text: "Sala 4"; font.pixelSize: 15; color: "#CCCCCC"}
                            }
                        }
                        Rectangle {
                            width: parent.width
                            height: parent.height/8
                            color: "#D2C9BF"
                            Row {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                spacing: 50
                                Text { text: "17:00"; font.pixelSize: 15}
                                Text { text: "Sala 2"; font.pixelSize: 15}
                            }
                        }
                        Rectangle {
                            width: parent.width
                            height: parent.height/8
                            color: "#C4B6AB"
                            Row {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                spacing: 50
                                Text { text: "19:40"; font.pixelSize: 15}
                                Text { text: "Sala 4"; font.pixelSize: 15}
                            }
                        }
                    }
                }

            }

        }

        //Rodapé com navegação
        //--------------------
        Rectangle {
            id: footnote
            width: parent.width
            height: parent.height/12
            color: "#428F9C"

            Rectangle {
                anchors.top: parent.top
                width: parent.width
                height: parent.height/1.2
                color: "#246B7D"
            }

            Rectangle {
                id: navigation
                width: parent.width
                height: parent.height
                color: Qt.rgba(0,0,0,0)

                Image {
                    id: backbtn
                    width: parent.width/10
                    fillMode: Image.PreserveAspectFit
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    source: "imgs/arrow_left.svg"
                    Text {
                        id: backtxt
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "voltar"
                        color: "#DDDDDD"
                        y: parent.height + 5
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: base.state = base.previousState
                    }
                }

                Image {
                    id: homebtn
                    width: parent.width/10
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                    source: "imgs/home.svg"
                    Text {
                        id: hometxt
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: parent.height + 5
                        text: "início"
                        color: "#DDDDDD"
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: base.state = "screen1"
                    }
                }

                Image {
                    id: forwardbtn
                    width: parent.width/10
                    fillMode: Image.PreserveAspectFit
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    source: "imgs/arrow_right.svg"
                    Text {
                        id: forwardtxt
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "confirmar"
                        color: "#DDDDDD"
                        y: parent.height + 5
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: base.state = base.nextState
                    }
                }
            }
        }
    }

    //Estados de transição
    //--------------------
    states: [
        State {
            name: "screen1"
            PropertyChanges { target: screen1; visible: true }
            PropertyChanges { target: screen2; visible: false }
            PropertyChanges { target: footnote; height: parent.height/12 }
            PropertyChanges { target: container; height: parent.height/1.35 }
            PropertyChanges { target: navigation; visible: false }
        },
        State {
            name: "screen2"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: true }
            PropertyChanges { target: footnote; height: parent.height/8 }
            PropertyChanges { target: container; height: parent.height/1.44 }
            PropertyChanges { target: navigation; visible: true }
            PropertyChanges { target: base; previousState: "screen1"; nextState: "screen3" }
        }
    ]

    state: "screen1"


}
