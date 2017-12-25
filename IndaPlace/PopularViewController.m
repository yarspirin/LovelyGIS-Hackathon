//
//  PopularViewController.m
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "PopularViewController.h"
#import "SWRevealViewController.h"
#import <HMSegmentedControl.h>

@interface PopularViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) HMSegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *mapContainer;
@property (weak, nonatomic) IBOutlet UIView *listContainer;
@property (weak, nonatomic) IBOutlet UIView *additionalView;
@property (weak, nonatomic) IBOutlet UIButton *personalizeButton;

@end

@implementation PopularViewController

- (IBAction)personalizeButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"personalize" sender:self];
}

- (void)configurePersonalizeButton {
    self.personalizeButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.personalizeButton.layer.borderWidth = 1.0;
    self.personalizeButton.layer.cornerRadius = 5.0;
}

- (void)configureSegmentedControl {
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Карта", @"Список"]];
    self.segmentedControl.borderWidth = 1;
    self.segmentedControl.borderType = HMSegmentedControlBorderTypeBottom | HMSegmentedControlBorderTypeLeft | HMSegmentedControlBorderTypeRight;
    self.segmentedControl.selectionIndicatorHeight = 1;
    self.segmentedControl.borderColor = [UIColor colorWithRed:47.0 / 255.0 green:51.0 / 255.0 blue:88.0 / 255.0 alpha:1];
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:47.0 / 255.0 green:51.0 / 255.0 blue:88.0 / 255.0 alpha:1];
    self.segmentedControl.selectionIndicatorBoxColor = [UIColor colorWithRed:47.0 / 255.0 green:51.0 / 255.0 blue:88.0 / 255.0 alpha:1];
    self.segmentedControl.titleTextAttributes = @{NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:18]};
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentedControl.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    [self.segmentedControl addTarget:self action:@selector(segmentedControlDidChangeValue:) forControlEvents:UIControlEventValueChanged];
    [self.additionalView addSubview:self.segmentedControl];
}

- (void)segmentedControlDidChangeValue: (HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 1) {
        [UIView animateWithDuration:0.5 animations:^{
            self.mapContainer.alpha = 1.0;
            self.listContainer.alpha = 0.0;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.mapContainer.alpha = 0.0;
            self.listContainer.alpha = 1.0;
        }];
    }
}

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
    [self configureSegmentedControl];
    [self configurePersonalizeButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
