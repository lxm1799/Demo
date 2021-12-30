//
//  Dog.h
//  RuntimeDemo
//
//  Created by luckyBoy on 2021/2/3.

#import <Foundation/Foundation.h>



@interface Dog : NSObject

-(void)eat;

-(void)run;

@end



@interface Dog(Add)

@property(nonatomic,copy)NSString *name;

@end



