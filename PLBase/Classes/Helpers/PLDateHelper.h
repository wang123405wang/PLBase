//
//  PLDateHelper.h
//  日期转换
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    PsdTimeStylePoint = 200,
    PsdTimeStyleSprit,
} PsdTimeStyle;

@interface DateHelper : NSObject


/**
 秒数转日期格式
 */
+ (NSDate *)toDate:(id)millisecond
       hasTimeZone:(BOOL)hasTimeZone;

+ (NSDate *)toDateWithLongTime:(long long int)millisecond;

/**
 * 获取友好的时间格式 格式：刚刚、1秒前、1分钟前、今天 12:00、昨天 12:00、05月16 12:00、2014年05月16日
 * @param date NSDate或毫秒数
 */
+ (NSString *)getTimeStr:(id)date;

/**
 * 获取友好的时间格式 格式：12:00、昨天 12:00、05-16 12:00、2014-05-16
 */
+ (NSString *)getTimeSimpleStr:(NSDate *)date;

/**
 * 获取友好的时间格式 12:00、 昨天 12:00、05/12 12:00、 2014/05/12 12:00
 */
+ (NSString *)getTimeStyle1:(id)date;

/**
 *  获取友好的时间格式 格式：刚刚、1秒前、1分钟前、1小时前 1天前 .. N天前
 *
 *  @param date
 *
 *  @return
 */
+ (NSString *)getTimeStyle2:(id)date;

/**
 * 获取友好的时间格式 格式：yyyy/MM/dd HH:mm
 */
+ (NSString *)getTimeStyle3:(id)date
                      style:(PsdTimeStyle)style;

/**
 * 获取友好的时间格式 格式：MM月dd日 HH:mm、yyyy年MM月dd日 HH:mm
 */
+ (NSString *)getTimeStyle4:(id)date;

/**
 * 获取友好的时间格式 格式：今天 HH:mm、明天 HH:mm 后天 HH:mm MM月dd日 HH:mm
 */
+ (NSString *)getTimeStyle5:(id)date;


/**
 获取当前时间 格式：HH:mm
 
 @param date
 @return
 */
+ (NSString *)getTimeStyle6:(id)date;

/**
 * 获取友好的日期格式
 * @param date NSDate或毫秒数
 */
+ (NSString *)getDateStr:(id)date
            showThisYear:(BOOL)showThisYear;

/**
 * 获取友好的日期格式 yyyy/MM/dd
 * @param date NSDate或毫秒数
 */
+ (NSString *)getDateStyle2:(id)date;

/**
 * 获取友好的日期格式 yyyy-MM-dd
 * @param date NSDate或毫秒数
 */
+ (NSString *)getDateStyle3:(id)date;

/**
 * 获取当前时间的毫秒数
 */
+ (long long)currentTimeMillis;

/**
 * 获取当前时间的毫秒数
 */
+ (NSString *)currentTimeMillisStr;

/**
 * 获取当前时间字符串，格式：yyyyMMddHHmmss
 */
+ (NSString *)currentTimeStyle1;

/**
 * 获取当前时间字符串，格式：yyyyMMdd
 */
+ (NSString *)currentTimeStyle2;


/**
 * 将日期转成毫秒数
 */
+ (NSString *)toMillisStr:(NSDate *)date;

/**
 * 将日期转成毫秒数
 */
+ (long long)toMillis:(NSDate *)date;

/**
 * 将日期转成字符串(yyyy-MM-dd HH:mm:ss)
 */
+ (NSString *)toString:(NSDate *)date;

/**
 将字符串转成时间(日期格式：yyyy-MM-dd HH:mm:ss)
 
 @param timeStr
 @return
 */
+ (NSDate *)stringToDate:(NSString *)timeStr;
+ (NSDate *)chineseDateStrToDate:(NSString *)timeStr;

/**
 * 获取当前日期
 */
+ (NSDate *)getNowDate;

/**
 * 增加指定天数
 */
+ (NSDate *)addDay:(NSDate *)date day:(NSInteger)day;

/**
 * 当前日期增加指定天数
 */
+ (NSDate *)addDay:(NSInteger)day;

/**
 * 当前日期增加指定年数
 */
+ (NSDate *)addYear:(NSDate *)date year:(NSInteger)year;

/**
 * 当前日期增加指定年数
 */
+ (NSDate *)addYear:(NSInteger)year;

/**
 * 两个日期相差秒数
 */
+ (int)differSeconds:(NSDate *)now other:(NSDate *)other;

/**
 距现在时间（格式为大于24小时为x天，小于则为x小时）
 系统时区
 @param millisecond
 @return
 */
+ (NSString *)getDayDistanceFromSecond:(id)millisecond;

/**
 * 判断是否为同一天
 */
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2;

+ (NSInteger)getAgeForDate:(id)date;

+ (NSString *)getCountDownString:(id)startTime;

+ (BOOL)isOverTime:(id)startTime;

/**
 *  将秒转成时间格式
 *
 *  @param seconds
 *
 *  @return
 */
+ (NSString *)toTimeString:(NSInteger)seconds;

/**
 视频发送时间间隔
 
 @param msgTime 消息时间
 
 @return 间隔天数
 */
+ (int)calcVideoLibItemOverTime:(NSDate *)msgTime;

+ (NSInteger)getHourForDate:(NSDate *)date;

+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

/**
 获取今年
 
 @return 整形年
 */
+ (NSInteger)getThisYear;

+ (NSDictionary *)sepDate:(id)date;

/**
 获取今年yyyy年MM月dd日,HH:mm:ss
 */
+ (NSString *)getTimeStyle7:(id)date;

/** 获取当前时间戳 转换成秒 */
+(NSString *)getNowTimeTimestamp;

@end

