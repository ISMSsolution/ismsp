package controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystems;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import ismspdao.ismspdao;
import ismspdto.resultdto;

public class PDFMaker {
	public static String FILENAME = "인증심사_결과.pdf";

	public void createPDF(String dstPath) throws DocumentException, IOException {
		String DESTI_FILENAME = dstPath+"\\download\\"+FILENAME;
		Document document = new Document(PageSize.A4, 20, 20, 50, 50);
		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(DESTI_FILENAME));
		writer.setInitialLeading(10.0f);
		
		document.open();
		XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
		
		StyleAttrCSSResolver cssResolver = new StyleAttrCSSResolver();
		CssFile cssFile = null;
		String curpath = System.getProperty("user.dir");
		System.out.println("curpath : "+curpath);
		//cssFile = helper.getCSS(new FileInputStream("C:\\Users\\junee\\git\\repository\\isms\\src\\main\\java\\controller\\pdf.css"));
		cssFile = XMLWorkerHelper.getCSS(getClass().getClassLoader().getResourceAsStream("pdf.css"));
		cssResolver.addCss(cssFile);
		
		XMLWorkerFontProvider fontProvider = new
				XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		fontProvider.register("C:\\Users\\junee\\git\\repository\\isms\\src\\main\\java\\controller\\MALGUN.ttf", "MalgunGothic");
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		
		PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
		HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
		CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);

		//XMLWorker worker = new XMLWorker(html, true);
		XMLWorker worker = new XMLWorker(css, true);
		XMLParser xmlParser = new XMLParser(true, worker, StandardCharsets.UTF_8);
		
		ismspdao db = new ismspdao();
		List<resultdto> resultlist = null;
		try {
			resultlist = db.selectAllResultTable();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String htmlStr = "<html><head><style>"
				+ " table { width: 100%; table-layout: fixed; border-collapse: collapse; }";
		if(resultlist.size()==0) {
			htmlStr += " th { border: 1px solid black; word-break: break-all; padding: 5px; }";
		}
		else {
			htmlStr += " th, td { border: 1px solid black; word-break: break-all; padding: 5px; }";
		}
		
		htmlStr += "</style>"
				+ "<body style='font-family: MalgunGothic;'>"
				+ "<p>YIGA를 활용한 ISMS-P 인증심사 결과.</p><br></br>"
				+ "<table border='3' style='table-layout:fixed;'>"
				+ "	<tr>"
				+ "		<th scope=\"col\">ISMS-P 인증항목</th>"
				+ "		<th scope=\"col\">증거자료</th>"
				+ "		<th scope=\"col\">준수 여부</th>"
				+ "		<th scope=\"col\">설명</th>"
				+ "	</tr>";
		
		for(int i=0;i<resultlist.size();i++) {
			htmlStr += "<tr>";
			htmlStr += "<td scope=\"col\">"+resultlist.get(i).getThirdclass()+"</td>";
			htmlStr += "<td scope=\"col\">"+resultlist.get(i).getFilename()+"</td>";
			htmlStr += "<td scope=\"col\">"+resultlist.get(i).getResult()+"</td>";
			htmlStr += "<td scope=\"col\">"+resultlist.get(i).getDescription()+"</td>";
			htmlStr += "</tr>";
		}
		
		htmlStr += "</table></body></head></html>";
		System.out.println("htmlStr : "+htmlStr);
		
		StringReader strReader = new StringReader(htmlStr);
		xmlParser.parse(strReader);
		document.close();
		writer.close();
	}
}
