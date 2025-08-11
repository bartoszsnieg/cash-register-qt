#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ui/commponents/common/keyboard/virtualkeyboardcontroller.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    bs::ui::components::VirtualKeyBoardController classic_virtual_keyboard_handler_{};
    bs::ui::components::VirtualKeyBoardController numeric_virtual_keyboard_handler_{};

    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    }
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    QQmlContext* root_context =  engine.rootContext();

    root_context->setContextProperty("virtual_keyboard_handler_classic", &classic_virtual_keyboard_handler_);
    root_context->setContextProperty("virtual_keyboard_handler_numeric", &numeric_virtual_keyboard_handler_);

    engine.load(url);

    return app.exec();
}
