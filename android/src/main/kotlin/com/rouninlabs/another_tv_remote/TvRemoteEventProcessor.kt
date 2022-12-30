package com.rouninlabs.another_tv_remote

import android.view.KeyEvent
import io.flutter.plugin.common.EventChannel

object TvRemoteEventProcessor: EventChannel.StreamHandler {
    private var mEventSink:EventChannel.EventSink? = null;

    private fun setEventNotifier(sink:EventChannel.EventSink?) {
        mEventSink = sink
    }

    fun notifyEvent(event:KeyEvent) {
        // TODO Call convert to generic event.
        // TODO call sink
        val buttonKey:String =
            when(event.keyCode) {
                KeyEvent.KEYCODE_BUTTON_B,
                KeyEvent.KEYCODE_BACK -> "back"

                KeyEvent.KEYCODE_BUTTON_SELECT,
                KeyEvent.KEYCODE_BUTTON_A,
                KeyEvent.KEYCODE_ENTER,
                KeyEvent.KEYCODE_DPAD_CENTER,
                KeyEvent.KEYCODE_NUMPAD_ENTER -> "ok"

                KeyEvent.KEYCODE_DPAD_UP -> "dPadUp"
                KeyEvent.KEYCODE_DPAD_DOWN -> "dPadDown"
                KeyEvent.KEYCODE_DPAD_LEFT -> "dPadLeft"
                KeyEvent.KEYCODE_DPAD_RIGHT -> "dPadRight"

                KeyEvent.KEYCODE_BUTTON_R1 -> "skipForward"
                KeyEvent.KEYCODE_BUTTON_L1 -> "skipBackward"

                KeyEvent.KEYCODE_BUTTON_R2 -> "fastForward"
                KeyEvent.KEYCODE_BUTTON_L2 -> "rewind"

                else -> "unknown"
        }

        val actionKey:String = when(event.action) {
            KeyEvent.ACTION_UP -> "up"
            KeyEvent.ACTION_DOWN -> "down"
            else -> "unknown"
        }

        mEventSink?.success(
            mapOf(
                "keyCode" to event.keyCode,
                "type" to buttonKey,
                "action" to actionKey
            )
        )

    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        setEventNotifier(sink = events)
    }

    override fun onCancel(arguments: Any?) {
        setEventNotifier(sink = null)
    }
}