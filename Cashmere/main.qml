import QtQuick 2.5
import Cashmere 1.0

MaterialApplication {
   id: app

   initialView: Page {
      actionBar {
         title: "Tab test"
      }

      mainView: TabbedViews {
         id: tabbedView

         tabBar: FixedTabBar {
            tabs: tabbedView.views
         }

         views: [
            View {
               name: "expenses"

               Item {
                  id: paddingArea
                  anchors.fill: parent
                  anchors.margins: 16

                  EntryCard {
                     width: parent.width - 16
                     height: 400

                     anchors.horizontalCenter: parent.horizontalCenter
                  }
               }
            },
            View {
               name: "incomes"
               Label {
                  text: "View 2"
                  anchors.centerIn: parent
               }
            }
         ]
      }
   }
}
