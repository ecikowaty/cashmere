import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import ".."

DialogStyle {
   id: root

   content: Item {

      Binding {
         target: control
         property: "contentHeight"
         value: titleLabel.paintedHeight + contentLabel.paintedHeight + (control.hasTitle ? 44 : 0)
      }

      Label {
         id: contentLabel

         width: parent.width

         anchors.top: control.hasTitle ? titleLabel.bottom : parent.top
         anchors.topMargin: control.hasTitle ? 20 : 0

         fontStyle: FontStyles.subheading
         color: Theme.secondaryText

         text: control.description
         wrapMode: Text.WordWrap
      }
   }

   background: Card {
      elevation: 24
   }

   actions: Row {
      anchors {
         right: parent.right; rightMargin: 8
      }

      layoutDirection: Qt.RightToLeft
      spacing: 8

      Button {
         action: control.positive
         onClicked: control.hide()
         style: FlatButtonStyle {
         }
      }

      Button {
         action: control.negative
         onClicked: control.hide()
         style: FlatButtonStyle {

         }
      }
   }
}
