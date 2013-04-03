/*
 * EncryptedNSUserDefaults.m
 *
 * Created by Oguzhan Cansin Gungor on 01/04/13.
 *
 * Copyright (c) 2013 Aslan-Apps. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *       This product includes software developed by Aslan-Apps.
 * 4. The name of the author may not be used to endorse or promote
 *    products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "EncryptedNSUserDefaults.h"
#import <CommonCrypto/CommonCryptor.h>


@implementation EncryptedNSUserDefaults

static NSString *_key = nil;

+ (void) setKey:(NSString *)key
{
    _key = key;
	if (_key == nil) {
		UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                     message:@"Key is nil!"
                                                    delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
#if !__has_feature(objc_arc) && __clang_major__ >= 3
        [av release];
#endif
	}
}




+(NSString*)stringForKey:(NSString*)aKey {

#if __has_feature(objc_arc) && __clang_major__ >= 3
    return [[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding];
#else
    return [[[NSString alloc] initWithData:[[EncryptedUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] autorelease];
#endif
}

+(BOOL)boolForKey:(NSString*)aKey {  
  
#if __has_feature(objc_arc) && __clang_major__ >= 3
    return [[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] boolValue];
#else
    return [[[[NSString alloc] initWithData:[[EncryptedUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] autorelease] boolValue];
#endif
    
}

+(id)objectForKey:(NSString*)aKey {
     return [[NSUserDefaults standardUserDefaults] objectForKey:aKey];
}

+(NSInteger)integerForKey:(NSString*)aKey {
   
#if __has_feature(objc_arc) && __clang_major__ >= 3
    return [[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] integerValue];
#else
    return [[[[NSString alloc] initWithData:[[EncryptedUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] autorelease] integerValue];
#endif
    
    
}

+(double)doubleForKey:(NSString*)aKey {
 
#if __has_feature(objc_arc) && __clang_major__ >= 3
    return [[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] doubleValue];
#else
    return [[[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] autorelease] doubleValue];
#endif
    
    
}

+(float)floatForKey:(NSString*)aKey {
    
#if __has_feature(objc_arc) && __clang_major__ >= 3
     return [[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] floatValue];
#else
     return [[[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] autorelease] floatValue];
#endif
    
}

+(int)intForKey:(NSString*)aKey {
  
#if __has_feature(objc_arc) && __clang_major__ >= 3
   return  [[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] intValue];
#else
    return [[[[NSString alloc] initWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] encoding:NSUTF8StringEncoding] autorelease] intValue];
#endif
    
}
+(NSData*)dataForKey:(NSString*)aKey {
    return (NSData*)[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] ; 
}

+(NSMutableData*)mutableDataForKey:(NSString*)aKey{
    return (NSMutableData*) [NSMutableData dataWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES]];
}

+(NSArray*)arrayForKey:(NSString*)aKey {
    return (NSArray*)[NSKeyedUnarchiver unarchiveObjectWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] ];
}

+(NSMutableArray*)mutableArrayForKey:(NSString*)aKey{
   
#if __has_feature(objc_arc) && __clang_major__ >= 3
    return (NSMutableArray*)[[NSKeyedUnarchiver unarchiveObjectWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] ] mutableCopy];
#else
    return (NSMutableArray*)[[[NSKeyedUnarchiver unarchiveObjectWithData:[[EncryptedUserDefaults objectForKey:aKey] DecryptAES] ] mutableCopy] autorelease];
#endif
    
    
}

+(NSDictionary*)dictionaryForKey:(NSString*)aKey{
    return (NSDictionary*)[NSKeyedUnarchiver unarchiveObjectWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] ];

}
+(NSMutableDictionary*)mutableDictionaryForKey:(NSString*)aKey{

#if __has_feature(objc_arc) && __clang_major__ >= 3
     return (NSMutableDictionary*) [[NSKeyedUnarchiver unarchiveObjectWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] ] mutableCopy];
#else
    return  return (NSMutableDictionary*) [[[NSKeyedUnarchiver unarchiveObjectWithData:[[EncryptedNSUserDefaults objectForKey:aKey] DecryptAES] ] mutableCopy] autorelease];
#endif
    
   
}


+(void)setData:(NSData*)aData forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[aData EncryptAES] forKey:aKey];
}

+(void)setMutableData:(NSMutableData*)aData forKey:(NSString*)aKey{
    [EncryptedNSUserDefaults setObject:[[aData mutableCopy] EncryptAES] forKey:aKey];
}

+(void)setString:(NSString*)aString forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[[aString dataUsingEncoding:NSUTF8StringEncoding] EncryptAES] forKey:aKey];
}

+(void)setBool:(BOOL)aBool forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[[[[NSNumber numberWithBool:aBool] stringValue] dataUsingEncoding:NSUTF8StringEncoding] EncryptAES]
                              forKey:aKey];
}

+(void)setObject:(id)anObject forKey:(NSString*)aKey {
//    NSLog(@"object %@", anObject);
    [[NSUserDefaults standardUserDefaults] setObject:anObject forKey:aKey];
//    NSLog(@"saved object: %@", [[NSUserDefaults standardUserDefaults] objectForKey:aKey]);
}

+(void)setInteger:(NSInteger)anInteger forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[[[[NSNumber numberWithInteger:anInteger] stringValue] dataUsingEncoding:NSUTF8StringEncoding] EncryptAES]
                                  forKey:aKey];
}

+(void)setDouble:(double)aDouble forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[[[[NSNumber numberWithDouble:aDouble] stringValue] dataUsingEncoding:NSUTF8StringEncoding] EncryptAES]
                              forKey:aKey];
}

+(void)setFloat:(float)aFloat forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[[[[NSNumber numberWithFloat:aFloat] stringValue] dataUsingEncoding:NSUTF8StringEncoding] EncryptAES]
                              forKey:aKey];
}

+(void)setInt:(int)anInt forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[[[[NSNumber numberWithInt:anInt] stringValue] dataUsingEncoding:NSUTF8StringEncoding] EncryptAES]
                              forKey:aKey];
}

+(void)setArray:(NSArray*)anArray forKey:(NSString*)aKey {
    [EncryptedNSUserDefaults setObject:[ [NSKeyedArchiver archivedDataWithRootObject:anArray]  EncryptAES]
                              forKey:aKey];
}

+(void)setMutableArray:(NSMutableArray*)anArray forKey:(NSString*)aKey{
    [EncryptedNSUserDefaults setObject:[ [NSKeyedArchiver archivedDataWithRootObject:[NSArray arrayWithArray:anArray]]  EncryptAES]
                              forKey:aKey];
}

+(void)setDictionary:(NSDictionary*)aDictionary forKey:(NSString*)aKey{
    [EncryptedNSUserDefaults setObject:[ [NSKeyedArchiver archivedDataWithRootObject:aDictionary]  EncryptAES]
                              forKey:aKey];
}
+(void)setMutableDictionary:(NSMutableDictionary*)aDictionary forKey:(NSString*)aKey{
    [EncryptedNSUserDefaults setObject:[ [NSKeyedArchiver archivedDataWithRootObject:[NSDictionary dictionaryWithDictionary:aDictionary]]  EncryptAES]
                              forKey:aKey];
}



@end


@implementation NSData(AES)

- (NSData *) EncryptAES {
    char keyPtr[kCCKeySizeAES256+1];
    bzero( keyPtr, sizeof(keyPtr) );
    
    [_key getCString: keyPtr maxLength: sizeof(keyPtr) encoding: NSUTF16StringEncoding];
    size_t numBytesEncrypted = 0;
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    CCCryptorStatus result = CCCrypt( kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                     keyPtr, kCCKeySizeAES256,
                                     NULL,
                                     [self bytes], [self length],
                                     buffer, bufferSize,
                                     &numBytesEncrypted );
    
    if( result == kCCSuccess )
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    free(buffer);
    return nil;
}

- (NSData *) DecryptAES {
    
    char  keyPtr[kCCKeySizeAES256+1];
    bzero( keyPtr, sizeof(keyPtr) );
    
    [_key getCString: keyPtr maxLength: sizeof(keyPtr) encoding: NSUTF16StringEncoding];
    
    size_t numBytesEncrypted = 0;
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer_decrypt = malloc(bufferSize);
    
    CCCryptorStatus result = CCCrypt( kCCDecrypt , kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                     keyPtr, kCCKeySizeAES256,
                                     NULL,
                                     [self bytes], [self length],
                                     buffer_decrypt, bufferSize,
                                     &numBytesEncrypted );
    
    if( result == kCCSuccess )
        return [NSData dataWithBytesNoCopy:buffer_decrypt length:numBytesEncrypted];
    free(buffer_decrypt);
    return nil;
}

@end