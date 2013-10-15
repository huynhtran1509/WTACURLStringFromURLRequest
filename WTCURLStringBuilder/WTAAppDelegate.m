//
//  WTAAppDelegate.m
//  WTCURLStringBuilder
//
//  Created by Andrew Carter on 10/15/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import "WTAAppDelegate.h"

#import "WTACURLStringFromURLRequest.h"

@implementation WTAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSString *urlString = @"https://www.google.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:50.0f];
    
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    options.simpleProgressBar = YES;
    options.connectTimeout = 100.0f;
    options.shortOptions = YES;
    options.dumpHeaderFile = "header";
    options.cookieJarFile = "cookies";
    options.insecure = YES;
    
    NSLog(@"%@", WTACURLStringFromURLRequest(request, options));
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
