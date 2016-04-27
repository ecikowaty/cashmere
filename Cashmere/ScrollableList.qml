import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Cashmere 1.0

ScrollView {
   id: root

   property alias view: listView

   property int scrollbarRightMargin: 8

   style: ScrollViewStyle {
      id: style
      corner: Item {

      }

      frame: corner
      incrementControl: Item {
         height: 8
      }

      decrementControl: incrementControl

      scrollBarBackground: Item {
         implicitWidth: scrollbarRightMargin
      }

      handle: Rectangle {
         implicitWidth: 4
         implicitHeight: 100

         radius: 2

         color: Theme.onLightBackground.dividers
      }

      transientScrollBars: true
   }

   ListView {
      id: listView

      anchors.fill: parent
   }
}
