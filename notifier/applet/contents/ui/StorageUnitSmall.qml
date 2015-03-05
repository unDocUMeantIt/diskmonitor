/****************************************************************************
 * DisKMonitor, KDE tools to monitor SMART and MDRaid health status         *
 * Copyright (C) 2014-2015 Michaël Lhomme <papylhomme@gmail.com>            *
 *                                                                          *
 * This program is free software; you can redistribute it and/or modify     *
 * it under the terms of the GNU General Public License as published by     *
 * the Free Software Foundation; either version 2 of the License, or        *
 * (at your option) any later version.                                      *
 *                                                                          *
 * This program is distributed in the hope that it will be useful,          *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
 * GNU General Public License for more details.                             *
 *                                                                          *
 * You should have received a copy of the GNU General Public License along  *
 * with this program; if not, write to the Free Software Foundation, Inc.,  *
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.              *
 ****************************************************************************/


import QtQuick 2.3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtQuick.Layouts 1.1
import org.papylhomme.diskmonitor 0.1 as DiskMonitor
import "StorageUnit.js" as StorageUnit


PlasmaComponents.ListItem {
  id: storageUnitItem
  enabled: true


  RowLayout {
    id: layout
    anchors.left: parent.left
    anchors.right: parent.right

  
    PlasmaCore.IconItem {
      id: unitIcon
      Layout.maximumWidth: 16
      Layout.maximumHeight: 16
      source: icon
    }

  

    PlasmaComponents.Label {
      id: unitLabel
      Layout.fillWidth: true
      width: parent.width
      elide: Text.ElideRight
      color: { StorageUnit.getTextColor(); }
      text: { StorageUnit.getStorageUnitText(); }
    }


    PlasmaCore.IconItem {
      Layout.maximumWidth: 16
      Layout.maximumHeight: 16
      source: { StorageUnit.getStatusIcon(); }
    }
  }


  onClicked: {
    monitor.openApp(path);
  }

}
