
#import "___FILEBASENAME___.h"
#import "DataStack.h"

NSString *const CDEN___VARIABLE_categoryClass:identifier___ = @"___VARIABLE_categoryClass:identifier___";

@implementation ___VARIABLE_categoryClass:identifier___ (___VARIABLE_categoryName:identifier___)

+ (instancetype)entityWith<#identifier#>:(id)<#identifier#> creatIfNotExist:(BOOL)creatIfNotExist {
    return [self objectWithValue:@(ssid) forKey:@keypathClassInstance(___VARIABLE_categoryClass:identifier___, <#identifier#>) inContext:[DataStack sharedInstance].managedObjectContext creatIfNotExist:creatIfNotExist];
}

+ (instancetype)persistentJSONObject:(___VARIABLE_categoryClass:identifier___JSONObject *)JSONObject {
    ___VARIABLE_categoryClass:identifier___ *obj = <#self#>
    return obj;
}

@end
