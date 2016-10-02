//
//  TodayViewController.m
//  AdBlockerPlus Widget
//
//  Created by Sami Sharaf on 10/2/16.
//  Copyright © 2016 Sami Sharaf. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <SafariServices/SafariServices.h>
#import "AdBlockerPlusConstants.h"

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *activeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *indicatorImage;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleBlockerState)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self handleBlockerState];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)handleBlockerState {
    
    // getStateofContentBlockerIdentifier API is iOS 10 only
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){.majorVersion = 10, .minorVersion = 0, .patchVersion = 0}]) {
        [SFContentBlockerManager getStateOfContentBlockerWithIdentifier:APP_EXTENSION_NAME completionHandler:^(SFContentBlockerState * _Nullable state, NSError * _Nullable error) {
            if (error!=nil) {
                NSLog(@"GETTING STATE OF %@ FAILED WITH ERROR -%@", APP_EXTENSION_NAME,[error localizedDescription]);
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (state.enabled) { // blocker turned ON in settings
                        self.activeLabel.text = @"AdBlocker is Active";
                        self.indicatorImage.image = [UIImage imageNamed:@"Green Circle"];
                    } else { // blocker turned OFF in settings
                        self.activeLabel.text = @"AdBlockerPlus is not Active";
                        self.indicatorImage.image = [UIImage imageNamed:@"Red Circle"];
                    }
                });
            }
        }];
    }
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)margins
{
    margins.bottom = 10.0;
    return margins;
}

@end
