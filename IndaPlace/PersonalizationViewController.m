//
//  PersonalizationViewController.m
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "PersonalizationViewController.h"
#import <HMSegmentedControl.h>

@interface PersonalizationViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

@property (weak, nonatomic) IBOutlet UIImageView *first;
@property (weak, nonatomic) IBOutlet UIImageView *second;
@property (weak, nonatomic) IBOutlet UIImageView *third;
@property (weak, nonatomic) IBOutlet UIImageView *fourth;

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;

@property (weak, nonatomic) IBOutlet UIView *firstContainer;
@property (weak, nonatomic) IBOutlet UIView *secondContainer;
@property (weak, nonatomic) IBOutlet UIView *thirdContainer;
@property (weak, nonatomic) IBOutlet UIView *fourthContainer;

@property (weak, nonatomic) IBOutlet UIView *additionalView;
@property (strong, nonatomic) HMSegmentedControl *segmentedControl;

@property (strong, nonatomic) NSArray<NSString *> *titles;
@property (strong, nonatomic) NSArray<NSString *> *images;

@end

@implementation PersonalizationViewController

- (void)configureSegmentedControl {
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Хайп", @"Компания", @"Настрой", @"Время"]];
    self.segmentedControl.borderWidth = 1;
    self.segmentedControl.borderType = HMSegmentedControlBorderTypeBottom;
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
    if (segmentedControl.selectedSegmentIndex == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.firstContainer.alpha = 1.0;
            self.secondContainer.alpha = 0.0;
            self.thirdContainer.alpha = 0.0;
            self.fourth.alpha = 0.0;
        }];
    } else if (segmentedControl.selectedSegmentIndex == 1) {
        [UIView animateWithDuration:0.5 animations:^{
            self.firstContainer.alpha = 0.0;
            self.secondContainer.alpha = 1.0;
            self.thirdContainer.alpha = 0.0;
            self.fourth.alpha = 0.0;
        }];
    } else if (segmentedControl.selectedSegmentIndex == 2) {
        [UIView animateWithDuration:0.5 animations:^{
            self.firstContainer.alpha = 0.0;
            self.secondContainer.alpha = 0.0;
            self.thirdContainer.alpha = 1.0;
            self.fourth.alpha = 0.0;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.firstContainer.alpha = 0.0;
            self.secondContainer.alpha = 0.0;
            self.thirdContainer.alpha = 0.0;
            self.fourth.alpha = 1.0;
        }];
    }
}

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)timerFired {
    int pos = arc4random_uniform(74) % 4;
    int with = arc4random_uniform(74) % [self.titles count];
    
    if (pos == 0) {
        self.firstLabel.text = self.titles[with];
        self.first.image = [UIImage imageNamed: self.images[with]];
    } else if (pos == 1) {
        self.secondLabel.text = self.titles[with];
        self.second.image = [UIImage imageNamed: self.images[with]];
    } else if (pos == 2) {
        self.thirdLabel.text = self.titles[with];
        self.third.image = [UIImage imageNamed: self.images[with]];
    } else {
        self.fourthLabel.text = self.titles[with];
        self.fourth.image = [UIImage imageNamed: self.images[with]];
    }
    
}

- (void)backgroundThread {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(timerFired)
                                           userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureSegmentedControl];
    [self backgroundThread];
    
    self.titles = @[@"Государственная Третьяковская галерея",
                    @"Центральный парк культуры и отдыха имени М. Горького",
                    @"Государственный Кремлевский дворец",
                    @"Московский Художественный театр имени А. П. Чехова",
                    @"Московский зоопарк",
                    @"Гоголь-центр",
                    @"Государственный музей А. С. Пушкина",
                    @"Московский международный Дом музыки",
                    @"Государственный академический Большой театр России",
                    @"Московский городской сад «Эрмитаж»",
                    @"Государственная публичная историческая библиотека России"];
    
    self.images = @[@"img_0.jpg", @"img_1.jpg", @"img_2.jpg", @"img_3.jpg", @"img_4.jpg", @"img_5.jpg", @"img_6.jpg", @"img_7.jpg", @"img_8.jpg", @"img_9.jpg", @"img_10.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
