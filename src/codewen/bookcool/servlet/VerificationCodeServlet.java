package codewen.bookcool.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证码Servlet
 * @author codewen
 * 
 */

@WebServlet("/VerificationCodeServlet")
public class VerificationCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int width = 100; 
		int height = 35;
		//在内存中生成一张图片
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//获取画笔
		Graphics g = image.getGraphics();
		g.setColor(Color.pink);
		g.fillRect(0, 0, width, height);
		g.setColor(Color.blue);
		g.drawRect(0, 0, width-1, height-1);
		char a[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B',
		'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
		'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b',
		'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
		'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
		Random random = new Random();
		g.setColor(Color.red);
		Font font = new Font("萝莉体 第二版", Font.BOLD, 16);
		g.setFont(font);
		String Vcode = "";
		//随机生成四个字母或数字
		for(int i=1; i<=4; i++) {
			int index = random.nextInt(a.length);
			Vcode+=a[index];
			g.drawString(a[index]+"", width/5*i-5, height/2+5);
		}
		//将生成的验证码放入session(供登录时检验验证码使用)
		request.getSession().setAttribute("Vcode", Vcode);
		//显示图片
		ImageIO.write(image, "jpg", response.getOutputStream());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
