import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Item {
   id: root

   property alias actionBar: actionBar

   ActionBar {
      id: actionBar

      title: "ActionBar"

      onBackPressed: app.popPage()
   }
}

