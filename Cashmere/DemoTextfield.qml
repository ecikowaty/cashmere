import QtQuick 2.5

Page {
   id: root

   actionBar {
      title: "Tabs test"
   }

   tabBar: FixedTabBar {
      views: root.views
   }

   views: [
      View {
         name: "music"

         Column {
            spacing: 20
            anchors.fill: parent

            Item {
               width: 400
               height: 50
            }

            TextFieldDropdown {
               width: 150
               anchors.horizontalCenter: parent.horizontalCenter

               items: [ "Londyn", "Szczecin", "Berlin", "Warszawa", "Kraków" ]
            }
         }
      }
   ]
}

