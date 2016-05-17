//
//  MapViewController.h
//  BK
//
//  Created by Chen Jin on 5/8/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSDictionary *event;

@end
