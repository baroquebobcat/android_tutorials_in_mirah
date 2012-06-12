Hello, World
=========================

###Note
Pindah makes a lot of the build docs invalid. In particular, I'm not using Eclipse. If you want to see the original tutorial it's [here](http://developer.android.com/resources/tutorials/hello-world.html). Attribution is on the bottom of the page.


Creating the Project Without Eclipse (This)
-------------
As a developer, you know that the first impression of a development framework is how easy it is to write "Hello, World." Well, on Android, it's pretty easy. It's particularly easy if you're using Eclipse as your IDE, because we've provided a great plugin that handles your project creation and management to greatly speed up your development cycles.

We're using the command line. You can check out [Building and Running from the Command Line](http://developer.android.com/guide/developing/building/building-cmdline.html) to get an idea of how it works using ant, but Pindah's a bit different.

Before you start, you should already have the SDK installed, and if you're using Eclipse, you should have installed the ADT plugin as well. If you have not installed these, see [Installing the Android SDK](http://developer.android.com/sdk/installing.html) and return here when you've completed the installation.



Install a Platform
-------------------

To run the Hello World application, you need to install at least one Android platform in your SDK environment. If you have not already performed this step, you need to do it now.

1. Run the `android` binary that's included with the SDK to bring up the SDK manager. 
    android
2. Select a platform to install, preferrably the latest. eg Android 4.0.3
3. Install it


Create an AVD
-----------------

To learn more about how to use AVDs and the options available to you, see [Managing Virtual Devices](http://developer.android.com/guide/developing/devices/index.html).

In this tutorial, you will run your application in the Android Emulator. Before you can launch the emulator, you must create an Android Virtual Device (AVD). An AVD defines the system image and device settings used by the emulator.

To create an AVD:

1. run `android`
2. open the tools menu and click Manage AVDs
3. Click on New...
   The Create New AVD dialog appears.
4. Type the name of the AVD, such as "my_avd".
5. Choose a target.
   The target is the platform (that is, the version of the Android SDK, such as 2.3.3) you want to run on the emulator. For this tutorial, choose the latest platform that you have installed and ignore the rest of the fields.
6 .Click Create AVD.

Create a New Android Project
---------------
_skip all the Eclipse stuff._ It's in the original, if you want to check it out.

Have you got your JRuby environment setup? If not, set it up with rvm, or the JRuby binary. Then install the pindah gem (0.1.2 doesn't work with the android 4.0.3 and up)

    gem install pindah

That will install pindah and mirah and all their dependencies.

Run the Pindah Generator

    pindah create com.example.helloandroid hello_android HelloAndroid

This creates an app skeleton with the name *hello_android*, the namespace *com.example.helloandroid*, and an activity named *HelloAndroid*
The output should look something like this.

    $ pindah create com.example.helloandroid hello_android HelloAndroid
    Created 'hello_android/src/com/example/helloandroid'.
    Created 'hello_android/bin'.
    Created 'hello_android/libs'.
    Created 'hello_android/res'.
    Created 'hello_android/res/drawable-hdpi'.
    Created 'hello_android/res/drawable-ldpi'.
    Created 'hello_android/res/drawable-mdpi'.
    Created 'hello_android/res/layout'.
    Created 'hello_android/res/values'.
    Created project in hello_android.
    Created Activity 'HelloAndroid' in 'hello_android/src/com/example/helloandroid/HelloAndroid.mirah'.

_from original tutorial_
Here is a description of each field:

_Project Name_
This is the Eclipse project name — the name of the directory that contains the project files.
_Build Target_
This is the version of the Android SDK that you're using to build your application. For example, if you choose Android 2.1, your application will be compiled against the Android 2.1 platform library. The target you choose here does not have to match the target you chose for your AVD; however, the target must be equal to or lower than the target you chose for your AVD. Android applications are forward-compatible, which means an application will run on the platform against which it is built as well as all platforms that are released in the future. For example, an application that is built against the 2.1 platform library will run normally on an AVD or device that is running the 2.3.3. The reverse is not true.
_Application Name_
This is the human-readable title for your application — the name that appears on the Android device.
_Package Name_
This is the package namespace (following the same rules as for packages in the Java programming language) that you want all your source code to reside under. This also sets the package name under which the stub Activity is generated.
Your package name must be unique across all packages installed on the Android system; for this reason, it's important to use a standard domain-style package for your applications. The example above uses the "com.example" namespace, which is a namespace reserved for example documentation — when you develop your own applications, you should use a namespace that's appropriate to your organization or entity.
_Create Activity_
This is the name for the class stub that is generated by the plugin. This is a subclass of Android's Activity class. An Activity is simply a class that can run and do work. It can create a UI if it chooses, but it doesn't need to. As the checkbox suggests, this is optional, but an Activity is almost always used as the basis for an application.
_Min SDK Version_
This value specifies the minimum API Level on which your application will run. The Min SDK Version should be the same as the Build Target you chose. For example, if the Build Target is Android 2.1, then the Min SDK Version should be 7 or lower (it can never be higher than 7). For more information, see Android API Levels.
_Other fields:_ The checkbox for "Use default location" allows you to change the location on disk where the project's files are generated and stored.


Your Android project is now ready. Open the `HelloAndroid.mirah` file, located inside `hello_android/src/com/example/helloandroid`. It should look like this:

```mirah
package com.example.helloandroid

import android.app.Activity

class HelloAndroid < Activity
  def onCreate(state)
    super state
    setContentView R.layout.main
  end
end
```

Notice that the class is based on the Activity class. An [Activity](http://developer.android.com/reference/android/app/Activity.html) is a single application entity that is used to perform actions. An application may have many separate activities, but the user interacts with them one at a time. The [onCreate()](http://developer.android.com/reference/android/app/Activity.html#onCreate(android.os.Bundle)) method is called by the Android system when your Activity starts — it is where you should perform all initialization and UI setup. An activity is not required to have a user interface, but usually does.

Now let's modify some code!



Construct the UI
-----------------------

Take a look at the revised code below and then make the same changes to your HelloAndroid class. The lines that have been added have comments.

```mirah
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
```


An Android user interface is composed of hierarchies of objects called Views. A [View](http://developer.android.com/reference/android/view/View.html) is a drawable object used as an element in your UI layout, such as a button, image, or (in this case) a text label. Each of these objects is a subclass of the View class and the subclass that handles text is [TextView](http://developer.android.com/reference/android/widget/TextView.html).

In this change, you create a TextView with the class constructor, which accepts an Android [Context](http://developer.android.com/reference/android/content/Context.html) instance as its parameter. A Context is a handle to the system; it provides services like resolving resources, obtaining access to databases and preferences, and so on. The Activity class inherits from Context, and because your HelloAndroid class is a subclass of Activity, it is also a Context. So, you can pass _self_ as your Context reference to the TextView.

Next, you define the text content with [setText()](http://developer.android.com/reference/android/widget/TextView.html#setText(java.lang.CharSequence)).

Finally, you pass the TextView to [setContentView()](http://developer.android.com/reference/android/app/Activity.html#setContentView(android.view.View)) in order to display it as the content for the Activity UI. If your Activity doesn't call this method, then no UI is present and the system will display a blank screen.

There it is — "Hello, World" in Android! The next step, of course, is to see it running.


Run the Application
------------------

Eclipse would make it easy to run the application, but we're using the command line. In theory, you should be able to do this:

```
rake debug:install
```

which would create a debug build of the project and install it on an emulator--possibly running the emulator if it wasn't already.

For now do this:

1. start up an emulator `$ emulator -avd my_avd` (assuming the Android SDK binaries are on your path).
2. create the debug build `$ rake debug`
3. install the debug build `$ rake installd` ( this bit doesn't work yet, but I've got a patch )
4. run the adb shell `$ android/platform-tools/adb -e shell` and start your activity
  `# am start -n com.example.helloandroid/com.example.helloandroid.HelloAndroid`


The "Hello Android" you see in the grey bar is actually the application title. The Pindah generator creates this automatically (the string is defined in the res/values/strings.xml file and referenced by your AndroidManifest.xml file). The text below the title is the actual text that you have created in the TextView object.

That concludes the basic "Hello World" tutorial, but you should continue reading for some more valuable information about developing Android applications.





# Attribution

Google was awesome and OSS licensed their content so that it could be remixed. All the tutorial content should have a paragraph at the bottom as follows, attributing it to the Android Open Source Project:

Portions of this page are modifications based on work created and [shared by the Android Open Source Project](http://code.google.com/policies.html ) and used according to terms described in the [Creative Commons 2.5 Attribution License](http://creativecommons.org/licenses/by/2.5/).

