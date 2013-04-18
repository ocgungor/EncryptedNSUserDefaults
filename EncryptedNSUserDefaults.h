/*
 * EncryptedNSUserDefaults.h
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

#import <Foundation/Foundation.h>

@interface EncryptedNSUserDefaults : NSUserDefaults

+ (void) setKey:(NSString *)key;

+(NSString*)stringForKey:(NSString*)aKey;
+(NSMutableString*)mutableStringForKey:(NSString*)aKey;
+(BOOL)boolForKey:(NSString*)aKey;
+(id)objectForKey:(NSString*)aKey;
+(NSInteger)integerForKey:(NSString*)aKey;
+(double)doubleForKey:(NSString*)aKey;
+(float)floatForKey:(NSString*)aKey;
+(int)intForKey:(NSString*)aKey;
+(NSData*)dataForKey:(NSString*)aKey;
+(NSMutableData*)mutableDataForKey:(NSString*)aKey;
+(NSArray*)arrayForKey:(NSString*)aKey;
+(NSMutableArray*)mutableArrayForKey:(NSString*)aKey;
+(NSDictionary*)dictionaryForKey:(NSString*)aKey;
+(NSMutableDictionary*)mutableDictionaryForKey:(NSString*)aKey;

+(void)setString:(NSString*)aString forKey:(NSString*)aKey;
+(void)setMutableString:(NSMutableString*)aString forKey:(NSString*)aKey;
+(void)setBool:(BOOL)aBool forKey:(NSString*)aKey;
+(void)setObject:(id)anObject forKey:(NSString*)aKey;
+(void)setData:(NSData*)aData forKey:(NSString*)aKey;
+(void)setMutableData:(NSMutableData*)aData forKey:(NSString*)aKey;
+(void)setInteger:(NSInteger)anInteger forKey:(NSString*)aKey;
+(void)setDouble:(double)aDouble forKey:(NSString*)aKey;
+(void)setFloat:(float)aFloat forKey:(NSString*)aKey;
+(void)setInt:(int)anInt forKey:(NSString*)aKey ;
+(void)setArray:(NSArray*)anArray forKey:(NSString*)aKey;
+(void)setMutableArray:(NSMutableArray*)anArray forKey:(NSString*)aKey;
+(void)setDictionary:(NSDictionary*)aDictionary forKey:(NSString*)aKey;
+(void)setMutableDictionary:(NSMutableDictionary*)aDictionary forKey:(NSString*)aKey;


@end


@interface NSData (AES)

- (NSData *) EncryptAES;
- (NSData *) DecryptAES;

@end