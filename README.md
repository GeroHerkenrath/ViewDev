# Project Template for testing custom views in Objective-C (iOS) #

This is just a template project I use to test custom views I code.
What I hate most about this is checking whether they behave correctly when being resized, 
so I made a "container" that can be easily resized. Once I put the view I want to test in there
I can easily see whether it works as I want during runtime. 
That's usually easier than fiddling with a large existing project.

### Test Setup ###

1. Add your view to the `ViewsToTest` folder, then also add them in the according group in the project. (This is just to keep everything tidy).

2. Either instantiate your view programmatically in the `viewDidLoad` method of the provided `ViewController.m` class or add it in interface builder (if you're using IB_DESIGNABLE).

The template is probably not absolutely complete, but it helps finding problems with your design.

#### Autolayout or viewDidLayoutSubviews Mode ####

You can either set the `ViewController.m` to use autolayout to resize the container (and if you set it up accordingly 
your own view with it) or simply set the frame of your view to the same as the container after each layout update.
You should be able to switch between these two modes simply by (un)commenting a few lines of code. I also provide
a sample constraint setup that results in an aspect fit relation between your view and the container view, but
whether that makes sense depends on your design.

#### Autolayout Related Considerations ####

A word of warning if your view uses autolayout constraints iternally: If you use the constraints setup between the container
and your view this can lead to autolayout warnings or broken constraints. 
For example: If you define a minimum width or height constraint for your view, but you then also use constraints to 
resize the view with the container (like in my sample), constraints might be broken during runtime if you resize the 
container below your minmum setting.

This isn't necessarily a problem, for example you can simply reduce the priority of the constraints between the container
and your view, but keep in mind that third party coders (if you want to distribute your view in a library) 
might run into similar issues then. I'd say this is bad design, since your view cannot be used "as is usual" then,
but ultimately that's your choice.

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
