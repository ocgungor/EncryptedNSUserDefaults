//
//  ViewController.m
//  EncryptedNSUserDefaults
//
//  Created by Oguzhan Gungor on 1/04/13.
//  Copyright (c) 2013 Aslan-Apps. All rights reserved.
//

#import "ViewController.h"
#import "EncryptedNSUserDefaults.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [EncryptedNSUserDefaults setString:@"OCG" forKey:@"string"];
    [EncryptedNSUserDefaults setInteger:100 forKey:@"int"];
    [EncryptedNSUserDefaults setBool:YES forKey:@"bool"];
    
    NSArray * arr = @[@"obj 1", @"obj 2"];
    [EncryptedNSUserDefaults setArray:arr forKey:@"array"];
    
    NSMutableArray *arr2 = [[NSMutableArray alloc] initWithObjects:@"1", @"2", nil];
    [EncryptedNSUserDefaults setMutableArray:arr2 forKey:@"mutableArr"];
    
    NSDictionary *dic = @{@"key1": @"obj1", @"key2": @"obj2"};
    [EncryptedNSUserDefaults setDictionary:dic forKey:@"dict"];
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] initWithObjects:arr forKeys:[NSArray arrayWithArray:arr2]];
    [EncryptedNSUserDefaults setDictionary:mutableDic forKey:@"mutableDic"];
    
    
    NSLog(@"now retrieve string : :%@",  [EncryptedNSUserDefaults stringForKey:@"string"]);
    NSLog(@"now retrieve integer : :%ld",  (long)[EncryptedNSUserDefaults integerForKey:@"int"]);
    NSLog(@"now retrieve bool :  %@",  ([EncryptedNSUserDefaults boolForKey:@"bool"]) ? @"YES" : @"NO");
    NSLog(@"now retrieve array :  %@",  [EncryptedNSUserDefaults arrayForKey:@"array"]);
    NSLog(@"now retrieve mutable array :  %@",  [EncryptedNSUserDefaults mutableArrayForKey:@"mutableArr"]);
    NSLog(@"now retrieve dictionary :  %@",  [EncryptedNSUserDefaults dictionaryForKey:@"dict"]);
    NSLog(@"now retrieve mutable dictionary :  %@",  [EncryptedNSUserDefaults mutableDictionaryForKey:@"mutableDic"]);
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
