#ifndef JSONDATA_H
#define JSONDATA_H

#include <QObject>
class JsonData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int level READ level WRITE setLevel NOTIFY levelChanged)
    Q_PROPERTY(int score READ score )

public:
    JsonData();

    int level() const;
    void setLevel(int level);
    void setScore(int score);
    int score() const;
    Q_INVOKABLE bool load();
    Q_INVOKABLE bool save();
    Q_INVOKABLE int addScore();


signals:
    void levelChanged();
private:
    int m_level;
    int m_score;
};


#endif // JSONDATA_H
