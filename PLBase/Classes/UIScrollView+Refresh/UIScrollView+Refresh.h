//
//  UIScrollView+Refresh.h
//  视图刷新
//
//  Created by wang123405wang on 11/18/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MJRefreshComponentRefreshingBlock)(void);

@interface UIScrollView (Refresh)

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block;

/** 添加脚部自动刷新 */
- (void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block;

/** 添加脚步返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block;

/** 结束头部刷新 */
- (void)endHeaderRefresh;

/** 结束脚部刷新 */
- (void)endFooterRefresh;

/** 开始头部刷新 */
- (void)beginHeaderRefresh;

/** 开始脚部刷新 */
- (void)beginFooterRefresh;

/** 结束脚步刷新并设置没有更多数据 */
- (void)endFooterRefreshWithNoMoreData;

@end

NS_ASSUME_NONNULL_END
