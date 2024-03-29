#include "jsondata.h"
#include <QFile>
#include <QStringLiteral>
#include <QJsonObject>
#include <QJsonDocument>

JsonData::JsonData()
{
    m_score=0;
}
int JsonData::addScore()
{
    return ++m_score;
}

int JsonData::level() const
{
    return m_level;
}


void JsonData::setLevel(int level)
{
    m_level = level;
}

//void JsonData::setScore(int score)
//{
//    m_score = score;
//}

int JsonData::score() const
{
    return m_score;
}


bool JsonData::load()
{
    QFile loadFile(QStringLiteral("save.json"));
    if(!loadFile.open(QIODevice::ReadOnly)){
        qWarning("Could't save file!");
        return false;
    }

    QByteArray saveData = loadFile.readAll();  //读取文件所有数据

    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));
    QJsonObject json(loadDoc.object());
    m_level = json["level"].toInt();
    m_score  = json["score"].toInt();

    return true;
}


bool JsonData::save()
{
    //保存文件
    QFile saveFile(QStringLiteral("save.json"));
    if(!saveFile.open(QIODevice::WriteOnly)){
        qWarning("Could't save file!");
        return false;
    }

    QJsonObject gameData;
    gameData["level"] = m_level;  //write
    gameData["score"] = m_score;


    QJsonDocument saveDoc(gameData);

    saveFile.write(saveDoc.toJson());
    return true;
}
