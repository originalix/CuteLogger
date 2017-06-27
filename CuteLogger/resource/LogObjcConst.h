//
//  LogObjcConst.h
//  CuteLogger
//
//  Created by Lix on 2017/6/27.
//  Copyright © 2017年 Lix. All rights reserved.
//

#ifndef LogObjcConst_h
#define LogObjcConst_h

#define Cute_Debug(log) [[LogGenerator new] debugWithTargetClass:self.classForCoder content:[NSString stringWithFormat:@"%@", log] :(NSInteger)__LINE__ :[NSString stringWithFormat:@"%s", __FUNCTION__]];

#define Cute_Warning(log) [[LogGenerator new] warningWithTargetClass:self.classForCoder content:[NSString stringWithFormat:@"%@", log] :(NSInteger)__LINE__ :[NSString stringWithFormat:@"%s", __FUNCTION__]];

#define Cute_Info(log) [[LogGenerator new] infoWithTargetClass:self.classForCoder content:[NSString stringWithFormat:@"%@", log] :(NSInteger)__LINE__ :[NSString stringWithFormat:@"%s", __FUNCTION__]];

#define Cute_Error(log) [[LogGenerator new] errorWithTargetClass:self.classForCoder content:[NSString stringWithFormat:@"%@", log] :(NSInteger)__LINE__ :[NSString stringWithFormat:@"%s", __FUNCTION__]];

#endif /* LogObjcConst_h */
