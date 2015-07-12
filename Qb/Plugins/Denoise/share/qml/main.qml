/* Webcamoid, webcam capture application.
 * Copyright (C) 2011-2015  Gonzalo Exequiel Pedone
 *
 * Webcamoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
 *
 * Email   : hipersayan DOT x AT gmail DOT com
 * Web-Site: http://github.com/hipersayanX/webcamoid
 */

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

GridLayout {
    id: configs
    columns: 3

    function strToFloat(str)
    {
        return str.length < 1? 0: parseFloat(str)
    }

    Label {
        text: qsTr("Radius")
    }
    Slider {
        id: sldRadius
        value: Denoise.radius
        stepSize: 1
        maximumValue: 10

        onValueChanged: Denoise.radius = value
    }
    SpinBox {
        id: spbRadius
        value: sldRadius.value
        maximumValue: sldRadius.maximumValue
        stepSize: sldRadius.stepSize

        onValueChanged: sldRadius.value = value
    }

    Label {
        text: qsTr("Factor")
    }
    TextField {
        text: Denoise.factor
        validator: RegExpValidator {
            regExp: /-?\d+/
        }

        onTextChanged: Denoise.factor = strToFloat(text)
    }
    Label {
    }

    Label {
        text: qsTr("Mu")
    }
    TextField {
        text: Denoise.mu
        validator: RegExpValidator {
            regExp: /-?\d+/
        }

        onTextChanged: Denoise.mu = strToFloat(text)
    }
    Label {
    }

    Label {
        text: qsTr("Sigma")
    }
    TextField {
        text: Denoise.sigma
        validator: RegExpValidator {
            regExp: /-?\d+/
        }

        onTextChanged: Denoise.sigma = strToFloat(text)
    }
    Label {
    }
}
