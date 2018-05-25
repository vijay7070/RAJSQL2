//
//  SEARCHViewController.m
//  RAJSQL2
//
//  Created by Student P_08 on 13/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import "SEARCHViewController.h"
#import "SearchTableViewCell.h"
#import "DBManager.h"
@interface SEARCHViewController ()

@end

@implementation SEARCHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string =@"SearchTableViewCell";
    SearchTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell==nil) {
        cell=[[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        
    }
    cell.searchnametxt.text=[[array objectAtIndex:indexPath.row]valueForKey:@"name"];
    
    cell.searchaddress.text=[[array objectAtIndex:indexPath.row] valueForKey:@"address"];
    
    cell.searchrollno.text=[[array objectAtIndex:indexPath.row] valueForKey:@"rollno"];
    
    cell.searchcity.text=[[array objectAtIndex:indexPath.row] valueForKey:@"city"];
    return cell;
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

- (IBAction)searchact:(id)sender {
    array = [[DBManager getInstance]SEARCHDATA:_searchdata.text];
    _searchtbl_vw.delegate=self;
    _searchtbl_vw.dataSource=self;
    [_searchtbl_vw reloadData];
}
@end
