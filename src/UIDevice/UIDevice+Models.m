//
//  UIDevice+Models.m
//  Vomit
//
//  Created by Corey Johnson on 2/11/09.
//  Copyright 2009 Probably Interactive. All rights reserved.
//

#import "UIDevice+Models.h"


@implementation UIDevice (Models)

- (BOOL)isPhone {
	NSRange rangeMatch = [[[[UIDevice currentDevice] model] lowercaseString] rangeOfString:@"phone"];
	return rangeMatch.location != NSNotFound;
}

- (BOOL)isTouch {
	return ![self isPhone];
}


@end
