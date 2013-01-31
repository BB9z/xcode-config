
#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()
@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (id)init {
    self = [super init];
    if (self) {
        [self onInit];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self onInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self onInit];
    }
    return self;
}

- (void)onInit {
    // Initialization code
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        // Do something
    }
}

- (void)dealloc {
    // Clear
}

@end
