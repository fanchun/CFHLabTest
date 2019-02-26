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

- (void)testOperand1Slider {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"\u52a0\u6cd5\u8a08\u7b97\u5668"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeSlider] matchingIdentifier:@"50%"] elementBoundByIndex:0] pressForDuration:3.2];
    /*@START_MENU_TOKEN@*/[app.sliders[@"50%"] pressForDuration:3.2];/*[["app.sliders[@\"50%\"]","["," tap];"," pressForDuration:3.2];"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/
    
}

@end
