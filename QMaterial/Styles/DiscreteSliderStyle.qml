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

      tickmarks: Repeater {
         width: control.width
         height: control.height
         model: control.width / control.stepSize
         delegate: Rectangle {
            color: Theme.onLightBackground.primary
            width: 4
            height: 2
//            parent.model:
         }
      }
//   tickmarks: Repeater {
//      id: repeater
//      model: control.stepSize > 0 ? 1 + (control.maximumValue - control.minimumValue) / control.stepSize : 0
//      width: control.orientation == Qt.Vertical ? control.height : control.width
//      height: control.orientation == Qt.Vertical ? control.width : control.height
//      Rectangle {
//         color: "black"
//         width: 40 ; height: 30
//         y: control.orientation == Qt.Vertical ? control.width : control.height
//         //Position ticklines from styleData.handleWidth to width - styleData.handleWidth/2
//         //position them at an half handle width increment
//         x: styleData.handleWidth / 2 + index * ((repeater.width - styleData.handleWidth) / (repeater.count>1 ? repeater.count-1 : 1))
//         opacity: control.enabled ? 1 : 0.6
//      }
//   }
}

