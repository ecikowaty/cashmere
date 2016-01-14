import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Dialog {
   id: root

   height: titleLabel.height + actionsColumn.height + 44

   title: "Simple dialog"

   property alias title: titleLabel.text
   property alias delegate: repeater.delegate


   property list<Action>   actions

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

   Column {
      id: actionsColumn
      width: parent.width
      height: repeater.count * 56
      clip: true

      anchors {
         top: titleLabel.bottom; topMargin: 20
         left: parent.left
         right: parent.right
      }

      Repeater {
         id: repeater
         clip: true
         model: actions.length

         delegate: Button {
            width: parent.width
            height: 56
            action: actions[index]
            onClicked: root.close()
            style: SingleLineListItemStyle {
               leftMargin: 24
            }
         }
      }
   }
}

