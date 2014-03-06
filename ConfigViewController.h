//
//  ConfigViewController.h
//  MusuemIBeacon
//
//  Created by Aalek Dixit on 06/03/2014.
//  Copyright (c) 2014 Aalek Dixit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface ConfigViewController : UIViewController <CBPeripheralManagerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *uuidLabel;

@property (weak, nonatomic) IBOutlet UILabel *majorLabel;

@property (weak, nonatomic) IBOutlet UILabel *minorLabel;

@property (weak, nonatomic) IBOutlet UILabel *identityLabel;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;

@property (strong, nonatomic) NSDictionary *beaconPeripheralData;

@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end
