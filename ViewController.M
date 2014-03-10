import "ViewController.h"



@interface ViewController ()

@property (nonatomic, strong) UIImageView*      bgImageView;
@property (nonatomic, assign) BOOL              notificationShown;
@property (nonatomic, strong) UIImageView*      productImage;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    
}

- (IBAction)pushNotification:(id)sender {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    
    localNotification.alertBody = @"Welcome to the Beacon Demo Please launch the App for your rewards! :D";
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    self.productImage = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setProductImage];
    [self.view addSubview:self.productImage];
   
    
}
     
     
-(void)setProductImage
{
    // product image when user outside beacon zone
    
    CGRect          screenRect          = [[UIScreen mainScreen] bounds];
    CGFloat         screenHeight        = screenRect.size.height;
    
    if (screenHeight > 480)
    {
        [self.productImage setImage:[UIImage imageNamed:@"beforeNotificationBig"]];
    }
    else
    {
        [self.productImage setImage:[UIImage imageNamed:@"beforeNotificationSmall"]];
    }
}


-(void)setDiscountImage
{
    // product image when user inside beacon zone
    
    CGRect          screenRect          = [[UIScreen mainScreen] bounds];
    CGFloat         screenHeight        = screenRect.size.height;
    
    if (screenHeight > 480)
    {
        [self.productImage setImage:[UIImage imageNamed:@"afterNotificationBig"]];
    }
    else
    {
        [self.productImage setImage:[UIImage imageNamed:@"afterNotificationSmall"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

