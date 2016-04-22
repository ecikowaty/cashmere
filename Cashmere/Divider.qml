import QtQuick 2.5
import "."

Rectangle {
   width: parent.width
   height: 1

   color: parent.light
          ? Theme.onLightBackground.dividers
          : Theme.onDarkBackground.dividers
}

