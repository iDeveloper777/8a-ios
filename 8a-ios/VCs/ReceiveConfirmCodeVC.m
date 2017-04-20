//
//  ReceiveConfirmCodeVC.m
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import "ReceiveConfirmCodeVC.h"

@interface ReceiveConfirmCodeVC (){
    AppDelegate *appDelegate;
}

@end

@implementation ReceiveConfirmCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = [AppDelegate sharedAppDeleate];
    
    [_lbl_Error setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_txt_ConfirmCode resignFirstResponder];
}

#pragma mark -  Buttons Events
- (IBAction)click_btn_DontReceive:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)click_btn_Next:(id)sender {
    

    [ProgressHUD show:@"Sending..."];
    
    ASIFormDataRequest *request =[[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:API_Login_credentials_URL]];
    request.delegate=self;
    
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:@"POST"];
    
    [request setPostValue: appDelegate.phoneNumber forKey:@"phoneNumber"];
    [request setPostValue: _txt_ConfirmCode.text forKey:@"confirmationCode"];
    
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
            NSString *token = (NSString *)[json objectForKey:@"token"];
            appDelegate.tokenID = token;
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[[AppDelegate sharedAppDeleate] storyboardName] bundle:nil];
            
            ProfileVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else{
//            int n_statusCode = [statusCode intValue];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Wrong confirmation Code." delegate:nil cancelButtonTitle:@"O K" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}


@end
