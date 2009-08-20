//
//  TFNetworkActivityIndicatorHelper.m
//
//  A singleton to manage the status bar network indicator.
//
//  Call [TFNetworkActivityIndicatorHelper increment] or decrement
//  and the indicator will be turned off or on if zero connections are
//  active.
//
//  NOTE: Doesn't work well with a UIWebView in a navigation stack.
//
//  Created by Geoffrey Grosenbach on 8/20/09.
//  Copyright 2009 Topfunky Corporation. MIT License.
//

#import "TFNetworkActivityIndicatorHelper.h"

@interface TFNetworkActivityIndicatorHelper (PrivateMethods)
- (void)increment;
- (void)decrement;
@end

@implementation TFNetworkActivityIndicatorHelper

static TFNetworkActivityIndicatorHelper *gInstance = NULL;

+ (TFNetworkActivityIndicatorHelper *)sharedInstance
{
  @synchronized(self)
    {
      if (gInstance == NULL)
        gInstance = [[self alloc] init];
    }
  return(gInstance);
}

- (id)init
{
  if (![super init])
    return nil;
  activeCount = 0;
  return self;
}

+ (void)increment
{
  [[self sharedInstance] increment];
}

+ (void)decrement
{
  [[self sharedInstance] decrement];
}

#pragma mark PrivateMethods

- (void)increment
{
  activeCount++;
  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)decrement
{
  activeCount--;
  if (activeCount <= 0)
    {
      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
      activeCount = 0;
      NSLog(@"Stopping indicator. Now at %i", activeCount);
    }
}

@end
