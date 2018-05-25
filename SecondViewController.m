//
//  SecondViewController.m
//  RAJSQL2
//
//  Created by Student P_08 on 12/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import "SecondViewController.h"
#import "SQLTableViewCell.h"
#import "DBManager.h"
#import "INFOViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tblvw.allowsMultipleSelectionDuringEditing = NO;
   
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    array = [[DBManager getInstance] FETCHDATA];
    NSLog(@"%@",array);
    tblvw.delegate=self;
    tblvw.dataSource=self;
    [tblvw reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string =@"SQLTableViewCell";
    SQLTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell==nil) {
        cell=[[SQLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        
    }
    cell.namecell.text=[[array objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    cell.Addresscell.text=[[array objectAtIndex:indexPath.row] valueForKey:@"address"];
    
    cell.rollnocell.text=[[array objectAtIndex:indexPath.row] valueForKey:@"rollno"];
    
    cell.Citycell.text=[[array objectAtIndex:indexPath.row] valueForKey:@"city"];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
   // NSInteger rollno=[NSNumber numberWithInteger:[[array objectAtIndex:indexPath.row]valueForKey:@"rollno"]];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[DBManager getInstance]DELETEDATA:[[[array objectAtIndex:indexPath.row]valueForKey:@"rollno"] integerValue]];
        NSMutableArray *arrtemp = [[NSMutableArray alloc]init];
        arrtemp = [array mutableCopy];
        [arrtemp removeObjectAtIndex:indexPath.row];
        array = [arrtemp copy];
        [tblvw reloadData];
    
    }
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    INFOViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"INFOViewController"];
    
    [self.navigationController pushViewController:obj animated:YES];
    
    obj.strname=[[array objectAtIndex:indexPath.row] valueForKey:@"name"];
    obj.straddress=[[array objectAtIndex:indexPath.row] valueForKey:@"address"];
    obj.strcity=[[array objectAtIndex:indexPath.row] valueForKey:@"city"];
    obj.strrollno=[[array objectAtIndex:indexPath.row] valueForKey:@"rollno"];
    
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

@end
