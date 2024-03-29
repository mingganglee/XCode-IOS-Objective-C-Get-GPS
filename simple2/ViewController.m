//
//  ViewController.m
//  simple2
//
//  Created by 李明刚 on 2022/11/7.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lon;
@property (weak, nonatomic) IBOutlet UILabel *lat;

@end


@implementation ViewController

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8 Vs earlier version like iOS7.Otherwise code will
    // crash on ios 7
    if ([self.locationManager respondsToSelector:@selector
                       (requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

// CLLocationManager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:
(NSArray *)locations {
    NSLog(@"update latlon is %@", [self getLatlon]);
}

- (void) locationManager:(CLLocationManager *)manager
        didFailWithError:(NSError *)error {
    NSLog(@"get gps error");
}

- (IBAction)onButtonPressed:(id)sender {
    self.lat.text = [NSString stringWithFormat:@"Lat: %@", [self getLat]];
    self.lon.text = [NSString stringWithFormat:@"Lon: %@", [self getLon]];

    NSLog(@"button click get latlon: %@", [self getLatlon]);
}


- (NSString*)getLat {
    return [[NSNumber numberWithDouble:locationManager.location.coordinate.latitude] stringValue];
}

- (NSString*)getLon {
    return [[NSNumber numberWithDouble:locationManager.location.coordinate.longitude] stringValue];
}

- (NSString*)getLatlon {
    return [NSString stringWithFormat:@"%@,%@", [self getLat], [self getLon]];
}

@end
