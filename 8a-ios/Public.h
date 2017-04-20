//
//  Public.h
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#ifndef Public_h
#define Public_h

#import "AppDelegate.h"

#import "InputPhoneNumberVC.h"
#import "ReceiveConfirmCodeVC.h"
#import "ProfileVC.h"

//Libaries
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "ProgressHUD.h"

#define API_URL @"http://dev-api.wwl.tv/api/v1"
#define API_Request_Code_URL @"http://dev-api.wwl.tv/api/v1/login/request-code"
#define API_Login_credentials_URL @"http://dev-api.wwl.tv/api/v1/login"
#define API_Get_Profile_URL @"http://dev-api.wwl.tv/api/v1/users/profile-fields"
#endif /* Public_h */
