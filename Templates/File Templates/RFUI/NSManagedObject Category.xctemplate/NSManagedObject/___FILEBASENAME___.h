//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

___IMPORTHEADER_categoryClass___

extern NSString *const CDEN___VARIABLE_categoryClass:identifier___;

@interface ___VARIABLE_categoryClass:identifier___ (___VARIABLE_categoryName:identifier___)
+ (___VARIABLE_categoryClass:identifier___ *)entityWithUID:(int)uid creatIfNotExist:(BOOL)creatIfNotExist;

+ (___VARIABLE_categoryClass:identifier___ *)persistentJSONObject:(___VARIABLE_categoryClass:identifier___JSONObject *)JSONObject;

@end
