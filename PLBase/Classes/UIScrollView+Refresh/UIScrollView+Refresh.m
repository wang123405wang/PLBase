//
//  UIScrollView+Refresh.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
/** 添加脚部自动刷新 */
- (void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
}
/** 添加脚步返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}
/** 结束头部刷新 */
- (void)endHeaderRefresh{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.mj_header endRefreshing];
    }];
}
/** 结束脚部刷新 */
- (void)endFooterRefresh{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.mj_footer endRefreshing];
    }];
}
/** 开始头部刷新 */
- (void)beginHeaderRefresh{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.mj_header beginRefreshing];
    }];
}
/** 开始脚部刷新 */
- (void)beginFooterRefresh{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.mj_footer beginRefreshing];
    }];
}

/** 结束脚步刷新并设置没有更多数据 */
- (void)endFooterRefreshWithNoMoreData{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.mj_footer endRefreshingWithNoMoreData];
    }];
}

@end
