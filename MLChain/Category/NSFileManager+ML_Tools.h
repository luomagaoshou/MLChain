//
//  NSFileManager+ML_Tools.h
//  MLProject
//
//  Created by 妙龙赖 on 15/12/19.
//  Copyright © 2015年 妙龙赖. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, MLFileOperationType) {
    MLFileOperationTypeMoveToTrashWhenFileExists = 1,///<当文件存在时删除原文件并生成新文件 否则直接生成新文件
    MLFileOperationTypeNoOporationWhenFileExists = 1 << 1,///当文件存在时不操作
    MLFileOperationTypeFileByAppending = 1 << 2,///<当文件存在时在原文件结尾添加内容，否则直接生成新文件
};
@interface NSFileManager (ML_Tools)

+ (NSString *)macDeskTopDiretory;
+ (NSString *)macTrashDiretory;
- (BOOL)writefileString:(NSString *)fileString
     ToFileWithDiretory:(NSString *)diretory
                       fileName:(NSString *)fileName
                           fileType:(NSString *)fileType
      operationType:(MLFileOperationType)operationType;
- (void)clearFileContenWithDiretory:(NSString *)diretory
                            fileName:(NSString *)fileName
                            fileType:(NSString *)fileType;

@end
