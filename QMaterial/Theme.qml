pragma Singleton

import QtQuick 2.5
import "."

Item {
   readonly property color text: alpha(0.82)
   readonly property color secondaryText: alpha(0.54)
   readonly property color disabled: alpha(0.38)
   readonly property color dividers: alpha(0.82)

   readonly property Color primaryPalette: Colors.blue
   readonly property Color accentPalette: Colors.cyan

   readonly property color primary: primaryPalette.regular[5]
   readonly property color accent: accentPalette.accent[1]

   function shadeOfPrimary(factor) {
      if (factor < 0 || factor > 9) {
         console.warn("invalid shade factor:", factor)
         return primaryPalette.regular[5]
      }

      return primaryPalette.regular[factor]
   }

   function shadeOfAccent(factor) {
      if (factor < 0 || factor > 9) {
         console.warn("invalid shade factor:", factor)
         return accentPalette.accent[5]
      }

      return accentPalette.accent[factor]
   }

   function alpha(factor) {
      return Qt.rgba(0, 0, 0, factor)
   }
}

