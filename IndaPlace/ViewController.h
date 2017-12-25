//
//  ViewController.h
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk.h>

@interface ViewController : UIViewController <VKSdkDelegate, VKSdkUIDelegate>

@property (nonatomic) BOOL afterSegue;

@end

