import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Page {
   id: root

   actionBar {
      color: Colors.green.regular[5]
      visibleLimit: 0
      actions: [
         Action {
            text: "Close"
            onTriggered: app.popPage()
         }
      ]
   }

   content: ListView {
      id: listView
      clip: true

      model: 20

      delegate: Button {
         width: parent.width
         height: 72

         style: DoubleLineListItemStyle {
            primaryText: "This is item number " + index + " on the list"
            secondaryText: "With some secondary text"

            icon: Icon {
               name: "face"
            }
         }
      }
   }
}

