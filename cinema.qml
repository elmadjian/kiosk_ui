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

            Screen1 { id: screen1 }

            Screen2 { id: screen2 }

            Screen3 { id: screen3 }

            Screen4 { id: screen4 }

            Screen5 { id: screen5}

            Rectangle {
                id: warningDialog
                width: parent.width * 0.7
                height: parent.height * 0.2
                color: "white"
                border.color: "#246B7D"
                border.width: 4
                visible: false
                anchors.centerIn: parent
                radius: 10

                Column {
                    width: parent.width * 0.8
                    height: parent.height * 0.7
                    anchors.centerIn: parent
                    Text {
                        horizontalAlignment: Text.Center
                        width: parent.width
                        id: warningTxt
                        text: ""
                        wrapMode: Text.WordWrap
                    }
                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        iconSource: "imgs/field_check.png"
                        text: "Entendi"
                        onClicked: warningDialog.visible = false;
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
                        color: "white"
                        y: parent.height + 3
                        opacity: 0.35;
                    }
                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: base.state = base.previousState
                        onEntered: {
                            parent.source = "imgs/undo2.svg";
                            backtxt.opacity = 1.0;
                        }
                        onExited: {
                            parent.source = "imgs/undo.svg";
                            backtxt.opacity = 0.35;
                        }
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
                        y: parent.height + 3
                        text: "recomeçar"
                        color: "white"
                        opacity: 0.35;
                    }
                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: base.state = "screen1"
                        onEntered: {
                            parent.source = "imgs/home2.svg";
                            hometxt.opacity = 1.0;
                        }
                        onExited: {
                            parent.source = "imgs/home.svg";
                            hometxt.opacity = 0.35;
                        }
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
                        color: "white"
                        y: parent.height + 3
                        opacity: 0.35;
                    }
                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onEntered: {
                            parent.source = "imgs/ok2.svg";
                            forwardtxt.opacity = 1.0;
                        }
                        onExited: {
                            parent.source = "imgs/ok.svg";
                            forwardtxt.opacity = 0.35;
                        }
                        onClicked: {
                            if (base.state == "screen2" && !screen2.movieSelected) {
                                warningTxt.text = "<h4>Por favor, selecione uma sessão antes de continuar</h4>";
                                warningDialog.visible = true;
                            }
                            else if (base.state == "screen3" && !screen3.seatsOK) {
                                warningTxt.text = "<h4>Número de assentos selecionados inválido</h4>";
                                warningDialog.visible = true;
                            }
                            else if (base.state == "screen4") {
                                if (screen4.additionalInfo.fieldsFilled == 3) {
                                    screen4.confirmScreen.visible = true;
                                    screen4.paymentContainer.opacity = 0.2;
                                }
                                else {
                                    warningTxt.text = "<h4>É necessário preencher os campos com os dados do " +
                                                      "cartão antes de continuar</h4>";
                                    warningDialog.visible = true;
                                }
                            }
                            else {
                                base.state = base.nextState
                                warningDialog.visible = false;
                            }
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
            PropertyChanges { target: screen2; visible: false}
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
            PropertyChanges { target: screen2; visible: true; movieSelected: false }
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
            PropertyChanges { target: screen3; visible: true; seatsOK: screen3.tickets > 0 ? true : false }
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
