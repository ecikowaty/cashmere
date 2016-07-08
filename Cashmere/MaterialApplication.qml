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

   function stackDepth() {
      return pageStack.depth
   }

   function pushPage(page) {
      pageStack.push(page)
   }

   function popPage() {
      if (pageStack.depth > 1) {
         pageStack.pop()
         replaceFloatingButton(pageStack.currentItem.floatingButton)
      }
      else {
         Qt.quit()
      }
   }

   function replaceFloatingButton(button) {
      floatingButtonLoader.replace(button)
   }

   function snackbarFor(entry) {
      snackbar.show("Entry deleted", "UNDO", 3000, function() {
         wallet.restore(entry)
         snackbar.stopTimer()
      });
   }

   PageStack {
      id: pageStack
      anchors.fill: parent
   }

   Loader {
      id: floatingButtonLoader
      anchors {
         right: parent.right; rightMargin: 24
         bottom: snackbar.top; bottomMargin: 24
      }

      property var newButton

      function switchButton() {
         sourceComponent = newButton
         newButton = null
      }

      function replace(button) {
         if (sourceComponent) {
            buttonScaleOut.start()
            newButton = button
         }
         else {
            sourceComponent = button
            buttonScaleIn.start()
         }
      }

      // todo: add a small rotation animation
      ScaleInAnimation {
         id: buttonScaleIn
         target: floatingButtonLoader
      }

      ScaleOutAnimation {
         id: buttonScaleOut
         target: floatingButtonLoader

         onStopped: {
            floatingButtonLoader.switchButton()
            buttonScaleIn.running = true
         }
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
