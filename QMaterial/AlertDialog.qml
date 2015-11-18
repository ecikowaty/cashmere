import QtQuick 2.5
import "."

Dialog {
   id: root

   height: titleLabel.height + descriptionLabel.paintedHeight + actionButtons.height + (title.length > 0 ? 68 : 24)

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
      wrapMode: Text.WordWrap
   }

   Label {
      id: descriptionLabel

      anchors {
         top: title.length > 0 ? titleLabel.bottom : parent.top
         topMargin: title.length > 0 ? 20 : 24
         left: parent.left; leftMargin: 24
         right: parent.right; rightMargin: 24
      }

      fontStyle: FontStyles.subheading
      color: Theme.secondaryText
      wrapMode: Text.WordWrap
   }

   ConfirmationButtons {
      id: actionButtons
      height: 52
      width: parent.width

      onInteracted: root.close()

      anchors {
         top: descriptionLabel.bottom; topMargin: 24
         right: parent.right; rightMargin: 8
      }
   }
}

