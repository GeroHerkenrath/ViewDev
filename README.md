# Project Template for testing custom views in Objective-C (iOS) #

This is just a template project I use to test custom views I code.
What I hate most about this is checking whether they behave correctly when being resized, 
so I made a "container" that can be easily resized. Once I put the view I want to test in there
I can easily see whether it works as I want during runtime. 
That's usually easier than fiddling with a large existing project.

### Test Setup ###

1. Add your view to the `Views to Test` folder, then also add them in the according group in the project. (This is just to keep everything tidy).

2. Either instantiate your view programmatically in the `viewDidLoad` method of the provided `ViewController.m` class or add it in interface builder (if you're using IB_DESIGNABLE).

### Repository notes ###

To prevent me from accidentally checking in the views to test in this repo, the entire `Views to Test` folder is ignored 
(the sample view is an exception). If you see missing files in the project (in the ViewsToTest group) I apparently forgot to
remove them from the project by accident (there's no easy way to ignore that).

### License ###
I provide this code under the MIT license, because these days apparently you have to chose a license...
See the added LICENSE file.

On a *completely unrelated* note, here's a joke: 

__Q__: *What are 1.000 lawyers on the bottom of the see?*

__A__: *A good start...*
