import QtQuick 2.5

Rectangle {
   color: "#fafafa"
   property string   name: "View"
   property bool     hasTabs: false

   Component.onCompleted: forceActiveFocus()

   FocusScope {
      anchors.fill: parent

      MouseArea {
         anchors.fill: parent
         onClicked: forceActiveFocus()
      }
   }

   Keys.onReleased: {
       if (event.key === Qt.Key_Back) {
           app.popPage()
           event.accepted = true
       }
   }
}

