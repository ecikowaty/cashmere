import QtQuick 2.5
import QtQuick.Controls 1.4
import "Styles"

Row {
   layoutDirection: Qt.RightToLeft
   spacing: 8

   property alias accepted: acceptButton.action
   property alias rejected: rejectButton.action

   signal interacted()

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

