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

#import "Helps_iphone.h"
#import "WebViewBoard_iPhone.h"
#import "AppBoard_iPhone.h"
#import "ServerConfig.h"

#pragma mark -

@interface Helps_iphone()
{
    FormElement * _pic1;
    FormElement * _pic2;
    FormElement * _pic3;
    FormElement * _rate;
    FormElement * _about;
    FormElement * _geek_zoo;
    FormElement * _bee;
    FormElement * _exit;
}
@end

@implementation Helps_iphone

DEF_SIGNAL( SIGN_OUT )

- (void)load
{
	[super load];
    
    self.datas = [[[NSMutableArray alloc] init] autorelease];
    self.titles = [[[NSMutableArray alloc] init] autorelease];
    
    
    FormElement *help1 =[[FormElement cell] retain];
    help1.title = __TEXT(@"manage_help_detail");
    FormElement *help2 =[[FormElement cell] retain];
    help2.title = __TEXT(@"manage_help_detail1");
    FormElement *help3 =[[FormElement cell] retain];
    help3.title = __TEXT(@"manage_help_detail2");
    FormElement *help4 =[[FormElement cell] retain];
    help4.title = __TEXT(@"manage_help_detail3");
    FormElement *help5 =[[FormElement cell] retain];
    help5.title = __TEXT(@"manage_help_detail4");
    FormElement *help6 =[[FormElement cell] retain];
    help6.title = __TEXT(@"manage_help_detail5");
    FormElement *help7 =[[FormElement cell] retain];
    help7.title = __TEXT(@"manage_help_detail6");
    FormElement *help8 =[[FormElement cell] retain];
    help8.title = __TEXT(@"manage_help_detail7");
    FormElement *help9 =[[FormElement cell] retain];
    help9.title = __TEXT(@"manage_help_detail8");
    FormElement *help10 =[[FormElement cell] retain];
    help10.title = __TEXT(@"manage_help_detail9");
    FormElement *help11 =[[FormElement cell] retain];
    help11.title = __TEXT(@"manage_help_detail10");
    FormElement *help12 =[[FormElement cell] retain];
    help12.title = __TEXT(@"manage_help_detail11");
    FormElement *help13 =[[FormElement cell] retain];
    help13.title = __TEXT(@"manage_help_detail12");
    FormElement *help14 =[[FormElement cell] retain];
    help14.title = __TEXT(@"manage_help_detail113");
    
    
    
    NSArray *group2 =@[help2,help3,help4,];
    NSArray *group3 =@[help6,help7];
    NSArray *group4 =@[help9,help10];
    NSArray *group6 =@[help12,help13];
    
    
    
    
    [self.datas addObject:group2];
    [self.titles addObject:__TEXT(@"manage_help_detail")];
    [self.datas addObject:group3];
    [self.titles addObject:__TEXT(@"manage_help_detail4")];
    [self.datas addObject:group4];
    [self.titles addObject:__TEXT(@"manage_help_detail7")];
    [self.datas addObject:group6];
    [self.titles addObject:__TEXT(@"manage_help_detail10")];
    
    
    
    self.selectedIndexPathes = [[[NSMutableArray alloc] init] autorelease];
    [self.selectedIndexPathes addObject:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)unload
{
    
	[_pic1 release];
	[_pic2 release];
	[_pic3 release];
	[_rate release];
	[_about release];
	[_exit release];
    [_bee release];
    
    [self.datas removeAllObjects];
    self.datas = nil;
    
    [self.selectedIndexPathes removeAllObjects];
	self.selectedIndexPathes = nil;
    
    [self.titles removeAllObjects];
    self.titles = nil;
    
	[super unload];
}

ON_SIGNAL2( BeeUIBoard, signal )
{
	[super handleUISignal_BeeUIBoard:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
        self.titleString = __TEXT(@"帮助");
        [self showNavigationBarAnimated:YES];
        [self hideBarButton:BeeUINavigationBar.RIGHT];
		
		[self observeNotification:UserModel.LOGIN];
		[self observeNotification:UserModel.LOGOUT];
		[self observeNotification:UserModel.KICKOUT];
		[self observeNotification:UserModel.UPDATED];
	}
    else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
        [self unobserveAllNotifications];
    }
    else if ( [signal is:BeeUIBoard.LOAD_DATAS] )
    {
		[self.selectedIndexPathes replaceObjectAtIndex:0
											withObject:[NSIndexPath indexPathForRow:[ConfigModel sharedInstance].photoMode
																		  inSection:0]];
    }
    else if ( [signal is:BeeUIBoard.WILL_APPEAR] )
    {
		[[AppBoard_iPhone sharedInstance] setTabbarHidden:YES];
//        [[ConfigModel sharedInstance] update];
		
		[self updateState];
    }
}

ON_SIGNAL2( BeeUINavigationBar, signal )
{
	[super handleUISignal:signal];
    
    if ( [signal is:BeeUINavigationBar.LEFT_TOUCHED] )
    {
        [self.stack popBoardAnimated:YES];
    }
    else if ( [signal is:BeeUINavigationBar.RIGHT_TOUCHED] )
    {
        // TODO
        [self.stack popBoardAnimated:YES];
    }
}

ON_SIGNAL2(  SettingBoard_iPhone, signal )
{
//    if ( [signal is:self.SIGN_OUT] )
//    {
//        [self signout];
//    }
}

//ON_SIGNAL2( signout_yes, signal )
//{
//	[super handleUISignal:signal];
//    
//    [[UserModel sharedInstance] signout];
//    
//    [[AppBoard_iPhone sharedInstance] showLogin];
//}


ON_NOTIFICATION3( UserModel, LOGIN, notification )
{
	[self updateState];
}

ON_NOTIFICATION3( UserModel, LOGOUT, notification )
{
	[self updateState];
}

ON_NOTIFICATION3( UserModel, KICKOUT, notification )
{
	[self updateState];
}

- (void)updateState
{
//	if ( [UserModel online] )
//	{
//		if ( self.datas.count >= 4 )
//		{
//			[self.datas removeObjectAtIndex:3];
//		}
//		
//		[self.datas addObject:@[_exit]];
//	}
//	else
//	{
//		if ( self.datas.count >= 4 )
//		{
//			[self.datas removeObjectAtIndex:3];
//		}
//	}
	
	[self reloadData];
}

//#pragma mark -
//
//- (void)signout
//{
//	BeeUIActionSheet * sheet = [BeeUIActionSheet spawn];
//	[sheet addButtonTitle:__TEXT(@"signout") signal:@"signout_yes"];
//	[sheet addCancelTitle:__TEXT(@"cancel")];
//	[sheet showInViewController:self];
//}

#pragma mark -

- (void)handleMessage:(BeeMessage *)msg
{
//先屏蔽动态获取config的功能
//    if ( [msg is:API.config] )
//    {
//        if ( msg.sending )
//        {
//            //			[self presentLoadingTips:__TEXT(@"tips_loading")];
//        }
//        else if ( msg.succeed )
//        {
//            //			[self dismissTips];
//            [self reloadData];
//        }
//        else if ( msg.failed )
//        {
//			[ErrorMsg presentErrorMsg:msg inBoard:self];
//        }
//    }
}

#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    FormElement * element = [[self.datas objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    
//	if ( 0 == indexPath.section )
//    {
//        if ( 0 == indexPath.row )
//        {
//			[ConfigModel sharedInstance].photoMode = ConfigModel.PHOTO_MODE_AUTO;
//			[[ConfigModel sharedInstance] saveCache];
//			
//			[self presentSuccessTips:__TEXT(@"switch_auto_mode")];
//        }
//        else if ( 1 == indexPath.row )
//        {
//			[ConfigModel sharedInstance].photoMode = ConfigModel.PHOTO_MODE_HIGH;
//			[[ConfigModel sharedInstance] saveCache];
//			
//			[self presentSuccessTips:__TEXT(@"switch_high_mode")];
//        }
//        else if ( 2 == indexPath.row )
//        {
//			[ConfigModel sharedInstance].photoMode = ConfigModel.PHOTO_MODE_LOW;
//			[[ConfigModel sharedInstance] saveCache];
//			
//			[self presentSuccessTips:__TEXT(@"switch_low_mode")];
//        }
//		
//		[self.selectedIndexPathes replaceObjectAtIndex:0
//											withObject:[NSIndexPath indexPathForRow:[ConfigModel sharedInstance].photoMode
//																		  inSection:0]];
//    }
//    else
//    {
//        if ( element == _rate )
//        {
//            NSString *	link = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=551560576";
//            NSURL *		url = [NSURL URLWithString:link];
//            
//            if ( [[UIApplication sharedApplication] canOpenURL:url] )
//            {
//                [[UIApplication sharedApplication] openURL:url];
//            }
//            else
//            {
//                [self presentFailureTips:__TEXT(@"cannot_open")];
//            }
//        }
//        else if ( element == _about )
//        {
//            WebViewBoard_iPhone * board = [WebViewBoard_iPhone board];
//            board.defaultTitle = __TEXT(@"setting_tech");
//            board.urlString = @"http://www.ecmobile.me/";
//            [self.stack pushBoard:board animated:YES];
//        }
//        else if ( element == _geek_zoo )
//        {
//            WebViewBoard_iPhone * board = [WebViewBoard_iPhone board];
//            board.defaultTitle = @"二维码";
//            board.urlString = [NSString stringWithFormat:@"%@client/client.html",
//                               [ServerConfig sharedInstance].url];
//            [self.stack pushBoard:board animated:YES];
//        }
//        else if ( element == _bee )
//        {
//            WebViewBoard_iPhone * board = [WebViewBoard_iPhone board];
//            board.defaultTitle = @"BeeFramework";
//            board.urlString = [NSString stringWithFormat:@"%@aboutus.html",[ServerConfig sharedInstance].url];
//            [self.stack pushBoard:board animated:YES];
//        }
//        
//    }
//    
//    [self reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FormCell * cell = (FormCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if ( 0 == indexPath.section )
    {
        if ( NSOrderedSame == [indexPath compare:[self.selectedIndexPathes objectAtIndex:indexPath.section]] )
        {
            cell.accessoryView.hidden = NO;
        }
        else
        {
            cell.accessoryView.hidden = YES;
        }
    }
    
    return cell;
}

- (void)openTelephone:(NSString *)telephone
{
    if ( telephone )
    {
        NSString * str = [[telephone componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@", str]];
        
        if ( [[UIApplication sharedApplication] canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url];
        }
        else
        {
            [self presentFailureTips:[NSString stringWithFormat:@"%@\n%@", __TEXT(@"cannot_call"), telephone]];
        }
    }
    else
    {
        [self presentFailureTips:__TEXT(@"cannot_call")];
    }
}

@end
