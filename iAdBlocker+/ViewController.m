//
//  ViewController.m
//  iAdBlocker+
//
//  Created by Sami Sharaf on 3/17/16.
//  Copyright © 2016 Sami Sharaf. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>
#import "UIDeviceHelper.h"
#import "AdBlockerPlusConstants.h"

@interface ViewController ()

-(IBAction)settingsTapped:(id)sender; //Settings button tap action.

@property (strong, nonatomic) IBOutlet UILabel *thankyouLabel; //Thank you for purchasing Label.
@property (strong, nonatomic) IBOutlet UILabel *instructionsLabel; //Below are the instructions Label.
@property (strong, nonatomic) IBOutlet UILabel *stepOneLabel; //Step 1 instruction Label.
@property (strong, nonatomic) IBOutlet UILabel *stepTwoLabel; //Step 2 instruction Label.
@property (strong, nonatomic) IBOutlet UILabel *stepThreeLabel; //Step 3 instruction Label.
@property (strong, nonatomic) IBOutlet UILabel *allDoneLabel; //All Done Label.
@property (strong, nonatomic) IBOutlet UILabel *blockingAdsLabel; //You are now blocking ads in safari Label.

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //------------------CODE STARTS HERE------------------
    
    //------------------View Configuration------------------
    
    UINavigationController *navigationController = (UINavigationController *)self.navigationController;
    UIFont *font = [UIFont fontWithName:@"Avenir Next" size:16];
    [navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                [UIColor blackColor],
                                                                NSForegroundColorAttributeName,
                                                                font,
                                                                NSFontAttributeName,
                                                                nil]];
    //------------------Fonts For Lables------------------
    
    if (IS_IPHONE_4 || IS_IPHONE_5) {
        
        self.instructionsLabel.font = [UIFont fontWithName:@"Avenir Next" size:11];
        self.stepOneLabel.font = [UIFont fontWithName:@"Avenir Next" size:13];
        self.stepTwoLabel.font = [UIFont fontWithName:@"Avenir Next" size:13];
        self.stepThreeLabel.font = [UIFont fontWithName:@"Avenir Next" size:13];
    }
    
    //------------------If Error Happens------------------
    
    [SFContentBlockerManager reloadContentBlockerWithIdentifier:APP_EXTENSION_NAME completionHandler:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"RELOAD OF %@ FAILED WITH ERROR -%@", APP_EXTENSION_NAME, [error localizedDescription]);
        }
    }];
    
    
}

-(IBAction)settingsTapped:(id)sender { //Open App Settings.
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
