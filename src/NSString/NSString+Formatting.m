//
//  NSString+Formatting.m
//  Fluenz
//
//  Created by ProbablyInteractive on 4/8/09.
//  Copyright 2009 Probably Interactive. All rights reserved.
//

#import "NSString+Formatting.h"


@implementation NSString (Formatting)

- (NSString *)stringInCamelCase {
	NSMutableString *camelCased = [NSMutableString string];
	
	BOOL shouldUppercase = NO;

	for (int i = 0; i < [self length]; i++) {
		NSString *currChar = [self substringWithRange:NSMakeRange(i, 1)];
		if ([currChar isEqualToString:@"_"]) {
			shouldUppercase = YES;
		}
		else {
			if (shouldUppercase) currChar = [currChar uppercaseString];
			shouldUppercase = NO;		
			[camelCased appendString:currChar];
		}			 
	}
	
	return camelCased;	
}

- (NSString *)stringWithoutAccents {
	return [[[NSString alloc] initWithData:[self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding] autorelease];
}

@end
