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

         tabBar: ScrollableTabBar {
            views: page.views
         }

         views: [
            View {
               name: "playlists"
               Column {
                  spacing: 20
                  anchors.fill: parent

                  Item {
                     width: 400
                     height: 50
                  }

                  Card {
                     width: 400
                     height: 150
                     anchors.horizontalCenter: parent.horizontalCenter

                     Label {
                        id: title1
                        text: "Fixed tab view"

                        anchors {
                           top: parent.top; topMargin: 16
                           left: parent.left; leftMargin: 16
                        }

                        fontStyle: FontStyles.headline
                     }

                     Label {
                        id: description1
                        text: "Pushes a multi tabbed view, each tab occupies same width in action bar."

                        anchors {
                           top: title1.bottom; topMargin: 16
                           left: parent.left; leftMargin: 16
                           right: parent.right; rightMargin: 16
                        }

                        wrapMode: Text.WordWrap
                        color: Theme.onLightBackground.secondary
                     }

                     Button {
                        text: "add"

                        anchors {
                           bottom: parent.bottom; bottomMargin: 8
                           left: parent.left; leftMargin: 8
                        }

                        style: FlatButtonStyle {
                           horizontalMargins: 16
                        }
                     }
                  }

                  Card {
                     width: 400
                     height: 150
                     anchors.horizontalCenter: parent.horizontalCenter

                     Label {
                        id: title2
                        text: "Scrollable tab view"

                        anchors {
                           top: parent.top; topMargin: 16
                           left: parent.left; leftMargin: 16
                        }

                        fontStyle: FontStyles.headline
                     }

                     Label {
                        id: description2
                        text: "Pushes a multi tabbed view, tabs are scrollable."

                        anchors {
                           top: title2.bottom; topMargin: 16
                           left: parent.left; leftMargin: 16
                           right: parent.right; rightMargin: 16
                        }

                        wrapMode: Text.WordWrap
                        color: Theme.onLightBackground.secondary
                     }

                     Button {
                        text: "add"

                        anchors {
                           bottom: parent.bottom; bottomMargin: 8
                           left: parent.left; leftMargin: 8
                        }

                        style: FlatButtonStyle {
                           horizontalMargins: 16
                        }
                     }
                  }
               }
            }
         ]
      }
   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }
}
