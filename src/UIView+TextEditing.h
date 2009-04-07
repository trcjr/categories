//
//  UIView+TextEditing.h
//  IList
//
//  Created by Corey Johnson on 12/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (TextEditing)

- (void)keyboardFocusForTextField:(UITextField *)textField padding:(int)padding;
- (void)endKeyboardFocus;

@end