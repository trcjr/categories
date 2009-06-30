//
//  NSData+MD5.h
//
//  Created by Geoffrey Garside on 29/12/2008.
//  Copyright 2008 Geoffrey Garside. All rights reserved.
//
//  Methods extracted from source given at
//  http://www.cocoadev.com/index.pl?NSDataCategory
//

#import <Foundation/NSData.h>

@interface NSData (MD5)

/*! Returns the MD5 digest of the receivers contents.
 * \return MD5 digest of the receivers contents.
 */
- (NSData*) md5Digest;

/*! Returns a string with the MD5 digest of the receivers contents.
 * \return String with the MD5 digest of the receivers contents.
 */
- (NSString*) md5DigestString;

@end
