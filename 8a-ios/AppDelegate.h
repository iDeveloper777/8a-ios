//
//  AppDelegate.h
//  8a-ios
//
//  Created by Uncovered on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(AppDelegate *)sharedAppDeleate;
-(NSString*)storyboardName;

@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *tokenID;

@end

