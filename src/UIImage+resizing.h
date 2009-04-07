//
//  UIImage+resizing.h
//  Craigslist
//
//  Created by Corey Johnson on 12/31/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage(resizing)

- (UIImage *)resizeTo:(CGSize)size;// cropTo:(CGSize)cropSize;
- (UIImage *)scale:(float)scaleAmount;

@end
