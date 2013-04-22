
#import "___FILEBASENAME___.h"
#import "DataStack.h"

NSString *const CDEN___VARIABLE_categoryClass:identifier___ = @"___VARIABLE_categoryClass:identifier___";

@implementation ___VARIABLE_categoryClass:identifier___ (___VARIABLE_categoryName:identifier___)

+ (___VARIABLE_categoryClass:identifier___ *)entityWithUID:(int)uid creatIfNotExist:(BOOL)creatIfNotExist {
    ___VARIABLE_categoryClass:identifier___ *this;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CDEN___VARIABLE_categoryClass:identifier___];
    request.predicate = [NSPredicate predicateWithFormat:@"%K = %d", @keypath(this, uid), uid];
    
    NSError __autoreleasing *e = nil;
    NSArray *results = [[DataStack sharedInstance].managedObjectContext executeFetchRequest:request error:&e];
    if (e) dout_error(@"%@", e);
    
    if (results.count == 1) {
        return [results firstObject];
    }
    if (results.count == 0 && creatIfNotExist) {
        ___VARIABLE_categoryClass:identifier___ *obj = [NSEntityDescription insertNewObjectForEntityForName:CDEN___VARIABLE_categoryClass:identifier___ inManagedObjectContext:[DataStack sharedInstance].managedObjectContext];
            obj.uid = uid;
        return obj;
    }
    
    RFAssert(false, @"存在多个UID相同的Entity");
    return nil;
}

+ (___VARIABLE_categoryClass:identifier___ *)persistentJSONObject:(___VARIABLE_categoryClass:identifier___JSONObject *)JSONObject {
    ___VARIABLE_categoryClass:identifier___ *obj = <#self#>
    return obj;
}

@end
