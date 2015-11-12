import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

ApplicationWindow {
   visible: true

   width: 480
   height: 800

   x: 450
   y: 50

   color: "#fafafa"

   MouseArea {
      id: overlay
      anchors.fill: parent
      z: actionBar.z + 1
   }

   ActionBar {
      id: actionBar

      title: "Material"
      actions: [
         Action {
            text: "Backup"
            iconName: "backup"
         },
         Action {
            text: "Settings"
            iconName: "settings"
         },
         Action {
            text: "Tags"
            iconName: "local_offer"
         },
         Action {
            text: "About"
            iconName: "info_outline"
            onTriggered: console.debug(text)
         },
         Action {
            text: "Close"
            iconName: "info_outline"
            onTriggered: console.debug(text)
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

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "raise"

         style: RaisedButtonStyle {
            light: true
         }

      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "flat"

         style: FlatButtonStyle { }
      }
   }
}
