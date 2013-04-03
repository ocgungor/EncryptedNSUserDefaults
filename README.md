EncryptedNSUserDefaults
=======================

EncryptedNSUserDefaults provides more security to default NSUserDefaults. Both ***ARC*** and ***MRC*** supported. Please **do not** use EncryptedNSUserDefaults to save vital information like user passwords. You should use Keychain Access instead.

At the moment the following types are supported:

NSString, 
NSData,
NSMutableData,
NSInteger,
NSArray,
NSMutableArray,
NSDictionary,
NSMutableDictionary,
BOOL,
double,
float,
int


Usage
=======================
Add  EncryptedNSUserDefaults.h and  EncryptedNSUserDefaultst.m files into your project and simply import EncryptedNSUserDefaults.h.

**Setting a key for decryption/encryption**
 
 It is recommended that you set a decryption/encryption key in your `-didFinishLaunchingWithOptions` method.
 ```
[EncryptedNSUserDefaults setKey:@"mySpecialKey"];
```

**Saving data**
```
    [EncryptedNSUserDefaults setString:@"OCG" forKey:@"string"];
    [EncryptedNSUserDefaults setInteger:100 forKey:@"int"];
    [EncryptedNSUserDefaults setBool:YES forKey:@"bool"];
```
**Retrieving data**
```
	NSString *str = [EncryptedNSUserDefaults stringForKey:@"string"];
    NSInteger int = [EncryptedNSUserDefaults integerForKey:@"int"];
    BOOL bool = [EncryptedNSUserDefaults boolForKey:@"bool"];
```

For more examples, check out the example project.




ToDo
=======================
Generating device specific keys so it will be useless if someone shares your .plist file.


Copyright
=======================
This project is based on Stephen [sdarlington](https://github.com/sdarlington "sdarlington") Darlington's  [SDCloudUserDefaults](https://github.com/sdarlington/SDCloudUserDefaults "SDCloudUserDefaults") project yet it does not support iClouds but it's coming soon. 

```
/*
 * EncryptedNSUserDefaults
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

```