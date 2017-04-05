package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileServlet extends HttpServlet{
	
	//读取文件
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FileServlet处理Get请求...");
		Scanner in = new Scanner(Paths.get("E:\\src\\Hello.java"));
        String s5 = null;
        PrintWriter out=resp.getWriter();
        while (in.hasNextLine()) {
            out.println(in.nextLine());
        }


        in.close();
	}

}
