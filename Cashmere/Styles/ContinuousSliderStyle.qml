import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

SliderStyle {
   id: root

   property color mainColor: Qt.rgba(0.7, 0.7, 0.7)
   property color backgroundColor: "#fafafa"

   groove: Rectangle {
      implicitWidth: 200
      implicitHeight: 2
      color: mainColor

      Rectangle {
         width: styleData.handlePosition
         height: parent.height
         visible: control.value > 0

         color: Theme.primaryColor
      }
   }

   handle: Rectangle {
      anchors.centerIn: parent
      color: backgroundColor

      implicitWidth: 16
      implicitHeight: 16

      border.color: mainColor
      border.width: 2

      radius: width / 2

      Rectangle {
         anchors.fill: parent
         anchors.margins: control.pressed ? -4 : 0

         radius: width / 2

         color: (control.value > 0 || control.pressed) ? Theme.primaryColor : "transparent"
         anchors.centerIn: parent

         Behavior on anchors.margins { NumberAnimation { duration: 100; easing.type: Easing.OutQuad } }
         Behavior on color { ColorAnimation { duration: 100 } }
      }
   }


}

