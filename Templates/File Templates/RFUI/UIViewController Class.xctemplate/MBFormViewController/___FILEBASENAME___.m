
#import "___FILEBASENAME___.h"
#import "API.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()
@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (BOOL)checkFields {
    // 其他检查

    return [super checkFields];
}

- (void)onSubmit:(id)sender {
    if (![self checkFields]) {
        return;
    }

    // 提交操作
}

@end
