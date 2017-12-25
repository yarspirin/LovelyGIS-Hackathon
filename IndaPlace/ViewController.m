//
//  ViewController.m
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "ViewController.h"
#import <VKSdk.h>
#import <SVProgressHUD.h>

static NSArray *SCOPE = nil;

@interface ViewController ()

@property (nonatomic) BOOL authorized;
@property (nonatomic) BOOL hide;
@property (nonatomic) dispatch_group_t dispatch_group;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation ViewController

- (void)presentAlert:(NSString *) errorMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:errorMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)performTransitionToMenuController {
    dispatch_group_notify(self.dispatch_group, dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        if (self.hide) {
            [self performSegueWithIdentifier:@"SegueToFakeRevealVC" sender:self];
        } else {
            [self performSegueWithIdentifier:@"reveal" sender:self];
        }
    });
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    [VKSdk authorize:SCOPE];
}

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    if (result.token) {
        [self performTransitionToMenuController];
    }
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self presentViewController: controller animated: YES completion: nil];
}

- (void)vkSdkDidDismissViewController:(UIViewController *)controller {
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
        if (state == VKAuthorizationAuthorized) {
            [self performTransitionToMenuController];
        }
    }];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [vc presentIn:self];
}

- (void)vkSdkUserAuthorizationFailed {
    [self presentAlert:@"Authorization Failed"];
}

- (void)configureStartButton {
    self.startButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.startButton.layer.borderWidth = 2.0;
    self.startButton.layer.cornerRadius = 5.0;
}

- (IBAction)startButtonTapped:(id)sender {
    [VKSdk authorize:SCOPE];
    // [self performSegueWithIdentifier:@"reveal" sender:self];
}

- (void)wakeUpSession {
    if (!self.afterSegue) {
        dispatch_group_enter(self.dispatch_group);
        [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
            if (state == VKAuthorizationAuthorized) {
                self.authorized = YES;
                dispatch_group_leave(self.dispatch_group);
                [self performTransitionToMenuController];
            } else if (error) {
                dispatch_group_leave(self.dispatch_group);
                [SVProgressHUD dismiss];
                [self presentAlert:@"Не удаётся войти.\n\n Проверьте соединение и попробуйте снова."];
            } else {
                dispatch_group_leave(self.dispatch_group);
                [SVProgressHUD dismiss];
            }
        }];
    }
}

- (void)viewDidLoad {
    SCOPE = @[VK_PER_FRIENDS, VK_PER_WALL, VK_PER_PHOTOS, VK_PER_NOHTTPS];
    
    VKSdk *sdkInstance = [VKSdk initializeWithAppId:@"6309206"];
    [super viewDidLoad];
    [self configureStartButton];
    
    [sdkInstance registerDelegate:self];
    [sdkInstance setUiDelegate:self];
    
    self.dispatch_group = dispatch_group_create();
    [self wakeUpSession];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
