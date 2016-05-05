import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Dialog {
   id: root

   height: titleLabel.height + itemList.height + 44

   title: "Simple dialog"

   property alias title: titleLabel.text

   property int visibleLimit: itemList.count

   property var model: ListModel {
      // elementText: "text"
      // elementIcon: "icon"
   }

   property list<Action> actions

   signal selected(var action)

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

   ListView {
      id: itemList
      anchors {
         top: titleLabel.bottom; topMargin: 20
      }

      width: root.width
      height: visibleLimit * 56
      clip: true

      interactive: visibleLimit < count
      model: root.model

      delegate: Button {
         width: parent.width
         height: 56

         action: Action {
            text: elementText ? elementText : "Unavailable"
            iconName: elementIcon
         }

         onClicked: {
            if (actions.length > 0) {
               actions[index].trigger()
            }

            selected(action)
            root.close()
         }

         style: SingleLineListItemStyle {
            leftMargin: 24
         }
      }
   }

   Component.onCompleted: {
      for (var i = 0; i < actions.length; ++i)
      {
         root.model.append({ "elementText": actions[i].text, "elementIcon": actions[i].iconName })
      }
   }
}

