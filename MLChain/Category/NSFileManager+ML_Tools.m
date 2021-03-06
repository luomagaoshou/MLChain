//
//  NSFileManager+ML_Tools.m
//  MLProject
//
//  Created by 妙龙赖 on 15/12/19.
//  Copyright © 2015年 妙龙赖. All rights reserved.
//

#import "NSFileManager+ML_Tools.h"

@implementation NSFileManager (ML_Tools)
+ (NSString *)macDeskTopDiretory
{
    
    NSString *userDiretory = [NSFileManager userDiretory];
    
      NSString *macDeskTopDiretory = [userDiretory stringByAppendingPathComponent:@"Desktop"];
    return macDeskTopDiretory;
    
        
}
+ (NSString *)macTrashDiretory
{
    NSString *userDiretory = [NSFileManager userDiretory];
    NSString *macTrashDiretory = [userDiretory stringByAppendingPathComponent:@".Trash"];
    return macTrashDiretory;
}
+ (NSString *)userDiretory
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask, YES);
    
    NSString *userDiretory = [paths objectAtIndex:0];
    return [userDiretory substringToIndex:[userDiretory rangeOfString:@"/Library/Developer/"].location];
}
- (BOOL)writefileString:(NSString *)fileString
     ToFileWithDiretory:(NSString *)diretory
               fileName:(NSString *)fileName
               fileType:(NSString *)fileType
          operationType:(MLFileOperationType)operationType
{
    NSString *filePath = [NSFileManager ml_filePathWithDiretory:diretory fileName:fileName fileType:fileType];
    if (![[NSFileManager defaultManager] fileExistsAtPath:diretory]) {
       BOOL res = [[NSFileManager defaultManager] createDirectoryAtPath:diretory withIntermediateDirectories:YES attributes:nil error:nil];
        if (res) {
            NSLog(@"%@路径创建成功", diretory);
        }
        else
        {
            NSLog(@"%@路径创建失败", diretory);

        }
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        if (operationType == MLFileOperationTypeMoveToTrashWhenFileExists
            || operationType == MLFileOperationTypeFileByAppending) {

            
            if (operationType == MLFileOperationTypeMoveToTrashWhenFileExists) {
              BOOL res = [self deleteFileWithDiretory:diretory fileName:fileName fileType:fileType];
                if (res) {
                    NSLog(@"%@", [NSString stringWithFormat:@"%@.%@ 已移到废纸篓", fileName, fileType]);
                    
                    BOOL res = [fileString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
                    if (res) {
                        NSLog(@"%@", [NSString stringWithFormat:@"%@.%@ 生成成功\n路径:\n%@", fileName, fileType, filePath]);
                        return res;
                    }
                    
                }
              
            } else if (operationType == MLFileOperationTypeFileByAppending) {
                NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
                [fileHandle seekToEndOfFile];
                NSData *buffer = [fileString dataUsingEncoding:NSUTF8StringEncoding];
                [fileHandle writeData:buffer];
                [fileHandle closeFile];
            }
           
         
        }
        else
        {
         
            NSLog(@"%@", [NSString stringWithFormat:@"%@.%@ 已存在", fileName, fileType]);
            return NO;
        }
    }
    else
    {
        BOOL res = [fileString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if (res) {
            NSLog(@"%@", [NSString stringWithFormat:@"%@.%@ 生成成功\n路径:\n%@", fileName, fileType, filePath]);
            return res;
        }
    }
   
    return NO;
}

- (void)clearFileContentWithDiretory:(NSString *)diretory
                            fileName:(NSString *)fileName
                            fileType:(NSString *)fileType {
    NSString *filePath;
    if ([diretory hasSuffix:@"/"]) {
        filePath  = [diretory stringByAppendingFormat:@"%@.%@",fileName, fileType];
    } else {
        filePath = [diretory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",fileName, fileType]];
    }
    [@"" writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];


}
- (BOOL)deleteFileWithDiretory:(NSString *)diretory fileName:(NSString *)fileName fileType:(NSString *)fileType {
    NSString *macTrashDiretory = [NSFileManager macTrashDiretory];
               NSString *dateStr = [self _ml_currentTimerSting];
    NSString *targetPath = [macTrashDiretory stringByAppendingFormat:@"/%@%@.%@", fileName, dateStr, fileType];
     NSString *filePath = [NSFileManager ml_filePathWithDiretory:diretory fileName:fileName fileType:fileType];
    BOOL res =[[NSFileManager defaultManager] moveItemAtPath:filePath toPath:targetPath error:nil];
    
    return res;
    
}
+ (NSString *)ml_filePathWithDiretory:(NSString *)diretory fileName:(NSString *)fileName fileType:(NSString *)fileType {
    NSString *filePath;
    if ([diretory hasSuffix:@"/"]) {
        filePath  = [diretory stringByAppendingFormat:@"%@.%@",fileName, fileType];
    } else {
        filePath = [diretory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",fileName, fileType]];
    }
    return filePath;
}
- (NSString *)_ml_currentTimerSting {
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:timeZone];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    return dateStr;
}
@end
