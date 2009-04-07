//
//  UIView+TextEditing.m
//  IList
//
//  Created by Corey Johnson on 12/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "UIView+TextEditing.h"
#import "UIView+FrameEditing.h"

@implementation UIView (TextEditing)

static int kKeyboardHeight = 236;

- (void)keyboardFocusForTextField:(UITextField *)textField padding:(int)padding {
	float topOfKeyboard = [[UIScreen mainScreen] bounds].size.height - kKeyboardHeight;	
	CGPoint point = [[UIApplication sharedApplication].keyWindow convertPoint:CGPointMake(0, topOfKeyboard) toView:self];
	float localTopOfKeyboard = point.y + 20; // Status bar adds another 20
	
	point = [textField convertPoint:CGPointMake(0, [textField frameBottom]) toView:self];
	float localBottomOfTextField = point.y;
	
	int moveY = (padding + localTopOfKeyboard - localBottomOfTextField);
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3]; {	
		[self setFrameY:[self frameTop] + moveY];
	}
	[UIView commitAnimations];
}

- (void)endKeyboardFocus {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3]; {	
		[self setFrameY:0];
	}
	[UIView commitAnimations];
}

@end
