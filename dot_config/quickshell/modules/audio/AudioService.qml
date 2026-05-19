pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: service

    readonly property PwNode defaultSource: Pipewire.defaultAudioSource
    readonly property PwNode defaultSink: Pipewire.defaultAudioSink

    // AudioSource
    property real currentSourceVolume: defaultSource?.audio.volume ?? 0
    property string currentSourceName: defaultSource?.description ?? "Could Not Find Default Source"
    property bool isSourceMuted: defaultSource?.audio.muted ?? false

    //AudioSink
    property real currentSinkVolume: defaultSink?.audio.volume ?? 0
    property string currentSinkName: defaultSink?.description ?? "Could Not Find Default Sink"
    property bool isSinkMuted: defaultSink?.audio.muted ?? false

    PwObjectTracker {
        objects: [defaultSink, defaultSource]
    }

    // Sink Functions
    function getAudioSinkName () {
        return currentSinkName
    }

    function toggleAudioSinkMute () {
        defaultSink.audio.muted = !isSinkMuted
    }

    function setAudioSinkMute (state) {
        defaultSink.audio.muted = state
    }

    function setSinkVolume (volume) {
        defaultSink.audio.volume = volume
    }

    function getSinkVolume () {
        return defaultSink.audio.volume
    }

    // Source Functions
    function getAudioSourceName () {
        return currentSourceName
    }

    function toggleAudioSourceMute () {
        defaultSource.audio.muted = !isSourceMuted
    }

    function setAudioSourceMute (state) {
        defaultSource.audio.muted = state
    }

    function setSourceVolume (volume) {
        defaultSource.audio.volume = volume
    }

    function getSourceVolume () {
        return defaultSource.audio.volume
    }

}

