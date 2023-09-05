#ifndef FLOATUI_H
#define FLOATUI_H

#include <QtQuick/QQuickPaintedItem>

class FloatUI : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_DISABLE_COPY(FloatUI)
public:
    explicit FloatUI(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    ~FloatUI() override;
};

#endif // FLOATUI_H
