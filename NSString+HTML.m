//
//  NSString+HTML.m
//  FilmBuff
//
//  Created by Corey Johnson on 11/28/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "NSString+HTML.h"
#import "RegexKitLite.h"

@implementation NSString (HTML)

- (NSString *)removeHTML {
	NSMutableString *decodedString = [NSMutableString stringWithString:self];
	[decodedString replaceOccurrencesOfRegex:@"<[^>]+>" withString:@""];	
	
	// Decode HTML entities
	NSRange range;
	while ((range = [decodedString rangeOfRegex:@"&#x....;"]).location != NSIntegerMax) {	
		NSScanner *scanner = [NSScanner scannerWithString:[decodedString substringWithRange:range]];
		[scanner setScanLocation:3];
		
		unsigned value = 0;
		[scanner scanHexInt:&value];
		
		NSString *decodedChar = [NSString stringWithCString:(char *)&value encoding:NSISOLatin1StringEncoding];
		
		[decodedString replaceCharactersInRange:range withString:decodedChar];
	}

	return decodedString;
}

@end
