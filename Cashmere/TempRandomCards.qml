import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"


Page {
   id: view

   actionBar {
      color: Colors.deepOrange.regular[5]

      title: "Single item list"

      actions: [
         Action {
            text: "Add"
            iconName: "add"
            onTriggered: app.pushPage(Qt.resolvedUrl("TempDoubleList.qml"))
         }
      ]
   }

   views: [
      View {
         name: "Items"

         ListView {
            id: listView
            clip: true

            anchors.fill: parent

            header: Item {
               width: parent.width
               height: 8
            }

            footer: Item {
               width: parent.width
               height: 8
            }

            model: 20

            delegate: Button {
               width: parent.width
               height: 48
               text: "This is item number " + index + " on the list"
               style: SingleLineListItemStyle {
                  icon: Icon{
                     name: "favorite"
                  }
               }
            }
         }
      }
   ]
}

