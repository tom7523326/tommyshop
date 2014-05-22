/*
 *                                                                          
 *       _/_/_/                      _/        _/_/_/_/_/                     
 *    _/          _/_/      _/_/    _/  _/          _/      _/_/      _/_/    
 *   _/  _/_/  _/_/_/_/  _/_/_/_/  _/_/          _/      _/    _/  _/    _/   
 *  _/    _/  _/        _/        _/  _/      _/        _/    _/  _/    _/    
 *   _/_/_/    _/_/_/    _/_/_/  _/    _/  _/_/_/_/_/    _/_/      _/_/       
 *                                                                          
 *
 *  Copyright 2013-2014, Geek Zoo Studio
 *  http://www.ecmobile.cn/license.html
 *
 *  HQ China:
 *    2319 Est.Tower Van Palace 
 *    No.2 Guandongdian South Street 
 *    Beijing , China
 *
 *  U.S. Office:
 *    One Park Place, Elmira College, NY, 14901, USA
 *
 *  QQ Group:   329673575
 *  BBS:        bbs.ecmobile.cn
 *  Fax:        +86-10-6561-5510
 *  Mail:       info@geek-zoo.com
 */

#import "ConfigModel.h"

#pragma mark -

@implementation ConfigModel

DEF_SINGLETON( ConfigModel )

DEF_NOTIFICATION( UPDATED )

DEF_NOTIFICATION( SHOP_OPENED )
DEF_NOTIFICATION( SHOP_CLOSED )

DEF_INT( PHOTO_MODE_AUTO,	0 )
DEF_INT( PHOTO_MODE_HIGH,	1 )
DEF_INT( PHOTO_MODE_LOW,	2 )

@synthesize config = _config;
@synthesize photoMode = _photoMode;

- (void)load
{
	[super load];
	
	[self loadCache];
}

- (void)unload
{
	[self saveCache];
	
	self.config = nil;

	[super unload];
}

#pragma mark -

- (void)loadCache
{
	self.config = [CONFIG readFromUserDefaults:@"ConfigModel.config"];
	self.photoMode = [[self userDefaultsRead:@"ConfigModel.photoMode"] integerValue];
}

- (void)saveCache
{
	[self.config saveToUserDefaults:@"ConfigModel.config"];
	[self userDefaultsWrite:__INT(self.photoMode) forKey:@"ConfigModel.photoMode"];
}

- (void)clearCache
{
	self.config = nil;
	self.photoMode = self.PHOTO_MODE_AUTO;

	self.loaded = NO;
}

#pragma mark -

- (void)update
{
    //先屏蔽动态获取config的功能
	self.CANCEL_MSG( API.config );
	self.MSG( API.config );
}

#pragma mark -

- (void)handleMessage:(BeeMessage *)msg
{
   
	if ( [msg is:API.config] )
	{
		if ( msg.succeed )
		{
			STATUS * status = msg.GET_OUTPUT( @"status" );
			if ( NO == status.succeed.boolValue )
			{
				msg.failed = YES;
				return;
			}
            NSDictionary *version = msg.GET_OUTPUT(@"version");
            NSString *versionStr = [version objectForKey:@"version"];
            
            //获取本程序的版本号
            NSString *nowversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
            if(nowversion.floatValue < versionStr.floatValue)
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"有新版本可以升级，是否升级" delegate:self cancelButtonTitle:@"升级" otherButtonTitles:@"取消",nil];
                [alert show];
                [alert release];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已经是最新版本 不用升级" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
                [alert release];
            }
            
 //先屏蔽动态获取config的功能
//			self.config = msg.GET_OUTPUT( @"config" );
//			self.loaded = YES;
			
//			[self saveCache];
//			[self postNotification:self.UPDATED];
			
//			if ( self.config.shop_closed.boolValue )
//			{
//				[self postNotification:self.SHOP_CLOSED];
//			}
//			else
//			{
//				[self postNotification:self.SHOP_OPENED];
//			}
		}
	}
}

@end
