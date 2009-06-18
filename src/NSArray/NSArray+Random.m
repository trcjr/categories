//
//  NSArray+Random.m
//  Fluenz
//
//  Created by ProbablyInteractive on 4/23/09.
//  Copyright 2009 Probably Interactive. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (NSArray *)randomize {
	NSMutableArray *randomArray = [NSMutableArray arrayWithArray:self];
	for (NSInteger i = [randomArray count] - 1; i > 0; --i) {
		NSInteger j = random() % i;
		[randomArray exchangeObjectAtIndex:j withObjectAtIndex:i]; 
	}
	
	return randomArray;	
}

@end
