//
//  ViewController.m
//  RuntimeDemo
//
//  Created by luckyBoy on 2021/2/3.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Dog.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///
    [self test1];
    [self creatTestClass];
    
    
}



-(void)test1{
    
    Dog *dog = [Dog new];
    [dog eat];

    dog.name = @"大黄";
    NSLog(@"name == %@",dog.name);
    
    [dog run];
}



#pragma mark------------------动态创建一个类-----------------------

-(void)creatTestClass{
    
    Class testClass = objc_allocateClassPair([NSObject class], "Person", 0);
//    class_addIvar(testClass, "_name", 16, 16, @encode(NSString));
    class_addIvar(testClass, "age", 4, 1, @encode(int));
    class_addMethod(testClass, @selector(readStr), (IMP)read, "v@:");
    objc_registerClassPair(testClass);
    
    id person = [testClass new];
    [person setValue:@(18) forKey:@"age"];
    [person readStr];
//    [person setValue:@"小明" forKey:@"_name"];
    
    NSLog(@"age == %ld",[[person valueForKey:@"age"] integerValue]);
    
}


-(void)readStr{
    NSLog(@"我在读书中ing");
}

@end
