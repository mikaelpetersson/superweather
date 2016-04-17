//
//  ViewController.h
//  superweather
//
//  Created by mikael petersson on 2016-04-17.
//  Copyright © 2016 mikael petersson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationTool.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) LocationTool* location;
@property (weak, nonatomic) IBOutlet UILabel *lattitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longditudeLabel;

@end

