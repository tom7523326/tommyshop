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

#import "Bee_FileCache.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

DEF_PACKAGE( BeePackage_System, BeeFileCache, fileCache );

#pragma mark -

@interface BeeFileCache()
{
	NSString *	_cachePath;
	NSString *	_cacheUser;
}
@end

#pragma mark -

@implementation BeeFileCache

@synthesize cachePath = _cachePath;
@synthesize cacheUser = _cacheUser;

DEF_SINGLETON( BeeFileCache );

- (id)init
{
	self = [super init];
	if ( self )
	{
		self.cacheUser = @"";
		self.cachePath = [NSString stringWithFormat:@"%@/%@/Cache/", [BeeSandbox libCachePath], [BeeSystemInfo appVersion]];
	}
	return self;
}

- (void)dealloc
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];

	self.cachePath = nil;
	self.cacheUser = nil;
	
	[super dealloc];
}

- (NSString *)fileNameForKey:(NSString *)key
{
	NSString * pathName = nil;
	if ( self.cacheUser && [self.cacheUser length] )
	{
		pathName = [self.cachePath stringByAppendingFormat:@"%@/", self.cacheUser];
	}
	else
	{
		pathName = self.cachePath;
	}
	
	if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:pathName] )
	{
		[[NSFileManager defaultManager] createDirectoryAtPath:pathName
								  withIntermediateDirectories:YES
												   attributes:nil
														error:NULL];
	}

	return [pathName stringByAppendingString:key];
}

- (BOOL)hasObjectForKey:(id)key
{
	return [[NSFileManager defaultManager] fileExistsAtPath:[self fileNameForKey:key]];
}

- (id)objectForKey:(id)key
{
	NSData * data = [NSData dataWithContentsOfFile:[self fileNameForKey:key]];
	if ( data )
	{
		return [self unserialize:data];
	}
	
	return nil;
}

- (void)setObject:(id)object forKey:(id)key
{
	if ( nil == object )
	{
		[self removeObjectForKey:key];
	}
	else
	{
		NSData * data = nil;
		
		if ( [object isKindOfClass:[NSData class]] )
		{
			data = (NSData *)object;
		}
		else
		{
			data = [self serialize:object];
		}
		
		[data writeToFile:[self fileNameForKey:key]
				  options:NSDataWritingAtomic
					error:NULL];
	}
}

- (void)removeObjectForKey:(NSString *)key
{
	[[NSFileManager defaultManager] removeItemAtPath:[self fileNameForKey:key] error:nil];
}

- (void)removeAllObjects
{
	[[NSFileManager defaultManager] removeItemAtPath:_cachePath error:NULL];
	[[NSFileManager defaultManager] createDirectoryAtPath:_cachePath
							  withIntermediateDirectories:YES
											   attributes:nil
													error:NULL];
}

- (NSData *)serialize:(id)obj
{
	if ( [obj isKindOfClass:[NSData class]] )
		return obj;
	
	if ( [obj respondsToSelector:@selector(JSONData)] )
		return [obj JSONData];
	
	return nil;
}

- (id)unserialize:(NSData *)data
{
	return [data objectFromJSONData];
}

- (id)objectForKeyedSubscript:(id)key
{
	return [self objectForKey:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id)key
{
	[self setObject:obj forKey:key];
}

@end

// ----------------------------------
// Unit test
// ----------------------------------

#pragma mark -

#if defined(__BEE_UNITTEST__) && __BEE_UNITTEST__

TEST_CASE( BeeFileCache )
{
	// TODO:
}
TEST_CASE_END

#endif	// #if defined(__BEE_UNITTEST__) && __BEE_UNITTEST__
