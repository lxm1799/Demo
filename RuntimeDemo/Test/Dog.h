

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject

-(void)eat;

-(void)run;

@end



@interface Dog(Add)

@property(nonatomic,copy)NSString *name;

@end


NS_ASSUME_NONNULL_END
