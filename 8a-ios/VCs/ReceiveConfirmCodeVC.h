//
//  ReceiveConfirmCodeVC.h
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Public.h"
#import "ASIHTTPRequest.h"

@interface ReceiveConfirmCodeVC : UIViewController <ASIHTTPRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txt_ConfirmCode;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Error;

- (IBAction)click_btn_Next:(id)sender;
- (IBAction)click_btn_DontReceive:(id)sender;

@end
