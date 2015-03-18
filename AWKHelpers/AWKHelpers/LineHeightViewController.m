//
//  LineHeightViewController.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 03-03-15.
//  Copyright (c) 2015 Awkward. All rights reserved.
//

#import "LineHeightViewController.h"
#import "AWKHelpers.h"

@interface LineHeightViewController ()

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@end

@implementation LineHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stepperControl.value = [[self font] lineHeight];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateView];
}

-(IBAction)stepperValueChanged:(id)sender {
    [self updateView];
}

-(UIFont *)font {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:14];
}

-(NSString *)text {
    return @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempus commodo odio sit amet vestibulum. Mauris a molestie enim. Vivamus quis nisi eu leo mattis laoreet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam scelerisque vulputate nulla id facilisis. Vestibulum sit amet efficitur velit, quis semper nisl. Morbi convallis aliquet faucibus. Sed feugiat ut purus non gravida. Quisque venenatis eget orci a tristique. Vivamus nec nisl ullamcorper magna laoreet lacinia fringilla ac erat. Integer ultricies nunc eget urna rhoncus suscipit. Nullam consequat urna ac sapien suscipit, vel fermentum justo hendrerit.";
}

-(void)updateView {
    UIFont *font = [self font];
    self.fontNameLabel.text = [NSString stringWithFormat:@"%@ %.0fpt",font.fontName,font.pointSize];
    self.adjustedLineHeightTitleLabel.text = [NSString stringWithFormat:@"Adjusted line height: %.03f",self.stepperControl.value];
    
    CGFloat lineHeight = self.stepperControl.value;
    [self.labels setValue:font forKey:@"font"];
    
    self.adjustedLineHeightLabel.attributedText = [[self text] attributedStringWithLineHeight:lineHeight];
    self.nonAdjustedLineHeightLabel.text = [self text];
    
    
}

@end
