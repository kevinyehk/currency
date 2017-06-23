//
//  GetCurrency.m
//  Currency
//
//  Created by 葉立誠 on 21/06/2017.
//  Copyright © 2017 葉立誠. All rights reserved.
//

#include "GetCurrency.h"

@implementation getCurrency

- (id)init {
    self = [super init];
    
    self.currencyName = @{@"美金":@"USD", @"日幣":@"JPY", @"歐元":@"EUR", @"人民幣":@"CNY", @"港幣":@"HKD"};
    return self;
}
- (NSDictionary *)currencyTW {
    
    __block  NSDictionary *dict;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://asper-bot-rates.appspot.com/currency.json"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        dispatch_semaphore_signal(semaphore);
     
    }];
    
    [dataTask resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"%ld",[dict[@"rates"] count]);
    return dict;
}

-(void)doSomething {
    NSLog(@"finish");
}
@end
