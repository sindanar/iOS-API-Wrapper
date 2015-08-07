//
//  NSString+AWUtils.m
//  
//
//  Created by Alexander Kozin on 13.07.15.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NSString+AWUtils.h"

@interface NSString_AWUtilsTests : XCTestCase

@end

@implementation NSString_AWUtilsTests

- (void)test
{
    XCTAssertTrue([[@"foobar" backendKeyFromPropertyName] isEqualToString:@"foobar"],
                  @"%@ != %@", [@"foobar" backendKeyFromPropertyName], @"foobar");

    XCTAssertTrue([[@"FOOBAR" backendKeyFromPropertyName] isEqualToString:@"foobar"],
                  @"%@ != %@", [@"FOOBAR" backendKeyFromPropertyName], @"foobar");

    XCTAssertTrue([[@"FOoBar" backendKeyFromPropertyName] isEqualToString:@"foo_bar"],
                  @"%@ != %@", [@"FOoBar" backendKeyFromPropertyName], @"foo_bar");

    XCTAssertTrue([[@"fooBAr" backendKeyFromPropertyName] isEqualToString:@"foo_bar"],
                  @"%@ != %@", [@"fooBAr" backendKeyFromPropertyName], @"foo_bar");

    XCTAssertTrue([[@"fooBar" backendKeyFromPropertyName] isEqualToString:@"foo_bar"],
                  @"%@ != %@", [@"fooBar" backendKeyFromPropertyName], @"foo_bar");
}

@end
