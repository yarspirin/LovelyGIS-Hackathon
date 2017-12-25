//
//  MenuViewController.m
//  IndaPlace
//
//  Created by whoami on 12/23/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "MenuViewController.h"
#import "TableViewCell.h"
#import <MessageUI/MessageUI.h>
#import <VkSdk.h>
#import "ViewController.h"

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet UIImageView *profilePhoto;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet UILabel *coinsNumber;

@end

@implementation MenuViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (void)composeMail {
    NSString *emailTitle = @"Обращение в службу поддержки";
    
    NSArray *toRecipents = [NSArray arrayWithObject:@"mountainviewer@yahoo.com"];
    
    MFMailComposeViewController *mailComposeVC = [[MFMailComposeViewController alloc] init];
    
    if ([MFMailComposeViewController canSendMail]) {
        mailComposeVC.mailComposeDelegate = self;
        [mailComposeVC setSubject:emailTitle];
        [mailComposeVC setToRecipients:toRecipents];
    
        [self presentViewController:mailComposeVC animated:YES completion:nil];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"Cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.cellLabel.text = @"Настройки";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"settings_white";
        cell.alternativeImageName = @"settings";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 1) {
        cell.cellLabel.text = @"Популярное";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"top_white";
        cell.alternativeImageName = @"top";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 2) {
        cell.cellLabel.text = @"Рекомендации";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"star_white";
        cell.alternativeImageName = @"star";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 3) {
        cell.cellLabel.text = @"Рядом со мной";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"marker_white";
        cell.alternativeImageName = @"marker";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 4) {
        cell.cellLabel.text = @"Магазин";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"shop_white";
        cell.alternativeImageName = @"shop";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 5) {
        cell.cellLabel.text = @"Написать нам";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"mail_white";
        cell.alternativeImageName = @"mail";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 6) {
        cell.cellLabel.text = @"Выход";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor whiteColor];
        cell.imageName = @"logout_white";
        cell.alternativeImageName = @"logout";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"back"]) {
        ViewController *vc = (ViewController *)segue.destinationViewController;
        vc.afterSegue = YES;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [self.menuTableView cellForRowAtIndexPath:indexPath];
    
    cell.cellLabel.textColor = [UIColor blackColor];
    cell.cellImageView.image = [UIImage imageNamed:cell.alternativeImageName];
    cell.contentView.backgroundColor = [UIColor colorWithRed:246.0 / 255.0 green:182.0 / 255.0 blue:43.0 / 255.0 alpha:1];
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"settings" sender:self];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"popular" sender:self];
    } else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"recommended" sender:self];
    } else if (indexPath.row == 3) {
        [self performSegueWithIdentifier:@"nearby" sender:self];
    } else if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"shop" sender:self];
    } else if (indexPath.row == 5) {
        [self composeMail];
    } else if (indexPath.row == 6) {
        [VKSdk forceLogout];
        [self performSegueWithIdentifier:@"back" sender:self];
    } else {
        // what???
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [self.menuTableView cellForRowAtIndexPath:indexPath];
    
    cell.cellLabel.textColor = [UIColor whiteColor];
    cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    cell.contentView.backgroundColor = [UIColor colorWithRed:47.0 / 255.0 green:51.0 / 255.0 blue:88.0 / 255.0 alpha:1];
}

- (void)configureProfilePhoto {
    [self.profilePhoto.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.profilePhoto.layer setBorderWidth:1.0];
    [self.profilePhoto.layer setCornerRadius:self.profilePhoto.frame.size.height / 2];
    [self.profilePhoto.layer setMasksToBounds:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    
    [self configureProfilePhoto];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
