//
//  WTCURLStringBuilderTests.m
//  WTCURLStringBuilderTests
//
//  Created by Andrew Carter on 10/15/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "WTACURLStringFromURLRequest.h"
#import "WTACURLStringFromURLRequest_private.h"

@interface WTCURLStringBuilderTests : XCTestCase

@end

@implementation WTCURLStringBuilderTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (NSMutableURLRequest *)requestForURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    return request;
}

- (void)testDefaultOptions
{
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    WTACURLStringOptions initializedOptions = {};
    XCTAssertEqual(options, initializedOptions);
}

- (void)testAppendURL
{
    NSURLRequest *request = [self requestForURLString:@"http://www.google.com"];
    NSMutableString *string = [NSMutableString new];
    WTACURLStringAppendURL(request, string);
    XCTAssert([string rangeOfString:@"\"http://www.google.com\""].location != NSNotFound, @"String should be included in string in qoutes.");
}

- (void)testProgressBar
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.simpleProgressBar = YES;
    WTACURLStringAppendSimpleProgressBar(string, options);
    XCTAssert([string rangeOfString:@"--progress-bar"].location != NSNotFound, @"String should include --progress-bar with default options.");
    
    options.shortOptions = YES;
    [string setString:@""];
    WTACURLStringAppendSimpleProgressBar(string, options);
    XCTAssert([string rangeOfString:@"-#"].location != NSNotFound, @"String should include -# with short option.");
}

- (void)testHTTPVersion
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.httpVersion = WTACURLStringHTTPVersionDefault;
    WTACURLStringAppendHTTPVersion(string, options);
    XCTAssert([string length] == 0, @"String should be empty if HTTP version is not specified");
    
    options.httpVersion = WTACURLStringHTTPVersion1_0;
    WTACURLStringAppendHTTPVersion(string, options);
    XCTAssert([string rangeOfString:@"--http1.0"].location != NSNotFound, @"String should include --http1.0");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendHTTPVersion(string, options);
    XCTAssert([string rangeOfString:@"-0"].location != NSNotFound, @"String should include -0 with short options on");
    [string setString:@""];
    options.shortOptions = NO;
    
    options.httpVersion = WTACURLStringHTTPVersion1_1;
    WTACURLStringAppendHTTPVersion(string, options);
    XCTAssert([string rangeOfString:@"--http1.1"].location != NSNotFound, @"String should include --http1.1");
    [string setString:@""];
    
    options.httpVersion = WTACURLStringHTTPVersion2_0;
    WTACURLStringAppendHTTPVersion(string, options);
    XCTAssert([string rangeOfString:@"--http2.0"].location != NSNotFound, @"String should include --http2.0");
    [string setString:@""];
}

- (void)testSSL
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.sslOption = WTACURLStringSSLOptionDefault;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string length] == 0, @"String should be empty with default options");
    
    options.sslOption = WTACURLStringSSLOptionTLSv1;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string rangeOfString:@"--tlsv1"].location != NSNotFound, @"string should include --tlsv1");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string rangeOfString:@"-1"].location != NSNotFound, @"string should include -1 with short options on");
    [string setString:@""];
    options.shortOptions = NO;
    
    options.sslOption = WTACURLStringSSLOptionSSLv2;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string rangeOfString:@"--sslv2"].location != NSNotFound, @"string should include --sslv2");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string rangeOfString:@"-2"].location != NSNotFound, @"string should include -2 with short options on");
    [string setString:@""];
    options.shortOptions = NO;
    
    options.sslOption = WTACURLStringSSLOptionSSLv3;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string rangeOfString:@"--sslv3"].location != NSNotFound, @"string should include --sslv3");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendSSLOption(string, options);
    XCTAssert([string rangeOfString:@"-3"].location != NSNotFound, @"string should include -3 with short options on");
    [string setString:@""];
    options.shortOptions = NO;
}

- (void)testIP
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.IPVersion = WTACURLStringIPVersionDefault;
    WTACURLStringAppendIPOption(string, options);
    XCTAssert([string length] == 0, @"String should be empty with default options");
    
    options.IPVersion = WTACURLStringIPVersionIPv4;
    WTACURLStringAppendIPOption(string, options);
    XCTAssert([string rangeOfString:@"--ipv4"].location != NSNotFound, @"string should include --ipv4");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendIPOption(string, options);
    XCTAssert([string rangeOfString:@"-4"].location != NSNotFound, @"string should include -4 with short options on");
    [string setString:@""];
    options.shortOptions = NO;
    
    options.IPVersion = WTACURLStringIPVersionIPv6;
    WTACURLStringAppendIPOption(string, options);
    XCTAssert([string rangeOfString:@"--ipv6"].location != NSNotFound, @"string should include --ipv6");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendIPOption(string, options);
    XCTAssert([string rangeOfString:@"-6"].location != NSNotFound, @"string should include -6 with short options on");
    [string setString:@""];
    options.shortOptions = NO;
}

- (void)testUserAgent
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.userAgent = "Test";
    WTACURLStringAppendUserAgent(string, options);
    XCTAssert([string rangeOfString:@"--user-agent \"Test\""].location != NSNotFound, @"string should include --user-agent \"Test\"");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendUserAgent(string, options);
    XCTAssert([string rangeOfString:@"-A \"Test\""].location != NSNotFound, @"string should include -A \"Test\"");
}

- (void)testASCII
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.ASCII = YES;
    WTACURLStringAppendASCIIOption(string, options);
    XCTAssert([string rangeOfString:@"--ASCII"].location != NSNotFound, @"string should include --ASCII");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendASCIIOption(string, options);
    XCTAssert([string rangeOfString:@"-B"].location != NSNotFound, @"string should include -B with short options enabled.");
}

- (void)testCompressed
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.compressed = YES;
    WTACURLStringAppendCompressedOption(string, options);
    XCTAssert([string rangeOfString:@"--compressed"].location != NSNotFound, @"string should include --compressed");
    [string setString:@""];
}

- (void)testTimeOut
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    NSMutableURLRequest *request = [self requestForURLString:@"http://www.google.com"];
    [request setTimeoutInterval:10.0f];
    
    WTACURLStringAppendConnectTimeoutOption(request, string, options);
    XCTAssert([string rangeOfString:@"10"].location != NSNotFound, @"String should contain 10 if timeout specified in request but not options");
    [string setString:@""];
    
    options.connectTimeout = 20.0f;
    WTACURLStringAppendConnectTimeoutOption(request, string, options);
    XCTAssert([string rangeOfString:@"20"].location != NSNotFound, @"String should contain 20 if timeout specified in options");
}

- (void)testCookieJar
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.cookieJarFile = "filename";
    WTACURLStringAppendCookieJarOption(string, options);
    XCTAssert([string rangeOfString:@"--cookie-jar \"filename\""].location != NSNotFound, @"String should contain --cookie-jar \"filename\"");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendCookieJarOption(string, options);
    XCTAssert([string rangeOfString:@"-c \"filename\""].location != NSNotFound, @"String should contain -c \"filename\" with short options on");
}

- (void)testDumpHeader
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.dumpHeaderFile = "filename";
    WTACURLStringAppendDumpHeaderOption(string, options);
    XCTAssert([string rangeOfString:@"--dump-header \"filename\""].location != NSNotFound, @"String should contain --dump-header \"filename\"");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendDumpHeaderOption(string, options);
    XCTAssert([string rangeOfString:@"-D \"filename\""].location != NSNotFound, @"String should contain -D \"filename\" with short options on");
}

- (void)testInsecure
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.insecure = YES;
    WTACURLStringAppendInsecureOption(string, options);
    XCTAssert([string rangeOfString:@"--insecure"].location != NSNotFound, @"String should contain --insecure");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendInsecureOption(string, options);
    XCTAssert([string rangeOfString:@"-k"].location != NSNotFound, @"String should contain -k with short options on");
    [string setString:@""];
}

- (void)testIncludeHeader
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    
    options.includeHeader = YES;
    WTACURLStringAppendIncludeHeaderOption(string, options);
    XCTAssert([string rangeOfString:@"--include"].location != NSNotFound, @"String should contain --include");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendIncludeHeaderOption(string, options);
    XCTAssert([string rangeOfString:@"-i"].location != NSNotFound, @"String should contain -i with short options on");
    [string setString:@""];
}

- (void)testHTTPMethod
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    NSMutableURLRequest *request = [self requestForURLString:@"http://www.google.com"];
    
    WTACURLStringAppendHTTPMethod(request, string, options);
    XCTAssert([string rangeOfString:@"--request GET"].location != NSNotFound, @"String should contain --request GET");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendHTTPMethod(request, string, options);
    XCTAssert([string rangeOfString:@"-X GET"].location != NSNotFound, @"String should contain -X GET with short options on");
}

- (void)testHTTPBody
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    NSMutableURLRequest *request = [self requestForURLString:@"http://www.google.com"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[@"test" dataUsingEncoding:NSUTF8StringEncoding]];
    
    WTACURLStringAppendHTTPBody(request, string, options);
    XCTAssert([string rangeOfString:@"--data \"test\""].location != NSNotFound, @"String should contain --data \"test\"");
    [string setString:@""];
    
    options.shortOptions = YES;
    WTACURLStringAppendHTTPBody(request, string, options);
    XCTAssert([string rangeOfString:@"-d \"test\""].location != NSNotFound, @"String should contain -d \"test\" with short options on");
}

- (void)testHTTPHeaders
{
    NSMutableString *string = [NSMutableString new];
    WTACURLStringOptions options = WTACURLStringDefaultOptions;
    NSMutableURLRequest *request = [self requestForURLString:@"http://www.google.com"];
    [request setValue:@"value" forHTTPHeaderField:@"key"];
    
    WTACURLStringAppendHTTPHeaders(request, string, options);
    XCTAssert([string rangeOfString:@"-H \"key\":\"value\""].location != NSNotFound, @"String should contain -H \"key\":\"value\"");
}

@end
