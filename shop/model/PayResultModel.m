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

#import "PayResultModel.h"

#pragma mark -

@implementation PayResultModel

DEF_SINGLETON( PayResultModel )


- (void)load
{
	[super load];
	
	[self loadCache];
}

- (void)unload
{
	[self saveCache];
	
    
	[super unload];
}

#pragma mark -

- (void)loadCache
{
}

- (void)saveCache
{
}

- (void)clearCache
{
    
	self.loaded = NO;
}

#pragma mark -

- (void)updatewithorder_sn:(NSString *)order_sn
{
    //先屏蔽动态获取config的功能
	self.CANCEL_MSG( API.affirmPaid);
	self.MSG( API.affirmPaid )
    .INPUT( @"order_sn", order_sn) ;
}

#pragma mark -

- (void)handleMessage:(BeeMessage *)msg
{
    
	if ( [msg is:API.affirmPaid] )
	{
		if ( msg.succeed )
		{
            
            
            
		}
	}
}

@end
