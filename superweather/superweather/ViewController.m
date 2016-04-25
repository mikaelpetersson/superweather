//
//  ViewController.m
//  superweather
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@property (strong, nonatomic) LocationTool* location;
@property (weak, nonatomic) IBOutlet UILabel *lattitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longditudeLabel;

@end

@implementation ViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        _location = [LocationTool sharedTool];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNewLocation:)
                                                     name:@"NewLocation"
                                                   object:nil];
    }
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void) receiveNewLocation:(NSNotification *) notification {
    CLLocation *pos = (CLLocation*) notification.object;
    self.lattitudeLabel.text = [NSString stringWithFormat:@"%.1f degrees", pos.coordinate.latitude];
    self.longditudeLabel.text = [NSString stringWithFormat:@"%.1f degrees", pos.coordinate.longitude];
}

@end
