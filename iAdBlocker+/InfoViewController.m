//
//  InfoViewController.m
//  iAdBlocker+
//
//  Created by Sami Sharaf on 3/17/16.
//  Copyright © 2016 Sami Sharaf. All rights reserved.
//

#import "InfoViewController.h"
#import "UIDeviceHelper.h"

@interface InfoViewController ()

@property (strong, nonatomic) IBOutlet UILabel *iAdBlockerPlusLabel; //iAdBlockerPlus Label.
@property (strong, nonatomic) IBOutlet UILabel *bySamiSharafLabel; //By Sami Sharaf Label.
@property (strong, nonatomic) IBOutlet UILabel *versionLabel; //Version Display Label.
@property (strong, nonatomic) IBOutlet UILabel *assistanceLabel; //For Assistance etc... Label.
@property (strong, nonatomic) IBOutlet UILabel *emailLabel; //E-mail Label.

@property (strong, nonatomic) IBOutlet UIImageView *appIconImage; //iAdBlocker+ Icon Image.

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //------------------CODE STARTS HERE------------------
    
    if (IS_IPHONE_4 || IS_IPHONE_5) { //Reduce Some Labels Font Size to Fit the Screen.
        
        self.assistanceLabel.font = [UIFont fontWithName:@"Avenir Next" size:12];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
