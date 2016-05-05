import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Dialog {
   id: root

   height: titleLabel.height + itemsList.height + actionButtons.height + 44

   property alias title: titleLabel.text

   function close() {
      state = "closed"
      itemsList.positionViewAtBeginning()
      if (radioGroup.current) {
         radioGroup.current = null
      }
   }

   property list<Action>   actions
   property int            visibleItems: actions.length

   signal selected(var item)

   Label {
      id: titleLabel

      anchors {
         top: parent.top; topMargin: 24
         left: parent.left; leftMargin: 24
         right: parent.right; rightMargin: 24
      }

      fontStyle: FontStyles.title
      wrapMode: Text.WordWrap
   }

   Divider {
      anchors.bottom: itemsList.top
      opacity: !itemsList.atYBeginning
      Behavior on opacity { NumberAnimation {} }
   }

   ListView {
      id: itemsList

      anchors.top: titleLabel.bottom
      anchors.topMargin: 20

      clip: true

      width: parent.width
      height: root.visibleItems * 56

      model: actions.length

      ExclusiveGroup {
         id: radioGroup
      }

      delegate: RadioButton {
         width: parent.width
         height: 56
         text: actions[index].text

         exclusiveGroup: radioGroup
         onClicked: itemsList.currentIndex = index

         style: CircleRadioButtonStyle {
            leftMargin: 24
         }
      }

      rebound: Transition {
         NumberAnimation {
            properties: "y"
            duration: 300
            easing.type: Easing.OutQuart
         }
      }
   }

   Divider {
      anchors.bottom: actionButtons.top
      opacity: !itemsList.atYEnd
      Behavior on opacity { NumberAnimation {} }
   }

   ConfirmationButtons {
      id: actionButtons

      width: parent.width
      height: 52

      anchors {
         top: itemsList.bottom
      }

      onInteracted: root.close()

      accepted: Action {
         text: "ok"
         enabled: radioGroup.current !== null
         onTriggered: actions[itemsList.currentIndex].trigger()
      }

      rejected: Action {
         text: "cancel"
      }
   }
}

