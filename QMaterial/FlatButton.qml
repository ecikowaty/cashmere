import QtQuick 2.0
import "."
import "Styles"

BasicButton {
   id: root

   label.color: color.regular[colorIndex]

   style: FlatButtonStyle {
      touchArea: root.touchArea
   }
}

