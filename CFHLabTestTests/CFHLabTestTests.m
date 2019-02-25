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
    [super setUp];
    NSLog(@"setUp...");
    self.mainVC = [[CFHMainViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
    NSLog(@"tearDown...");
}

- (void)testAdd {
    NSInteger result = [self.mainVC addOperandValue1:3 andOperandValue2:5];
    XCTAssert(result == 8);
}

- (void)testUpdateLabels {
    UIView *view = self.mainVC.view; // 載入畫面的元件和方法
    [self.mainVC updateLabelsWithOperand1Value:12 operand2Value:10 result:22];
    XCTAssert([self.mainVC.mOperand1Label.text isEqualToString:@"12"], @"operantLabel1 display error!");
    XCTAssert([self.mainVC.mOperand2Label.text isEqualToString:@"10"], @"operantLabel2 display error!");
    XCTAssert([self.mainVC.mResultLabel.text isEqualToString:@"計算結果: 22"], @"resultLabel display error!");
}

@end
