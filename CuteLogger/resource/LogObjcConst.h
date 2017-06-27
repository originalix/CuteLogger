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

#endif /* LogObjcConst_h */
