//
//  ListViewController.m
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "ListViewController.h"
#import "PlaceTableViewCell.h"
#import <NYAlertViewController.h>

@interface ListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<NSString *> *titles;
@property (strong, nonatomic) NSArray<NSString *> *prices;
@property (strong, nonatomic) NSArray<NSString *> *rates;
@property (strong, nonatomic) NSArray<NSString *> *destTimes;
@property (strong, nonatomic) NSArray<NSString *> *consumptionTimes;
@property (strong, nonatomic) NSArray<NSString *> *images;
@property (strong, nonatomic) NSArray<NSString *> *sites;
@property (strong, nonatomic) NSArray<NSString *> *latitude;
@property (strong, nonatomic) NSArray<NSString *> *longitude;

@end

@implementation ListViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    PlaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.image = [UIImage imageNamed: self.images[indexPath.row]];
    cell.title = self.titles[indexPath.row];
    cell.price = self.prices[indexPath.row];
    cell.rate = self.rates[indexPath.row];
    cell.destTime = self.destTimes[indexPath.row];
    cell.consumptionTime = self.consumptionTimes[indexPath.row];
    cell.imgView.image = cell.image;
    cell.titleLabel.text = cell.title;
    cell.destTimeLabel.text = [NSString stringWithFormat:@"В пути: %@", cell.destTime];
    cell.consumptionTimeLabel.text = [NSString stringWithFormat:@"Длительность: %@", cell.consumptionTime];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NYAlertViewController *alertVC = [[NYAlertViewController alloc] init];
    
    alertVC.title = self.titles[indexPath.row];
    alertVC.titleFont = [UIFont fontWithName:@"AvenirNext-Regular" size:18.0];
    alertVC.titleColor = [UIColor blackColor];
    
    alertVC.message = [NSString stringWithFormat:@"Цена: %@ рублей", self.prices[indexPath.row]];
    alertVC.messageFont = [UIFont fontWithName:@"AvenirNext-Regular" size:17.0];
    
    alertVC.cancelButtonColor = [UIColor colorWithRed:47.0 / 255.0 green:51.0 / 255.0 blue:88.0 / 255.0 alpha:1];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    
    alertVC.alertViewContentView = imageView;
    
    NYAlertAction *okAction = [NYAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(NYAlertAction *action) {
                                                         [self dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)initTitles {
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
}

- (void)initLatitude {
    self.latitude = @[@"55.741156", @"55.731353", @"55.752181", @"55.760236", @"55.762394", @"55.762176", @"55.743553", @"55.733249", @"55.760211", @"55.770264", @"55.756214"];
}

- (void)initLongitude {
    self.longitude = @[@"37.620213", @"37.604637", @"37.611419", @"37.612982", @"37.578684", @"37.662012", @"37.597836", @"37.646597", @"37.618569", @"37.609065", @"37.640048"];
}

- (void)initPrices {
    self.prices = @[@"400", @"0", @"300", @"1500", @"300", @"600", @"300", @"450", @"2500", @"0", @"0"];
}

- (void)initRates {
    self.rates = @[@"9.2 / 10.0", @"9.2 / 10.0", @"9.1 / 10.0", @"8.9 / 10.0", @"8.7 / 10.0", @"8.7 / 10.0", @"8.6 / 10.0", @"8.6 / 10.0", @"8.5 / 10.0", @"8.3 / 10.0", @"8.0 / 10.0"];
}

- (void)initDestTimes {
    self.destTimes = @[@"50 минут", @"57 минут", @"51 минута", @"55 минут", @"53 минуты", @"45 минут", @"60 минут", @"70 минут", @"53 минуты", @"60 минут", @"40 минут"];
}

- (void)initConsumptionTimes {
    self.consumptionTimes = @[@"4 часа", @"2 часа", @"1,5 часа", @"3 часа", @"2 часа", @"2 часа", @"3 часа", @"2 часа", @"3 часа", @"1 час", @"1 час"];
}

- (void)initImages {
    self.images = @[@"img_0.jpg", @"img_1.jpg", @"img_2.jpg", @"img_3.jpg", @"img_4.jpg", @"img_5.jpg", @"img_6.jpg", @"img_7.jpg", @"img_8.jpg", @"img_9.jpg", @"img_10.jpg"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPrices];
    [self initRates];
    [self initDestTimes];
    [self initConsumptionTimes];
    [self initImages];
    [self initTitles];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
