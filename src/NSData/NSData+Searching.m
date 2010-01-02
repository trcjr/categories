//
//  NSData+Searching.m
//
//  Created by Geoffrey Garside on 17/07/2008.
//  Copyright (c) 2008 Geoff Garside
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSData+Searching.h"
#import <string.h> // memchr

@implementation NSData (Searching)

- (NSRange)rangeFrom:(NSInteger)start toByte:(NSInteger)c;
{
	const char *pdata = [self bytes];
	NSUInteger len = [self length];
    if (start < len) {
        char *end = memchr(pdata + start, c, len - start);
        if (end != NULL)
            return NSMakeRange (start, end - (pdata + start));
    }
    return NSMakeRange(NSNotFound, 0);
}

- (NSRange)rangeOfNullTerminatedBytesFrom:(NSInteger)start
{
    return [self rangeFrom:start toByte:0x00];
}

- (NSData*)subdataFromIndex:(NSUInteger)anIndex
{
    NSRange theRange = NSMakeRange(anIndex, [self length] - anIndex);
    return [self subdataWithRange:theRange];
}
- (NSData*)subdataToIndex:(NSUInteger)anIndex
{
    NSRange theRange = NSMakeRange(0, anIndex);
    return [self subdataWithRange:theRange];
}

@end
