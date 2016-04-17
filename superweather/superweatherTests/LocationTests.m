//
//  LocationTests.m
//  LocationTests
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationTool.h"

@interface superweatherTests : XCTestCase

@property (strong, nonatomic) LocationTool *location;

@end

@implementation superweatherTests {
}

- (void)setUp {
    [super setUp];
    self.location  = [[LocationTool alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLocation {
    CLLocation *pos = [self.location position];
    XCTAssertNotNil(pos);
    XCTAssertLessThan(pos.coordinate.latitude, 90.1);
    XCTAssertGreaterThan(pos.coordinate.latitude, -90.1);
    XCTAssertLessThan(pos.coordinate.longitude, 180.1);
    XCTAssertGreaterThan(pos.coordinate.longitude, -180.1);
    NSLog(@"Coordinates - long: %f deg, lat: %f deg", pos.coordinate.latitude, pos.coordinate.longitude);
}

@end
