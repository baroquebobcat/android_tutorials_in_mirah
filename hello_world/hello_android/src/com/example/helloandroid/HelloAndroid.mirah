package com.example.helloandroid

import android.app.Activity
import android.widget.TextView  # added

class HelloAndroid < Activity
  def onCreate(state)
    super state
    tv = TextView.new self      # added
    tv.setText "Hello, Android" # added
    setContentView tv           # added
  end
end