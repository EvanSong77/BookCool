package codewen.bookcool.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import codewen.bookcool.entity.BookContent;

/**
 * 书籍内容帮助类
 * 
 * @author codewen
 *
 */
public class BookContentUtils {
	static List<BookContent> cLists = new ArrayList<BookContent>();

	/**
	 * 分割章节的方法
	 * @param srcFilePath 该txt小说放在磁盘中的位置
	 * @param bookname 该txt小说的书名
	 * @param encoding 编码类型
	 * @return	该txt小说的所有章节
	 */
	public static List<BookContent> cut(String srcFilePath, String bookname,
			String encoding) {
		BufferedReader br = null;
		InputStreamReader read;
		try {
			read = new InputStreamReader(
					new FileInputStream(new File(srcFilePath)), encoding);
			br = new BufferedReader(read);
			String tempString = null;
			StringBuffer sb = new StringBuffer();
			Pattern p = Pattern.compile("第.{1,5}章\\s.*");//分割章节号
			Matcher m = null;
			int index = 0;//用于记录下次匹配到的下标
			String allStr = "";//用于记录章节内容
			int i = 0;//计数
			while ((tempString = br.readLine()) != null) {//读取一行
				tempString += "\n";
				sb.append(tempString);
			}
			m = p.matcher(sb.toString());//对文章的所有内容进行匹配
			while (m.find()) {
				i++;
				BookContent bc = new BookContent();
				String group = m.group();
				String bookchapter = group.trim();//章节号 如：第一章
				int start = m.start();
				if (m.find()) {//再匹配一次
					index = m.start();
					allStr = sb.toString()
							.substring(start + bookchapter.length(), index);
					m.region(index, sb.length());//重置匹配器，从下标为index开始匹配，到sb.length结束
				} else {
					allStr = sb.toString().substring(
							start + bookchapter.length(),
							sb.toString().length());
				}
				//封装
				bc.setBcname(bookname);
				bc.setBcchapter(bookchapter);
				bc.setBccontent(allStr);
				bc.setChapter_num(i);
				cLists.add(bc);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException ie) {
			ie.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return cLists;
	}

	/**
	 * 该方法用于将切割出来的的小说章节内容进行格式处理
	 * @param cuts 切割出来的小说章节集合
	 * @param booknum 小说的编号
	 * @return 进行格式处理后的小说章节集合
	 */
	public static List<BookContent> bookContentFormat(List<BookContent> cuts, int booknum) {
		//遍历该小说所有章节
		for (BookContent bookContent : cuts) {
			String bccontent2 = "";//用于存处理过后的章节内容
			Pattern p = Pattern.compile(".*");//匹配除"\r\n"之外的任何字符
			Matcher matcher = p.matcher(bookContent.getBccontent());
			while(matcher.find()) {
				String group = matcher.group();
				String trim = group.trim();
				if(trim != null && !trim.equals("")) {
					trim="<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+trim+"</p>";//对章节内容进行简单处理
					bccontent2 += trim;
				}
			}
			//封装
			bookContent.setBccontent(bccontent2);
			bookContent.setBc_bnum(booknum);
		}
		return cuts;
	}
}