import QtQuick 2.5
import QtQuick.Controls 1.4
import "Styles"
import "."

Card {
   id: root

   readonly property int   widthFactor: 56
   property double         multiplier: 2.0
   property int            visibleLimit: 3
   property int            itemHeight: 48
   property list<Action>   actions

   width: multiplier * widthFactor
   height: (actions.length > visibleLimit ? visibleLimit : actions.length) * itemHeight

   ListView {
      id: listView

      anchors {
         fill: parent
         leftMargin: 16; rightMargin: leftMargin
      }

      clip: true

      delegate: SingleListItemStyle {
         width: parent.width
         height: root.itemHeight
         text: name
      }
   }
}

