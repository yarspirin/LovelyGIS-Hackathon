//
//  SecondViewController.m
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation SecondViewController

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"yoga%d", (int)sender.value + 1]];
    NSLog(@"slider value = %f", sender.value);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgView.image = [UIImage imageNamed:@"yoga1"];
    
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
