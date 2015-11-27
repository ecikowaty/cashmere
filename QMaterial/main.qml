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
         actionBar {
            title: "Tabs test"
            tabs: [ "Tab 1", "Tab 2", "Tab 3" ]
         }
      }
   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }
}
