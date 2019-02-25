//
//  CFHLabTestTests.m
//  CFHLabTestTests
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CFHMainViewController.h"

@interface CFHLabTestTests : XCTestCase

@property (strong, nonatomic) CFHMainViewController *mainVC;

@end

@implementation CFHLabTestTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
    NSLog(@"setUp...");
    self.mainVC = [[CFHMainViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"tearDown...");
}

- (void)testExample {
    int a = 3;
    XCTAssertFalse(a == 0, @"a can not be zero");
}

@end
