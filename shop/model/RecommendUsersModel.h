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

#import "Bee.h"
#import "ecmobile.h"
#import "BaseModel.h"

#pragma mark -

@interface RecommendUsersModel : SinglePageModel

AS_SINGLETON( RecommendUsersModel )

@property (nonatomic, assign) NSInteger         level;
@property (nonatomic, retain) ADDRESS *         address;
@property (nonatomic, retain) ADDRESS *         tempAddress;
@property (nonatomic, retain) NSNumber *        parent_id;
@property (nonatomic, retain) NSMutableArray *  regions;

- (void)clearTempRegion;
- (void)clearRegion;

- (BOOL)isValid;
- (NSString *)region;
- (void)setRegionFromAddress:(ADDRESS *)address;
+ (NSString *)regionFromAddress:(ADDRESS *)address;

@end
