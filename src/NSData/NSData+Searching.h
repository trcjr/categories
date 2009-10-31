//
//  NSData+Searching.h
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

#import <Foundation/NSData.h>

@interface NSData (Searching)

/*! Returns the range of bytes up to the first occurrence of byte c from start.
 * \return Range of bytes up to the first occurrence of c from start. If c
 * can not be found then the NSRange.location will be set to NSNotFound.
 * \see memchr
 */
- (NSRange)rangeFrom:(NSInteger)start toByte:(NSInteger)c;

/*! Returns the range of bytes up to the first NULL byte from start.
 * \return Range of bytes up to the first NULL from start. If no NULL
 * can be found then the NSRange.location will be set to NSNotFound.
 * \see memchr
 */
- (NSRange)rangeOfNullTerminatedBytesFrom:(NSInteger)start;

/*! Returns a data object containing a copy of the receiver's bytes
 * that fall within the limits specified by a given index and the
 * end of the bytes.
 * \param index Start of the range which defines the limits to extract.
 * \return A data object containing a copy of the receiver's bytes
 * that fall within the limits of index and the end of the bytes.
 * \see -subdataWithRange:
 */
- (NSData*)subdataFromIndex:(NSUInteger)index;

/*! Returns a data object containing a copy of the receiver's bytes
 * that fall within the first byte and index.
 * \param index End of the range which defines the limits to extract.
 * \return A data object containing a copy of the receiver's bytes
 * that fall within the first byte and index.
 * \see -subdataWithRange:
 */
- (NSData*)subdataToIndex:(NSUInteger)index;

@end
