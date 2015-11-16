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
            onTriggered: app.pushPage(Qt.resolvedUrl("qrc:/QMaterial/TempDoubleList.qml"))
         }
      ]
   }

   content: ListView {
      id: listView
      clip: true

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

