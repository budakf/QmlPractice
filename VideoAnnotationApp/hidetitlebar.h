#ifndef HIDETITLEBAR_H
#define HIDETITLEBAR_H

#include <QQuickWindow>

class HideTitleBar : public QObject
{
    Q_OBJECT
public:
    HideTitleBar() {}

public slots:
    void hideTitleBar(QQuickWindow* window);
};

#endif // HIDETITLEBAR_H
