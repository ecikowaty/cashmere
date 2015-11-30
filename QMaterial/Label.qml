import QtQuick 2.0
import "."

Text {
    id: root

    color: Theme.onLightBackground.primary
    property FontStyle fontStyle: FontStyles.body1

    FontLoader {
        id: regular
        source: "qrc:/fonts/Roboto-Regular.ttf"
    }

    FontLoader {
        id: light
        source: "qrc:/fonts/Roboto-Light.ttf"
    }

    FontLoader {
        id: medium
        source: "qrc:/fonts/Roboto-Medium.ttf"
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

