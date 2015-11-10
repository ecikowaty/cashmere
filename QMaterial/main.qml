import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

ApplicationWindow {
   visible: true
   width: 480
   height: 800

   color: "#fafafa"

   toolBar: ActionBar {
      actions: [
         Action {
            iconName: "backup"
         },
         Action {
            iconName: "settings"
         }
      ]
   }

   Column {
      anchors.fill: parent
      spacing: 10

      Item {
         width: 20
         height: 70
      }

      Card {
         width: 200
         height: 150

         anchors.horizontalCenter: parent.horizontalCenter

         Label {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "Test"
         }
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "raise"

         style: RaisedButtonStyle { }
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "flat"

         style: FlatButtonStyle { }
      }
   }
}

