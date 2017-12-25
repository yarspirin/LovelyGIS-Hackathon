//
//  PlaceTableViewCell.h
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *rate;
@property (nonatomic, strong) NSString *destTime;
@property (nonatomic, strong) NSString *consumptionTime;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *site;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *destTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *consumptionTimeLabel;

@end
