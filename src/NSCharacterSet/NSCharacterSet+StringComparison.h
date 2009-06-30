//
//  NSCharacterSet+StringComparison.h
//
//  Created by Geoffrey Garside on 25/03/2009.
//  Copyright 2009 Geoffrey Garside. All rights reserved.
//

#import <Foundation/NSCharacterSet.h>

@class NSString;
@interface NSCharacterSet (StringComparison)
- (BOOL)stringIsComposedOfCharactersInSet:(NSString*)string;
@end
