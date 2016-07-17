import QtQuick 2.5

Rectangle {
   color: "#fafafa"
   property string   name: "View"
   property bool     hasTabs: false
   property bool     lightBackground: true

   Component.onCompleted: forceActiveFocus()

   FocusScope {
      anchors.fill: parent

      MouseArea {
         anchors.fill: parent
         onClicked: forceActiveFocus()
      }
   }

   Keys.onReleased: {
      if (event.key === Qt.Key_Back || event.key === Qt.Key_Left) {
         if (navigationDrawer.isOpen()) {
            navigationDrawer.close()
         }
         else if (overlay.enabled) {
            overlay.forceClicked()
         }
         else {
            app.popPage()
         }

         event.accepted = true
      }
   }
}

