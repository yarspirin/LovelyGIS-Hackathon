//
//  PageViewController.h
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIPageViewController <UIPageViewControllerDataSource>

@property (nonatomic, strong) UIViewController *viewController;

@end
