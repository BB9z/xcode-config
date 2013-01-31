
#import "___FILEBASENAME___.h"
#import "DataStack.h"

@implementation ___VARIABLE_categoryClass:identifier___ (___VARIABLE_categoryName:identifier___)

+ (___VARIABLE_categoryClass:identifier___ *)entityWithUID:(int)uid creatIfNotExist:(BOOL)creatIfNotExist {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CDEN___VARIABLE_categoryClass:identifier___];
    request.predicate = [NSPredicate predicateWithFormat:@"uid = %d", uid];
    
    NSError *e = nil;
    NSArray *results = [[DataStack sharedInstance].context executeFetchRequest:request error:&e];
    if (e) dout_error(@"%@", e);
    
    if (results.count == 1) {
        return [results firstObject];
    }
    else if (results.count == 0) {
        if (creatIfNotExist) {
            ___VARIABLE_categoryClass:identifier___ *obj = [NSEntityDescription insertNewObjectForEntityForName:CDEN___VARIABLE_categoryClass:identifier___ inManagedObjectContext:[DataStack sharedInstance].context];
            obj.uid = uid;
        }
    }
    else {
        RFAssert(false, @"存在多个UID相同的Entity");
    }
    return nil;
}

@end
