import QtQuick 2.0
import "."

Text {
    id: root

    property FontStyle style: FontStyles.body1

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
        if (style.weight === Font.Light) {
            return light.name
        }
        else if (style.weight === Font.DemiBold) {
            return medium.name
        }

        return regular.name
    }

    font.pixelSize: style.size
    font.weight: style.weight

    Component.onCompleted: {
        if (style === FontStyles.button) {
            text = text.toUpperCase()
        }
    }
}

