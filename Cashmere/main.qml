import QtQuick 2.5
import QtQuick.Controls 1.4
import Cashmere 1.0
import Cashmere.Styles 1.0

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

                  Button {
                     anchors.centerIn: parent
                     onClicked: dialog.toggle()

                     action: Action {
                        iconName: "add"
                     }

                     style: FloatingActionButtonStyle {
                        mini: true
                     }
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
