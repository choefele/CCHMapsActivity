//
//  ViewController.m
//  CCHMapsActivityExample
//
//  Created by Claus on 09.07.13.
//  Copyright (c) 2013 Claus Höfele. All rights reserved.
//

#import "ViewController.h"

#import "CCHMapsActivity.h"

#import <MapKit/MapKit.h>
//#import <AddressBook/AddressBook.h>

@implementation ViewController

- (IBAction)showActivities:(UIBarButtonItem *)sender
{
    // Using the address properties requires the Address Book Framework
//    NSDictionary *addressDictionary = @{(NSString *)kABPersonAddressStreetKey : @"Unter den Linden",
//                                        (NSString *)kABPersonAddressCityKey : @"Berlin",
//                                        (NSString *)kABPersonAddressZIPKey : @"10117"};
    
    // Not using CLLocationCoordinate2DMake here to avoid linking in the Core Location Framework
    CLLocationCoordinate2D coordinate = {52.516667, 13.383333};
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil /*addressDictionary*/];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = @"Berlin";

    // Show activity controller
    CCHMapsActivity *mapsActivity = [[CCHMapsActivity alloc] init];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[mapItem] applicationActivities:@[mapsActivity]];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end
