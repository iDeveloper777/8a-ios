//
//  ProfileVC.h
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Public.h"
#import "ASIHTTPRequest.h"
#import "UIImageView+WebCache.h"

@interface ProfileVC : UIViewController <ASIHTTPRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *img_ProfilePhoto;
@property (weak, nonatomic) IBOutlet UITextField *txt_Name;
@property (weak, nonatomic) IBOutlet UITextView *txt_Bio;

- (IBAction)click_btn_LogOut:(id)sender;
- (IBAction)click_btn_Save:(id)sender;
- (IBAction)click_btn_Cancel:(id)sender;

@end
