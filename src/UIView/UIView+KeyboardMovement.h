//
//  UIView+KeyboardMovement.h
//  IList
//
//  Created by Corey Johnson on 12/24/08.
//  Copyright 2008 Probably Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (KeyboardMovement)

- (int)localTopOfKeyboardWithHeight:(int)height;
- (void)focusSubview:(UIView *)view withPadding:(int)padding forNotification:(NSNotification *)notification;
- (void)revertFocusForNotification:(NSNotification *)notification;
	
@end