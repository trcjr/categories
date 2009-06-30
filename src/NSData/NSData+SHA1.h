//
//  NSData+SHA1.h
//
//  Created by Geoffrey Garside on 29/06/2008.
//  Copyright 2008 Geoffrey Garside. All rights reserved.
//
//  Methods extracted from source given at
//  http://www.cocoadev.com/index.pl?NSDataCategory
//

#import <Foundation/NSData.h>

@interface NSData (SHA1)

#pragma mark -
#pragma mark SHA1 Hashing routines
/*! Returns the SHA1 digest of the receivers contents.
 * \return SHA1 digest of the receivers contents.
 */
- (NSData*) sha1Digest;

/*! Returns a string with the SHA1 digest of the receivers contents.
 * \return String with the SHA1 digest of the receivers contents.
 */
- (NSString*) sha1DigestString;

@end
