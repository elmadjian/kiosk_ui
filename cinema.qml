import QtQuick 2.5
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Rectangle {
    id: base
    width: 549
    height: 732
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
            id: header

            Row {
                width: parent.width
                height: parent.height * 0.95

                Rectangle {
                    width: parent.width/4
                    height: parent.height
                    color: Qt.rgba(0,0,0,0)
                    Image {
                        id: tabImg1
                        width: parent.width/3
                        source: "imgs/movie.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        Text {
                            anchors.top: parent.bottom
                            anchors.topMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "EM CARTAZ"
                            font.pixelSize: parent.width * 0.2
                        }
                    }
                }
                Rectangle {
                    width: parent.width/4
                    height: parent.height
                    color: Qt.rgba(0,0,0,0)
                    Image {
                        id: tabImg2
                        width: parent.width/3
                        source: "imgs/time.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        Text {
                            anchors.top: parent.bottom
                            anchors.topMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "SESSÕES"
                            font.pixelSize: parent.width * 0.2
                        }
                    }
                }
                Rectangle {
                    width: parent.width/4
                    height: parent.height
                    color: Qt.rgba(0,0,0,0)
                    Image {
                        id: tabImg3
                        width: parent.width/3
                        source: "imgs/ticket.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                         Text {
                            anchors.top: parent.bottom
                            anchors.topMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "POLTRONAS"
                            font.pixelSize: parent.width * 0.2
                        }
                    }
                }
                Rectangle {
                    width: parent.width/4
                    height: parent.height
                    color: Qt.rgba(0,0,0,0)
                    Image {
                        id: tabImg4
                        width: parent.width/3
                        source: "imgs/money.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        Text {
                            anchors.top: parent.bottom
                            anchors.topMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "PAGAMENTO"
                            font.pixelSize: parent.width * 0.2
                        }
                    }
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height/20
                color: "#246B7D"
            }

            states: [
                State {
                    name: "screen1"
                    PropertyChanges { target: tabImg1; opacity: 1.0 }
                    PropertyChanges { target: tabImg2; opacity: 0.2 }
                    PropertyChanges { target: tabImg3; opacity: 0.2 }
                    PropertyChanges { target: tabImg4; opacity: 0.2 }
                },
                State {
                    name: "screen2"
                    PropertyChanges { target: tabImg1; opacity: 0.2 }
                    PropertyChanges { target: tabImg2; opacity: 1.0 }
                    PropertyChanges { target: tabImg3; opacity: 0.2 }
                    PropertyChanges { target: tabImg4; opacity: 0.2 }
                },
                State {
                    name: "screen3"
                    PropertyChanges { target: tabImg1; opacity: 0.2 }
                    PropertyChanges { target: tabImg2; opacity: 0.2 }
                    PropertyChanges { target: tabImg3; opacity: 1.0 }
                    PropertyChanges { target: tabImg4; opacity: 0.2 }
                },
                State {
                    name: "screen4"
                    PropertyChanges { target: tabImg1; opacity: 0.2 }
                    PropertyChanges { target: tabImg2; opacity: 0.2 }
                    PropertyChanges { target: tabImg3; opacity: 0.2 }
                    PropertyChanges { target: tabImg4; opacity: 1.0 }
                },
                State {
                    name: "screen5"
                    PropertyChanges { target: tabImg1; opacity: 0.2 }
                    PropertyChanges { target: tabImg2; opacity: 0.2 }
                    PropertyChanges { target: tabImg3; opacity: 0.2 }
                    PropertyChanges { target: tabImg4; opacity: 0.2 }
                }
            ]

            state: "screen1"
        }

        //Conteúdo principal
        //------------------
        Rectangle {
            id: container
            width: base.width
            height: parent.height/1.35

            MovieList { id: screen1 }

            Session { id: screen2 }

            Theater { id: screen3 }

            Payment { id: screen4 }

            Rectangle {
                id: screen5
                width: parent.width
                height: parent.height
                color: "#D2C9BF"
                visible: false

                Column {
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    anchors.centerIn: parent
                    spacing: 20

                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width/2.5
                        source: "imgs/popcorn.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                    Rectangle {
                        width: parent.width
                        height: parent.height * 0.45
                        color: "#C4B6AB"
                        radius: 10
                        Text {
                            anchors.centerIn: parent
                            text: "<h2>Pagamento efetuado com sucesso!</h2><br><ul>" +
                                  '<h4>Alguns avisos:</h4><br>' +
                                  "<li>&#8226;É proibido fumar no interior da sala</li>" +
                                  "<li>&#8226;É proibido portar latas e garrafas</li>" +
                                  "<li>&#8226;Por favor, deixe seu celular desligado</li><br>"
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
                    source: "imgs/undo.svg"
                    smooth: true
                    Text {
                        id: backtxt
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "desfazer"
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
                    smooth: true
                    Text {
                        id: hometxt
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: parent.height + 5
                        text: "recomeçar"
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
                    source: "imgs/ok.svg"
                    smooth: true
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
                        onClicked: {
                            if (base.state == "screen4") {
                                if (screen4.additionalInfo.fieldsFilled == 3) {
                                    screen4.confirmScreen.visible = true;
                                    screen4.paymentContainer.opacity = 0.2;
                                }
                            }
                            else
                                base.state = base.nextState
                        }
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
            PropertyChanges { target: screen3; visible: false }
            PropertyChanges { target: screen4; visible: false }
            PropertyChanges { target: footnote; height: parent.height/12 }
            PropertyChanges { target: container; height: parent.height/1.35 }
            PropertyChanges { target: navigation; visible: false }
            PropertyChanges { target: header; state: "screen1" }
        },
        State {
            name: "screen2"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: true }
            PropertyChanges { target: screen3; visible: false }
            PropertyChanges { target: screen4; visible: false }
            PropertyChanges { target: footnote; height: parent.height/8 }
            PropertyChanges { target: container; height: parent.height/1.44 }
            PropertyChanges { target: navigation; visible: true }
            PropertyChanges { target: header; state: "screen2" }
            PropertyChanges { target: base; previousState: "screen1"; nextState: "screen3" }            
            onCompleted: screen2.timeTable.clearTime();
        },
        State {
            name: "screen3"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: false }
            PropertyChanges { target: screen3; visible: true }
            PropertyChanges { target: screen4; visible: false }
            PropertyChanges { target: footnote; height: parent.height/8 }
            PropertyChanges { target: container; height: parent.height/1.44 }
            PropertyChanges { target: navigation; visible: true }
            PropertyChanges { target: header; state: "screen3" }
            PropertyChanges { target: base; previousState: "screen2"; nextState: "screen4" }            
        },
        State {
            name: "screen4"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: false }
            PropertyChanges { target: screen3; visible: false }
            PropertyChanges { target: screen4; visible: true }
            PropertyChanges { target: footnote; height: parent.height/8 }
            PropertyChanges { target: container; height: parent.height/1.44 }
            PropertyChanges { target: navigation; visible: true }
            PropertyChanges { target: header; state: "screen4" }
            PropertyChanges { target: base; previousState: "screen3"; nextState: "screen5" }
        },
        State {
            name: "screen5"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: false }
            PropertyChanges { target: screen3; visible: false }
            PropertyChanges { target: screen4; visible: false }
            PropertyChanges { target: screen5; visible: true }
            PropertyChanges { target: footnote; height: parent.height/12 }
            PropertyChanges { target: container; height: parent.height/1.35 }
            PropertyChanges { target: navigation; visible: false }
            PropertyChanges { target: header; state: "screen5" }
        }
    ]

    state: "screen1"


}
