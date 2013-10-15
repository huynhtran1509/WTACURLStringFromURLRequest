//
//  WTACURLStringFromURLRequest.h
//
//  Created by Andrew Carter on 10/15/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef WTACURLStringFromURLRequest_h
#define WTACURLStringFromURLRequest_h

typedef NS_ENUM(NSUInteger, WTACURLStringHTTPVersion)
{
    WTACURLStringHTTPVersionDefault,
    WTACURLStringHTTPVersion1_0, // -0, --http1.0
    WTACURLStringHTTPVersion1_1, // --http1.1
    WTACURLStringHTTPVersion2_0, // --http2.0
};

typedef NS_ENUM(NSUInteger, WTACURLStringSSLOption)
{
    WTACURLStringSSLOptionDefault,
    WTACURLStringSSLOptionTLSv1, // -1, --tlsv1
    WTACURLStringSSLOptionSSLv2, // -2, --sslv2
    WTACURLStringSSLOptionSSLv3, // -3, sslv3
};

typedef NS_ENUM(NSUInteger, WTACURLStringIPVersion)
{
    WTACURLStringIPVersionDefault,
    WTACURLStringIPVersionIPv4, // -4, --ipv4
    WTACURLStringIPVersionIPv6, // -6, --ipv6
};

typedef struct
{
    BOOL shortOptions;
    BOOL simpleProgressBar; // -#, --progress-bar
    WTACURLStringHTTPVersion httpVersion;
    WTACURLStringSSLOption sslOption;
    WTACURLStringIPVersion IPVersion;
    char * userAgent; // -A, --user-agent * If this is set in the request's headers, only one (last specified) will be used.
    BOOL ASCII; // -B, --use-ascii
    char * cookieJarFile; // -c, --cookie-jar
    BOOL compressed; // --compressed
    NSTimeInterval connectTimeout; // --connect-timeout * If this is > 0 it will override the timeoutInterval of the request
    char * dumpHeaderFile; // -D, --dump-header
    BOOL insecure; // -k, --insecure
    BOOL includeHeader; // -i, --include
} WTACURLStringOptions;

static const WTACURLStringOptions WTACURLStringDefaultOptions = {};

FOUNDATION_EXPORT NSString * WTACURLStringFromURLRequest(NSURLRequest *request, WTACURLStringOptions options);
FOUNDATION_EXPORT NSString * WTADefaultCURLStringFromURLRequest(NSURLRequest *request);

#endif
