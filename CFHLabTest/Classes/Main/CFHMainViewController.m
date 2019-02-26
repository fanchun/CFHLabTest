//
//  CFHMainViewController.m
//  CFHLabTest
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import "CFHMainViewController.h"
#import "CFHSecondViewController.h"

@interface CFHMainViewController ()

@end

@implementation CFHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登入";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self resetSettings];
}

#pragma mark - Override

#pragma mark - Delegate

#pragma mark - DataSource methods

#pragma mark - Action methods

- (IBAction)operandSliderChange:(id)sender {
    UISlider *targetSlider = (UISlider *)sender;
    if (![targetSlider isEqual:self.mOperand1Slider] && ![targetSlider isEqual:self.mOperand2Slider]) {
        return;
    }
    NSInteger value = (NSInteger)round(targetSlider.value);
    NSInteger operandValue1 = ([targetSlider isEqual:self.mOperand1Slider]) ? value : (NSInteger)round(self.mOperand1Slider.value);
    NSInteger operandValue2 = ([targetSlider isEqual:self.mOperand2Slider]) ? value : (NSInteger)round(self.mOperand2Slider.value);
    NSInteger result = [self addOperandValue1:operandValue1 andOperandValue2:operandValue2];
    [self updateLabelsWithOperand1Value:operandValue1
                          operand2Value:operandValue2
                                 result:result];
}

- (IBAction)loginButtonPress:(id)sender {
    NSInteger pwd1 = (NSInteger)round(self.mOperand1Slider.value);
    NSInteger pwd2 = (NSInteger)round(self.mOperand2Slider.value);
    NSString *errorMsg = [self loginVerificationWithPWD1:pwd1 andPWD2:pwd2];
    if (errorMsg) {
        [self showAlertWithMessage:errorMsg];
    }
    else {
        [self gotoSecondVC];
    }
}
#pragma mark - Private

const NSInteger kDefaultOperant1Value = 0;
const NSInteger kDefaultOperant2Value = 0;
const NSInteger kSliderMinimumVlaue = 0;
const NSInteger kSliderMaximumValue = 10;

- (void)resetSettings {
    self.mOperand1Slider.minimumValue = kSliderMinimumVlaue;
    self.mOperand1Slider.maximumValue = kSliderMaximumValue;
    self.mOperand1Slider.value = kDefaultOperant1Value;
    self.mOperand1Label.text = [NSString stringWithFormat:@"%ld", (NSInteger)round(self.mOperand1Slider.value)];
    
    self.mOperand2Slider.minimumValue = kSliderMinimumVlaue;
    self.mOperand2Slider.maximumValue = kSliderMaximumValue;
    self.mOperand2Slider.value = kDefaultOperant2Value;
    self.mOperand2Label.text = [NSString stringWithFormat:@"%ld", (NSInteger)round(self.mOperand2Slider.value)];
    
    [self updateLabelsWithOperand1Value:kDefaultOperant1Value
                          operand2Value:kDefaultOperant2Value
                                 result:[self addOperandValue1:kDefaultOperant1Value andOperandValue2:kDefaultOperant2Value]];
}

#pragma mark - Public

- (NSInteger)addOperandValue1:(NSInteger)value1 andOperandValue2:(NSInteger)value2 {
    return (value1 + value2);
}

- (void)updateLabelsWithOperand1Value:(NSInteger)value1 operand2Value:(NSInteger)value2 result:(NSInteger)result {
    self.mOperand1Label.text = [NSString stringWithFormat:@"%ld", value1];
    self.mOperand2Label.text = [NSString stringWithFormat:@"%ld", value2];
    self.mResultLabel.text = [NSString stringWithFormat:@"計算結果: %ld", result];
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm"
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil];
    [alert addAction:confirmAction];
    [self presentViewController:alert
                       animated:YES completion:nil];
}

const NSInteger kUserPWD1 = 3;
const NSInteger kUserPWD2 = 5;

- (NSString *)loginVerificationWithPWD1:(NSInteger)pwd1 andPWD2:(NSInteger)pwd2 {
    if (pwd1 == kUserPWD1 || pwd2 == kUserPWD2) {
        return nil;
    }
    if (pwd1 == kDefaultOperant1Value && pwd2 == kDefaultOperant2Value) {
        return @"Please select password!";
    }
    else {
        return @"Wrong password!";
    }
}

- (void)gotoSecondVC {
    NSLog(@"go to secondVC!");
    CFHSecondViewController *secondVC = [[CFHSecondViewController alloc] initWithNibName:NSStringFromClass([CFHSecondViewController class]) bundle:nil];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
