/*
 * Copyright (C) 2021-2026 CutefishOS Team.
 */

#include "cicontheme.h"
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QDebug>

CIconTheme::CIconTheme(QObject *parent)
    : QObject(parent)
{
}

QStringList CIconTheme::installedThemes() const
{
    return list();
}

QStringList CIconTheme::list()
{
    QStringList themes;
    QStringList searchPaths;
    searchPaths << QDir::homePath() + QStringLiteral("/.icons")
                << QDir::homePath() + QStringLiteral("/.local/share/icons")
                << QStringLiteral("/usr/share/icons")
                << QStringLiteral("/usr/local/share/icons");

    for (const QString &basePath : searchPaths) {
        QDir dir(basePath);
        if (!dir.exists())
            continue;

        const QStringList subDirs = dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
        for (const QString &subDir : subDirs) {
            QString themePath = basePath + QLatin1Char('/') + subDir;
            if (QFile::exists(themePath + QStringLiteral("/index.theme"))) {
                if (!themes.contains(subDir) && subDir != QStringLiteral("hicolor") && !subDir.startsWith(QStringLiteral("default"))) {
                    themes.append(subDir);
                }
            }
        }
    }

    themes.sort(Qt::CaseInsensitive);

    if (themes.isEmpty()) {
        themes << QStringLiteral("Cutefish") << QStringLiteral("Cutefish-Dark") << QStringLiteral("Cutefish-Light");
    }

    return themes;
}
