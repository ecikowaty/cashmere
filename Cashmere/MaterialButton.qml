import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Button {
   id: root
   clip: true

   RippleSurface {
      onClicked: {
         if (root.action) {
            root.action.trigger()
         }
         else {
            parent.clicked()
         }
      }
   }
}
