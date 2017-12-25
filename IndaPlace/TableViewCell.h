//
//  TableViewCell.h
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *alternativeImageName;

@end
