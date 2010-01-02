//
//  UIView+KeyboardMovement.m
//  IList
//
//  Created by Corey Johnson on 12/24/08.
//  Copyright 2008 Probably Interactive. All rights reserved.
//

#import "UIView+KeyboardMovement.h"
#import "UIView+FrameEditing.h"

@implementation UIView (KeyboardMovement)

static NSMutableDictionary *kOriginalPositions;

- (int)localTopOfKeyboardWithHeight:(int)height {	
	float topOfKeyboard = [[UIScreen mainScreen] bounds].size.height - height;
	CGPoint point = [[UIApplication sharedApplication].keyWindow convertPoint:CGPointMake(0, topOfKeyboard) toView:self];
	return point.y + [self frameTop];
}

- (void)focusSubview:(UIView *)view withPadding:(int)padding forNotification:(NSNotification *)notification {
	if (!kOriginalPositions) kOriginalPositions = [[NSMutableDictionary alloc] init];
	
	CGRect keyboardBounds;
	double animationDurration;
	UIViewAnimationCurve animationCurve;
#if __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_2_2
	[[[notification userInfo] valueForKey:@"UIKeyboardBoundsUserInfoKey"] getValue:&keyboardBounds];
	[[[notification userInfo] valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"] getValue:&animationDurration];
	[[[notification userInfo] valueForKey:@"UIKeyboardAnimationCurveUserInfoKey"] getValue:&animationCurve];
#else
        keyboardBounds = CGRectMake(0, 0, 320, 216);
        animationDurration = 0.3;
        animationCurve = UIViewAnimationCurveEaseInOut;
#endif
	
	[kOriginalPositions setObject:[NSNumber numberWithFloat:[self frameTop]] forKey:[NSNumber numberWithInt:(int)self]];

	CGPoint point = [view convertPoint:CGPointMake(0, [view frameBottom]) toView:self];
	float localBottomOfTextField = point.y;
	float localTopOfKeyboard = [self localTopOfKeyboardWithHeight:keyboardBounds.size.height];
	
	int moveY = (-padding + localTopOfKeyboard - localBottomOfTextField);
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:animationDurration];
	[UIView setAnimationCurve:animationCurve]; {	
		[self setFrameY:[self frameTop] + moveY];
	}
	[UIView commitAnimations];	
}

- (void)revertFocusForNotification:(NSNotification *)notification {
	CGRect keyboardBounds;
	double animationDurration;
	UIViewAnimationCurve animationCurve;

#if __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_2_2
	[[[notification userInfo] valueForKey:@"UIKeyboardBoundsUserInfoKey"] getValue:&keyboardBounds];
	[[[notification userInfo] valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"] getValue:&animationDurration];
	[[[notification userInfo] valueForKey:@"UIKeyboardAnimationCurveUserInfoKey"] getValue:&animationCurve];
#else
        keyboardBounds = CGRectMake(0, 0, 320, 216);
        animationDurration = 0.3;
        animationCurve = UIViewAnimationCurveEaseInOut;
#endif
        
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:animationDurration];
	[UIView setAnimationCurve:animationCurve]; {
		float y = [[kOriginalPositions objectForKey:[NSNumber numberWithInt:(int)self]] floatValue];
		[self setFrameY:y];
	}
	[UIView commitAnimations];
        
        [kOriginalPositions removeObjectForKey:[NSNumber numberWithInt:(int)self]];
}

@end
