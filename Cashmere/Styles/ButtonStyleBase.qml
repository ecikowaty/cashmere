import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   property Color color: Theme.primaryPalette
   property int   colorIndex: 5
   property bool  lightBackground: false
   property int   textPaintedWidth
   property int   horizontalMargins: 32

   property color supportingColor: lightBackground ? "#999" : "#CCC"

   onColorIndexChanged: {
      if (colorIndex > 7) {
         colorIndex = 7
      }
      else if (colorIndex < 0) {
         colorIndex = 0
      }
   }
}

