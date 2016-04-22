import QtQuick 2.5
import "."

Rectangle {
   width: parent.width
   height: 1

   color: parent.lightBackground
          ? Theme.onLightBackground.dividers
          : Theme.onDarkBackground.dividers
}

