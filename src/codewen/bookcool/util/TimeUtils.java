package codewen.bookcool.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 数据库timestamp类型返回时间格式转换
 * @author codewen
 *
 */
public class TimeUtils {

	public static String parseTime(String time) {
		String formatTime = null;
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
			formatTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		} catch (ParseException e) {
			System.out.println("时间转化失败!");
			formatTime = "";
		}
		return formatTime;
	}
}
