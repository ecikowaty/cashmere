import QtQuick 2.5
import QtQuick.Controls 1.4
import "Styles"

Row {
   layoutDirection: Qt.RightToLeft
   spacing: 8

   height: 52
   width: parent.width

   property alias accepted: acceptButton.action
   property alias rejected: rejectButton.action

   signal interacted()

   anchors {
      right: parent.right; rightMargin: 8
   }

   Button {
      id: acceptButton
      onClicked: interacted()

      anchors.verticalCenter: parent.verticalCenter

      style: FlatButtonStyle {
         lightBackground: true
      }
   }

   Button {
      id: rejectButton
      onClicked: interacted()

      anchors.verticalCenter: parent.verticalCenter

      style: FlatButtonStyle {
         lightBackground: true
      }
   }
}

