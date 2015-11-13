import QtQuick 2.0
import QtQuick.Controls 1.4

StackView {
   id: root

   delegate: StackViewDelegate {

      pushTransition: StackViewTransition {
         NumberAnimation {
            target: enterItem
            property: "opacity"
            from: 0; to: 1
            duration: 200
         }
         NumberAnimation {
            target: enterItem
            property: "y"
            from: enterItem.height * 0.05; to: 0
            duration: 300
            easing.type: Easing.OutQuart
         }
      }

      popTransition: StackViewTransition {
         NumberAnimation {
            target: exitItem
            property: "opacity"
            from: 1; to: 0
            duration: 200
         }
         NumberAnimation {
            target: exitItem
            property: "y"
            from: 0; to: enterItem.height * 0.05
            duration: 300
            easing.type: Easing.OutQuart
         }
      }
   }
}

