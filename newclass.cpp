#include "newclass.h"
#include <QDebug>

newClass::newClass(QObject *parent) : QObject(parent)
{

}
void newClass::print()
{
    qDebug()<<"from C++";
}
