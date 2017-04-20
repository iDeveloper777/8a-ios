//
//  InputPhoneNumberVC.h
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Public.h"
#import "ASIHTTPRequest.h"


@interface InputPhoneNumberVC : UIViewController <ASIHTTPRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txt_PhoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *btn_GetConfirmCode;


- (IBAction)click_btn_GetConfirmCode:(id)sender;


@end
