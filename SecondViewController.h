//
//  SecondViewController.h
//  RAJSQL2
//
//  Created by Student P_08 on 12/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *array;
    
    __weak IBOutlet UITableView *tblvw;
}

@end
