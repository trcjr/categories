//
//  UIColor+Components.m
//  sheep
//
// Borrowed code from "Darklight iPhone Toolkit" by Brian Gilbert

#import "UIColor+Components.h"

@implementation UIColor (Components)

-(BOOL)isMonochrome {
	return kCGColorSpaceModelMonochrome == CGColorSpaceGetModel(CGColorGetColorSpace([self CGColor]));
}

-(CGFloat)red {
	return CGColorGetComponents([self CGColor])[0];
}

-(CGFloat)green {
	const CGFloat *colors = CGColorGetComponents([self CGColor]);
	return [self isMonochrome] ? colors[0] : colors[1];
}

-(CGFloat)blue {
	const CGFloat *colors = CGColorGetComponents([self CGColor]);
	return [self isMonochrome] ? colors[0] : colors[2];
}

-(CGFloat)hue {
	float hfa[4];
	[self hsba:hfa];
	return hfa[0];
}

-(CGFloat)saturation {
	float hfa[4];
	[self hsba:hfa];
	return hfa[1];
}

-(CGFloat)brightness {
	float hfa[4];
	[self hsba:hfa];
	return hfa[2];
}


-(CGFloat)alpha {
	return CGColorGetAlpha([self CGColor]);
}

-(void)rgba:(float[4])arr {
	arr[0]=[self red];
	arr[1]=[self green];
	arr[2]=[self blue];
	arr[3]=[self alpha];
}
-(void)hsba:(float[4])arr {
	arr[3]=[self alpha];
	RGB2HSL([self red], [self green], [self blue], &arr[0],&arr[1],&arr[2]);
	
}

-(UIColor *)getReverseColor {
	return [UIColor colorWithRed:1-[self red] green:1-[self green] blue:1-[self blue] alpha:[self alpha]];
}

void RGB2HSL(float r, float g, float b, float* outH, float *outS, float *outV) {
	float minC,maxC;
	minC = fminf(r, g);
	minC = fminf(minC,b);
	maxC = fmaxf(r, g);
	maxC = fmaxf(maxC,b);
	
	float h,s,v,f,i;
	v=maxC;
	
	if(minC == maxC){
		h=s=0;
	}else{
		f = (r == minC) ? g - b : ((g == minC) ? b - r : r - b);
		i = (r == minC) ? 3 : ((g == minC) ? 5 : 1);
		
		h = ((i - f /(maxC - minC))/6);
		s = (maxC - minC)/maxC;
	}
	
	*outH = h;
	*outS = s;
	*outV = v;
}


void HSL2RGB(float h, float s, float l, float* outR, float* outG, float* outB) {
	float			temp1,
	temp2;
	float			temp[3];
	int				i;
	
	// Check for saturation. If there isn't any just return the luminance value for each, which results in gray.
	if(s == 0.0) {
		if(outR)
			*outR = l;
		if(outG)
			*outG = l;
		if(outB)
			*outB = l;
		return;
	}
	
	// Test for luminance and compute temporary values based on luminance and saturation 
	if(l < 0.5)
		temp2 = l * (1.0 + s);
	else
		temp2 = l + s - l * s;
	temp1 = 2.0 * l - temp2;
	
	// Compute intermediate values based on hue
	temp[0] = h + 1.0 / 3.0;
	temp[1] = h;
	temp[2] = h - 1.0 / 3.0;
	
	for(i = 0; i < 3; ++i) {
		
		// Adjust the range
		if(temp[i] < 0.0)
			temp[i] += 1.0;
		if(temp[i] > 1.0)
			temp[i] -= 1.0;
		
		if(6.0 * temp[i] < 1.0)
			temp[i] = temp1 + (temp2 - temp1) * 6.0 * temp[i];
		else {
			if(2.0 * temp[i] < 1.0)
				temp[i] = temp2;
			else {
				if(3.0 * temp[i] < 2.0)
					temp[i] = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - temp[i]) * 6.0;
				else
					temp[i] = temp1;
			}
		}
	}
	
	// Assign temporary values to R, G, B
	if(outR)
		*outR = temp[0];
	if(outG)
		*outG = temp[1];
	if(outB)
		*outB = temp[2];
}

@end

