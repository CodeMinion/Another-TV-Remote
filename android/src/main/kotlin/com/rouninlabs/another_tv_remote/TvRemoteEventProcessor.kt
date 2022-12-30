package com.rouninlabs.another_tv_remote

import android.view.KeyEvent
import io.flutter.plugin.common.EventChannel
import java.lang.reflect.Field
import java.lang.reflect.Modifier

object TvRemoteEventProcessor: EventChannel.StreamHandler {
    private var mEventSink:EventChannel.EventSink? = null;
    private var keyCodeNameByKeyCode = KeyEvent::class.java.fields
        .filter { field -> field.name.startsWith("KEYCODE_") }
        .filter { field -> Modifier.isStatic(field.modifiers) }
        .map { field -> field.getInt(null) to field.name }
        .toMap();

    private fun setEventNotifier(sink:EventChannel.EventSink?) {
        mEventSink = sink
    }

    fun notifyEvent(event:KeyEvent) {
        // TODO call sink
        val buttonKey:String = keyCodeNameByKeyCode[event.keyCode] ?: "unknown"

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