//
//  NSCharacterSet+StringComparison.m
//
//  Created by Geoffrey Garside on 25/03/2009.
//  Copyright 2009 Geoffrey Garside. All rights reserved.
//

#import "NSCharacterSet+StringComparison.h"
#import <Foundation/NSString.h>

@implementation NSCharacterSet (StringComparison)
- (BOOL)stringIsComposedOfCharactersInSet:(NSString*)string
{
    NSCharacterSet *inverted = [self invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:inverted] componentsJoinedByString:@""];
    return [string isEqualToString:filtered];
}
@end
