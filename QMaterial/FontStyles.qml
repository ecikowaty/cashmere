import QtQuick 2.0

pragma Singleton

QtObject {
    property FontStyle display4: FontStyle { size: 112; weight: Font.Light }
    property FontStyle display3: FontStyle { size: 56; weight: Font.Normal }
    property FontStyle display2: FontStyle { size: 45; weight: Font.Normal }
    property FontStyle display1: FontStyle { size: 34; weight: Font.Normal }

    property FontStyle headline: FontStyle { size: 24; weight: Font.Normal }
    property FontStyle title: FontStyle { size: 20; weight: Font.DemiBold }
    property FontStyle subheading: FontStyle { size: 16; weight: Font.Normal }

    property FontStyle body2: FontStyle { size: 14; weight: Font.DemiBold }
    property FontStyle body1: FontStyle { size: 14; weight: Font.Normal }

    property FontStyle caption: FontStyle { size: 12; weight: Font.Normal }
    property FontStyle button: FontStyle { size: 14; weight: Font.DemiBold }
}

