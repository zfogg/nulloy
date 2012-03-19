/********************************************************************
**  Nulloy Music Player, http://nulloy.com
**  Copyright (C) 2010-2011 Sergey Vlasov <sergey@vlasov.me>
**
**  This program can be distributed under the terms of the GNU
**  General Public License version 3.0 as published by the Free
**  Software Foundation and appearing in the file LICENSE.GPL3
**  included in the packaging of this file.  Please review the
**  following information to ensure the GNU General Public License
**  version 3.0 requirements will be met:
**
**  http://www.gnu.org/licenses/gpl-3.0.html
**
*********************************************************************/

#include "pluginGstreamer.h"
#include "playbackEngineGstreamer.h"
#include "waveformBuilderGstreamer.h"

NPluginGstreamer::NPluginGstreamer(QObject *parent) : QObject(parent)
{
	m_elements << new NPlaybackEngineGStreamer(this)
				<< new NWaveformBuilderGstreamer(this);
}

QObjectList NPluginGstreamer::elements()
{
	return m_elements;
}

#if !defined _N_GSTREAMER_PLUGINS_BUILTIN_ && !defined _N_NO_PLUGINS_
Q_EXPORT_PLUGIN2(plugin_gstreamer, NPluginGstreamer)
#endif
