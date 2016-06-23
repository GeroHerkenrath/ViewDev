//
//  ViewToTest.m
//  ViewDev
//
//  Created by Gero Herkenrath on 09/06/16.
//

#import "ViewToTest.h"

@implementation ViewToTest

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
		NSLog(@"ViewToTest received \"initWithFrame:\" (it has a blue transparent color)");
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
		NSLog(@"ViewToTest received \"initWithCoder:\" (it has a blue transparent color)");
	}
	return self;
}

@end
