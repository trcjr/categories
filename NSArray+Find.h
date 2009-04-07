//
//  NSArray+Find.h
//  IList
//
//  Created by Corey Johnson on 12/19/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Find)

- (id)findWhereKeyPath:(NSString *)keyPath equals:(id)value;
- (id)findWhereKeyPath:(NSString *)keyPath equalsBoolean:(BOOL)value;

- (NSArray *)findAllWhereKeyPath:(NSString *)keyPath equals:(id)value;
- (NSArray *)findAllWhereKeyPath:(NSString *)keyPath equalsBoolean:(BOOL)value;

@end
