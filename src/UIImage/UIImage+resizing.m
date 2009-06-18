//
//  UIImage+resizing.m
//  Craigslist
//
//  Created by Corey Johnson on 12/31/08.
//  Copyright 2008 Probably Interactive. All rights reserved.
//

#import "UIImage+resizing.h"


@implementation UIImage(resizing)

- (UIImage *)resizeTo:(CGSize)size {// cropTo:(CGSize)cropSize {
	CGRect imageRect = CGRectMake(0, 0, size.width, size.height);	
	float width = size.width;
	float height = size.height;

	CGImageRef imageRef = [self CGImage];
	size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
	size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
	CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
	CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
	if (alphaInfo == kCGImageAlphaNone)	{
		alphaInfo = kCGImageAlphaNoneSkipLast;	
		bytesPerRow = 4 * width;
	}

	CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, alphaInfo);
	
	CGContextBeginPath(context);
	CGContextAddRect(context, imageRect);
	CGContextClosePath(context);
	CGContextClip(context);
	CGContextDrawImage(context, imageRect, self.CGImage);	

	CGImageRef resizedImageRef = CGBitmapContextCreateImage(context);
	UIImage *resizedImage = [UIImage imageWithCGImage:resizedImageRef];
	CGImageRelease(resizedImageRef);
	CGContextRelease(context);

	return resizedImage;
}

- (UIImage *)scale:(float)scaleAmount {
	float width = self.size.width * scaleAmount;
	float height = self.size.height * scaleAmount;
	UIGraphicsBeginImageContext(CGSizeMake(width, height));
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);	
	
	UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return scaledImage;
}


@end
