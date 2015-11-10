import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   property Color color: Theme.primaryPalette
   property int   textPaintedWidth
   property bool  light: false
   property color supportingColor: "#999999"
}

