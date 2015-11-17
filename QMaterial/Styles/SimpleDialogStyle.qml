import QtQuick 2.5
import "."
import ".."

DialogStyle {
   id: root

   content: Item {

      Binding {
         target: control
         property: "contentHeight"
         value: titleLabel.paintedHeight + listView.height + (control.hasTitle ? 44 : 0)
      }

      Label {
         id: titleLabel

         width: parent.width
         text: control.title

         fontStyle: FontStyles.title
         wrapMode: Text.WordWrap
      }

      ListView {
         id: listView
         width: parent.width
         height: control.visibleLimit * 58

         anchors.top: control.hasTitle ? titleLabel.bottom : parent.top
         anchors.topMargin: control.hasTitle ? 20 : 0

         model: control.model
         delegate: control.listDelegate
      }
   }

   background: Card {
      elevation: 24
   }
}

