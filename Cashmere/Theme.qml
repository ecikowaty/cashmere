pragma Singleton

import QtQuick 2.5
import "."

Item {
   property TextColorPreset onLightBackground: TextColorPreset {
      primary: Qt.rgba(0, 0, 0, 0.87)
      secondary: Qt.rgba(0, 0, 0, 0.54)
      hintOrDisabled: Qt.rgba(0, 0, 0, 0.38)
      dividers: Qt.rgba(0, 0, 0, 0.12)
   }
   property TextColorPreset onDarkBackground: TextColorPreset {
      primary: Qt.rgba(1, 1, 1, 1)
      secondary: Qt.rgba(1, 1, 1, 0.7)
      hintOrDisabled: Qt.rgba(1, 1, 1, 0.3)
      dividers: Qt.rgba(1, 1, 1, 0.12)
   }

   readonly property Color primaryPalette: Colors.blue
   readonly property Color accentPalette: Colors.lime

   readonly property color primaryColor: primaryPalette ? primaryPalette.regular[5] : "black"
   readonly property color accentColor: accentPalette ? accentPalette.accent[2] : "black"

   function shadeOfPrimary(factor) {
      if (factor < 0 || factor > 9) {
         console.warn("invalid shade factor:", factor)
         return primaryPalette.regular[factor]
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
}

