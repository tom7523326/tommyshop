//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2013-2014, {Bee} open source community
//	http://www.bee-framework.com
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#import "Bee_Precompile.h"
#import "Bee_Foundation.h"
#import "Bee_Message.h"

#pragma mark -

@interface NSObject(BeeMessage)

@property (nonatomic, readonly) BeeMessageBlockN MSG;
@property (nonatomic, readonly) BeeMessageBlockN MSG_IF_NOT_SENDING;
@property (nonatomic, readonly) BeeMessageBlockN MSG_CANCEL_IF_SENDING;
@property (nonatomic, readonly) BeeMessageBlockN CANCEL_MSG;

- (BOOL)sendingMessage:(NSString *)msg;
- (void)cancelMessage:(NSString *)msg;
- (void)cancelMessages;

- (BeeMessage *)message:(NSString *)msg;
- (BeeMessage *)message:(NSString *)msg timeoutSeconds:(NSUInteger)seconds;

- (BeeMessage *)sendMessage:(NSString *)msg;
- (BeeMessage *)sendMessage:(NSString *)msg timeoutSeconds:(NSUInteger)seconds;

- (BOOL)prehandleMessage:(BeeMessage *)msg;
- (void)posthandleMessage:(BeeMessage *)msg;
- (void)handleMessage:(BeeMessage *)msg;

@end
