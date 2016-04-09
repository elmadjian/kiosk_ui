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

            Theater {
                id: screen3
            }

            Rectangle {
                id: screen4
                width: parent.width
                height: parent.height
                color: "#D2C9BF"

                Column {
                    id: paymentContainer
                    width: parent.width
                    height: parent.height
                    spacing: 20

                    Text {
                        text: "\nEscolha a forma de pagamento:"
                        font.pixelSize: parent.width/30
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    //Escolha do cartão de débito ou crédito
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width * 0.9
                        height: parent.height/3

                        Rectangle {
                            id: debit
                            width: parent.width/2
                            height: parent.height
                            color: mouseDebit.containsMouse? Qt.rgba(1,1,1,0.5) : Qt.rgba(1,1,1,0)
                            radius: 10

                            MouseArea {
                                id: mouseDebit
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: "PointingHandCursor"
                                onClicked: {
                                    debit.border.color = "#246B7D"
                                    debit.border.width = 4
                                    credit.border.width = 0
                                    additionalInfo.visible = true
                                }
                            }

                            Image {
                                source: "imgs/debit.png"
                                width: parent.width * 0.9
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                                opacity: mouseDebit.containsMouse? 1.0 : 0.8
                            }

                        }
                        Rectangle {
                            id: credit
                            width: parent.width/2
                            height: parent.height
                            color: mouseCredit.containsMouse? Qt.rgba(1,1,1,0.5) : Qt.rgba(1,1,1,0)
                            radius: 10

                            MouseArea {
                                id: mouseCredit
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: "PointingHandCursor"
                                onClicked: {
                                    credit.border.color = "#246B7D"
                                    credit.border.width = 4
                                    debit.border.width = 0
                                    additionalInfo.visible = true
                                }
                            }

                            Image {
                                source: "imgs/credit.png"
                                width: parent.width * 0.9
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                                opacity: mouseCredit.containsMouse? 1.0 : 0.8
                            }
                        }
                    }

                    //Preenchimento com dados do cartão
                    Rectangle {
                        id: additionalInfo
                        width: parent.width * 0.9
                        height: parent.height/2.8
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#C4B6AB"
                        radius: 8

                        property int creditNumbers: 0
                        property int fieldsFilled: 0

                        Column {
                            width: parent.width * 0.95
                            height: parent.height * 0.9
                            anchors.centerIn: parent
                            spacing: 15

                            Text {
                                text: "INFORMAÇÕES ADICIONAIS:"
                                font.underline: true
                            }
                            Row {
                                spacing: 10
                                Text {
                                    width: additionalInfo.width * 0.3
                                    text: "Número do cartão: "
                                }

                                Row {
                                    spacing: 5
                                    Repeater {
                                        model: 4
                                        TextField {
                                            width: additionalInfo.width/10
                                            validator: RegExpValidator {regExp: /[0-9]{1,4}/}
                                            maximumLength: 4
                                            property bool finished: false
                                            onLengthChanged: {
                                                if (length == maximumLength && !finished) {
                                                    finished = true;
                                                    additionalInfo.creditNumbers++;
                                                }
                                                if (additionalInfo.creditNumbers == maximumLength) {
                                                    arrow1.source = "imgs/field_check.png";
                                                    arrow2.visible = true;
                                                    additionalInfo.fieldsFilled++;
                                                }
                                            }
                                        }
                                    }
                                }
                                Image {
                                    id: arrow1
                                    visible: true
                                    width: additionalInfo.width/24
                                    source: "imgs/arrow_left.svg"
                                    fillMode: Image.PreserveAspectFit
                                }

                            }
                            Row {
                                spacing: 10
                                Text {
                                    width: additionalInfo.width * 0.3
                                    text: "Código de segurança: "
                                }
                                TextField {
                                    width: additionalInfo.width/12
                                    validator: RegExpValidator {regExp: /[0-9]{1,3}/}
                                    maximumLength: 3
                                    onLengthChanged: {
                                        if (length == maximumLength) {
                                            arrow2.source = "imgs/field_check.png"
                                            arrow3.visible = true;
                                            additionalInfo.fieldsFilled++;
                                        }
                                    }
                                }
                                Image {
                                    id: arrow2
                                    visible: false
                                    width: additionalInfo.width/24
                                    source: "imgs/arrow_left.svg"
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                            Row {
                                spacing: 10
                                Text {
                                    width: additionalInfo.width * 0.3
                                    text: "Senha: "
                                }
                                TextField {
                                    echoMode: TextInput.Password
                                    maximumLength: 6
                                    onLengthChanged: {
                                        if (length == maximumLength) {
                                            arrow3.source = "imgs/field_check.png"
                                            additionalInfo.fieldsFilled++;
                                        }
                                    }
                                }
                                Image {
                                    id: arrow3
                                    visible: false
                                    width: additionalInfo.width/24
                                    source: "imgs/arrow_left.svg"
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: confirmScreen
                    visible: false
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    color: "white"
                    radius: 8
                    anchors.centerIn: parent
                    border.color: "red"
                    border.width: 5


                    Column {
                        Text {
                            text: "*** ATENÇÃO: ESTA OPERAÇÃO NÃO PODERÁ SER DESFEITA ***"
                            color: "red"
                        }
                        Text {
                            text: "Por favor, confirme os dados da sua compra:"+
                                  "\nAssentos: " + screen3.getSeatsAsString() +
                                  "\nValor total: " + screen3.total +
                                  "\nForma de pagamento: "

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
                                if (additionalInfo.fieldsFilled == 3) {
                                    confirmScreen.visible = true;
                                    paymentContainer.opacity = 0.2;
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
            PropertyChanges { target: base; previousState: "screen3"; nextState: "screen5" }
        }
    ]

    state: "screen1"


}
