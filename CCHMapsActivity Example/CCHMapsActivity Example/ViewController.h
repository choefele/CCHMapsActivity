//
//  ViewController.h
//  CCHMapsActivity Example
//
//  Created by Claus Höfele on 16.01.14.
//  Copyright (c) 2014 Claus Höfele. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
    
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
    
- (IBAction)showActivity:(UIBarButtonItem *)sender;

@end
