//
//  LocationTool.m
//  superweather
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import "LocationTool.h"

@implementation LocationTool {
    CLLocation *position;
}

-(instancetype) init {
    if (self = [super init]) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter= 10; // meters
        CLLocationAccuracy accuracy = kCLLocationAccuracyNearestTenMeters;
        [_locationManager setDesiredAccuracy:accuracy];
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];
        }
        [_locationManager startUpdatingLocation];
    }
    return self;
}

+ (instancetype)sharedTool {
    static LocationTool *sharedTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTool = [[self alloc] init];
    });
    return sharedTool;
}


- (CLLocation*)position {
    return position;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    position = locations.lastObject;
    NSLog(@"position: %@", position);
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"NewLocation"
         object:position];
    });
}

@end
