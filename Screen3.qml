import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle {
    id: screen3
    width: parent.width
    height: parent.height
    color: "#D2C9BF"
    property int tickets: 0
    property var seats: []
    property int total: 0
    property bool seatsOK: false

    //sorteia ocupação de uma poltrona
    function raffleColor() {
        if (Math.random() > 0.65)
            return "#999999";
        return "white";
    }

    //atualiza dados sobre os assentos
    function updateSeats() {
        seatsText.text = screen3.getSeatsAsString();
        wholeTicket.value = screen3.tickets;
        halfTicket.value = 0;
        screen3.seatsOK = (screen3.seats == 0) ? false : true;
    }

    //muda a cor da potlrona para vermelho e
    //adiciona ou remove o assento à compra
    function setColor(element){
        if (element.color == "#ffffff") {
            element.color = "#ff0000";
            screen3.tickets++;
            screen3.seats.push(element.id);
            if (screen3.tickets < 5)
                seatBG.width += 18;
            if (screen3.tickets == 5 || screen3.tickets == 9)
                seatBG.height += 18;
        }
        else if (element.color == "#ff0000") {
            element.color = "#ffffff";
            screen3.tickets--;
            screen3.seats.splice(screen3.seats.indexOf(element.id),1);
            if (screen3.tickets < 4)
                seatBG.width -= 18;
            if (screen3.tickets == 4 || screen3.tickets == 8)
                seatBG.height -= 18;
        }
        screen3.updateSeats();
    }

    //devolve a lista de assentos como uma string
    function getSeatsAsString() {
        var boughtSeats = "";
        for (var i in screen3.seats)
            boughtSeats += screen3.seats[i] + " ";
        return boughtSeats.slice(0,-1);
    }

    Rectangle {
        id: auditorium
        width: parent.width * 0.8
        height: parent.height
        color: Qt.rgba(0, 0, 0, 0)
        anchors.horizontalCenter: parent.horizontalCenter

        //imagem de fundo do auditório
        Image {
            id: cinemaBG
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            width: parent.width
            source: "imgs/cinema2.png"
        }

        //poltronas superiores
        Row {
            id: upperRows
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: auditorium.width/16
            spacing: 20

            //poltronas da esquerda
            Grid {
                id: leftTheater
                columns: 3; rows: 6
                function setSeatID() {
                    setSeatID.id  = setSeatID.id || 0;
                    setSeatID.idx = setSeatID.idx || 0;
                    var letter = ['A','B','C','D','E','F'];
                    var id = letter[setSeatID.idx] + (setSeatID.id++ % 3 + 1);
                    setSeatID.idx += (setSeatID.id % 3 == 0) ? 1: 0;
                    return id;
                }

                Repeater {
                    model: 18
                    Rectangle {
                        width: auditorium.width/16
                        height: auditorium.width/16
                        border.width: 2
                        border.color: "#246B7D"
                        color: screen3.raffleColor();
                        property string id: leftTheater.setSeatID();
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                            onClicked: screen3.setColor(parent);
                        }
                    }
                }
            }
            //poltronas centrais
            Grid {
                columns: 6; rows: 6
                id: midTheater
                function setSeatID() {
                    setSeatID.id  = setSeatID.id || 0;
                    setSeatID.idx = setSeatID.idx || 0;
                    var letter = ['A','B','C','D','E','F'];
                    var id = letter[setSeatID.idx] + (setSeatID.id++ % 6 + 4);
                    setSeatID.idx += (setSeatID.id % 6 == 0) ? 1: 0;
                    return id;
                }
                Repeater {
                    model: 36
                    Rectangle {
                        width: auditorium.width/16
                        height: auditorium.width/16
                        border.width: 2
                        border.color: "#246B7D"
                        color: screen3.raffleColor();
                        property string id: midTheater.setSeatID();
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                            onClicked: screen3.setColor(parent);
                        }
                    }
                }
            }
            //poltronas da direita
            Grid {
                columns: 3; rows: 6
                id: rightTheater
                function setSeatID() {
                    setSeatID.id  = setSeatID.id || 0;
                    setSeatID.idx = setSeatID.idx || 0;
                    var letter = ['A','B','C','D','E','F'];
                    var id = letter[setSeatID.idx] + (setSeatID.id++ % 3 + 10);
                    setSeatID.idx += (setSeatID.id % 3 == 0) ? 1: 0;
                    return id;
                }
                Repeater {
                    model: 18
                    Rectangle {
                        width: auditorium.width/16
                        height: auditorium.width/16
                        border.width: 2
                        border.color: "#246B7D"
                        color: screen3.raffleColor();
                        property string id: rightTheater.setSeatID();
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                            onClicked: screen3.setColor(parent);
                        }
                    }
                }
            }
        }

        //poltronas inferiores
        Grid {
            anchors.top: upperRows.bottom
            anchors.topMargin: auditorium.width/24
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 6
            rows: 2
            id: bottomTheater
            function setSeatID() {
               setSeatID.id = setSeatID.id || 1;
               switch(true) {
               case (setSeatID.id < 7): return "G" + (3 + setSeatID.id++);
               case (setSeatID.id > 6 && setSeatID.id < 13): return "H" + (setSeatID.id++ - 3);
               }
            }
            Repeater {
                model: 12
                Rectangle {
                    width: auditorium.width/16
                    height: auditorium.width/16
                    border.width: 2
                    border.color: "#246B7D"
                    property string id: bottomTheater.setSeatID();
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: screen3.setColor(parent);
                    }
                }
            }
        }

        //legenda
        Column {
            id: subtitle
            anchors.top: cinemaBG.bottom
            width: parent.width/2
            spacing: 5
            Row {
                spacing: 10
                Rectangle {
                    width: 15
                    height: 15
                    radius: 4
                    color: "white"
                }
                Text { text: "disponível" }
            }
            Row {
                spacing: 10
                Rectangle {
                    width: 15
                    height: 15
                    radius: 4
                    color: "#999999"
                }
                Text { text: "ocupado" }
            }
        }

        //Preços dos ingressos
        Column {
            id: prices
            anchors.top: cinemaBG.bottom
            anchors.left: subtitle.right
            anchors.leftMargin: 30
            width: parent.width/2
            Text {
                text: "Preços: "
                font.pixelSize: 14
                font.underline: true
             }
            Row {
                Text { text: "INTEIRA:"; width: prices.width/3}
                Text { text: "R$ 20,00"}
            }
            Row {
                Text { text: "MEIA:"; width: prices.width/3 }
                Text { text: "R$ 10,00" }
            }
        }

        //Dados da compra
        Row {
            id: infoTickets
            anchors.top: subtitle.bottom
            anchors.topMargin: 30
            width: parent.width

            Column {
                width: parent.width/2
                spacing: 8
                Row {
                    Text { text: "Ingressos: "; anchors.verticalCenter: parent.verticalCenter}
                    Rectangle { width: 30; height: 15; color: "white"; radius: 4
                        Text { text: screen3.tickets; anchors.centerIn: parent }
                    }
                }
                Row {
                    Text { text: "Poltronas: "; anchors.verticalCenter: parent.verticalCenter }
                    Rectangle { id: seatBG; width: 30; height: 15; color: "white"; radius: 4
                        Text {
                            id: seatsText;
                            text: "";
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            wrapMode: Text.WordWrap
                            width: 100
                        }
                    }
                }
            }

            Column {
                id: purchase
                width: parent.width/2
                spacing: 5

                function calculateHalfAndWhole() {
                    if (wholeTicket.value + halfTicket.value > screen3.tickets) {
                        if (wholeTicket.value > halfTicket.value)
                            wholeTicket.value--;
                        else
                            halfTicket.value--;
                    }
                    else if (wholeTicket.value + halfTicket.value < screen3.tickets) {
                        wtt.color = "red";
                        htt.color = "red";
                        screen3.seatsOK = false;
                    }
                    else {
                        wtt.color = "black";
                        htt.color = "black";
                        screen3.seatsOK = true;
                        var surmount = wholeTicket.value * 20 + halfTicket.value * 10;
                        totalCost.text = "R$ " + surmount;
                        screen3.total = surmount;
                    }
                }


                Row {
                    Text { id: wtt; text: "Inteira: "; anchors.verticalCenter: parent.verticalCenter}
                    SpinBox {
                        id: wholeTicket
                        maximumValue: screen3.tickets
                        activeFocusOnPress: false
                        onValueChanged: purchase.calculateHalfAndWhole();
                    }
                }
                Row {
                    Text { id: htt; text: "Meia: "; anchors.verticalCenter: parent.verticalCenter }
                    SpinBox {
                        id: halfTicket
                        maximumValue: screen3.tickets
                        activeFocusOnPress: false
                        onValueChanged: purchase.calculateHalfAndWhole();

                    }
                }
                Row {
                    Text { text: "Total: "; anchors.verticalCenter: parent.verticalCenter }
                    Rectangle { width: 45; height: 15; color: "white"; radius: 4
                        Text { id: totalCost; text: ""; anchors.centerIn: parent }
                    }
                }
            }
        }
    }
}
