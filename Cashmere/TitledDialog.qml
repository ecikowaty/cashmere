import QtQuick 2.5
import Cashmere 1.0
import Cashmere.Styles 1.0

Dialog {
   id: root

   Label {
      id: titleLabel

      anchors {
         top: parent.top; topMargin: 24
         left: parent.left; leftMargin: 24
         right: parent.right; rightMargin: 24
      }

      fontStyle: FontStyles.title
      wrapMode: Text.WordWrap
   }
}
