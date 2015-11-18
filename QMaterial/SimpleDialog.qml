import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Dialog {
   id: root

   height: titleLabel.height + listView.height + 44

   title: "Simple Dialog"

   property alias title: titleLabel.text
   property alias delegate: listView.delegate


   property list<Action>   actions
   property int            visibleActions: actions.length

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

   ListView {
      id: listView
      width: parent.width
      height: visibleActions * 56
      clip: true
      model: actions.length

      interactive: visibleActions < actions.length

      anchors {
         top: titleLabel.bottom; topMargin: 20
         left: parent.left
         right: parent.right
      }

      delegate: Button {
         width: parent.width
         height: 56
         action: actions[index]
         onClicked: root.hide()
         style: SingleLineListItemStyle {

         }
      }
   }
}
