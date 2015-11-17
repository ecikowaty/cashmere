import QtQuick 2.5
import "."

Dialog {
   id: root

//   height: titleLabel.height + descriptionLabel.height + actionButtons.height

   property alias accepted: actionButtons.accepted
   property alias rejected: actionButtons.rejected

   property alias title: titleLabel.text
   property alias description: descriptionLabel.text

   Label {
      id: titleLabel

      anchors {
         top: parent.top; topMargin: 24
         left: parent.left; leftMargin: 24
         right: parent.right; rightMargin: 24
      }

      fontStyle: FontStyles.title
   }

   Label {
      id: descriptionLabel

      anchors {
         top: titleLabel; topMargin: 20
         left: parent.left; leftMargin: 24
         right: parent.right; rightMargin: 24
         bottom: actionButtons.top; bottomMargin: 24
      }

      fontStyle: FontStyles.subheading
      color: Theme.secondaryText
   }

   ActionButtons {
      id: actionButtons
      height: 52
      width: parent.width

      onInteracted: root.hide()

      anchors {
         right: parent.right; rightMargin: 8
         bottom: parent.bottom
      }
   }
}

