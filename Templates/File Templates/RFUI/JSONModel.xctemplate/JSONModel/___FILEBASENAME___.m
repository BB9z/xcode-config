
#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

+ (JSONKeyMapper *)keyMapper {
    ___FILEBASENAMEASIDENTIFIER___ *this;
    return [[JSONKeyMapper alloc] initWithDictionary:@{
        @"id": @keypath(this, uid),
    }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
