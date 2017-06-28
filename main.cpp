#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine/QtWebEngine>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>
#include "newclass.h"
#include <QSqlTableModel>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtWebEngine::initialize();
    newClass *varfromout = new newClass();

    QSqlTableModel model;

    QQmlApplicationEngine engine;
    QQmlContext *con=engine.rootContext();

    con->setContextProperty("newdf",varfromout);
    con->setContextProperty("MyModel",&model);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
