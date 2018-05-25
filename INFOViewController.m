//
//  INFOViewController.m
//  RAJSQL2
//
//  Created by Student P_08 on 13/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import "INFOViewController.h"
#import "DBManager.h"

@interface INFOViewController ()

@end

@implementation INFOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nameinfotxt.text=_strname;
    _addressinfotxt.text=_straddress;
    _cityinfotxt.text=_strcity;
    _rollnotxt.text=_strrollno;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)UPDATEACT:(id)sender {
    if ([[DBManager getInstance]Update:_nameinfotxt.text Address:_addressinfotxt.text city:_cityinfotxt.text rollno:[_rollnotxt.text integerValue]]) {
        NSLog(@"SUCCESS");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"NOT updated");
    }
    
    
    
}
@end
