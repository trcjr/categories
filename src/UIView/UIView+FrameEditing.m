//
//  UIView+FrameEditing.m
//  FilmBuff
//
//  Created by Corey Johnson on 11/12/08.
//  Copyright 2008 Probably Interactive. All rights reserved.
//

#import "UIView+FrameEditing.h"


@implementation UIView (FrameEditing)

// Get Methods
// -----------
- (float)frameWidth {
	return self.frame.size.width;
}

- (float)frameHeight {
	return self.frame.size.height;
}

- (float)frameTop {
	return self.frame.origin.y;
}

- (float)frameBottom {
	return self.frame.origin.y + self.frame.size.height;
}

- (float)frameLeft {
	return self.frame.origin.x;
}

- (float)frameRight {
	return self.frame.origin.x + self.frame.size.width;
}

- (CGPoint)frameCenter {
	float xCenter = (self.frame.size.width / 2.0) + self.frame.origin.x;
	float yCenter = (self.frame.size.height / 2.0) + self.frame.origin.y;
	
	return CGPointMake(xCenter, yCenter);
}


// Set Methods
// -----------
- (UIView *)addToY:(float)value {
	CGRect frame = self.frame;
	frame.origin.y += value;	
	self.frame = frame;	
	return self;
        
}

- (UIView *)setFrameX:(float)x {
	CGRect frame = self.frame;
	frame.origin.x = x;
	
	self.frame = frame;	
	return self;
}

- (UIView *)setFrameY:(float)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	
	self.frame = frame;	
	return self;
}

- (UIView *)setFrameWidth:(float)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	
	self.frame = frame;	
	return self;
}

- (UIView *)setFrameHeight:(float)height {
	CGRect frame = self.frame;
	frame.size.height = height;

	self.frame = frame;	
	return self;
}

- (UIView *)setFrameLeft:(float)left {
	CGRect frame = self.frame;	
	frame.size.width = frame.size.width - (left - frame.origin.x);	
	frame.origin.x = left;
	self.frame = frame;	
	return self;
}

- (UIView *)setFrameTop:(float)top {
	CGRect frame = self.frame;	
	frame.size.height = (frame.origin.y + frame.size.height) - top;	
	frame.origin.y = top;
	self.frame = frame;	
	return self;
}

- (UIView *)setFrameBottom:(float)bottom {
	CGRect frame = self.frame;
	frame.size.height = bottom - frame.origin.y;	
	self.frame = frame;	
	return self;
}

@end
