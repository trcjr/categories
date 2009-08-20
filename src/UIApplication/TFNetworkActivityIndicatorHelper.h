//
//  TFNetworkActivityIndicatorHelper.h
//
//  Created by Geoffrey Grosenbach on 8/20/09.
//  Copyright 2009 Topfunky Corporation. MIT License.
//

#import <Foundation/Foundation.h>

@interface TFNetworkActivityIndicatorHelper : NSObject {
  NSInteger activeCount;
}

+ (TFNetworkActivityIndicatorHelper *)sharedInstance;
+ (void)increment;
+ (void)decrement;

@end
