//
//  CFHUITestsMainViewController.m
//  CFHLabTestUITests
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CFHUITestsMainViewController : XCTestCase

@end

@implementation CFHUITestsMainViewController

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testLoginFail {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.sliders[@"operand1Slider"] adjustToNormalizedSliderPosition:0.2];
    [app.sliders[@"operand2Slider"] adjustToNormalizedSliderPosition:0.9];
    sleep(1);
    [app.buttons[@"login"] tap];
    XCTAssert(app.alerts.staticTexts[@"Wrong Password!"].exists);
    [app.alerts.buttons[@"Confirm"] tap];
}

- (void)testLoginSuccess {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.sliders[@"operand1Slider"] adjustToNormalizedSliderPosition:0.3];
    [app.sliders[@"operand2Slider"] adjustToNormalizedSliderPosition:0.5];
    sleep(1);
    [app.buttons[@"login"] tap];
    XCTAssert(app.navigationBars[@"簽到"].exists, @"Do not enter to login success screen");
    [app.navigationBars[@"簽到"].buttons[@"登入"] tap];
    XCTAssert(app.navigationBars[@"登入"].exists, @"Do not go back to Login screen.");
}

@end
