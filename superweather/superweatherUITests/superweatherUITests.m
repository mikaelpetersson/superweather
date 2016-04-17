//
//  superweatherUITests.m
//  superweatherUITests
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LocationTool.h"

@interface superweatherUITests : XCTestCase

@end

@implementation superweatherUITests {
    NSString *latString;
    NSString *lonString;
}

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
    LocationTool *locationTool = [[LocationTool alloc] init];
    latString = [NSString stringWithFormat:@"%.1f degrees", [locationTool position].coordinate.latitude];
    lonString = [NSString stringWithFormat:@"%.1f degrees", [locationTool position].coordinate.longitude];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testInitialGUI {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *lat = [[app staticTexts] elementMatchingType:XCUIElementTypeStaticText identifier:@"Lattitude"];
    XCUIElement *lon = [[app staticTexts] elementMatchingType:XCUIElementTypeStaticText identifier:@"Longditude"];    
    XCUIElement *lonValue = [[app staticTexts] elementMatchingType:XCUIElementTypeStaticText identifier: lonString];
    XCUIElement *latValue = [[app staticTexts] elementMatchingType:XCUIElementTypeStaticText identifier: latString];
    XCTAssertTrue([lat exists]);
    XCTAssertTrue([lon exists]);
    XCTAssertTrue([lonValue exists]);
    XCTAssertTrue([latValue exists]);
}

@end
