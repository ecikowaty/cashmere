import QtQuick 2.0
import "."

Text {
    id: root

    color: parent.light
           ? Theme.onLightBackground.primary
           : Theme.onDarkBackground.primary
    property FontStyle fontStyle: FontStyles.body1

    Behavior on color { ColorAnimation { duration: 200 } }

    FontLoader {
        id: regular
        source: Qt.resolvedUrl("fonts/Roboto-Regular.ttf")
    }

    FontLoader {
        id: light
        source: Qt.resolvedUrl("fonts/Roboto-Light.ttf")
    }

    FontLoader {
        id: medium
        source: Qt.resolvedUrl("fonts/Roboto-Medium.ttf")
    }

    font.family: {
        if (fontStyle.weight === Font.Light) {
            return light.name
        }
        else if (fontStyle.weight === Font.DemiBold) {
            return medium.name
        }

        return regular.name
    }

    font.pixelSize: fontStyle.size
    font.weight: fontStyle.weight

    Component.onCompleted: {
        if (fontStyle === FontStyles.button) {
            text = text.toUpperCase()
        }
    }
}

