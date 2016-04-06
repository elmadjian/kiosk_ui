import QtQuick 2.5
import QtQuick.Controls 1.4

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

            Session {
                id: screen2
            }
            Rectangle {
                id: screen3
                width: parent.width
                height: parent.height
                color: "#D2C9BF"

                Rectangle {
                    id: auditorium
                    width: parent.width * 0.8
                    height: parent.height
                    color: Qt.rgba(0, 0, 0, 0)
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        id: cinemaBG
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                        width: parent.width
                        source: "imgs/cinema.png"
                    }

                    Row {
                        id: upperRows
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: auditorium.width/16
                        spacing: 20

                        function raffleColor() {
                            if (Math.random() > 0.65)
                                return "#999999";
                            return "white";
                        }

                        function setColor(element){
                            if (element.color == "#ffffff")
                                element.color = "#ff0000";
                            else if (element.color == "#ff0000")
                                element.color = "#ffffff";
                        }

                        Grid {
                            columns: 3; rows: 6
                            Repeater {
                                model: 18
                                Rectangle {
                                    width: auditorium.width/16
                                    height: auditorium.width/16
                                    border.width: 2
                                    border.color: "#246B7D"
                                    color: upperRows.raffleColor();
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: "PointingHandCursor"
                                        onClicked: upperRows.setColor(parent);
                                    }
                                }
                            }
                        }
                        Grid {
                            columns: 6; rows: 6
                            Repeater {
                                model: 36
                                Rectangle {
                                    width: auditorium.width/16
                                    height: auditorium.width/16
                                    border.width: 2
                                    border.color: "#246B7D"
                                    color: upperRows.raffleColor();
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: "PointingHandCursor"
                                        onClicked: upperRows.setColor(parent);
                                    }
                                }
                            }
                        }
                        Grid {
                            columns: 3; rows: 6
                            Repeater {
                                model: 18
                                Rectangle {
                                    width: auditorium.width/16
                                    height: auditorium.width/16
                                    border.width: 2
                                    border.color: "#246B7D"
                                    color: upperRows.raffleColor();
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: "PointingHandCursor"
                                        onClicked: upperRows.setColor(parent);
                                    }
                                }
                            }
                        }
                    }
                    Grid {
                        anchors.top: upperRows.bottom
                        anchors.topMargin: auditorium.width/24
                        anchors.horizontalCenter: parent.horizontalCenter
                        columns: 6
                        rows: 2
                        Repeater {
                            model: 12
                            Rectangle {
                                width: auditorium.width/16
                                height: auditorium.width/16
                                border.width: 2
                                border.color: "#246B7D"
                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: "PointingHandCursor"
                                    onClicked: upperRows.setColor(parent);
                                }
                            }
                        }
                    }

                    Column {
                        anchors.top: cinemaBG.bottom
                        Row {
                            spacing: 10
                            Rectangle {
                                width: 15
                                height: 15
                                radius: 4
                                color: "white"
                            }
                            Text {
                                text: "disponível"
                            }
                        }
                        Row {
                            spacing: 10
                            Rectangle {
                                width: 15
                                height: 15
                                radius: 4
                                color: "#999999"
                            }
                            Text {
                                text: "ocupado"
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
                    source: "imgs/undo.svg"
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
            PropertyChanges { target: screen3; visible: false }
            PropertyChanges { target: footnote; height: parent.height/12 }
            PropertyChanges { target: container; height: parent.height/1.35 }
            PropertyChanges { target: navigation; visible: false }
        },
        State {
            name: "screen2"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: true }
            PropertyChanges { target: screen3; visible: false }
            PropertyChanges { target: footnote; height: parent.height/8 }
            PropertyChanges { target: container; height: parent.height/1.44 }
            PropertyChanges { target: navigation; visible: true }
            PropertyChanges { target: base; previousState: "screen1"; nextState: "screen3" }
            onCompleted: screen2.timeTable.clearTime();
        },
        State {
            name: "screen3"
            PropertyChanges { target: screen1; visible: false }
            PropertyChanges { target: screen2; visible: false }
            PropertyChanges { target: screen3; visible: true }
            PropertyChanges { target: footnote; height: parent.height/8 }
            PropertyChanges { target: container; height: parent.height/1.44 }
            PropertyChanges { target: navigation; visible: true }
            PropertyChanges { target: base; previousState: "screen2"; nextState: "screen4" }
        }
    ]

    state: "screen1"


}
