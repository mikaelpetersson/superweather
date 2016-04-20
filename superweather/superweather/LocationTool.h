//
//  LocationTool.h
//  superweather
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationListener <NSObject>

- (void)newPosition: (CLLocation*)position;

@end

@interface LocationTool : NSObject<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

- (void) addListener: (NSObject<LocationListener>*) listener;
- (instancetype) init;
- (CLLocation*) position;
+ (instancetype) sharedTool;

@end
