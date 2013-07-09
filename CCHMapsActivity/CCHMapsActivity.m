//
//  CCHMapsActivity.m
//  Stolpersteine
//
//  Created by Claus on 06.07.13.
//  Copyright (c) 2013 Option-U Software. All rights reserved.
//

#import "CCHMapsActivity.h"

#import <MapKit/MapKit.h>

@interface CCHMapsActivity()

@property (nonatomic, strong) MKMapItem *mapItem;

@end

@implementation CCHMapsActivity

- (NSString *)activityType
{
    return NSStringFromClass(self.class);
}

- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"activity.openMaps", @"CCHMapsActivity", nil);
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"CCHMapsActivity.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    BOOL result;
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:MKMapItem.class]) {
            result = YES;
            break;
        }
    }

    return result;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:MKMapItem.class]) {
            self.mapItem = activityItem;
        }
    }
}

- (void)performActivity
{
    BOOL result = [self.mapItem openInMapsWithLaunchOptions:self.launchOptions];
    [self activityDidFinish:result];
}

@end
