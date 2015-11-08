import QtQuick 2.0
import "."
import "Styles"

BasicButton {
   id: root

   label.color: root.color.regular[root.colorIndex]

   style: FlatButtonStyle {
      touchArea: root.touchArea
   }
}

