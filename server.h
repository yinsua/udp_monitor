#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QThread>
#include <QString>
#include <QtQml/qqml.h>

class Server : public QThread
{
    Q_OBJECT
    Q_PROPERTY(QString msg READ msg WRITE setMsg NOTIFY msgChanged)
    QML_ELEMENT
public:
    explicit Server(QObject* parent=nullptr);
    ~Server() override;
    void run() override;
    QString msg(){return m_msg;}
    void setMsg(const QString& str){
        m_msg = str;
        emit msgChanged();
    }
signals:
    void msgChanged();

private:
    QString m_msg;
};

#endif // SERVER_H
