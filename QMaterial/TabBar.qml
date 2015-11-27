import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."


Item {
   id: root

   property int currentTab: 0

   property int visibleTabs: views.length

   property var views
}
