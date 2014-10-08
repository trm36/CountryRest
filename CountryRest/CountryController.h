//
//  CountryController.h
//  CountryRest
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryController : NSObject

+ (CountryController *)sharedInstance;

- (void)getCountriesWithName:(NSString *)name withCompletion:(void (^)(NSArray *))completion;

@end
