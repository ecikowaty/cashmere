import QtQuick 2.5
import QtQml.Models 2.2

ListView {
   id: listView

   property alias views: viewsModel.children

   orientation: Qt.Horizontal
   snapMode: ListView.SnapOneItem

   highlightFollowsCurrentItem: true
   highlightMoveVelocity: listView.width * 5

   interactive: views.length > 1

   clip: true

   function next() {
      if (currentIndex < count) {
         ++currentIndex
      }
   }

   function prev() {
      if (currentIndex > 0) {
         --currentIndex
      }
   }

   onFlickEnded: listView.currentIndex = visibleArea.xPosition / visibleArea.widthRatio
   model: ObjectModel {
      id: viewsModel
   }

   onWidthChanged: {
      for (var i = 0; i < views.length; ++i) {
         views[i].width = listView.width
      }
   }

   onHeightChanged: {
      for (var i = 0; i < views.length; ++i) {
         views[i].height = listView.height
      }
   }

   Component.onCompleted: {
      // weird fix for ListView showing incorrect item on start
      listView.currentIndex = 1
      listView.currentIndex = 0
   }
}
