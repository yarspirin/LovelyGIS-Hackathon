//
//  MapViewController.m
//  IndaPlace
//
//  Created by whoami on 12/24/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "MapViewController.h"
#import <NMAKit/NMAKit.h>

@interface MapViewController ()

@property (nonatomic, strong) NMAMapView *mapView;
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

@implementation MapViewController

- (IBAction)buttonTapped:(id)sender {
    NMAGeoCoordinates *coordinates = [[NMAGeoCoordinates alloc] initWithLatitude:47.0 longitude:39.0];
    
    NMAMapMarker *marker = [[NMAMapMarker alloc] initWithGeoCoordinates:coordinates];
    
    [self.mapView addMapObject:marker];
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
    [self initDestTimes];
    [self initLongitude];
    [self initLatitude];
    
    self.mapView = [[NMAMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
    
    NMAGeoCoordinates *coordinates = [[NMAGeoCoordinates alloc] initWithLatitude:47.0 longitude:39.0];
    
    NMAMapMarker *marker = [[NMAMapMarker alloc] initWithGeoCoordinates:coordinates];
    
    [self.mapView addMapObject:marker];
    
    float avg_lat = 0;
    float avg_long = 0;
    
    for (int i = 0; i < [self.destTimes count]; ++i) {
        float latitude = [self.latitude[i] floatValue];
        float longitude = [self.longitude[i] floatValue];
        
        printf("%f %f\n", latitude, longitude);
        
        avg_lat += latitude;
        avg_long += longitude;
        
        NMAGeoCoordinates *geoCoord = [[NMAGeoCoordinates alloc]
                                      initWithLatitude:latitude longitude:longitude];
        
        NMAMapMarker *marker = [[NMAMapMarker alloc] initWithGeoCoordinates:geoCoord];
        [self.mapView addMapObject:marker];
        [marker setVisibility:YES fromZoomLevel:-20 toZoomLevel:20];
    }
    
    
    NMAGeoCoordinates *geoCoordCenter = [[NMAGeoCoordinates alloc]
                                         initWithLatitude:avg_lat / [self.destTimes count] longitude:avg_long / [self.destTimes count]];
    
    [self.mapView setGeoCenter:geoCoordCenter withAnimation:NMAMapAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
