//
//  ViewController.m
//  CCHMapsActivity Example
//
//  Created by Claus Höfele on 16.01.14.
//  Copyright (c) 2014 Claus Höfele. All rights reserved.
//

#import "ViewController.h"

#import "CCHMapsActivity.h"

#import <AddressBook/AddressBook.h>

static const MKCoordinateRegion BERLIN_REGION = { {52.516819, 13.404293}, {0.4493, 0.7366} };

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Show pin for Berlin
    self.mapView.region = BERLIN_REGION;
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = BERLIN_REGION.center;
    [self.mapView addAnnotation:annotation];
}

- (IBAction)showActivity:(UIBarButtonItem *)sender
{
    // Optional address information
    NSMutableDictionary *addressDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    [addressDictionary setObject:@"Street" forKey:(NSString *)kABPersonAddressStreetKey];
    [addressDictionary setObject:@"City" forKey:(NSString *)kABPersonAddressCityKey];
    [addressDictionary setObject:@"ZIP" forKey:(NSString *)kABPersonAddressZIPKey];

    // Create an MKMapItem to pass to the Maps app
    CLLocationCoordinate2D coordinate = BERLIN_REGION.center;
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:addressDictionary];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = @"Berlin";
    
    // Configure activity
    NSArray *itemsToShare = @[mapItem];
    CCHMapsActivity *mapsActivity = [[CCHMapsActivity alloc] init];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:@[mapsActivity]];
    [self presentViewController:activityViewController animated:YES completion:nil];
}
    
@end
