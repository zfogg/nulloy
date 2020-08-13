TEMPLATE = subdirs
CONFIG += ordered

isEmpty(N_CONFIG_SUCCESS) {
    error(Please run `configure\')
}

# INFO: https://stackoverflow.com/a/51602580
unix {
    CONFIG += link_pkgconfig
    PKGCONFIG += QtCLucene
    PKGCONFIG += QtUiTools
}
macx {
    # Enable pkg-config (pkg-config is disabled by default in the Qt package for mac)
    QT_CONFIG -= no-pkg-config
    # pkg-config location if your brew installation is standard
    PKG_CONFIG = /usr/local/bin/pkg-config
    QMAKE_MAC_SDK = macosx11.0
}

# qmake -config no-skins
!no-skins {
    widgets.subdir = src/widgetCollection
    SUBDIRS += widgets
}

# qmake -config gstreamer
gstreamer {
    gstreamer.file = src/plugins/gstreamer/pluginGstreamer.pro
    SUBDIRS += gstreamer
}

# qmake -config phonon
phonon {
    phonon.file = src/plugins/phonon/pluginPhonon.pro
    SUBDIRS += phonon
}

# qmake -config vlc
vlc {
    vlc.file = src/plugins/vlc/pluginVlc.pro
    SUBDIRS += vlc
}

# qmake -config taglib
taglib {
    taglib.file = src/plugins/taglib/pluginTaglib.pro
    SUBDIRS += taglib
}

# qmake -config plugins-all
plugins-all {
    plugins.subdir = src/plugins
    SUBDIRS += plugins
}

SUBDIRS += src

tests {
    SUBDIRS += tests
}

