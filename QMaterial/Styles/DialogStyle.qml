import QtQuick 2.5
import ".."

QtObject {
   property Item        control
   property Component   background
   property Component   content
   property Component   actions

   Component.onCompleted: {
      if (!control) {
         console.error("control not defined")
      }
   }
}

