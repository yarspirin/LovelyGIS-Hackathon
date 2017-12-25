//
//  FirstViewController.m
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation FirstViewController

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"hype%d", (int)sender.value]];
    NSLog(@"slider value = %f", sender.value);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgView.image = [UIImage imageNamed:@"hype2"];
    
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
