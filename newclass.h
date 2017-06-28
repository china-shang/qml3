#ifndef NEWCLASS_H
#define NEWCLASS_H

#include <QObject>

class newClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString str READ str WRITE setStr NOTIFY strChanged)
public:

    explicit newClass(QObject *parent = nullptr);
    QString str(){
        return m_str;
    }

    void setStr(QString string)
    {
        if (string != m_str)
        {
            emit strChanged(m_str);
            m_str=string;
        }
    }

    Q_INVOKABLE  void print();

signals:

    void strChanged(QString string);

public slots:

private:
    QString m_str;
};

#endif // NEWCLASS_H
