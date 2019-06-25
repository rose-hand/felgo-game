#ifndef JSONDATA_H
#define JSONDATA_H

#include <QObject>
class JsonData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int level READ level WRITE setLevel NOTIFY levelChanged)

public:
    JsonData();

    int level() const;
    void setLevel(int level);

    Q_INVOKABLE bool load();
    Q_INVOKABLE bool save();

signals:
    void levelChanged();
private:
    int m_level;
};


#endif // JSONDATA_H
