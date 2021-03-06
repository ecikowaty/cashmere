import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Rectangle {
   id: root

   color: "#fafafa"

   property alias actionBar: actionBar

   property alias mainView: mainViewLoader.sourceComponent

   property bool lightBackground: true

   property Component floatingButton

   ActionBar {
      id: actionBar

      width: parent.width
      height: 56

      title: "ActionBar"
      dropShadow: !mainViewLoader.item || !mainViewLoader.item.hasTabs

      onBackPressed: app.popPage()
   }

   Loader {
      id: mainViewLoader

      anchors {
         top: actionBar.bottom
         left: parent.left
         right: parent.right
         bottom: parent.bottom
      }
   }
}

