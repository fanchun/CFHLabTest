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
    self.mainVC.view; // 載入畫面的元件和方法
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
    [self.mainVC updateLabelsWithOperand1Value:12 operand2Value:10 result:22];
    XCTAssertEqualObjects(self.mainVC.mOperand1Label.text, @"12", @"Operand1Label displays wrong value!");
    XCTAssertEqualObjects(self.mainVC.mOperand2Label.text, @"10", @"Operand2Label displays wrong value!");
    XCTAssertEqualObjects(self.mainVC.mResultLabel.text, @"計算結果: 22", @"ResultLabel displays wrong value!");
}

- (void)testResetSettings {
    [self.mainVC resetSettings];
    // Operand1
    XCTAssertEqual(self.mainVC.mOperand1Slider.value, 0, @"Operand1 Slider's value not reset!");
    XCTAssertEqualObjects(self.mainVC.mOperand1Label.text, @"0", @"Operand1 Label test not reset!");
    // Operand2
    XCTAssertEqual(self.mainVC.mOperand2Slider.value, 0, @"Operand2 Slider's value not reset!");
    XCTAssertEqualObjects(self.mainVC.mOperand2Label.text, @"0", @"Operand2 Label test not reset!");
}

- (void)testLoginVerification {
    [self measureBlock:^{
        for (NSInteger pwd1 = CFHMainVCSliderMinimumVlaue; pwd1 <= CFHMainVCSliderMaximumValue; pwd1++) {
            for (NSInteger pwd2 = CFHMainVCSliderMinimumVlaue; pwd2 <= CFHMainVCSliderMaximumValue; pwd2 ++) {
                BOOL passVerification = [self.mainVC loginVerificationWithPWD1:pwd1 andPWD2:pwd2];
                if (pwd1 == CFHMainVCUserPWD1 && pwd2 == CFHMainVCUserPWD2) {
                    XCTAssertTrue(passVerification);
                }
                else {
                    XCTAssertFalse(passVerification, @"pwd: %ld & pwd: %ld: 成功解鎖!", pwd1, pwd2);
                }
            }
        }
    }];
}

@end
