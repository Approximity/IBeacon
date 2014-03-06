//
//  ConfigViewController.m
//  MusuemIBeacon
//
//  Created by Aalek Dixit on 06/03/2014.
//  Copyright (c) 2014 Aalek Dixit. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()
@end

@implementation ConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   


    
}
    -(void)setLabels {
        self.uuidLabel.text = self.beaconRegion.proximityUUID.UUIDString;
        self.majorLabel.text = [NSString stringWithFormat:@"%@", self.beaconRegion.major];
    self.minorLabel.text = [NSString stringWithFormat:@"%@", self.beaconRegion.minor];
        self.identityLabel.text = self.beaconRegion.identifier;
        
    }

- (void)initBeacon {
        NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
        self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                    major:1
                                                                    minor:1
                                                                    identifier:@"com.ibazaar.MyRegion"];
        
    }
    
    -(IBAction)transmitBeacon: (UIButton *)sender  {
        self.beaconPeripheralData = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
        self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                         queue:nil
                                                                       options:nil];
        
    }

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Power On");
        [self.peripheralManager startAdvertising:self.beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Power Off");
        [self.peripheralManager stopAdvertising];
    }
    }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
