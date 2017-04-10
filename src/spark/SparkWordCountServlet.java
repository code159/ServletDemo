package spark;

import java.util.Arrays;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Iterable;

import scala.Tuple2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.function.PairFunction;

/**
 * Servlet implementation class SparkWordCountServlet
 */
@WebServlet("/SparkWordCountServlet")
public class SparkWordCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SparkWordCountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(this.getClass() + "处理Get请求...");
		System.out.println(System.getProperty("java.classpath"));
		SparkConf conf = new SparkConf().setAppName("WordCount");
		conf.setMaster("local");
		JavaSparkContext jsc = new JavaSparkContext(conf);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String in = "E:\\src\\count.txt";
		// String out = "E:\\src\\out.txt";
		JavaRDD<String> input = jsc.textFile(in);
		JavaRDD<String> words = input.flatMap(new FlatMapFunction<String, String>() {
			@Override
			public Iterable<String> call(String arg) throws Exception {
				return Arrays.asList(arg.split(" "));
			}
		});

		JavaPairRDD<String, Integer> counts = words.mapToPair(new PairFunction<String, String, Integer>() {
			@Override
			public Tuple2<String, Integer> call(String x) throws Exception {
				return new Tuple2(x, 1);
			}
		}).reduceByKey(new Function2<Integer, Integer, Integer>() {
			@Override
			public Integer call(Integer x, Integer y) throws Exception {
				return x + y;
			}
		});

		// counts.saveAsTextFile(out);

		List<Tuple2<String, Integer>> output = counts.collect();
		for (Tuple2<?, ?> tuple : output) {
			// System.out.println(tuple._1() + ": " + tuple._2());
			out.println(tuple._1() + ": " + tuple._2() + "<br/>");
		}
		jsc.stop();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(this.getClass() + "处理Post请求...");
		System.out.println(System.getProperty("java.classpath"));
		SparkConf conf = new SparkConf().setAppName("WordCountPost");
		conf.setMaster("local");
		JavaSparkContext jsc = new JavaSparkContext(conf);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 使用http header解决乱码问题
		request.setCharacterEncoding("utf-8");

		// 解决乱码问题
		// String in = new String((request.getParameter("content")).getBytes("ISO-8859-1"),"UTF-8");
		// String out = "E:\\src\\out.txt";
		
		//数据行
		String in = request.getParameter("content");
		//数据集
		String inSet = request.getParameter("contents");
		
		
		if (in != null) {
			JavaRDD<String> input = jsc.parallelize(Arrays.asList(in));
			JavaRDD<String> words = input.flatMap(new FlatMapFunction<String, String>() {
				@Override
				public Iterable<String> call(String arg) throws Exception {
					return Arrays.asList(arg.split(" "));
				}
			});

			JavaPairRDD<String, Integer> counts = words.mapToPair(new PairFunction<String, String, Integer>() {
				@Override
				public Tuple2<String, Integer> call(String x) throws Exception {
					return new Tuple2(x, 1);
				}
			}).reduceByKey(new Function2<Integer, Integer, Integer>() {
				@Override
				public Integer call(Integer x, Integer y) throws Exception {
					return x + y;
				}
			});

			// counts.saveAsTextFile(out);

			List<Tuple2<String, Integer>> output = counts.collect();
			for (Tuple2<?, ?> tuple : output) {
				// System.out.println(tuple._1() + ": " + tuple._2());
				out.println(tuple._1() + ": " + tuple._2() + "<br/>");
			}
			jsc.stop();
		}

	}

}
