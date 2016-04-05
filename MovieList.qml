import QtQuick 2.5
import QtQuick.Controls 1.4

ScrollView {
    width: parent.width
    height: parent.height

    Column {
        width: parent.width
        height: 5*base.width/3

        Rectangle {
            width: base.width - 15
            height: base.width/3
            color: "#D2C9BF"

            Image {
                id: moviePoster1
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: parent.width/5
                height: width * 1.4
                source: "imgs/jarjar.jpg"
            }
            Text {
                width: base.width/1.5
                anchors.left: moviePoster1.right
                anchors.top: moviePoster1.top
                anchors.margins: 15
                font.pixelSize: parent.height/15
                wrapMode: Text.WordWrap
                text: "<h3>Jar Jar's Speech</h3><br>Lorem ipsum dolor sit amet, duo nisl magna cu. Aperiri "+
                      "efficiantur id eam, affert delicata similique te pro, sit agam "+
                      "accumsan et. Detracto intellegebat vix et, pri modus tempor omnium "+
                      "an. Ipsum euripidis qui in."
            }
            Button {
                id: movie1btn
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
                text: " Ver sessões "
                onClicked: {
                    base.state = "screen2";
                    screen2.movieTitle = "<h1>Jar Jar's Speech</h1>"
                }

            }
        }
        Rectangle {
            width: base.width - 15
            height: base.width/3
            color: "#C4B6AB"

            Image {
                id: moviePoster2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: parent.width/5
                height: width * 1.4
                source: "imgs/indiana_phantom.jpg"
            }
            Text {
                width: base.width/1.5
                anchors.left: moviePoster2.right
                anchors.top: moviePoster2.top
                anchors.margins: 15
                font.pixelSize: parent.height/15
                wrapMode: Text.WordWrap
                text: "<h3>Indiana Jones and the Phantom Menace</h3><br>"+
                      "Cetero eruditi vix ei, cum epicuri repudiare ex. An sed esse partiendo, "+
                      "id aliquip argumentum dissentias sea, an putent eleifend vis. Ut "+
                      "oporteat ocurreret quo, eum quis wisi ea. No has saepe principes, "+
                      "duo eu ludus saperet, iudico officiis adipisci id sit. Vix in fuisset "+
                      "omittantur, sit no ignota integre dignissim."
            }
            Button {
                id: movie2btn
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
                text: " Ver sessões "
                onClicked: {
                    base.state = "screen2";
                    screen2.movieTitle = "<h1>Indiana Jones and the Phantom Menace</h1>"
                }
            }
        }
        Rectangle {
            width: base.width - 15
            height: base.width/3
            color: "#D2C9BF"

            Image {
                id: moviePoster3
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: parent.width/5
                height: width * 1.4
                source: "imgs/enemy_of_bill.jpg"
            }
            Text {
                width: base.width/1.5
                anchors.left: moviePoster3.right
                anchors.top: moviePoster3.top
                anchors.margins: 15
                font.pixelSize: parent.height/15
                wrapMode: Text.WordWrap
                text: "<h3>Enemy of Bill Gates</h3><br>"+
                      "Saepe mandamus explicari in sit, movet putent laboramus id nec. "+
                      "Odio aeterno minimum sit ad, vix velit alienum mandamus cu. Cu "+
                      "harum option suavitate sea. Vis in quis inermis. Et meis homero "+
                      "sea. Sea no meliore laboramus expetendis."
            }
            Button {
                id: movie3btn
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
                text: " Ver sessões "
                onClicked: {
                    base.state = "screen2";
                    screen2.movieTitle = "<h1>Enemy of Bill Gates</h1>"
                }
            }
        }
        Rectangle {
            width: base.width - 15
            height: base.width/3
            color: "#C4B6AB"

            Image {
                id: moviePoster4
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: parent.width/5
                height: width * 1.4
                source: "imgs/x-men_in_black.jpg"
            }
            Text {
                width: base.width/1.5
                anchors.left: moviePoster4.right
                anchors.top: moviePoster4.top
                anchors.margins: 15
                font.pixelSize: parent.height/15
                wrapMode: Text.WordWrap
                text: "<h3>X-Men in Black</h3><br>"+
                      "Ne nam quis discere fierent, ea modo quidam meliore sed, et "+
                      "eos impetus sensibus. Harum maiorum ut vim. Ex homero oporteat "+
                      "consectetuer est, mea an accusam disputando. Stet magna cum te, "+
                      "reque aeque ancillae pro ne, tincidunt definitiones ne eam."
            }
            Button {
                id: movie4btn
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
                text: " Ver sessões "
                onClicked: {
                    base.state = "screen2";
                    screen2.movieTitle = "<h1>X-Men in Black</h1>"
                }
            }
        }
        Rectangle {
            width: base.width - 15
            height: base.width/3
            color: "#D2C9BF"

            Image {
                id: moviePoster5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: parent.width/5
                height: width * 1.4
                source: "imgs/harry_sully.jpg"
            }
            Text {
                width: base.width/1.5
                anchors.left: moviePoster5.right
                anchors.top: moviePoster5.top
                anchors.margins: 15
                font.pixelSize: parent.height/15
                wrapMode: Text.WordWrap
                text: "<h3>When Harry Met Sully</h3><br>"+
                      "Sed et agam necessitatibus. No mucius doming insolens per, "+
                      "eirmod tamquam constituam ei mel, vel delenit quaestio evertitur "+
                      "ea. Pri id prima clita, et nominavi suscipit lucilius per. At eripuit "+
                      "intellegat per, eros ullum torquatos in sit, mei eu ponderum antiopam. "+
                      "Eos ei omnis iriure sapientem."
            }
            Button {
                id: movie5btn
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
                text: " Ver sessões "
                onClicked: {
                    base.state = "screen2";
                    screen2.movieTitle = "<h1>When Harry Met Sully</h1>"
                }
            }
        }
    }
}
