//
//  INFOViewController.h
//  RAJSQL2
//
//  Created by Student P_08 on 13/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface INFOViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameinfotxt;
@property (weak, nonatomic) IBOutlet UITextField *addressinfotxt;
@property (weak, nonatomic) IBOutlet UITextField *cityinfotxt;
@property (weak, nonatomic) IBOutlet UILabel *rollnotxt;

@property (strong,nonatomic)NSString *strname;
@property (strong,nonatomic)NSString *straddress;
@property (strong,nonatomic)NSString *strcity;
@property (strong,nonatomic)NSString *strrollno;

- (IBAction)UPDATEACT:(id)sender;


@end
