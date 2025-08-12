#include "virtualkeyboardcontroller.h"
#include <QDebug>


namespace bs {
namespace ui {
namespace components {

VirtualKeyBoardController::VirtualKeyBoardController(QObject *parent)
    : QObject{parent}, m_IsVisible{false}
{}

void VirtualKeyBoardController::addTextField(QObject *obj)
{
    if (auto item = qobject_cast<QQuickItem*>(obj)) {
        QObject::connect(item, &QQuickItem::activeFocusChanged,
                         this, [this, item](bool val){
                             this->current_text_field_ = (val)?item:nullptr;
                             this->setIsVisible(val);
                         });
    }
}

void VirtualKeyBoardController::keyPress(QVariant key_code)
{
    if (this->current_text_field_) {
        const QString new_value =
            this->current_text_field_->property("text").toString() +
            key_code.toString();
        this->current_text_field_->setProperty("text", QVariant{new_value});
    }
}

void VirtualKeyBoardController::backspacePress()
{
    if (this->current_text_field_) {
        QString new_value =
            this->current_text_field_->property("text").toString();
        if(new_value.length() > 0){
            new_value.chop(1);
            this->current_text_field_->setProperty("text", QVariant{new_value});
        }
    }
}

void VirtualKeyBoardController::acceptValue()
{
    QMetaObject::invokeMethod(this->current_text_field_, "accepted");
    // this->current_text_field_->setProperty("focus",QVariant{false});
}

void VirtualKeyBoardController::cancelValue()
{
    this->current_text_field_->setProperty("text", QVariant{""});
    this->current_text_field_->setProperty("focus",QVariant{false});
}

bool VirtualKeyBoardController::IsVisible() const
{
    return m_IsVisible;
}

void VirtualKeyBoardController::setIsVisible(bool newIsVisible)
{
    if(this->current_text_field_ && not(newIsVisible)) {
        this->current_text_field_->setProperty("focus",QVariant{false});
    }
    if (m_IsVisible == newIsVisible)
        return;
    m_IsVisible = newIsVisible;
    emit IsVisibleChanged();
}

} // namespace components
} // namespace ui
} // namespace bs
