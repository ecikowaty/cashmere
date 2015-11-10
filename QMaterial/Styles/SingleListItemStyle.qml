import QtQuick 2.0
import ".."

Rectangle {
   id: root

   width: 200
   height: 50

   property alias text: label.text

   Label {
      id: label

      anchors {
         left: parent.left;
         verticalCenter: parent.verticalCenter
      }

      fontStyle: FontStyles.subheading
      text: "Single list item"
   }
}

