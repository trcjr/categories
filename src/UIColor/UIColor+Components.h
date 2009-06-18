//
//  UIColor+Components.h
//  sheep
//
//  Created by ProbablyInteractive on 4/6/09.
//  Copyright 2009 Probably Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIColor (Components)

-(BOOL)isMonochrome;

-(CGFloat)red;
-(CGFloat)green;
-(CGFloat)blue;

-(CGFloat)hue;
-(CGFloat)saturation;
-(CGFloat)brightness;

-(CGFloat)alpha;

-(void)rgba:(float[4])arr;
-(void)hsba:(float[4])arr;

-(UIColor *)getReverseColor;
	
@end

void RGB2HSL(float r, float g, float b, float* outH, float *outS, float *outV);
void HSL2RGB(float h, float s, float l, float* outR, float* outG, float* outB);

