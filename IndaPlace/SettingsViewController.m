//
//  SettingsViewController.m
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end

@implementation SettingsViewController

- (void)configureRevealVC {
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureRevealVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
