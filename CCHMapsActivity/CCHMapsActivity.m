//
//  CCHMapsActivity.m
//  Stolpersteine
//
//  Created by Claus on 06.07.13.
//  Copyright (c) 2013 Option-U Software. All rights reserved.
//
//  https://github.com/choefele/CCHMapsActivity
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//  - Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
//  - Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
//  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
//  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
//  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
//  OF THE POSSIBILITY OF SUCH DAMAGE.
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
