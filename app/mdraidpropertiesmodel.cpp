#include "mdraidpropertiesmodel.h"

#include <QFont>



/*
 *
 */
MDRaidPropertiesModel::MDRaidPropertiesModel()
{
  headerLabels << "UUID" << "Level" << "Devices number" <<
           "Size" << "Sync action" << "Sync completed" <<
           "Sync remaining time";
}



/*
 *
 */
MDRaidPropertiesModel::~MDRaidPropertiesModel()
{

}



/*
 *
 */
MDRaid* MDRaidPropertiesModel::getMDRaid() const
{
  return (MDRaid*) this -> unit;
}



/*
 *
 */
int MDRaidPropertiesModel::rowCount(const QModelIndex& /*index*/) const
{
  return headerLabels.size();
}


/*
 *
 */
int MDRaidPropertiesModel::columnCount(const QModelIndex& /*index*/) const
{
  return 1;
}



/*
 *
 */
QVariant MDRaidPropertiesModel::data(const QModelIndex& index, int role) const
{
  if(!index.isValid())
    return QVariant();

  if(role == Qt::DisplayRole) {
    MDRaid* mdraid = getMDRaid();

    if(index.column() == 0 && mdraid != NULL) {
      switch(index.row()) {
        case 0: return QVariant(mdraid -> getUUID()); break;
        case 1: return QVariant(mdraid -> getLevel()); break;
        case 2: return QVariant(mdraid -> getNumDevices()); break;
        case 3: return QVariant(mdraid -> getSize()); break;
        case 4: return QVariant(mdraid -> getSyncAction()); break;
        case 5: return QVariant(mdraid -> getSyncCompleted()); break;
        case 6: return QVariant(mdraid -> getSyncRemainingTime()); break;
      }
    }
  }

  return QVariant();
}



/*
 *
 */
QVariant MDRaidPropertiesModel::headerData(int section, Qt::Orientation orientation, int role) const
{
  if(orientation != Qt::Vertical)
    return QVariant();

  if(role == Qt::DisplayRole) {
      return QVariant(headerLabels.at(section));

  } else if(role == Qt::FontRole) {
    QFont font;
    font.setBold(true);
    return QVariant(font);
  }

  return QVariant();
}

