//
//  SEARCHViewController.h
//  RAJSQL2
//
//  Created by Student P_08 on 13/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEARCHViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *array;
}
@property (weak, nonatomic) IBOutlet UITableView *searchtbl_vw;
@property (weak, nonatomic) IBOutlet UITextField *searchdata;
- (IBAction)searchact:(id)sender;


@end
