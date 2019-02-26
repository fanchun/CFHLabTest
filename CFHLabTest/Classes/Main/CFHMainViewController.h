//
//  CFHMainViewController.h
//  CFHLabTest
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CFHMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *mOperand1Slider;
@property (weak, nonatomic) IBOutlet UISlider *mOperand2Slider;
@property (weak, nonatomic) IBOutlet UILabel *mOperand1Label;
@property (weak, nonatomic) IBOutlet UILabel *mOperand2Label;
@property (weak, nonatomic) IBOutlet UILabel *mResultLabel;
@property (weak, nonatomic) IBOutlet UIButton *mLoginButton;

- (NSInteger)addOperandValue1:(NSInteger)value1 andOperandValue2:(NSInteger)value2;
- (void)updateLabelsWithOperand1Value:(NSInteger)value1 operand2Value:(NSInteger)value2 result:(NSInteger)result;
@end

NS_ASSUME_NONNULL_END
