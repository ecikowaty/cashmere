import QtQuick 2.5
import "."
import "Styles"

BasicButton {
   id: root

   style: RaisedButtonStyle {
       baseColor: root.color
       colorIndex: root.colorIndex
       touchArea: root.touchArea
   }
}

