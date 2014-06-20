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

#import "ChangeRecord_iPhone.h"
#import "AppBoard_iPhone.h"
#import "model.h"
#import "ChangeRecordModel.h"

#pragma mark -

@interface ChangeRecord_iPhone()
{
	BeeUIScrollView * _scroll;
}
@end

#pragma mark -

@implementation ChangeRecord_iPhone

SUPPORT_RESOURCE_LOADING( YES )
SUPPORT_AUTOMATIC_LAYOUT( YES )

DEF_SINGLETON( ChangeRecord_iPhone )

- (void)load
{
	[[ChangeRecordModel sharedInstance] addObserver:self];
}

- (void)unload
{
	[[ChangeRecordModel sharedInstance] removeObserver:self];
}

#pragma mark -

ON_SIGNAL2( BeeUIBoard, signal )
{
	[super handleUISignal_BeeUIBoard:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        self.titleString = @"积分提现";
        //		[self showBarButton:BeeUINavigationBar.LEFT image:[UIImage imageNamed:@"nav-back.png"]];
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
	}
	else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
	{
	}
    else if ( [signal is:BeeUIBoard.LOAD_DATAS] )
    {
    }
    else if ( [signal is:BeeUIBoard.FREE_DATAS] )
    {
    }
    else if ( [signal is:BeeUIBoard.WILL_APPEAR] )
    {
        [self showNavigationBarAnimated:NO];
    }
    else if ( [signal is:BeeUIBoard.WILL_DISAPPEAR] )
    {
    }
}

ON_SIGNAL2( BeeUINavigationBar, signal )
{
	[super handleUISignal:signal];
    
	if ( [signal is:BeeUINavigationBar.LEFT_TOUCHED] )
	{
		[[AppBoard_iPhone sharedInstance] hideLogin];
	}
	else if ( [signal is:BeeUINavigationBar.RIGHT_TOUCHED] )
	{
		[self doLogin];
	}
}

ON_SIGNAL2( BeeUITextField, signal )
{
	[super handleUISignal:signal];
    
    if ( [signal is:BeeUITextField.RETURN] )
    {
		if ( $(@"username").focusing )
		{
			$(@"password").FOCUS();
            return;
		}
		else
		{
			[self doLogin];
		}
		
        [self.view endEditing:YES];
    }
}

ON_SIGNAL3( ChangeRecord_iPhone, signup, signal )
{
	if ( [signal is:BeeUIButton.TOUCH_UP_INSIDE] )
	{
		[self doLogin];
	}
}

- (void)doLogin
{
	NSString * userName = $(@"username").text.trim;
	NSString * password = $(@"password").text.trim;
    
    
    NSDateFormatter *fmtter =[[[NSDateFormatter alloc] init] autorelease];
    [fmtter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
    [fmtter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [fmtter setDateFormat:@"EEE"];
    NSString* dayString = [fmtter stringFromDate:[NSDate date]];
    if (![dayString hasPrefix:@"Fri"]) {
        [self presentMessageTips:@"只有周五才能兑换积分！"];
		return;
    }
    
    if(![self isPureInt:userName])
    {
        [self presentMessageTips:@"积分不是纯数字请重新输入"];
		return;
    }
	
	if ( 0 == userName.length  )
	{
		[self presentMessageTips:@"请输入您要兑换的积分"];
		return;
	}
    
    
	if ( 0 == password.length)
	{
		[self presentMessageTips:@"请输入您的账户信息"];
		return;
	}
    
	[[ChangeRecordModel sharedInstance]updatewithAmount:userName desc:password];
}

- (void)handleMessage:(BeeMessage *)msg
{
	if ( [msg is:API.changerecord] )
	{
		if ( msg.sending )
		{
			[self presentLoadingTips:__TEXT(@"signing_in")];
		}
		else
		{
			[self dismissTips];
		}
        
		if ( msg.succeed )
		{
            
             NSString *data = msg.GET_OUTPUT(@"data");
            [[AppBoard_iPhone sharedInstance] presentSuccessTips:data];

		}
		else if ( msg.failed )
		{
            //			[self presentFailureTips:@"登录失败，请稍后再试"];
			[ErrorMsg presentErrorMsg:msg inBoard:self];
		}
	}
}
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

@end
