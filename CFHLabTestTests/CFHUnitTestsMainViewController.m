//
//  CFHUnitTestsMainViewController.m
//  CFHLabTestTests
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CFHMainViewController.h"

@interface CFHUnitTestsMainViewController : XCTestCase

@property (strong, nonatomic) CFHMainViewController *mainVC;

@end

@implementation CFHUnitTestsMainViewController

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
    XCTAssertEqual(result, 8, @"The result of add calculation is wrong!");
}

- (void)testUpdateLabels {
    UIView *view = self.mainVC.view; // 載入畫面的元件和方法
    [self.mainVC updateLabelsWithOperand1Value:12 operand2Value:10 result:22];
    XCTAssertEqualObjects(self.mainVC.mOperand1Label.text, @"12", @"Operand1Label displays wrong value!");
    XCTAssertEqualObjects(self.mainVC.mOperand2Label.text, @"10", @"Operand2Label displays wrong value!");
    XCTAssertEqualObjects(self.mainVC.mResultLabel.text, @"計算結果: 22", @"ResultLabel displays wrong value!");
}

@end
