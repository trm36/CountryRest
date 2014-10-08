//
//  NetworkController.m
//  
//
//  Created by Taylor Mott on 10.7.14.
//
//

#import "NetworkController.h"


@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://restcountries.eu/rest/v1/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    return api;
}

@end
