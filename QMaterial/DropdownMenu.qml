import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Menu {
   id: root

   property var   alignOver
   property var   items

   Component {
      id: menuAction
      Action {
         property int index: 0
         onTriggered: root.currentItemIndex = index
      }
   }

   Component.onCompleted: {
      var itemActions = []
      for (var i = 0; i < items.length; ++i) {
         itemActions[i] = menuAction.createObject(root, { "text": items[i], "index": i })
      }

      actions = itemActions
   }
}

