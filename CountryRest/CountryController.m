//
//  CountryController.m
//  CountryRest
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CountryController.h"
#import "NetworkController.h"

@implementation CountryController

+ (CountryController *)sharedInstance {
    static CountryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CountryController new];
    });
    return sharedInstance;
}

- (void)getCountriesWithName:(NSString *)name withCompletion:(void (^)(NSArray *))completion
{
    NSString *path = [NSString stringWithFormat:@"name/%@", name];
    [[NetworkController api] GET:path parameters:nil success:
     ^(NSURLSessionDataTask *task, id responseObject)
        {
            completion(responseObject);
        }
                         failure:
     ^(NSURLSessionDataTask *task, NSError *error)
        {
            NSLog(@"ERROR: %@", error);
            completion(nil);
        }
    ];
}

@end
