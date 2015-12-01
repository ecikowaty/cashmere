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
               name: "playlists"
               contentHeight: 2000

               Column {
                  spacing: 20
                  anchors.fill: parent

                  Item {
                     width: 400
                     height: 50
                  }

                  Card {
                     width: 400
                     height: 200

                     anchors.horizontalCenter: parent.horizontalCenter
                  }

                  Card {
                     width: 400
                     height: 200

                     anchors.horizontalCenter: parent.horizontalCenter
                  }

                  Card {
                     width: 400
                     height: 200

                     anchors.horizontalCenter: parent.horizontalCenter
                  }

                  Card {
                     width: 400
                     height: 200

                     anchors.horizontalCenter: parent.horizontalCenter
                  }

                  Card {
                     width: 400
                     height: 200

                     anchors.horizontalCenter: parent.horizontalCenter
                  }
               }
            },
            View {
               name: "music"

               Column {
                  spacing: 20
                  anchors.fill: parent

                  Item {
                     width: 400
                     height: 50
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

//   Rectangle {
//      id: drawerOverlay

//      anchors.fill: parent

//      color: Qt.rgba(0, 0, 0, 0.4)
//      opacity: 1 - (Math.abs(navigationDrawer.x) / navigationDrawer.width)
//   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }
}
