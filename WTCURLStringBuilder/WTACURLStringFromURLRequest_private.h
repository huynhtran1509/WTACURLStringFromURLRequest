//
//  WTACURLStringFromURLRequest_private.h
//  WTCURLStringBuilder
//
//  Created by Andrew Carter on 10/15/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef WTCURLStringBuilder_WTACURLStringFromURLRequest_private_h
#define WTCURLStringBuilder_WTACURLStringFromURLRequest_private_h

FOUNDATION_EXPORT void WTACURLStringAppendURL(NSURLRequest *request, NSMutableString *string);
FOUNDATION_EXPORT void WTACURLStringAppendSimpleProgressBar(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendHTTPVersion(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendSSLOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendIPOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendUserAgent(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendASCIIOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendCompressedOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendConnectTimeoutOption(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendCookieJarOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendDumpHeaderOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendInsecureOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendIncludeHeaderOption(NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendHTTPMethod(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendHTTPBody(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options);
FOUNDATION_EXPORT void WTACURLStringAppendHTTPHeaders(NSURLRequest *request, NSMutableString *string, WTACURLStringOptions options);

#endif
