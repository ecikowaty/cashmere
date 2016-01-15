import QtQuick 2.5

Flickable {
   property string   name: "View"
   property bool     hasTabs: false
   property alias    color: background.color

   Rectangle {
      id: background
      anchors.fill: parent
   }
}

