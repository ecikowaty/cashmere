import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Rectangle {
   id: root
   color: "#fafafa"

   property alias actionBar: actionBar
   property alias content: contentLoader.sourceComponent

   onContentChanged: {
      if (content) {
         contentLoader.sourceComponent = content
      }
   }

   ActionBar {
      id: actionBar

      title: "ActionBar"

      onBackPressed: app.popPage()
   }

   Loader {
      id: contentLoader
      anchors {
         top: actionBar.bottom
         left: parent.left
         right: parent.right
         bottom: parent.bottom
      }
   }
}

