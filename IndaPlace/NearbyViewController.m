//
//  NearbyViewController.m
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "NearbyViewController.h"
#import "SWRevealViewController.h"

@interface NearbyViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end

@implementation NearbyViewController

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
