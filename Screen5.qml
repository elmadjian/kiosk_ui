import QtQuick 2.5

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
                      "<li>&#8226;É proibido entrar portando latas ou garrafas</li>" +
                      "<li>&#8226;Por favor, deixe seu celular desligado</li><br><br>"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                text: "<h4>BOA SESSÃO!</h4>"
            }
        }
    }
}
