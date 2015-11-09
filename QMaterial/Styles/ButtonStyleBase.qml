import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   property Color  color
   property int    colorIndex: 5

   onColorIndexChanged: {
       if (colorIndex > 7) {
           colorIndex = 7
       }
   }

   property int textPaintedWidth
}

