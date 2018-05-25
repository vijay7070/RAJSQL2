//
//  DBManager.h
//  RAJSQL2
//
//  Created by Student P_08 on 12/08/17.
//  Copyright © 2017 RAJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject
+(DBManager *)getInstance;
-(void)createDB;
-(BOOL)saveData:(NSString *)strName Address:(NSString *)address city:(NSString *)city rollno:(NSInteger)rollno;
-(NSArray*)FETCHDATA;
-(BOOL)Update:(NSString *)strName Address:(NSString *)address city:(NSString *)city rollno:(NSInteger)rollno;
-(BOOL)DELETEDATA:(NSUInteger)rollno;
-(NSArray*)SEARCHDATA:(NSString*)strname;
@end
