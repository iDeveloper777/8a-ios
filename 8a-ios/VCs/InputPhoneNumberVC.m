//
//  InputPhoneNumberVC.m
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import "InputPhoneNumberVC.h"

@interface InputPhoneNumberVC ()

@end

@implementation InputPhoneNumberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_txt_PhoneNumber resignFirstResponder];
}

#pragma mark -  Buttons Events
- (IBAction)click_btn_GetConfirmCode:(id)sender {
    [ProgressHUD show:@"Sending..."];
    
    ASIFormDataRequest *request =[[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:API_Request_Code_URL]];
    request.delegate=self;
    
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:@"POST"];
    
    NSString *str_PhoneNumber = [NSString stringWithFormat:@"+%@", _txt_PhoneNumber.text];
    
    [request setPostValue: str_PhoneNumber forKey:@"phoneNumber"];
    
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
        
        NSString *success = (NSString *)[json objectForKey:@"success"];
        NSString *statusCode = (NSString *)[json objectForKey:@"status_code"];
        
        if (statusCode == nil){
            if ([success isEqualToString:@"ok"]){
                AppDelegate *appDelegate = [AppDelegate sharedAppDeleate];
                appDelegate.phoneNumber =  [NSString stringWithFormat:@"+%@", _txt_PhoneNumber.text];
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[[AppDelegate sharedAppDeleate] storyboardName] bundle:nil];
                
                ReceiveConfirmCodeVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"ReceiveConfirmCodeVC"];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }else{
            int n_statusCode = [statusCode intValue];
            if (n_statusCode == 422){
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The phone number field contains an invalid number." delegate:nil cancelButtonTitle:@"O K" otherButtonTitles:nil, nil];
                [alertView show];
            }
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    [ProgressHUD dismiss];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Cannot connect to server" delegate:nil cancelButtonTitle:@"O K" otherButtonTitles:nil, nil];
    [alertView show];
}
@end
