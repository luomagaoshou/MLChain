//
//  NSObject+CreateCode.h
//  LotterySteward
//
//  Created by apple on 15/11/5.
//  Copyright © 2015年 ytx. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface MLCCreateCodeModel:NSObject
@property (nonatomic, copy) NSString *className;//
@property (nonatomic, copy) NSString *superclassName;//
- (NSString *)endString;
//h文件
- (NSString *)hFileTopString;
//添加除自身类及父类的头文件名
@property (nonatomic, copy) NSArray *hFileImportFileNames;//
- (NSString *)hFileImportString;
- (NSString *)hFileInterfaceString;
@property (nonatomic, copy) NSString *hFileContentString;//

//protocol
@property (nonatomic, copy) NSArray *superProtocolNames;
@property (nonatomic, copy) NSString *protocolName;
@property (nonatomic, copy) NSString *protocolContentString;
@property (nonatomic, copy) NSArray *protocolsToConform;


//m文件
- (NSString *)mFileTopString;
//添加除自身类及父类的头文件名
@property (nonatomic, copy) NSArray *mFileImportFileNames;//
@property (nonatomic, copy) NSString *mFileStringBeforeImplementation;
@property (nonatomic, copy) NSString *mFileStringAfterEnd;
- (NSString *)mFileImportString;
- (NSString *)mFileImplementationString;

@property (nonatomic, copy) NSString *mFileContentString;//

//结果
- (NSString *)protocolResultString;
- (NSString *)hFileResultString;
- (NSString *)mFileResultString;

- (NSString *)fileName;
@property (nonatomic, copy) NSString *typedefString;
@property (nonatomic, copy) NSString *classDeclearString;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, assign) BOOL shouldImportSelfClass;
@property (nonatomic, assign) BOOL shouldImportSuperClass;
+ (instancetype)modelWithClassName:(NSString *)className
                    superclassName:(NSString *)superclassName
              hFileImportFileNames:(NSArray *)hFileImportFileNames
                hFileContentString:(NSString *)hFileContentString
              mFileImportFileNames:(NSArray *)mFileImportFileNames
                mFileContentString:(NSString *)mFileContentString
                        moreConfig:(void(^)(MLCCreateCodeModel *modelOfSelf))moreConfigBlock;

@end


extern NSString *const kML_CreateCodeFileType_h;
extern NSString *const kML_CreateCodeFileType_m;

@interface NSObject (CreateCode)


//未完成
+ (NSString *)ML_createPropertyStringWithClass:(Class)aClass;

#pragma mark - ========= View =========
+ (NSString *)ML_createViewCodeWithClass:(Class)aClass;
+ (NSString *)ML_createViewCodeWithClass:(Class)aClass isOutPutToDeskTop:(BOOL)isOutPutToDeskTop;

+ (NSString *)ML_createInitStringWithClass:(Class)aClass;
+ (NSString *)ML_createLayoutStringWithClass:(Class)aClass;
+ (NSString *)ML_createEventMothodString;
+ (NSString *)ML_createGetterMethodStringWithClass:(Class)aClass;


#pragma mark - ========= Xib =========
+ (NSString *)ML_createXibViewInitHelperWithClass:(Class)aClass;
+ (NSString *)ML_createXibViewInitHelperWithClass:(Class)aClass isOutPutToDeskTop:(BOOL)isOutPutToDeskTop;

#pragma mark - ========= Method =========


/**
 *  生成h或m文件的介绍
 *
 *  @param className 类名
 *  @param fileType  文件类型h或m
 *  @param content   内容
 *
 *  @return <#return value description#>
 */
+ (NSString *)ml_hFileOrMFileTopIntroduceWithClassName:(NSString *)className fileType:(NSString *)fileType;


@end
