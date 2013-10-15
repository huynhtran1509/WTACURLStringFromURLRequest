//
//  WTACURLStringFromURLRequest.m
//
//  Created by Andrew Carter on 10/15/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import "WTACURLStringFromURLRequest.h"

void WTACURLStringAppendURL(NSURLRequest *request, NSMutableString *string)
{
    [string appendFormat:@"\"%@\" ", [[request URL] absoluteString]];
}

void WTACURLStringAppendSimpleProgressBar(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.simpleProgressBar)
    {
        [string appendString:options.shortOptions ? @"-# " : @"--progress-bar "];
    }
}

void WTACURLStringAppendHTTPVersion(NSMutableString *string, WTACURLStringOptions options)
{
    NSString *optionString;
    switch (options.httpVersion)
    {
        case WTACURLStringHTTPVersionDefault:
            break;
            
        case WTACURLStringHTTPVersion1_0:
            optionString = options.shortOptions ? @"-0 " : @"--http1.0 ";
            break;
            
        case WTACURLStringHTTPVersion1_1:
            optionString = @"--http1.1 ";
            break;
            
        case WTACURLStringHTTPVersion2_0:
            optionString = @"--http2.0 ";
            break;
    }
    if (optionString)
    {
        [string appendString:optionString];
    }
}

void WTACURLStringAppendSSLOption(NSMutableString *string, WTACURLStringOptions options)
{
    NSString *optionString;
    switch (options.sslOption)
    {
        case WTACURLStringSSLOptionDefault:
            break;
            
        case WTACURLStringSSLOptionTLSv1:
            optionString = options.shortOptions ? @"-1 " : @"--tlsv1 ";
            break;
            
        case WTACURLStringSSLOptionSSLv2:
            optionString = options.shortOptions ? @"-2 " : @"--sslv2 ";
            break;
            
        case WTACURLStringSSLOptionSSLv3:
            optionString = options.shortOptions ? @"-3 " : @"--sslv3 ";
            break;
    }
    if (optionString)
    {
        [string appendString:optionString];
    }
}

void WTACURLStringAppendIPOption(NSMutableString *string, WTACURLStringOptions options)
{
    NSString *optionString;
    switch (options.IPVersion)
    {
        case WTACURLStringIPVersionDefault:
            break;
            
        case WTACURLStringIPVersionIPv4:
            optionString = options.shortOptions ? @"-4 " : @"--ipv4 ";
            break;
            
        case WTACURLStringIPVersionIPv6:
            optionString = options.shortOptions ? @"-6 " : @"--ipv6 ";
            break;
    }
    if (optionString)
    {
        [string appendString:optionString];
    }
}

void WTACURLStringAppendUserAgent(NSMutableString *string, WTACURLStringOptions options)
{
    NSString *optionString;
    if (options.userAgent != NULL)
    {
        optionString = [[NSString alloc] initWithFormat:@"%@ \"%@\" ",
                        (options.shortOptions ? @"-A" : @"--user-agent"),
                        [[NSString alloc] initWithCString:options.userAgent encoding:NSUTF8StringEncoding]];
    }
    if (optionString)
    {
        [string appendString:optionString];
    }
}

void WTACURLStringAppendASCIIOption(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.ASCII)
    {
        [string appendFormat:@"%@ ", options.shortOptions ? @"-B" : @"--ASCII"];
    }
}

void WTACURLStringAppendCompressedOption(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.compressed)
    {
        [string appendString:@"--compressed "];
    }
}

void WTACURLStringAppendConnectTimeoutOption(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options)
{
    NSString *optionString;
    if (options.connectTimeout)
    {
        optionString = [[NSString alloc] initWithFormat:@"--connect-timeout %ld ", (long)options.connectTimeout];
    }
    else if ([request timeoutInterval])
    {
        optionString = [[NSString alloc] initWithFormat:@"--connect-timeout %ld ", (long)[request timeoutInterval]];
    }
    if (optionString)
    {
        [string appendString:optionString];
    }
}

void WTACURLStringAppendCookieJarOption(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.cookieJarFile != NULL)
    {
        [string appendFormat:@"%@ \"%@\" ",
         options.shortOptions ? @"-c" : @"--cookie-jar",
         [[NSString alloc] initWithCString:options.cookieJarFile encoding:NSUTF8StringEncoding]];
    }
}

void WTACURLStringAppendDumpHeaderOption(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.dumpHeaderFile != NULL)
    {
        [string appendFormat:@"%@ \"%@\" ",
         options.shortOptions ? @"-D" : @"--dump-header",
         [[NSString alloc] initWithCString:options.dumpHeaderFile encoding:NSUTF8StringEncoding]];
    }
}

void WTACURLStringAppendInsecureOption(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.insecure)
    {
        [string appendFormat:@"%@ ", options.shortOptions ? @"-k" : @"--insecure"];
    }
}

void WTACURLStringAppendIncludeHeaderOption(NSMutableString *string, WTACURLStringOptions options)
{
    if (options.includeHeader)
    {
        [string appendFormat:@"%@ ", options.shortOptions ? @"-i" : @"--include"];
    }
}

void WTACURLStringAppendHTTPMethod(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options)
{
    [string appendFormat:@"%@ %@ ", options.shortOptions ? @"-X" : @"--request", [request HTTPMethod]];
}

void WTACURLStringAppendHTTPBody(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options)
{
    if ([request HTTPBody])
    {
        [string appendFormat:@"%@ \"%@\" ",
         options.shortOptions ? @"-d" : @"--data",
         [[NSString alloc] initWithData:[request HTTPBody] encoding:NSUTF8StringEncoding]];
    }
}

void WTACURLStringAppendHTTPHeaders(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options)
{
    for (NSString *headerKey in [[request allHTTPHeaderFields] allKeys])
    {
        NSString *value = [request allHTTPHeaderFields][headerKey];
        [string appendFormat:@"-H \"%@\":\"%@\" ", headerKey, value];
    }
}

NSString * WTACURLStringFromURLRequest(NSURLRequest *request, WTACURLStringOptions options)
{
    NSMutableString *string = [[NSMutableString alloc] initWithString:@"curl "];
    
    WTACURLStringAppendSimpleProgressBar(string, options);
    WTACURLStringAppendHTTPVersion(string, options);
    WTACURLStringAppendSSLOption(string, options);
    WTACURLStringAppendIPOption(string, options);
    WTACURLStringAppendUserAgent(string, options);
    WTACURLStringAppendASCIIOption(string, options);
    WTACURLStringAppendCompressedOption(string, options);
    WTACURLStringAppendConnectTimeoutOption(request, string, options);
    WTACURLStringAppendCookieJarOption(string, options);
    WTACURLStringAppendDumpHeaderOption(string, options);
    WTACURLStringAppendInsecureOption(string, options);
    WTACURLStringAppendIncludeHeaderOption(string, options);
    WTACURLStringAppendHTTPMethod(request, string, options);
    WTACURLStringAppendHTTPBody(request, string, options);
    WTACURLStringAppendHTTPHeaders(request, string, options);
    WTACURLStringAppendURL(request, string);
    
    return [NSString stringWithString:string];
}

NSString * WTADefaultCURLStringFromURLRequest(NSURLRequest *request)
{
    return WTACURLStringFromURLRequest(request, WTACURLStringDefaultOptions);
}