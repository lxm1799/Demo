//
//  Dog.m
//  RuntimeDemo
//


#import "Dog.h"
#import <objc/runtime.h>
#import <objc/message.h>

#import "Cat.h"


@implementation Dog


-(void)eat{
    NSLog(@"这是一条🐶🐶");
}

@end








@implementation Dog (Add)


#pragma mark------------------方法交换-----------------------
///动态替换方法
+(void)load{
    
    Method method    = class_getInstanceMethod([self class], @selector(eatPrint));
    
    Method lodMethod = class_getInstanceMethod([self class], @selector(eat));
    
    method_exchangeImplementations(lodMethod,method);

}

///替换方法的实现
-(void)eatPrint{
    NSLog(@"这是一条分类的🐶🐶");
}


#pragma mark------------------关联对象-----------------------
static const char*kNameKey = "kNameKey"; ///一定是c语言的字符串

-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, kNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)name{
    return objc_getAssociatedObject(self, kNameKey);
}


#pragma mark------------------消息转发-----------------------


//  第一步，消息接收者没有找到对应的方法时候，会先调用此方法，可在此方法实现中动态添加新的方法
//  返回YES表示相应selector的实现已经被找到，或者添加新方法到了类中，否则返回NO
-(BOOL)respondsToSelector:(SEL)aSelector{
    
    return YES;
}


//  第二步， 如果第一步的返回NO或者直接返回了YES而没有添加方法，该方法被调用
//  在这个方法中，我们可以指定一个可以返回一个可以响应该方法的对象， 注意如果返回self就会死循环

-(id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector) {
//        return [super forwardingTargetForSelector:aSelector];
//    }else{
//
//    }
    return [Cat new];
}





@end
