//
//  ViewController.m
//  ViewDev
//
//  Created by Gero Herkenrath on 08/06/16.
//

#import "ViewController.h"
#pragma mark - Import your view header if needed
//#import "ViewToTest.h" // or some other and/or additional views.

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property (strong, nonatomic) UIView *myTestView;

@property (weak, nonatomic) IBOutlet UIView *containerView;
- (IBAction)changeConstraint:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
#pragma mark - Add any views programmatically here!
	// you can use the property myTestView to hold your view & keep a reference
	
	[self setupConstraints];
}

- (void)setupConstraints {
#pragma mark - Create any constraints your custom view needs here
	// you should probably do this so it resizes with the containerView as you wish
	// the following sets it to "aspect fit" inside the containerView. Uncomment for that behavior.
//	self.myTestView.translatesAutoresizingMaskIntoConstraints = NO;
//	[self.containerView addSubview:self.myTestView];
//	[self setAspectFitModeFor:self.myTestView withParent:self.containerView];
	
}

#pragma mark - Zoom containerView with sliders action

- (IBAction)changeConstraint:(id)sender {
	
	NSLayoutConstraint *oldConstraint;
	NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute; // just a default to satisfy the analyze build...
	if ([sender tag] == 1) { // X -> width
		attribute = NSLayoutAttributeWidth;
		oldConstraint = self.widthConstraint;
	} else if ([sender tag] == 2) { // Y -> height
		attribute = NSLayoutAttributeHeight;
		oldConstraint = self.heightConstraint;
	}
	
	// fallback for accidentally messing up the storyboard tags:
	if (attribute == NSLayoutAttributeNotAnAttribute) {
		return;
	}
	
	CGFloat newMultiplier = (CGFloat)[(UISlider *)sender value];
	NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.containerView
																	 attribute:attribute
																	 relatedBy:NSLayoutRelationEqual
																		toItem:self.view
																	 attribute:attribute
																	multiplier:newMultiplier
																	  constant:0.0];
	[self.view removeConstraint:oldConstraint];
	[self.view addConstraint:newConstraint];
	if (attribute == NSLayoutAttributeWidth) {
		self.widthConstraint = newConstraint;
	} else {
		self.heightConstraint = newConstraint;
	}
}

#pragma mark - Predefined aspect fit constraints
// Note that this makes only sense if your view is meant to have a fixed aspect ratio!
// The method does NOT add constraints for that, but assumes they already exist in some form
// It also relies on the view's translatesAutoresizingMaskIntoConstraints being NO
- (void)setAspectFitModeFor:(UIView *)view withParent:(UIView *)parent {
	
	if (!view || !parent || view.translatesAutoresizingMaskIntoConstraints) {
		return;
	}
	
	NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:view
															   attribute:NSLayoutAttributeCenterX
															   relatedBy:NSLayoutRelationEqual
																  toItem:parent
															   attribute:NSLayoutAttributeCenterX
															  multiplier:1.0
																constant:0.0];
	NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:view
															   attribute:NSLayoutAttributeCenterY
															   relatedBy:NSLayoutRelationEqual
																  toItem:parent
															   attribute:NSLayoutAttributeCenterY
															  multiplier:1.0
																constant:0.0];
	NSLayoutConstraint *lessOrEqualWidth = [NSLayoutConstraint constraintWithItem:view
																		attribute:NSLayoutAttributeWidth
																		relatedBy:NSLayoutRelationLessThanOrEqual
																		   toItem:parent
																		attribute:NSLayoutAttributeWidth
																	   multiplier:1.0
																		 constant:0.0];
	NSLayoutConstraint *equalWidthHighP = [NSLayoutConstraint constraintWithItem:view
																	   attribute:NSLayoutAttributeWidth
																	   relatedBy:NSLayoutRelationEqual
																		  toItem:parent
																	   attribute:NSLayoutAttributeWidth
																	  multiplier:1.0
																		constant:0.0];
	equalWidthHighP.priority = UILayoutPriorityDefaultHigh; // this is very important!
	NSLayoutConstraint *lessOrEqualHeight = [NSLayoutConstraint constraintWithItem:view
																		 attribute:NSLayoutAttributeHeight
																		 relatedBy:NSLayoutRelationLessThanOrEqual
																			toItem:parent
																		 attribute:NSLayoutAttributeHeight
																		multiplier:1.0
																		  constant:0.0];
	NSLayoutConstraint *equalHeightHighP = [NSLayoutConstraint constraintWithItem:view
																		attribute:NSLayoutAttributeHeight
																		relatedBy:NSLayoutRelationEqual
																		   toItem:parent
																		attribute:NSLayoutAttributeHeight
																	   multiplier:1.0
																		 constant:0.0];
	equalHeightHighP.priority = UILayoutPriorityDefaultHigh; // this is very important!
	
	[parent addConstraints:@[centerX, centerY, lessOrEqualWidth, lessOrEqualHeight, equalWidthHighP, equalHeightHighP]];
}


@end
