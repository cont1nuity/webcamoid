/* Webcamoid, webcam capture application.
 * Copyright (C) 2016  Gonzalo Exequiel Pedone
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
 * Web-Site: http://webcamoid.github.io/
 */

import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.1 as LABS
import AkControls 1.0 as AK

GridLayout {
    columns: 2

    function haarFileIndex(haarFile)
    {
        var index = -1

        for (var i = 0; i < cbxHaarFile.model.count; i++)
            if (cbxHaarFile.model.get(i).haarFile === haarFile) {
                index = i
                break
            }

        return index
    }

    function markerTypeIndex(markerType)
    {
        var index = -1

        for (var i = 0; i < cbxMarkerType.model.count; i++)
            if (cbxMarkerType.model.get(i).markerType === markerType) {
                index = i
                break
            }

        return index
    }

    function markerStyleIndex(markerStyle)
    {
        var index = -1

        for (var i = 0; i < cbxMarkerStyle.model.count; i++)
            if (cbxMarkerStyle.model.get(i).markerStyle === markerStyle) {
                index = i
                break
            }

        return index
    }

    function fromRgba(rgba)
    {
        var a = ((rgba >> 24) & 0xff) / 255.0
        var r = ((rgba >> 16) & 0xff) / 255.0
        var g = ((rgba >> 8) & 0xff) / 255.0
        var b = (rgba & 0xff) / 255.0

        return Qt.rgba(r, g, b, a)
    }

    function toRgba(color)
    {
        var a = Math.round(255 * color.a) << 24
        var r = Math.round(255 * color.r) << 16
        var g = Math.round(255 * color.g) << 8
        var b = Math.round(255 * color.b)

        return a | r | g | b
    }

    function toQrc(uri)
    {
        if (uri.indexOf(":") === 0)
            return "qrc" + uri

        return "file:" + uri
    }

    function strToSize(str)
    {
        if (str.length < 1)
            return Qt.size()

        var size = str.split("x")

        if (size.length < 2)
            return Qt.size()

        return Qt.size(size[0], size[1])
    }

    // Haar file.
    Label {
        //: https://en.wikipedia.org/wiki/Haar-like_feature
        text: qsTr("Haar file")
    }
    ComboBox {
        id: cbxHaarFile
        textRole: "text"
        currentIndex: haarFileIndex(FaceDetect.haarFile)
        Layout.fillWidth: true

        model: ListModel {
            ListElement {
                text: qsTr("Eye")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_eye.xml"
            }
            ListElement {
                text: qsTr("Eye glasses")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_eye_tree_eyeglasses.xml"
            }
            ListElement {
                text: qsTr("Frontal face alternative 1")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_frontalface_alt.xml"
            }
            ListElement {
                text: qsTr("Frontal face alternative 2")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_frontalface_alt2.xml"
            }
            ListElement {
                text: qsTr("Frontal face alternative 3")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_frontalface_alt_tree.xml"
            }
            ListElement {
                text: qsTr("Frontal face default")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_frontalface_default.xml"
            }
            ListElement {
                text: qsTr("Full body")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_fullbody.xml"
            }
            ListElement {
                text: qsTr("Left Eye 1")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_lefteye_2splits.xml"
            }
            ListElement {
                text: qsTr("Lower body")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_lowerbody.xml"
            }
            ListElement {
                text: qsTr("Eye pair big")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_eyepair_big.xml"
            }
            ListElement {
                text: qsTr("Eye pair small")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_eyepair_small.xml"
            }
            ListElement {
                text: qsTr("Left ear")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_leftear.xml"
            }
            ListElement {
                text: qsTr("Left eye 2")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_lefteye.xml"
            }
            ListElement {
                text: qsTr("Mouth")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_mouth.xml"
            }
            ListElement {
                text: qsTr("Nose")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_nose.xml"
            }
            ListElement {
                text: qsTr("Right ear")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_rightear.xml"
            }
            ListElement {
                text: qsTr("Right Eye 1")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_righteye.xml"
            }
            ListElement {
                text: qsTr("Upper body 1")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_mcs_upperbody.xml"
            }
            ListElement {
                text: qsTr("Profile face")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_profileface.xml"
            }
            ListElement {
                text: qsTr("Right eye 2")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_righteye_2splits.xml"
            }
            ListElement {
                text: qsTr("Smile")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_smile.xml"
            }
            ListElement {
                text: qsTr("Upper body")
                haarFile: ":/FaceDetect/share/haarcascades/haarcascade_upperbody.xml"
            }
        }

        onCurrentIndexChanged: FaceDetect.haarFile = cbxHaarFile.model.get(currentIndex).haarFile
    }

    // Scan block.
    Label {
        text: qsTr("Scan block")
    }
    TextField {
        text: FaceDetect.scanSize.width + "x" + FaceDetect.scanSize.height
        placeholderText: qsTr("Scan block")
        selectByMouse: true
        validator: RegExpValidator {
            regExp: /\d+x\d+/
        }
        Layout.fillWidth: true

        onTextChanged: FaceDetect.scanSize = strToSize(text)
    }

    // Marker type.
    Label {
        text: qsTr("Marker type")
    }
    ComboBox {
        id: cbxMarkerType
        textRole: "text"
        currentIndex: markerTypeIndex(FaceDetect.markerType)
        Layout.fillWidth: true

        model: ListModel {
            ListElement {
                text: qsTr("Rectangle")
                markerType: "rectangle"
            }
            ListElement {
                text: qsTr("Ellipse")
                markerType: "ellipse"
            }
            ListElement {
                text: qsTr("Image")
                markerType: "image"
            }
            ListElement {
                text: qsTr("Pixelate")
                markerType: "pixelate"
            }
            ListElement {
                text: qsTr("Blur")
                markerType: "blur"
            }
            ListElement {
                text: qsTr("Blur Outer")
                markerType: "blurouter"
            }
            ListElement {
                text: qsTr("Background Image")
                markerType: "imageouter"
            }
        }

        onCurrentIndexChanged: FaceDetect.markerType = cbxMarkerType.model.get(currentIndex).markerType
    }

    // Marker style.
    Label {
        text: qsTr("Marker style")
    }
    ComboBox {
        id: cbxMarkerStyle
        textRole: "text"
        currentIndex: markerStyleIndex(FaceDetect.markerStyle)
        Layout.fillWidth: true

        model: ListModel {
            ListElement {
                text: qsTr("Solid")
                markerStyle: "solid"
            }
            ListElement {
                text: qsTr("Dash")
                markerStyle: "dash"
            }
            ListElement {
                text: qsTr("Dot")
                markerStyle: "dot"
            }
            ListElement {
                text: qsTr("Dash dot")
                markerStyle: "dashDot"
            }
            ListElement {
                text: qsTr("Dash dot dot")
                markerStyle: "dashDotDot"
            }
        }

        onCurrentIndexChanged: FaceDetect.markerStyle = cbxMarkerStyle.model.get(currentIndex).markerStyle
    }

    // Marker color.
    Label {
        text: qsTr("Marker color")
    }
    RowLayout {
        Item {
            Layout.fillWidth: true
        }
        AK.ColorButton {
            currentColor: fromRgba(FaceDetect.markerColor)
            title: qsTr("Select marker color")
            showAlphaChannel: true

            onCurrentColorChanged: FaceDetect.markerColor = toRgba(currentColor)
        }
    }

    // Marker width.
    Label {
        text: qsTr("Marker width")
    }
    TextField {
        text: FaceDetect.markerWidth
        placeholderText: qsTr("Marker width")
        selectByMouse: true
        validator: RegExpValidator {
            regExp: /\d+/
        }
        Layout.fillWidth: true

        onTextChanged: FaceDetect.markerWidth = Number(text)
    }

    // Marker picture.
    Label {
        text: qsTr("Masks")
    }
    ComboBox {
        id: cbxMasks
        textRole: "text"
        Layout.fillWidth: true

        model: ListModel {
            ListElement {
                text: qsTr("Angel")
                mask: ":/FaceDetect/share/masks/angel.png"
            }
            ListElement {
                text: qsTr("Bear")
                mask: ":/FaceDetect/share/masks/bear.png"
            }
            ListElement {
                text: qsTr("Beaver")
                mask: ":/FaceDetect/share/masks/beaver.png"
            }
            ListElement {
                text: qsTr("Cat")
                mask: ":/FaceDetect/share/masks/cat.png"
            }
            ListElement {
                text: qsTr("Chicken")
                mask: ":/FaceDetect/share/masks/chicken.png"
            }
            ListElement {
                text: qsTr("Cow")
                mask: ":/FaceDetect/share/masks/cow.png"
            }
            ListElement {
                text: qsTr("Devil")
                mask: ":/FaceDetect/share/masks/devil.png"
            }
            ListElement {
                text: qsTr("Dog")
                mask: ":/FaceDetect/share/masks/dog.png"
            }
            ListElement {
                text: qsTr("Dalmatian dog")
                mask: ":/FaceDetect/share/masks/dog-dalmatian.png"
            }
            ListElement {
                text: qsTr("Happy dog")
                mask: ":/FaceDetect/share/masks/dog-happy.png"
            }
            ListElement {
                text: qsTr("Dragon")
                mask: ":/FaceDetect/share/masks/dragon.png"
            }
            ListElement {
                text: qsTr("Elephant 1")
                mask: ":/FaceDetect/share/masks/elephant1.png"
            }
            ListElement {
                text: qsTr("Elephant 2")
                mask: ":/FaceDetect/share/masks/elephant2.png"
            }
            ListElement {
                text: qsTr("Elk")
                mask: ":/FaceDetect/share/masks/elk.png"
            }
            ListElement {
                text: qsTr("Frog")
                mask: ":/FaceDetect/share/masks/frog.png"
            }
            ListElement {
                text: qsTr("Ghost")
                mask: ":/FaceDetect/share/masks/ghost.png"
            }
            ListElement {
                text: qsTr("Giraffe")
                mask: ":/FaceDetect/share/masks/giraffe.png"
            }
            ListElement {
                text: qsTr("Gnu")
                mask: ":/FaceDetect/share/masks/gnu.png"
            }
            ListElement {
                text: qsTr("Goat")
                mask: ":/FaceDetect/share/masks/goat.png"
            }
            ListElement {
                text: qsTr("Hippo")
                mask: ":/FaceDetect/share/masks/hippo.png"
            }
            ListElement {
                text: qsTr("Horse")
                mask: ":/FaceDetect/share/masks/horse.png"
            }
            ListElement {
                text: qsTr("Gray horse")
                mask: ":/FaceDetect/share/masks/horse-gray.png"
            }
            ListElement {
                text: qsTr("Koala")
                mask: ":/FaceDetect/share/masks/koala.png"
            }
            ListElement {
                text: qsTr("Monkey")
                mask: ":/FaceDetect/share/masks/monkey.png"
            }
            ListElement {
                text: qsTr("Gray mouse")
                mask: ":/FaceDetect/share/masks/mouse-gray.png"
            }
            ListElement {
                text: qsTr("White mouse")
                mask: ":/FaceDetect/share/masks/mouse-white.png"
            }
            ListElement {
                text: qsTr("Panda")
                mask: ":/FaceDetect/share/masks/panda.png"
            }
            ListElement {
                text: qsTr("Penguin")
                mask: ":/FaceDetect/share/masks/penguin.png"
            }
            ListElement {
                text: qsTr("Pumpkin 1")
                mask: ":/FaceDetect/share/masks/pumpkin1.png"
            }
            ListElement {
                text: qsTr("Pumpkin 2")
                mask: ":/FaceDetect/share/masks/pumpkin2.png"
            }
            ListElement {
                text: qsTr("Raccoon")
                mask: ":/FaceDetect/share/masks/raccoon.png"
            }
            ListElement {
                text: qsTr("Rhino")
                mask: ":/FaceDetect/share/masks/rhino.png"
            }
            ListElement {
                text: qsTr("Sheep")
                mask: ":/FaceDetect/share/masks/sheep.png"
            }
            ListElement {
                text: qsTr("Skull 1")
                mask: ":/FaceDetect/share/masks/skull1.png"
            }
            ListElement {
                text: qsTr("Skull 2")
                mask: ":/FaceDetect/share/masks/skull2.png"
            }
            ListElement {
                text: qsTr("Triceratops")
                mask: ":/FaceDetect/share/masks/triceratops.png"
            }
            ListElement {
                text: qsTr("Zebra")
                mask: ":/FaceDetect/share/masks/zebra.png"
            }
            ListElement {
                text: qsTr("Custom")
                mask: ""
            }
        }

        onCurrentIndexChanged: FaceDetect.markerImage = cbxMasks.model.get(currentIndex).mask
    }

    Label {
        text: qsTr("Marker picture")
    }
    RowLayout {
        Image {
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 16
            sourceSize.height: 16
            source: toQrc(txtTable.text)
        }
        TextField {
            id: txtTable
            text: FaceDetect.markerImage
            placeholderText: qsTr("Replace face with this picture")
            selectByMouse: true
            Layout.fillWidth: true

            onTextChanged: {
                for (var i = 0; i < cbxMasks.model.count; i++) {
                    if (cbxMasks.model.get(i).mask === FaceDetect.markerImage) {
                        cbxMasks.currentIndex = i

                        break
                    } else if (i == cbxMasks.model.count - 1) {
                        cbxMasks.model.get(i).mask = FaceDetect.markerImage
                        cbxMasks.currentIndex = i

                        break
                    }
                }
            }
        }
        Button {
            text: qsTr("Search")
            icon.source: "image://icons/search"

            onClicked: fileDialog.open()
        }
    }

    // Background picture.
    Label {
        text: qsTr("Backgrounds")
    }
    ComboBox {
        id: cbxBackgrounds
        textRole: "text"
        Layout.fillWidth: true

        model: ListModel {
            ListElement {
                text: qsTr("Black Square")
                background: ":/FaceDetect/share/background/black_square.png"
            }
            ListElement {
                text: qsTr("Custom")
                background: ""
            }
        }

        onCurrentIndexChanged: FaceDetect.backgroundImage = cbxBackgrounds.model.get(currentIndex).background
    }

    Label {
        text: qsTr("Background picture")
    }
    RowLayout {
        Image {
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 16
            sourceSize.height: 16
            source: toQrc(txtBackgroundImage.text)
        }
        TextField {
            id: txtBackgroundImage
            text: FaceDetect.backgroundImage
            placeholderText: qsTr("Replace background with this picture")
            selectByMouse: true
            Layout.fillWidth: true

            onTextChanged: {
                for (var i = 0; i < cbxBackgrounds.model.count; i++) {
                    if (cbxBackgrounds.model.get(i).background === FaceDetect.backgroundImage) {
                        cbxBackgrounds.currentIndex = i

                        break
                    } else if (i == cbxBackgrounds.model.count - 1) {
                        cbxBackgrounds.model.get(i).background = FaceDetect.backgroundImage
                        cbxBackgrounds.currentIndex = i

                        break
                    }
                }
            }
        }
        Button {
            text: qsTr("Search")
            icon.source: "image://icons/search"

            onClicked: fileDialogBGImage.open()
        }
    }

    // Pixel grid.
    Label {
        text: qsTr("Pixel grid size")
    }
    TextField {
        text: FaceDetect.pixelGridSize.width + "x" + FaceDetect.pixelGridSize.height
        placeholderText: qsTr("Pixel grid size")
        selectByMouse: true
        validator: RegExpValidator {
            regExp: /\d+x\d+/
        }
        Layout.fillWidth: true

        onTextChanged: FaceDetect.pixelGridSize = strToSize(text)
    }

    // Blur radius.
    Label {
        text: qsTr("Blur radius")
    }
    TextField {
        text: FaceDetect.blurRadius
        placeholderText: qsTr("Blur radius")
        selectByMouse: true
        validator: RegExpValidator {
            regExp: /\d+/
        }
        Layout.fillWidth: true

        onTextChanged: FaceDetect.blurRadius = Number(text)
    }

    Label {
        text: qsTr("Face Area Settings")
    }
    RowLayout {
        Item {
            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Advanced face area settings for \nbackground blur or image below.")
        }
        Item {
            Layout.fillWidth: true
        }
    }

    // Face area size scale.
    Label {
        text: qsTr("Scale")
    }
    RowLayout {
        Slider {
            id: sldScale
            value: FaceDetect.scale
            from: 0.5
            to: 2
            stepSize: 0.05
            Layout.fillWidth: true

            onValueChanged: FaceDetect.scale = value
        }
        SpinBox {
            property int decimals: 2
            property real factor: Math.pow(10,decimals);
            id: spbScale
            value: FaceDetect.scale * factor
            from: sldScale.from * factor
            to: sldScale.to * factor
            stepSize: sldScale.stepSize * factor
            editable: true

            onValueChanged: FaceDetect.scale = Number(value*1.0/spbScale.factor)
            validator: DoubleValidator {
                bottom: Math.min(spbScale.from, spbScale.to)*spbScale.factor
                top:  Math.max(spbScale.from, spbScale.to)*spbScale.factor
            }
            textFromValue: function(value, locale) {
                var num = parseFloat(value*1.0/spbScale.factor).toFixed(spbScale.decimals);
                return num
                //return Number(value / 100).toLocaleString(locale, 'f', spinbox.decimals)
            }
            valueFromText: function(text, locale) {
                return parseFloat(text) * spbScale.factor
                //return Number.fromLocaleString(locale, text) * spbScale.factor
            }
        }
    }

    // Configure face area offsets.
    Label {
        text: qsTr("H-Offset")
    }
    RowLayout {
        Slider {
            id: sldHOffset
            value: FaceDetect.hOffset
            from: -150
            to: 150
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.hOffset = value
        }
        SpinBox {
            id: spbHOffset
            value: FaceDetect.hOffset
            from: sldHOffset.from
            to: sldHOffset.to
            stepSize: sldHOffset.stepSize
            editable: true

            onValueChanged: FaceDetect.hOffset = Number(value)
        }
    }

    Label {
        text: qsTr("V-Offset")
    }
    RowLayout {
        Slider {
            id: sldVOffset
            value: FaceDetect.vOffset
            from: -150
            to: 150
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.vOffset = value
        }
        SpinBox {
            id: spbVOffset
            value: FaceDetect.vOffset
            from: sldVOffset.from
            to: sldVOffset.to
            stepSize: sldVOffset.stepSize
            editable: true

            onValueChanged: FaceDetect.vOffset = Number(value)
        }
    }

    // Configure face area width/height.
    Label {
        text: qsTr("Width Adjust %")
    }
    RowLayout {
        Slider {
            id: sldWAdjust
            value: FaceDetect.wAdjust
            from: 1
            to: 200
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.wAdjust = value
        }
        SpinBox {
            id: spbWAdjust
            value: FaceDetect.wAdjust
            from: sldWAdjust.from
            to: sldWAdjust.to
            stepSize: sldWAdjust.stepSize
            editable: true

            onValueChanged: FaceDetect.wAdjust = Number(value)
        }
    }

    Label {
        text: qsTr("Height Adjust %")
    }
    RowLayout {
        Slider {
            id: sldHAdjust
            value: FaceDetect.hAdjust
            from: 1
            to: 200
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.hAdjust = value
        }
        SpinBox {
            id: spbHAdjust
            value: FaceDetect.hAdjust
            from: sldHAdjust.from
            to: sldHAdjust.to
            stepSize: sldHAdjust.stepSize
            editable: true

            onValueChanged: FaceDetect.hAdjust = Number(value)
        }
    }

    // Round face area overlay.
    Label {
        text: qsTr("Round Area")
    }
    Switch {
        id: chkSmotheEdges
        checked: FaceDetect.smootheEdges

        onCheckedChanged: FaceDetect.smootheEdges = checked
    }

    // Edge smothing size scale.
    Label {
        text: qsTr("Scale")
    }
    RowLayout {
        Slider {
            id: sldRScale
            value: FaceDetect.rScale
            from: 0.5
            to: 2
            stepSize: 0.05
            Layout.fillWidth: true

            onValueChanged: FaceDetect.rScale = value
        }
        SpinBox {
            property int decimals: 2
            property real factor: Math.pow(10,decimals);
            id: spbRScale
            value: FaceDetect.rScale * factor
            from: sldRScale.from * factor
            to: sldRScale.to * factor
            stepSize: sldRScale.stepSize * factor
            editable: true

            onValueChanged: FaceDetect.rScale = Number(value*1.0/spbRScale.factor)
            validator: DoubleValidator {
                bottom: Math.min(spbRScale.from, spbRScale.to)*spbRScale.factor
                top:  Math.max(spbRScale.from, spbRScale.to)*spbRScale.factor
            }
            textFromValue: function(value, locale) {
                return parseFloat(value*1.0/spbRScale.factor).toFixed(decimals);
                //return Number(value / 100).toLocaleString(locale, 'f', spinbox.decimals)
            }
            valueFromText: function(text, locale) {
                return parseFloat(text) * spbRScale.factor
                //return Number.fromLocaleString(locale, text) * spbRScale.factor
            }
        }
    }

    // Configure rounded face area width/height.
    Label {
        text: qsTr("Width Adjust %")
    }
    RowLayout {
        Slider {
            id: sldRWAdjust
            value: FaceDetect.rWAdjust
            from: 1
            to: 200
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.rWAdjust = value
        }
        SpinBox {
            id: spbRWAdjust
            value: FaceDetect.rWAdjust
            from: sldRWAdjust.from
            to: sldRWAdjust.to
            stepSize: sldRWAdjust.stepSize
            editable: true

            onValueChanged: FaceDetect.rWAdjust = Number(value)
        }
    }

    Label {
        text: qsTr("Height Adjust %")
    }
    RowLayout {
        Slider {
            id: sldRHAdjust
            value: FaceDetect.rHAdjust
            from: 1
            to: 200
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.rHAdjust = value
        }
        SpinBox {
            id: spbRHAdjust
            value: FaceDetect.rHAdjust
            from: sldRHAdjust.from
            to: sldRHAdjust.to
            stepSize: sldRHAdjust.stepSize
            editable: true

            onValueChanged: FaceDetect.rHAdjust = Number(value)
        }
    }

    // Configure rounded face area radius
    Label {
        text: qsTr("H-Radius %")
    }
    RowLayout {
        Slider {
            id: sldHRad
            value: FaceDetect.rHRadius
            to: 100
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.rHRadius = value
        }
        SpinBox {
            id: spbHRad
            value: FaceDetect.rHRadius
            to: sldHRad.to
            stepSize: sldHRad.stepSize
            editable: true

            onValueChanged: FaceDetect.rHRadius = Number(value)
        }
    }

    Label {
        text: qsTr("V-Radius %")
    }
    RowLayout {
        Slider {
            id: sldVRad
            value: FaceDetect.rVRadius
            to: 100
            stepSize: 1
            Layout.fillWidth: true

            onValueChanged: FaceDetect.rVRadius = value
        }
        SpinBox {
            id: spbVRad
            value: FaceDetect.rVRadius
            to: sldVRad.to
            stepSize: sldVRad.stepSize
            editable: true

            onValueChanged: FaceDetect.rVRadius = Number(value)
        }
    }

    LABS.FileDialog {
        id: fileDialog
        title: qsTr("Please choose an image file")
        nameFilters: ["Image files (*.bmp *.gif *.jpg *.jpeg *.png *.pbm *.pgm *.ppm *.xbm *.xpm)"]
        folder: "file://" + picturesPath

        onAccepted: FaceDetect.markerImage = String(file).replace("file://", "")
    }

    LABS.FileDialog {
        id: fileDialogBGImage
        title: qsTr("Please choose an image file")
        nameFilters: ["Image files (*.bmp *.gif *.jpg *.jpeg *.png *.pbm *.pgm *.ppm *.xbm *.xpm)"]
        folder: "file://" + picturesPath

        onAccepted: {
            var curFile = String(file)
            if (curFile.match("file:\/\/\/[A-Za-z]{1,2}:")) {
                FaceDetect.backgroundImage = curFile.replace("file:///", "")
            } else {
                FaceDetect.backgroundImage = curFile.replace("file://", "")
            }
        }
    }
}


