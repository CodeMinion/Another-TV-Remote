# another_tv_remote

A plugin for receiving TV remote input.

## Android Setup

The remote control buttons on an Android TV are sent as KeyEvents. This 
means we currently need to listen on the activity for these key events.

In you main TV Activity add the following

```
    override fun onKeyDown(keyCode: Int, event: KeyEvent): Boolean {
        TvRemoteEventProcessor.notifyEvent(event = event)
        return super.onKeyDown(keyCode, event)
    }
    override fun onKeyUp(keyCode: Int, event: KeyEvent): Boolean {
        TvRemoteEventProcessor.notifyEvent(event = event)
        return super.onKeyUp(keyCode, event)
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {

        when(event.keyCode) {
            KeyEvent.KEYCODE_BUTTON_B,
            KeyEvent.KEYCODE_BACK,

            KeyEvent.KEYCODE_BUTTON_SELECT,
            KeyEvent.KEYCODE_BUTTON_A,
            KeyEvent.KEYCODE_ENTER,
            KeyEvent.KEYCODE_DPAD_CENTER,
            KeyEvent.KEYCODE_NUMPAD_ENTER -> {
                // Skip the center pad because you get it on the on onKeyDown
                return super.dispatchKeyEvent(event)
            }
        }
        if(event.action == KeyEvent.ACTION_DOWN) {
            TvRemoteEventProcessor.notifyEvent(event = event)
        }
        return super.dispatchKeyEvent(event)
    } 
```


