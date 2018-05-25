//
//  DBManager.m
//  RAJSQL2
//
//  Created by Student P_08 on 12/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import "DBManager.h"
#import <sqlite3.h>
static DBManager *sharedInstance=nil;
static sqlite3 *database=nil;
static sqlite3_stmt *statement=nil;
@implementation DBManager

+(DBManager *)getInstance{
    if(sharedInstance ==nil)
    {
        sharedInstance =[[DBManager alloc]init];
    }
    return  sharedInstance;
}
-(NSString *)DBPath{
    NSArray *array=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *strDocumentPath=[array firstObject];
    
    NSString *strDBpath=[strDocumentPath stringByAppendingPathComponent:@"student.db"];
    NSLog(@"%@",strDBpath);
    return  strDBpath;
}
-(void)createDB{
    NSString *strDBPath=[self DBPath];
    NSFileManager *filemanager=[NSFileManager defaultManager];
    
    if (![filemanager fileExistsAtPath:strDBPath]) {
        
        const char *dbpath=[strDBPath UTF8String];
        
        if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
            
            NSString *strQuery=@"create table student(id integer primary key autoincrement,name text,Address text,City text,rollno integer unique)";
            
            const char *createQuery=[strQuery UTF8String];
            char *error;
            if(sqlite3_exec(database, createQuery, NULL, NULL, &error)==SQLITE_OK){
                NSLog(@"DONE...");
                
                
                
            }else{
                NSString* string = [NSString stringWithFormat:@"%s" , error];
                

            
            NSLog(@"ALERT:-%@",string);
            }
            sqlite3_close(database);
            
            
        }
        
        
    }
    

}

-(BOOL)saveData:(NSString *)strName Address:(NSString *)address city:(NSString *)city rollno:(NSInteger)rollno{
    NSString *strPath=[self DBPath];
    const char *dbpath=[strPath UTF8String];
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        NSString *strInsertQuery=[NSString stringWithFormat:@"insert into student (name,Address,City,rollno) values('%@','%@','%@','%ld')",strName,address,city,(long)rollno];
        const char *InsertQuery=[strInsertQuery UTF8String];
        if (sqlite3_prepare_v2(database, InsertQuery, -1, &statement, NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_DONE) {
                return YES;
                
                
                
            }
        }
        sqlite3_close(database);
    }
    return NO;
}
-(NSArray*)FETCHDATA{
    NSString *strPath=[self DBPath];
    const char *dbpath=[strPath UTF8String];
   NSMutableArray *mutarray=[[NSMutableArray alloc]init];
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        NSString *strselectquery=@"select * from student";
        const char *selectquery=[strselectquery UTF8String];
        if (sqlite3_prepare_v2(database, selectquery, -1, &statement, NULL)==SQLITE_OK){
            
            
            
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
              
                NSString *strname=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                
                NSString *straddress=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                NSString *strCity=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
            
            NSInteger rollno=sqlite3_column_int(statement, 4);
                NSDictionary *dict=@{@"name":strname,@"address":straddress,@"city":strCity,@"rollno":[NSString stringWithFormat:@"%ld",(long)rollno]};
                [mutarray addObject:dict];
                
            }
        }
        sqlite3_close(database);
    }
    
    return [mutarray copy];
}
-(BOOL)Update:(NSString *)strName Address:(NSString *)address city:(NSString *)city rollno:(NSInteger)rollno{
    NSString *strPath=[self DBPath];
    const char *dbpath=[strPath UTF8String];
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        NSString *strUpdateQuery=[NSString stringWithFormat:@"UPDATE student SET  name ='%@', Address ='%@', City ='%@' WHERE rollno == '%ld' ",strName,address,city,(long)rollno];
        const char *UpdateQuery=[strUpdateQuery UTF8String];
        if (sqlite3_prepare_v2(database, UpdateQuery, -1, &statement, NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_DONE) {
            
            return YES;
            
                
                
            }
        }
        sqlite3_close(database);
    }
    return NO;
}
-(BOOL)DELETEDATA:(NSUInteger)rollno{
    NSString *strPath=[self DBPath];
    const char *dbpath=[strPath UTF8String];
    NSMutableArray *mutarray=[[NSMutableArray alloc]init];
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        NSString *strDeletequery=[NSString stringWithFormat:@"DELETE FROM student WHERE rollno == '%lu'",(unsigned long)rollno];
        const char *Deletequery=[strDeletequery UTF8String];
        if (sqlite3_prepare_v2(database, Deletequery, -1, &statement, NULL)==SQLITE_OK){
            
            
            
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                
                NSString *strname=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                
                NSString *straddress=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                NSString *strCity=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                
                NSInteger rollno=sqlite3_column_int(statement, 4);
                NSDictionary *dict=@{@"name":strname,@"address":straddress,@"city":strCity,@"rollno":[NSString stringWithFormat:@"%ld",(long)rollno]};
                [mutarray addObject:dict];
                
            }
        }
        sqlite3_close(database);
    }
    
    return [mutarray copy];
}
-(NSArray*)SEARCHDATA:(NSString*)strname{
    NSString *strPath=[self DBPath];
    const char *dbpath=[strPath UTF8String];
    NSMutableArray *mutarray=[[NSMutableArray alloc]init];
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        NSString *strselectquery=[NSString stringWithFormat:@"select * from student where name == '%@'",strname];
        const char *selectquery=[strselectquery UTF8String];
        if (sqlite3_prepare_v2(database, selectquery, -1, &statement, NULL)==SQLITE_OK){
            
            
            
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                
                NSString *strname=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                
                NSString *straddress=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                NSString *strCity=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                
                NSInteger rollno=sqlite3_column_int(statement, 4);
                NSDictionary *dict=@{@"name":strname,@"address":straddress,@"city":strCity,@"rollno":[NSString stringWithFormat:@"%ld",(long)rollno]};
                [mutarray addObject:dict];
                
            }
        }
        sqlite3_close(database);
    }
    
    return [mutarray copy];
}
@end
