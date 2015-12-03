//
//  NSData+AES.h
//  EncriptionTest
//
//  Created by Ivan Sinitsa on 6/12/15.
//  Copyright © 2015 Ivan Sinitsa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(AES)
- (NSData*)AES256EncryptWithKey:(NSString*)key;
- (NSData*)AES256DecryptWithKey:(NSString*)key;
@end

