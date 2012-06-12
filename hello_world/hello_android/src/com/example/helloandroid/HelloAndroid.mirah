package com.example.helloandroid

import android.app.Activity

class HelloAndroid < Activity
  def onCreate(state)
    super state
    setContentView R.layout.main
  end
end
