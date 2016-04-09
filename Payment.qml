import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle {
    id: screen4
    width: parent.width
    height: parent.height
    color: "#D2C9BF"
    property string payment: ""
    property alias paymentContainer: paymentContainer
    property alias confirmScreen: confirmScreen
    property alias additionalInfo: additionalInfo

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
                        screen4.payment = "débito"
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
                        screen4.payment = "crédito"
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
        height: parent.height * 0.45
        color: "white"
        radius: 8
        anchors.centerIn: parent
        border.color: "red"
        border.width: 5


        Column {
            width: parent.width * 0.8
            height: parent.height * 0.8
            anchors.centerIn: parent
            Text {
                text: "*** UMA VEZ CONFIRMADA, ESTA OPERAÇÃO NÃO PODERÁ SER DESFEITA ***\n"
                color: "red"
                font.pixelSize: parent.width/40
            }
            Text {
                text: "<h3>Por favor, confirme os dados da compra:</h3><br><lu>"+
                      "<li>Filme: " + screen2.movieTitle.substring(4, screen2.movieTitle.length-5) + "</li>" +
                      "<li>Sessão: " + screen2.session + "</li>" +
                      "<li>Assentos: " + screen3.getSeatsAsString() + "</li>" +
                      "<li>Valor total: R$" + screen3.total + "</li>" +
                      "<li>Forma de pagamento: " + screen4.payment + "</li></lu><br>"
            }
            Row {
                width: parent.width
                spacing: 10
                Button {
                    iconSource: "imgs/field_wrong.png"
                    text: "Cancelar"
                    onClicked: {
                        confirmScreen.visible = false
                        screen4.paymentContainer.opacity = 1.0
                    }
                }
                Button {
                    iconSource: "imgs/field_check.png"
                    text: "Confirmar"
                    onClicked: base.state = "screen5"
                }
            }
        }
    }
}
