//
//  UIView+FrameEditing.h
//  FilmBuff
//
//  Created by Corey Johnson on 11/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (FrameEditing)

- (UIView *)setFrameX:(float)x;
- (UIView *)setFrameY:(float)y;
- (UIView *)setFrameHeight:(float)height;
- (UIView *)setFrameWidth:(float)width;

- (UIView *)setFrameLeft:(float)left;
- (UIView *)setFrameBottom:(float)bottom;
- (UIView *)setFrameTop:(float)top;

- (float)frameWidth;
- (float)frameHeight;
- (float)frameTop;
- (float)frameBottom;
- (float)frameLeft;
- (float)frameRight;

@end
