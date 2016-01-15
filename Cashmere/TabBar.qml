import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."


Rectangle {
   id: root

   color: Theme.primaryColor

   property int currentTab: 0

   property int visibleTabs: tabs.length

   property var tabs: []

   property alias elevation: shadow.elevation

   Shadow {
      id: shadow
      elevation: 4

      z: parent.z - 1

      visible: elevation > 0

      width: parent.width
      height: parent.height
      anchors.centerIn: parent

      anchors.verticalCenterOffset: elevation / 2
   }
}
