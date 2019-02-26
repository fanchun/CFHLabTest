//
//  CFHMainViewController.m
//  CFHLabTest
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import "CFHMainViewController.h"

@interface CFHMainViewController ()

@end

@implementation CFHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - Private

const NSInteger kDefaultOperant1Value = 0;
const NSInteger kDefaultOperant2Value = 0;
const NSInteger kSliderMinimumVlaue = 0;
const NSInteger kSliderMaximumValue = 10;

- (void)resetSettings {
    self.title = @"加法計算器";
    
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

@end
