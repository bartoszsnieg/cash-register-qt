#include "pagecontroller.h"

namespace bs {
namespace ui {

PageController::PageController(QObject *parent)
    : QObject{parent}, m_pageUrl{"qrc:/ui/LoginView.qml"}
{}

QString PageController::pageUrl() const
{
    return m_pageUrl;
}


} // namespace ui
} // namespace bs
