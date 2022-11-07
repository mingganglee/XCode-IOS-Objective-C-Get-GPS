//
//  ViewController.h
//  simple2
//
//  Created by 李明刚 on 2022/11/7.
//

#import <UIKit/UIKit.h>
#import<CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
    @property (nonatomic, retain) CLLocationManager *locationManager;
@end

