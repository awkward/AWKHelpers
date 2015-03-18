//
//  LineHeightViewController.h
//  AWKHelpers
//
//  Created by Rens Verhoeven on 03-03-15.
//  Copyright (c) 2015 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineHeightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *adjustedLineHeightTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nonAdjustedLineHeightTitleLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepperControl;
@property (weak, nonatomic) IBOutlet UILabel *adjustedLineHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *nonAdjustedLineHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *fontNameLabel;

@end
