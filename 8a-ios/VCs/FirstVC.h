//
//  FirstVC.h
//  8a-ios
//
//  Created by iDeveloper on 4/20/17.
//  Copyright © 2017 Allfree Group LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Public.h"

@interface FirstVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_Watch_News;
@property (weak, nonatomic) IBOutlet UIButton *btn_Report_News;

- (IBAction)click_btn_Watch_News:(id)sender;
- (IBAction)click_btn_Report_News:(id)sender;
@end
