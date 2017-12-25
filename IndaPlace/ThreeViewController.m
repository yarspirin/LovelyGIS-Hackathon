//
//  ThreeViewController.m
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ThreeViewController

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"crowd%d", (int)sender.value]];
    NSLog(@"slider value = %f", sender.value);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgView.image = [UIImage imageNamed:@"crowd1"];
    
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
