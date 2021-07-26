#include "server.h"
#include "network.h"

Server::Server(QObject* parent)
    : QThread(parent)
{
    connect(this, &QThread::finished, this, &QThread::deleteLater, Qt::DirectConnection);
}
Server::~Server(){
    requestInterruption();
    wait();
    quit();
}
void Server::run()
{
    try
    {
        WSASession Session;
        UDPSocket Socket;
        char buffer[1024];

        Socket.SetRecvTimeout(500);
        Socket.Bind(8388);
        while (!QThread::currentThread()->isInterruptionRequested())
        {
            Socket.RecvFrom(buffer, sizeof(buffer));
            if(buffer[0]){
                setMsg(QString(buffer));
                qDebug("recv: %s",buffer);
            }
        }
    }
    catch (std::system_error& e)
    {
        qDebug("init server failed: %s", e.what());
    }
}
