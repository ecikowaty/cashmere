import QtQuick 2.5
import Cashmere 1.0

MaterialApplication {
   id: app

   initialView: Page {
      actionBar {
         title: "Tab test"
      }

      tabBar: ScrollableTabBar {
         tabs: [ "Tab 1", "Tab 2" ]
      }

      views: [
         View {
            Label {
               text: "View 1"
               anchors.centerIn: parent
            }
         },
         View {
            Label {
               text: "View 2"
               anchors.centerIn: parent
            }

         }
      ]
   }
}
