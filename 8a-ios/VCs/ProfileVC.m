//
//  ProfileVC.m
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import "ProfileVC.h"

@interface ProfileVC (){
    AppDelegate *appDelegate;
    
    NSString *photo_URL;
    NSString *str_Name;
    NSString *str_Bio;
}

@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = [AppDelegate sharedAppDeleate];
    if (appDelegate.tokenID != nil && ![appDelegate.tokenID isEqualToString:@""]){
        [self getProfile];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_txt_Name resignFirstResponder];
    [_txt_Bio resignFirstResponder];
}

#pragma mark -  Buttons Events
- (IBAction)click_btn_LogOut:(id)sender {
}

- (IBAction)click_btn_Save:(id)sender {
}

- (IBAction)click_btn_Cancel:(id)sender {
}

#pragma mark -  get profile information
- (void) getProfile{
    NSString *str_token = [NSString stringWithFormat:@"Bearer {%@}", appDelegate.tokenID];
    
    [ProgressHUD show:@"Sending..."];
    
    ASIFormDataRequest *request =[[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:API_Get_Profile_URL]];
    request.delegate=self;
    
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request addRequestHeader:@"Authorization" value:str_token];
    [request setRequestMethod:@"GET"];
    
    request.tag = 400;
    [request startAsynchronous];
}

#pragma mark HTTP Post Request
-(void)requestFinished:(ASIHTTPRequest *)request
{
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:request.responseData
                                                         options:kNilOptions
                                                           error:&error];
    if (request.tag == 400){
        [ProgressHUD dismiss];
        
        NSString *statusCode = (NSString *)[json objectForKey:@"status_code"];
        
        if (statusCode == nil){
           
            NSArray* data = (NSArray *)[json objectForKey:@"data"];
            
            NSDictionary *dic_Name = (NSDictionary *)data[0];
            str_Name = (NSString *)[dic_Name objectForKey:@"value"];
            
            NSDictionary *dic_Image = (NSDictionary *)data[1];
            photo_URL = (NSString *)[dic_Image objectForKey:@"value"];
            
            NSDictionary *dic_Bio = (NSDictionary *)data[2];
            str_Bio = (NSString *)[dic_Bio objectForKey:@"value"];
            
            [self showProfile];
        }else{
            //            int n_statusCode = [statusCode intValue];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Wrong confirmation Code." delegate:nil cancelButtonTitle:@"O K" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}

- (void) showProfile{
    _txt_Name.text = str_Name;
    _txt_Bio.text = str_Bio;
    [_img_ProfilePhoto sd_setImageWithURL:[[NSURL alloc] initWithString:photo_URL]];
}


@end
