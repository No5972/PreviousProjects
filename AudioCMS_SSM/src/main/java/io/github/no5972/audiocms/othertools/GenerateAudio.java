package io.github.no5972.audiocms.othertools;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONException;
import org.json.JSONObject;

import com.baidu.aip.speech.AipSpeech;
import com.baidu.aip.speech.TtsResponse;
import com.baidu.aip.util.Util;

public class GenerateAudio extends Thread {
    public static final String APP_ID = "11139621";
    public static final String API_KEY = "Gg1oy8x7wvtjxnTTysyXGptC";
    public static final String SECRET_KEY = "yCEFIj4zo5BNHqFqrQcMbEbwknACzXUb";
    public int id;
    public String content;
    public GenerateAudio(int id, String content) {
    	this.id = id;
    	this.content = content;
    }
    /**
     * 把原始字符串分割成指定长度的字符串列表
     * 
     * @param inputString
     *            原始字符串
     * @param length
     *            指定长度
     * @return
     */
    public static List<String> getStrList(String inputString, int length) {
        int size = inputString.length() / length;
        if (inputString.length() % length != 0) {
            size += 1;
        }
        return getStrList(inputString, length, size);
    }

 /**
     * 把原始字符串分割成指定长度的字符串列表
     * 
     * @param inputString
     *            原始字符串
     * @param length
     *            指定长度
     * @param size
     *            指定列表大小
     * @return
     */
    public static List<String> getStrList(String inputString, int length,
            int size) {
        List<String> list = new ArrayList<String>();
        for (int index = 0; index < size; index++) {
            String childStr = substring(inputString, index * length,
                    (index + 1) * length);
            list.add(childStr);
        }
        return list;
    }
    /**
     * 分割字符串，如果开始位置大于字符串长度，返回空
     * 
     * @param str
     *            原始字符串
     * @param f
     *            开始位置
     * @param t
     *            结束位置
     * @return
     */
    public static String substring(String str, int f, int t) {
        if (f > str.length())
            return null;
        if (t > str.length()) {
            return str.substring(f, str.length());
        } else {
            return str.substring(f, t);
        }
    }
    public static String delHTMLTag(String htmlStr){ 
        String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式 
        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式 
        String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式 
        String regEx_and="&[^;]+;"; //定义&****;的正则表达式 

        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
        Matcher m_script=p_script.matcher(htmlStr); 
        htmlStr=m_script.replaceAll(""); //过滤script标签 

        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
        Matcher m_style=p_style.matcher(htmlStr); 
        htmlStr=m_style.replaceAll(""); //过滤style标签 

        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
        Matcher m_html=p_html.matcher(htmlStr); 
        htmlStr=m_html.replaceAll(""); //过滤html标签

        Pattern p_and=Pattern.compile(regEx_and,Pattern.CASE_INSENSITIVE); 
        Matcher m_and=p_and.matcher(htmlStr); 
        htmlStr=m_and.replaceAll(""); //过滤&****;标签

        return htmlStr.trim(); //返回文本字符串 
    }
    
    public static void generate(String piece, String filename) throws JSONException {
		AipSpeech client = new AipSpeech(APP_ID, API_KEY, SECRET_KEY);
		
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);
		
		System.setProperty("aip.log4j.conf", GenerateAudio.class.getClassLoader().getResource("").getPath()+"//log4j.properties");
		TtsResponse res = client.synthesis(piece, "zh", 1, null);
        byte[] data = res.getData();
        JSONObject res1 = res.getResult();
        if (data != null) {
            try {
                Util.writeBytesToFileSystem(data, filename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (res1 != null) {
            System.out.println(res1.toString(2));
        }
        
	}
	public static void generateById(int id, String content) throws JSONException {
		int i=0;
		//String u=System.getProperty("webapp.root");
		System.out.println("AUDIO_ID====="+id);
		String u = GenerateAudio.class.getClassLoader().getResource("").getPath();
		System.out.println("PATH====="+u);
		String content_removedHTML = delHTMLTag(content);
		if (content_removedHTML.length()>500) {
			List<String> pieces = getStrList(content_removedHTML, 500);
			for (String piece : pieces) {
				generate(piece, u+"//..//..//Audios//TMP//"+id+"_"+i+".mp3");
				System.out.println((i++)+1+" of "+pieces.size()+" Generated");
			}
			//TODO: Merge!
			try {
				MergeAudio mergeAudio = new MergeAudio();
				mergeAudio.mergeFile(id);
				System.out.println(mergeAudio.isFinished);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			generate(content_removedHTML, u+"//..//..//Audios//"+id+".mp3");
		}
	}
	public void run() {
		try {
			generateById(id, content);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
