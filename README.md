Mirah-ification of Android Tutorials
======================

I'm forking and Mirah-ifying the [tutorials](http://developer.android.com/resources/browser.html?tag=tutorial).

features/problems
-------
* current pindah (0.1.2) and the current android sdk don't play nice
```
$ rake debug
rake aborted!
org.apache.tools.ant.BuildException: 

Error. You are using an obsolete build.xml
You need to delete it and regenerate it using
	android update project

(See full trace by running task with --trace)
```
You may need to install it from source. Check https://github.com/mirah/pindah for instructions.


Goals
----
* Learn more about the Android platform
* Dog food Mirah on the platform a bit, and fix things that suck.

Tutorials
------
## Hello World
[original](http://developer.android.com/resources/tutorials/hello-world.html)
## Hello Views
*TODO*
* Layouts
  * Linear Layout
  * Relative Layout
  * ...
* Widgets and Other Views
  * ...
  * Gallery
## Hello Localization
*TODO*
## Notepad Tutorial 
*TODO*


# Attribution

Google was awesome and OSS licensed their content so that it could be remixed. All the tutorial content should have a paragraph at the bottom as follows, attributing it to the Android Open Source Project:

> Portions of this page are modifications based on work created and [shared by the Android Open Source Project](http://code.google.com/policies.html ) and used according to terms described in the [Creative Commons 2.5 Attribution License](http://creativecommons.org/licenses/by/2.5/).

