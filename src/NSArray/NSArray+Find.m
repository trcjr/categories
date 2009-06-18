//
//  NSArray+find.m
//  IList
//
//  Created by Corey Johnson on 12/19/08.
//  Copyright 2008 Probably Interactive. All rights reserved.
//

#import "NSArray+Find.h"

@implementation NSArray (Find)

- (id)findWhereKeyPath:(NSString *)keyPath equals:(id)value {
	for (id object in self) {
		id objectValue = [object valueForKeyPath:keyPath];
		if ([objectValue isEqual:value] || objectValue == value) return object;
	}
	
	return nil;
}

- (id)findWhereKeyPath:(NSString *)keyPath equalsBoolean:(BOOL)value {
	return [self findWhereKeyPath:keyPath equals:[NSNumber numberWithBool:value]];
}

- (NSArray *)findAllWhereKeyPath:(NSString *)keyPath equals:(id)value {
	NSMutableArray *matches = [NSMutableArray array];
	for (id object in self) {
		id objectValue = [object valueForKeyPath:keyPath];
		if ([objectValue isEqual:value] || objectValue == value) [matches addObject:object];			
	}
	
	return matches;
}

- (NSArray *)findAllWhereKeyPath:(NSString *)keyPath equalsBoolean:(BOOL)value {
	return [self findAllWhereKeyPath:keyPath equals:[NSNumber numberWithBool:value]];
}

- (NSArray *)map:(SEL)selector target:(id)target {
	NSMutableArray *mappedArray = [NSMutableArray array];
	for (id object in self) {
		[mappedArray addObject:[target performSelector:selector withObject:object]];
	}
	return mappedArray;
}



@end
