//
//  LocationTool.m
//  superweather
//
//  So far this only wraps CLLocationManager, but it could be useful
//  if we do more with location.
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import "LocationTool.h"

@implementation LocationTool

-(LocationTool*) init {
    if (self = [super init]) {
        self.locationManager = [[CLLocationManager alloc] init];
        CLLocationAccuracy accuracy = kCLLocationAccuracyNearestTenMeters;
        [self.locationManager setDesiredAccuracy:accuracy];
    }
    return self;
}

- (CLLocation*)position {
    return [self.locationManager location];
}


@end
