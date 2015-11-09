import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Window {
   visible: true
   width: 480
   height: 800

   color: "#fafafa"

   Column {
      anchors.fill: parent
      spacing: 10

      Item {
         width: 20
         height: 70
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "raise"

         style: RaisedButtonStyle { }

         onClicked: card.elevation++
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "flat"

         style: FlatButtonStyle { }
      }

      Card {
         id: card

         width: 200
         height: 150
         anchors.horizontalCenter: parent.horizontalCenter

         Icon {
            anchors.centerIn: parent
            name: "arrow_back"
         }
      }
   }
}

