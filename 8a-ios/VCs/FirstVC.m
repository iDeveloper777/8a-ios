//
//  FirstVC.m
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  Buttons Events

- (IBAction)click_btn_Watch_News:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[[AppDelegate sharedAppDeleate] storyboardName] bundle:nil];
    
    InputPhoneNumberVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"InputPhoneNumberVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)click_btn_Report_News:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[[AppDelegate sharedAppDeleate] storyboardName] bundle:nil];
    
    InputPhoneNumberVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"InputPhoneNumberVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
