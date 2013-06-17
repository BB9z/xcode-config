//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

___IMPORTHEADER_categoryClass___
#import "___VARIABLE_categoryClass:identifier___JSONObject.h"

extern NSString *const CDEN___VARIABLE_categoryClass:identifier___;

@interface ___VARIABLE_categoryClass:identifier___ (___VARIABLE_categoryName:identifier___)
+ (instancetype)entityWith<#identifier#>:(id)<#identifier#> creatIfNotExist:(BOOL)creatIfNotExist;

+ (instancetype)persistentJSONObject:(___VARIABLE_categoryClass:identifier___JSONObject *)JSONObject;

@end
