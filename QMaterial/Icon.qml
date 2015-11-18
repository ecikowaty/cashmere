import QtQuick 2.0

Item {
   id: root

   property alias size: icon.font.pixelSize
   property alias name: icon.text
   property alias color: icon.color
   property bool  light: false

   width: size
   height: size

   Text {
      id: icon

      FontLoader {
         id: materialIcons
         source: "qrc:/fonts/MaterialIcons-Regular.ttf"
      }

      anchors.centerIn: parent

      font.family: materialIcons.name
      font.pixelSize: 24

      color: light ? Qt.rgba(1, 1, 1) : Qt.rgba(0, 0, 0, 0.38)
   }
}

