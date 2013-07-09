//
//  CCHMapsActivity.m
//  Stolpersteine
//
//  Created by Claus on 06.07.13.
//  Copyright (c) 2013 Option-U Software. All rights reserved.
//

#import "CCHMapsActivity.h"

@interface CCHMapsActivity()

@property (nonatomic, strong) NSURL *url;

@end

@implementation CCHMapsActivity

- (NSString *)activityType
{
	return NSStringFromClass(self.class);
}

- (NSString *)activityTitle
{
	return NSLocalizedStringFromTable(@"In der Karten App öffnen", @"TUSafariActivity", nil);
}

- (UIImage *)activityImage
{
	return [UIImage imageNamed:@"Maps.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem]) {
			return YES;
		}
	}
    
	return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]]) {
			self.url = activityItem;
		}
	}
}

- (void)performActivity
{
	BOOL completed = [[UIApplication sharedApplication] openURL:self.url];
    
	[self activityDidFinish:completed];
}

@end
