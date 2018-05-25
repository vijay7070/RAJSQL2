//
//  ViewController.h
//  RAJSQL2
//
//  Created by Student P_08 on 12/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *NAMETXT;
@property (weak, nonatomic) IBOutlet UITextField *rollnotxt;
- (IBAction)SAVEACT:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *CITYTXT;

@property (weak, nonatomic) IBOutlet UITextField *ADDRESSTXT;

@end

