#ifndef PAGECONTROLLER_H
#define PAGECONTROLLER_H

#include <QObject>
#include <QString>

namespace bs {
namespace ui {

class PageController : public QObject
{
    Q_PROPERTY(QString pageUrl READ pageUrl NOTIFY pageUrlChanged FINAL)

    Q_OBJECT
public:
    explicit PageController(QObject *parent = nullptr);

    QString pageUrl() const;

signals:
    void pageUrlChanged();
private:
    QString m_pageUrl;
};

} // namespace ui
} // namespace bs

#endif // PAGECONTROLLER_H
