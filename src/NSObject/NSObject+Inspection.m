//
//  NSObject+Inspection.m
//  Fluenz
//
//  Created by ProbablyInteractive on 4/17/09.
//  Copyright 2009 Probably Interactive. All rights reserved.
//

#import "NSObject+Inspection.h"

@implementation NSObject (Inspection)

+ (NSArray *)methods {
	uint methodCount;
	Method *methodArray;
	methodArray = class_copyMethodList(self, &methodCount);
	
	NSMutableArray *methods = [NSMutableArray array];
	for (int i = 0; i < methodCount; i++) {
		Method method = methodArray[i];
		NSString *name = NSStringFromSelector(method_getName(method));
		[methods addObject:name];
	}
	
	free(methodArray);
	
	return methods;
}

@end
