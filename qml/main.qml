/*
 * This file is part of webkiosk
 *
 * Copyright (c) 2014 Eric Le Bihan <eric.le.bihan.dev@free.fr>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtWebKit 3.0

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600

    property string initialUrl: "http://www.google.com/"

    Rectangle {
        id: content
        width: window.width
        color: "black"
        anchors.fill: parent

        WebView {
            id: webView
            anchors.fill: parent
            opacity: 0

            url: window.initialUrl

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                }
            }

            onLoadingChanged: {
                switch (loadRequest.status) {
                    case WebView.LoadSucceededStatus:
                    case WebView.LoadFailedStatus:
                        opacity = 1
                        break
                    default:
                    opacity = 0
                    break
                }
            }
        }
    }
}
