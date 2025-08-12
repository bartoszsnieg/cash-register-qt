#ifndef FORMCONTROLLER_H
#define FORMCONTROLLER_H

#include <QObject>
#include <QList>
#include <QJsonObject>

namespace bs {
namespace ui {
namespace components {

class FormController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<QObject*> input READ input WRITE setInput NOTIFY inputChanged FINAL)

public:
    explicit FormController(QObject *parent = nullptr);

    QList<QObject *> input() const;
    void setInput(const QList<QObject *> &newInput);
    Q_INVOKABLE void submit();
signals:
    void inputChanged();
    void submited(QJsonObject value);
private:
    QList<QObject *> m_input;
};

} // namespace components
} // namespace ui
} // namespace bs

#endif // FORMCONTROLLER_H
