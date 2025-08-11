#ifndef VIRTUALKEYBOARDCONTROLLER_H
#define VIRTUALKEYBOARDCONTROLLER_H

#include <QObject>
#include <QQuickItem>

namespace bs {
namespace ui {
namespace components {

class VirtualKeyBoardController : public QObject
{
    Q_PROPERTY(bool IsVisible READ IsVisible WRITE setIsVisible NOTIFY IsVisibleChanged FINAL)
    Q_OBJECT
public:
    explicit VirtualKeyBoardController(QObject *parent = nullptr);
    Q_INVOKABLE void addTextField(QObject* obj);
    Q_INVOKABLE void keyPress(QVariant key_code);
    Q_INVOKABLE void backspacePress();
    Q_INVOKABLE void acceptValue();
    Q_INVOKABLE void cancelValue();
    bool IsVisible() const;
    void setIsVisible(bool newIsVisible);

private:
    QQuickItem* current_text_field_{nullptr};
    bool m_IsVisible;

signals:
    void IsVisibleChanged();
};

} // namespace components
} // namespace ui
} // namespace bs

#endif // VIRTUALKEYBOARDCONTROLLER_H
