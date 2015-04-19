//
//  main.m
//  ClassAct
//
//  Created by Alexander Kudryashov on 16.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "BNRTowel.h"

NSArray *BNRHierarchyForClass(Class cls) {
    NSMutableArray *classHierarchy = [NSMutableArray array];
    for (Class c = cls; c != nil; c = class_getSuperclass(c)) {
        NSString *className = NSStringFromClass(c);
        [classHierarchy insertObject:className atIndex:0];
    }
    
    return classHierarchy;
}

NSArray *BNRMethodsForClass(Class cls) {
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(cls, &methodCount);
    NSMutableArray *methodArray = [NSMutableArray array];
    
    for (int m = 0; m < methodCount; m++) {
        Method currentMethod = methodList[m];
        SEL methodSelector = method_getName(currentMethod);
        [methodArray addObject:NSStringFromSelector(methodSelector)];
    }
    
    return methodArray;
}

NSArray *BNRIvarsForClass(Class cls) {
    unsigned int ivarCount = 0;
    Ivar *ivarList = class_copyIvarList(cls, &ivarCount);
    NSMutableArray *ivarArray = [NSMutableArray array];
    
    for (int i = 0; i < ivarCount; i++) {
        Ivar currentIvar = ivarList[i];
        const char *name = ivar_getName(currentIvar);
        [ivarArray addObject:[NSString stringWithCString:name encoding:NSASCIIStringEncoding]];
    }
    
    return ivarArray;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRTowel *myTowel = [BNRTowel new];
        [myTowel addObserver:nil
                  forKeyPath:@"location"
                     options:NSKeyValueObservingOptionNew
                     context:NULL];
        
        NSMutableArray *runtimeClassInfo = [NSMutableArray array];
        
        unsigned int classCount = 0;
        Class *classList = objc_copyClassList(&classCount);
        for (int i = 0; i < classCount; i++) {
            Class currentClass = classList[i];

            NSString *className = NSStringFromClass(currentClass);
            NSArray *hierarchy = BNRHierarchyForClass(currentClass);
            NSArray *methods = BNRMethodsForClass(currentClass);
            NSArray *ivars = BNRIvarsForClass(currentClass);
            
            NSDictionary *classInfoDict = @{@"className": className,
                                            @"hierarchy": hierarchy,
                                            @"methods": methods,
                                            @"ivars": ivars};
            
            [runtimeClassInfo addObject:classInfoDict];
        }
        free(classList);
        
        NSSortDescriptor *alphaAsc = [NSSortDescriptor sortDescriptorWithKey:@"className"
                                                                   ascending:YES];
        NSArray *sortedArray = [runtimeClassInfo sortedArrayUsingDescriptors:@[alphaAsc]];
        NSLog(@"There are %ld classes registered in the runtime for this program", sortedArray.count);
        NSLog(@"%@", sortedArray);
        
        [myTowel removeObserver:nil forKeyPath:@"location"];
    }
    return 0;
}
