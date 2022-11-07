# XCode IOS Objective C Get GPS

授权问题(Authorize)

- [Location Services not working in iOS 8](https://stackoverflow.com/questions/24062509/location-services-not-working-in-ios-8)

获取gps整体代码

- [How to fix CLLocationManager location updates issue in iOS 8](http://datacalculation.blogspot.com/2014/11/how-to-fix-cllocationmanager-location.html)

参考获取 latlon 部分代码

- [how to get GPS Coordinates in iphone using Objective C](https://stackoverflow.com/questions/1789519/how-to-get-gps-coordinates-in-iphone-using-objective-c)

## Dev

- XCode Version `13.4.1(13F100)`

## Example

authorize

- `Privacy - Location When In Use Usage Description`
- `Privacy - Location Always Usage Description`


ViewController.h

```objc
#import <UIKit/UIKit.h>
#import<CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
    @property (nonatomic, retain) CLLocationManager *locationManager;
@end
```

ViewController.m

```objc
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
```
