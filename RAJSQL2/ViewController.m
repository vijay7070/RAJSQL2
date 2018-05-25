//
//  ViewController.m
//  RAJSQL2
//
//  Created by Student P_08 on 12/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SAVEACT:(id)sender {
   
    
    if ([_NAMETXT.text isEqualToString:@""]||[_ADDRESSTXT.text isEqualToString:@""]||[_rollnotxt.text isEqualToString:@""]) {
        NSLog(@"ALERT");
        
    }
    else{
        if ([[DBManager getInstance]saveData:_NAMETXT.text Address:_ADDRESSTXT.text city:_CITYTXT.text rollno:[_rollnotxt.text integerValue]]==YES) {
            [_NAMETXT resignFirstResponder];
            [_ADDRESSTXT resignFirstResponder];
            [_rollnotxt resignFirstResponder];
            [_CITYTXT resignFirstResponder];
            NSLog(@"SUCCESS");
            
        }
        else{
            NSLog(@"NOT INSERTED");
        }
        
        
    }
}
@end
