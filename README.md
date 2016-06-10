# Project Template for testing custom views in Objective-C (iOS) #

This is just a template project I use to test custom views I code.
What I hate most about this is checking whether they behave correctly when being resized, 
so I made a "container" that can be easily resized. Once I put the view I want to test in there
I can easily see whether it works as I want during runtime. 
That's usually easier than fiddling with a large existing project.

### Test Setup ###

1. Add your view to the `Views to Test` folder, then also add them in the according group in the project. (This is just to keep everything tidy).

2. Either instantiate your view programmatically in the `viewDidLoad` method of the provided `ViewController.m` class or add it in interface builder (if you're using IB_DESIGNABLE).

The template is probably not absolutely complete, but it helps finding problems with your design.
Note that I use autolayout constraints to resize the container view. Depending on how you add your view this can lead to autolayout
warnings etc. For example: If your view uses constraints internally to layout its subviews and those define a ninimum width
or height, but you then also use constraints to resize it with the containerView in the template, you might get errors.
This isn't necessarily a problem (the app doesn't crash, it simply breaks one of the problematic constraints during runtime), 
but keep in mind that third party coders might run into similar issues then.

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
