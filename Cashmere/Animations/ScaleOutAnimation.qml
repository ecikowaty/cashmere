import QtQuick 2.5

NumberAnimation {
   property: "scale"
   from: 1
   to: 0
   duration: target ? 200 : 0
   easing.type: Easing.OutCubic

   onStopped: {
      floatingButtonLoader.switchButton()
      buttonScaleIn.running = true
   }
}
