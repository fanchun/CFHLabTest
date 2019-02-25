//
//  CFHMainViewControllerTests.m
//  CFHLabTestTests
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CFHMainViewController.h"

@interface CFHMainViewControllerTests : XCTestCase

@property (strong, nonatomic) CFHMainViewController *mainVC;

@end

@implementation CFHMainViewControllerTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
    NSLog(@"[%@] setUp...", NSStringFromClass(self.class));
    self.mainVC = [[CFHMainViewController alloc] initWithNibName:NSStringFromClass([CFHMainViewController class]) bundle:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"[%@] tearDown", NSStringFromClass(self.class));
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
