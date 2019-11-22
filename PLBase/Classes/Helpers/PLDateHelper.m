//
//  PLDateHelper.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "PLDateHelper.h"

static const NSInteger kOneDayHours = 24;
static const NSInteger kOneHourSeconds = 3600;

@interface PLDateHelper ()

@end

@implementation PLDateHelper

+ (NSDate *)toDate:(id)millisecond
       hasTimeZone:(BOOL)hasTimeZone
{
    if (millisecond == nil) {
        return nil;
    }
    NSDate *tempDate = [NSDate dateWithTimeIntervalSince1970:[self getTimeInterval:millisecond]];
    if (hasTimeZone) {
        tempDate = [self addTimeZoneWithDate:tempDate];
    }
    return tempDate;
}

+ (NSDate *)toDateWithLongTime:(long long)millisecond
{
    return [NSDate dateWithTimeIntervalSince1970:millisecond / 1000];
}

+ (NSTimeInterval)getTimeInterval:(id)millisecond
{
    long long value = [[NSString stringWithFormat:@"%@", millisecond] longLongValue];
    return value / 1000;
}

+ (NSString *)getTimeStr:(id)date
{
    if (date == nil) {
        return nil;
    }
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    time_t delta = current_time - this_time;
    if (delta <= 0) {
        return @"刚刚";
    } else if (delta < 60) {
        return [NSString stringWithFormat:@"%ld秒前", delta];
    } else if (delta < kOneHourSeconds) {
        return [NSString stringWithFormat:@"%ld分钟前", delta /60];
    } else {
        struct tm tm_now, tm_in;
        localtime_r(&current_time, &tm_now);
        localtime_r(&this_time, &tm_in);
        NSString *format = nil;
        if (tm_now.tm_year == tm_in.tm_year) {
            if (tm_now.tm_yday == tm_in.tm_yday) {
                format = @"今天 %-H:%M";
            } else if (tm_now.tm_yday - tm_in.tm_yday == 1) {
                format = @"昨天 %-H:%M";
            } else {
                format = @"%-m月%-d日 %-H:%M";
            }
        } else {
            format = @"%Y年%-m月%-d日";
        }
        char buf[256] = {0};
        strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
        return [NSString stringWithUTF8String:buf];
    }
}

+ (NSString *)getTimeSimpleStr:(NSDate *)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time = [(NSDate *)date timeIntervalSince1970];
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = nil;
    if (tm_now.tm_year == tm_in.tm_year) {
        if (tm_now.tm_yday == tm_in.tm_yday) {
            format = @"%H:%M";
        } else if (tm_now.tm_yday - tm_in.tm_yday == 1) {
            format = @"昨天 %H:%M";
        } else {
            format = @"%m-%d %H:%M";
        }
    } else {
        format = @"%Y-%m-%d %H:%M";
    }
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
    
}

+ (NSString *)getTimeStyle1:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = nil;
    if (tm_now.tm_year == tm_in.tm_year) {
        if (tm_now.tm_yday == tm_in.tm_yday) {
            format = @"%H:%M";
        } else if (tm_now.tm_yday - tm_in.tm_yday == 1) {
            format = @"昨天 %H:%M";
        } else {
            format = @"%m/%d %H:%M";
        }
    } else {
        format = @"%Y/%m/%d %H:%M";
    }
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getTimeStyle2:(id)date
{
    if (date == nil) {
        return nil;
    }
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    time_t delta = current_time - this_time;
    if (delta <= 0) {
        return @"刚刚";
    }
    if (delta < 60) {
        return [NSString stringWithFormat:@"%ld秒前", delta];
    }
    if (delta < kOneHourSeconds) {
        return [NSString stringWithFormat:@"%ld分钟前", delta / 60];
    }
    if (delta < kOneHourSeconds * kOneDayHours) {
        return [NSString stringWithFormat:@"%ld小时前", delta / kOneHourSeconds];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    int days = 0;
    if (tm_now.tm_year != tm_in.tm_year) {
        days = (int)delta / (kOneHourSeconds * kOneDayHours);
        if (days > 30) {
            days = 30;
        }
    } else {
        days = tm_now.tm_yday - tm_in.tm_yday;
        if (days > 30) {
            days = 30;
        }
    }
    return [NSString stringWithFormat:@"%d天前", days];
}

+ (NSString *)getTimeStyle3:(id)date
                      style:(PsdTimeStyle)style
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y/%m/%d %H:%M";
    if (style == PsdTimeStylePoint) {
        format = @"%Y.%m.%d %H:%M";
    }
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getTimeStyle4:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = nil;
    if (tm_now.tm_year == tm_in.tm_year) {
        format = @"%m月%d日 %H:%M";
    } else {
        format = @"%Y年%m月%d日 %H:%M";
    }
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getTimeStyle5:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = nil;
    if (tm_in.tm_yday >= tm_now.tm_yday) {
        int day = tm_in.tm_yday - tm_now.tm_yday;
        if (day == 0) {
            format = @"今天 %H:%M";
        } else if (day == 1) {
            format = @"明天 %H:%M";
        } else {
            format = @"%m月%d日 %H:%M";
        }
    } else {
        format = @"%m月%d日 %H:%M";
    }
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getTimeStyle6:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%H:%M";
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getTimeStyle7:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y年%m月%d日,%H:%M:%S";;
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getDateStr:(id)date
            showThisYear:(BOOL)showThisYear
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = nil;
    format = @"%Y年%-m月%-d日";
    if (!showThisYear) {
        if (tm_now.tm_year == tm_in.tm_year) {
            format = @"%-m月%-d日";
        }
    }
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getDateStyle2:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y/%m/%d";
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)getDateStyle3:(id)date
{
    time_t current_time = [[NSDate date] timeIntervalSince1970];
    time_t this_time;
    if ([date isKindOfClass:[NSDate class]]) {
        this_time = [(NSDate *)date timeIntervalSince1970];
    } else {
        this_time = [self getTimeInterval:date];
    }
    struct tm tm_now, tm_in;
    localtime_r(&current_time, &tm_now);
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y-%m-%d";
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (long long)currentTimeMillis
{
    return [self toMillis:[NSDate date]];
}

+ (NSString *)currentTimeMillisStr
{
    return [self toMillisStr:[NSDate date]];
}

+ (NSString *)currentTimeStyle1
{
    time_t this_time = [[NSDate date] timeIntervalSince1970];
    struct tm tm_in;
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y%m%d%H%M%S";
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSString *)currentTimeStyle2
{
    time_t this_time = [[NSDate date] timeIntervalSince1970];
    struct tm tm_in;
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y%m%d";
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}


+ (NSString *)toMillisStr:(NSDate *)date
{
    long long millis = [date timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%lld", millis];
}

+ (long long)toMillis:(NSDate *)date
{
    return [date timeIntervalSince1970] * 1000;
}

+ (NSString *)toString:(NSDate *)date
{
    time_t this_time = [date timeIntervalSince1970];
    struct tm tm_in;
    localtime_r(&this_time, &tm_in);
    NSString *format = @"%Y-%m-%d %H:%M:%S";
    char buf[256] = {0};
    strftime(buf, sizeof(buf), [format UTF8String], &tm_in);
    return [NSString stringWithUTF8String:buf];
}

+ (NSDate *)stringToDate:(NSString *)timeStr
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    return [formatter dateFromString:timeStr];
}

+ (NSDate *)chineseDateStrToDate:(NSString *)timeStr
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy年MM月";
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    return [formatter dateFromString:timeStr];
}

+ (NSDate *)getNowDate
{
    NSDate *date = [NSDate date];
    return [self addTimeZoneWithDate:date];
}

+ (NSDate *)addTimeZoneWithDate:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    return [date dateByAddingTimeInterval:interval];
}

+ (NSDate *)addDay:(NSDate *)date day:(NSInteger)day
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [formatter stringFromDate:date];
    NSDate *now = [formatter dateFromString:dateStr];
    return [now dateByAddingTimeInterval:kOneDayHours * kOneHourSeconds * day];
}

+ (NSDate *)addDay:(NSInteger)day
{
    return [self addDay:[NSDate date] day:day];
}

+ (NSDate *)addYear:(NSDate *)date year:(NSInteger)year
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:year];
    return [gregorian dateByAddingComponents:dateComponents toDate:date options:0];
}

+ (NSDate *)addYear:(NSInteger)year
{
    return [self addYear:[NSDate date] year:year];
}

+ (int)differSeconds:(NSDate *)now other:(NSDate *)other
{
    return fabs([now timeIntervalSince1970] - [other timeIntervalSince1970]);
}

+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2
{
    if (date1 == nil || date2 == nil) {
        return NO;
    }
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    return [comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year];
}

+ (NSInteger)getAgeForDate:(id)date
{
    if (date == nil) {
        return 0;
    }
    NSDate *now = nil;
    if ([date isKindOfClass:[NSDate class]]) {
        now = date;
    } else {
        now = [self toDate:date hasTimeZone:NO];
    }
    NSTimeInterval dateDiff = [now timeIntervalSinceNow];
    return (NSInteger)fabs(trunc(dateDiff / (60 * 60 * 24)) / 365);
}

+ (NSString *)getCountDownString:(id)startTime
{
    NSDate *time = nil;
    if ([startTime isKindOfClass:[NSDate class]]) {
        time = startTime;
    } else {
        time = [PLDateHelper toDate:startTime hasTimeZone:NO];
    }
    NSDate *endTime = [NSDate dateWithTimeInterval:2 * 60 * 60 sinceDate:time];
    NSInteger limit = [endTime timeIntervalSinceDate:[NSDate date]];
    if (limit <= 0) {
        return nil;
    }
    NSInteger totalMinutes = limit / 60;
    NSInteger hours = 0;
    NSInteger minutes = 0;
    if (totalMinutes % 60 == 0) {
        hours = totalMinutes / 60;
    } else {
        hours = totalMinutes / 60;
        minutes = totalMinutes - (60 * hours);
    }
    if (hours > 0) {
        if (minutes == 0) {
            return [NSString stringWithFormat:@"%zd小时", hours];
        }
        return [NSString stringWithFormat:@"%zd小时%zd分", hours, minutes];
    }
    return [NSString stringWithFormat:@"%zd分", minutes];
}

+ (BOOL)isOverTime:(id)startTime
{
    return [self getCountDownString:startTime] == nil;
}

+ (NSString *)toTimeString:(NSInteger)seconds
{
    NSString *hour = [NSString stringWithFormat:@"%02ld", seconds / kOneHourSeconds];
    NSString *minute = [NSString stringWithFormat:@"%02ld", (seconds % kOneHourSeconds) / 60];
    NSString *second = [NSString stringWithFormat:@"%02ld", seconds % 60];
    if ([hour isEqualToString:@"00"]) {
        return [NSString stringWithFormat:@"%@:%@",minute, second];
    }
    return [NSString stringWithFormat:@"%@:%@:%@",hour, minute, second];
}

+ (int)calcVideoLibItemOverTime:(NSDate *)msgTime
{
    NSDate *nowDate = [PLDateHelper getNowDate];
    
    int disSec = [PLDateHelper differSeconds:nowDate other:msgTime];
    
    int days = disSec / (kOneHourSeconds * kOneDayHours);
    
    return days;
}

+ (NSInteger)getHourForDate:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitHour fromDate:date];
    return components.hour;
}

+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {//past
        return 1;
    }else if (result == NSOrderedAscending){//future
        return -1;
    }
    return 0;
}

+ (NSInteger)getThisYear
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    return year;
}

+ (NSString *)getDayDistanceFromSecond:(id)millisecond
{
    NSInteger resultTime = 0;
    NSString *lastStr = @"小时";
    //nowDate有时区hasTimeZone为yes
    NSDate *tempDate = [self toDate:millisecond hasTimeZone:YES];
    NSDate *nowDate = [self getNowDate];
    CGFloat seconds = [self differSeconds:nowDate other:tempDate];
    resultTime = seconds / kOneHourSeconds;
    resultTime = resultTime == 0 ? 1 : resultTime;
    if (resultTime >= kOneDayHours) {
        lastStr = @"天";
        resultTime /= kOneDayHours;
    }
    return [NSString stringWithFormat:@"%zd%@",resultTime,lastStr];
}

+ (NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}

@end
