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

#import "Notice_iphone.h"
#import "WebViewBoard_iPhone.h"
#import "AppBoard_iPhone.h"
#import "ServerConfig.h"
#import "NoticeModel.h"
#pragma mark -

@interface Notice_iphone()
{
}
@end

@implementation Notice_iphone

DEF_SIGNAL( SIGN_OUT )

- (void)load
{
	[super load];
    
    [[NoticeModel sharedInstance]addObserver:self];
    
    
    self.datas = [[[NSMutableArray alloc] init] autorelease];
    self.titles = [[[NSMutableArray alloc] init] autorelease];
    
    

    
    [[NoticeModel sharedInstance] update];
    
    self.selectedIndexPathes = [[[NSMutableArray alloc] init] autorelease];
    [self.selectedIndexPathes addObject:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)unload
{
    [[NoticeModel sharedInstance] removeObserver:self];

    
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
        self.titleString = __TEXT(@"topview_message");
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

	
	[self reloadData];
}


#pragma mark -

- (void)handleMessage:(BeeMessage *)msg
{
    //先屏蔽动态获取config的功能
      if ( [msg is:API.notice] )
      {
          if ( msg.sending )
          {
              //			[self presentLoadingTips:__TEXT(@"tips_loading")];
           }
        else if ( msg.succeed )
          {
            //			[self dismissTips];
              
              STATUS * status = msg.GET_OUTPUT( @"status" );
              if ( NO == status.succeed.boolValue )
              {
                  msg.failed = YES;
                  return;
              }
              NSDictionary *version = msg.GET_OUTPUT(@"content");
              NSString *versionStr = [version objectForKey:@"content"];
              
              FormElement *help2 =[[FormElement cell] retain];
              help2.title = __TEXT(versionStr);
//              FormElement *help2 =[[FormElement cell] retain];
//              help2.title = __TEXT(@"manage_help_detail1");
//              FormElement *help3 =[[FormElement cell] retain];
//              help3.title = __TEXT(@"manage_help_detail2");
//              FormElement *help4 =[[FormElement cell] retain];
//              help4.title = __TEXT(@"manage_help_detail3");
              
              
              
              NSArray *group2 =@[help2];
              
              
              
              
              
              [self.datas addObject:group2];
              [self.titles addObject:__TEXT(@"topview_message")];
              
              [self reloadData];
        }
           else if ( msg.failed )
           {
    		[ErrorMsg presentErrorMsg:msg inBoard:self];
           }
       }
}

#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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



@end
