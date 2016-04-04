import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle {
    id: base
    width: 600
    height: 800
    color: "white"

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
            width: base.width
            height: parent.height/1.35

            MovieList {
                id: screen1
            }

            Rectangle {
                id: screen2
                width: parent.width
                height: parent.height
                color: "black"
            }

        }

        //Rodapé com navegação
        //--------------------
        Rectangle {
            width: parent.width
            height: parent.height/12
            color: "#428F9C"

            Rectangle {
                anchors.top: parent.top
                width: parent.width
                height: parent.height/3
                color: "#246B7D"
            }
        }
    }

    //Estados de transição
    //--------------------
    states: [
        State {
            name: "screen1"
            PropertyChanges {
                target: screen1
                visible: true
            }
            PropertyChanges {
                target: screen2
                visible: false
            }
        },
        State {
            name: "screen2"
            PropertyChanges {
                target: screen1
                visible: false
            }
            PropertyChanges {
                target: screen2
                visible: true
            }
        }
    ]

    state: "screen1"


}
