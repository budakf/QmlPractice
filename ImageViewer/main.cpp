#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>


void setStyle(){
    #if defined (Q_OS_IOS) || defined (Q_OS_ANDROID)
        QQuickStyle::setStyle("Material");
    #elif defined (Q_OS_MACOS) || defined (Q_OS_LINUX) || defined (Q_OS_WIN)
        QQuickStyle::setStyle("Fusion");
    #endif //
}


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    setStyle();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
