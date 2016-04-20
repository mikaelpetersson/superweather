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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.location = [LocationTool sharedTool];
    [self.location addListener:self];
    CLLocation *pos = [self.location position];
//    self.lattitudeLabel.text = [NSString stringWithFormat:@"%.1f degrees", pos.coordinate.latitude];
//    self.longditudeLabel.text = [NSString stringWithFormat:@"%.1f degrees", pos.coordinate.longitude];
}

- (void) newPosition:(CLLocation *)pos {
    self.lattitudeLabel.text = [NSString stringWithFormat:@"%.1f degrees", pos.coordinate.latitude];
    self.longditudeLabel.text = [NSString stringWithFormat:@"%.1f degrees", pos.coordinate.longitude];
}

@end
