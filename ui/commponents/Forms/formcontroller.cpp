#include "formcontroller.h"
#include <QDebug>
#include <QMetaProperty>


namespace bs {
namespace ui {
namespace components {

FormController::FormController(QObject *parent)
    : QObject{parent} , m_input{}
{}

QList<QObject *> FormController::input() const
{
    return m_input;
}

void FormController::setInput(const QList<QObject *> &newInput)
{
    if (m_input == newInput)
        return;
    m_input = newInput;
    emit inputChanged();
}

void FormController::submit()
{
    QJsonObject res{};

    foreach (QObject* item, this->m_input) {
        res.insert(item->objectName(),QJsonValue::fromVariant(item->property("text")));
    }
    emit submited(res);
}

} // namespace components
} // namespace ui
} // namespace bs
