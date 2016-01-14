import QtQuick 2.5

Item {
   id: root

   property var observed
   property var observedStart
   property double measurementStart

   property bool measureWhen
   property bool increasing: true

   signal velocityMeasured(var velocity)

   onMeasureWhenChanged: {
      if (measureWhen) {
         measurementStart = new Date().valueOf()
         observedStart = observed
      }
      else {
         var elapsed = new Date().valueOf() - measurementStart
         var pixelDistance = observed - observedStart

         increasing = pixelDistance > 0
         velocityMeasured((Math.abs(pixelDistance) * 1000) / elapsed)
      }
   }
}

