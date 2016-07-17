import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"
import "Animations"

Window {
   id: app

   visible: true

   width: 480
   height: 800

   x: 470
   y: 80

   color: "#fafafa"

   property alias initialView: pageStack.initialItem
   property alias navigationDrawer: navigationDrawer
   property alias overlay: overlay
   property alias snackbar: snackbar

   function isInitialPage(page) {
      return pageStack.initialItem === page
   }

   function popPage() {
      pageStack.pop()
   }

   function pushPage(page) {
      pageStack.push(page)
   }

   function undoableRemove(entry) {
      snackbar.show("Entry deleted", "UNDO", 3000, function() {
         wallet.restore(entry)
         snackbar.stopTimer()
      });
   }

   PageStack {
      id: pageStack
      anchors.fill: parent

      onCurrentItemChanged: fbLoader.load(currentItem ? currentItem.floatingButton : null)
   }

   FloatingButtonLoader {
      id: fbLoader

      anchors {
         right: parent.right; rightMargin: 24
         bottom: snackbar.top; bottomMargin: 24
      }
   }

   Snackbar {
      id: snackbar
   }

   NavigationDrawer {
      id: navigationDrawer
   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }
}
