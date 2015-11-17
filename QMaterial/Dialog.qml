import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Item {
   id: root

   width: 350
   height: contentLoader.height + actionsLoader.height

   anchors.centerIn: parent

   state: "hidden"
   enabled: isOpen()

   opacity: isOpen()
   Behavior on opacity { NumberAnimation { duration: 150 } }

   property string   title
   property string   description

   property bool     hasTitle: title.length > 0

   property Action   positive
   property Action   negative

   property int      contentHeight

   property DialogStyle style

   function isOpen() {
      return state === "open"
   }

   function show() {
      state = "open"
   }

   function hide() {
      state = "hidden"
   }

   MouseArea {
      anchors.fill: parent // doesn't propagate event over to Overlay
   }

   OverlayBinder {
      onClicked: hide()
      darken: true
      enableWhen: isOpen()
   }

   Loader {
      id: backgroundLoader

      anchors.fill: parent
      sourceComponent: style.background
   }

   Loader {
      id: contentLoader

      width: parent.width - 48 // margins
      height: contentHeight + 24 // bottom margin

      anchors.top: parent.top
      anchors.topMargin: 24
      anchors.horizontalCenter: parent.horizontalCenter

      sourceComponent: style.content
   }

   Loader {
      id: actionsLoader

      width: parent.width
      height: visible ? 52 : 0

      anchors.bottom: parent.bottom

      visible: positive && negative

      sourceComponent: style.actions
   }

   Component.onCompleted: parent = overlay
}

