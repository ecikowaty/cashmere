import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

ApplicationWindow {
   id: app

   visible: true

   width: 480
   height: 800

   x: 450
   y: 50

   color: "#fafafa"

   function isInitialPage(page) {
      return pageStack.initialItem === page
   }

   function stackDepth() {
      return pageStack.depth
   }

   function pushPage(page) {
      pageStack.push(page)
   }

   function popPage() {
      if (pageStack.depth > 1) {
         pageStack.pop()
      }
   }

   FocusScope {
      id: focusScope
      anchors.fill: parent

      MouseArea {
         anchors.fill: parent
         onClicked: forceActiveFocus()
      }
   }

   PageStack {
      id: pageStack
      anchors.fill: parent

      initialItem: Page {
         id: page

         actionBar {
            title: "Tabs test"
         }

         tabBar: FixedTabBar {
            views: page.views
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

                  Slider {
                     width: 400
                     anchors.horizontalCenter: parent.horizontalCenter

                     style: ContinuousSliderStyle {

                     }
                  }
               }
            }
         ]
      }
   }

   NavigationDrawer {
      id: navigationDrawer

      Button {
         anchors {
            top: parent.top; topMargin: 20
            horizontalCenter: parent.horizontalCenter
         }

         text: "drawer"
         style: RaisedButtonStyle {

         }
      }
   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }
}
