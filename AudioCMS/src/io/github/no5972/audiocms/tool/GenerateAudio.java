package io.github.no5972.audiocms.tool;

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
		
		System.setProperty("aip.log4j.conf", "log4j.properties");
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
		//String demo="摘自央视新闻　　距离2016年全国高考还有不到一个月的时间，在紧张备考的时候，一个有关高考招生计划的消息却在部分考生和家长中引发了忧虑。湖北、江苏等地的家长担心一些高校特别是位于本省的重点高校在本地的招生规模缩小，对此，两地教育部门进行了回应。　　教育部等发文支援中西部招生　　这一新闻源自于一份通知。4月底，《教育部 国家发展改革委关于做好2016年普通高等教育招生计划编制和管理工作的通知》下发，《通知》提到为促进高等教育区域和城乡入学机会公平，2016年，支援中西部地区招生协作计划安排21万人，其中本科14万人，由北京、天津、江苏等14个省（市）的公办普通高校承担，面向河南、广西、贵州、甘肃等10个中西部省（区）招生。　　此后，江苏省教育厅公布《关于2016年江苏高等学校跨省招生计划的说明》，表示江苏省将调出3.8万个招生计划安排到中西部省份。而据湖北教育厅官网消息，湖北省高校（不含在鄂部委属高校）2016年将编制4万名额计划支持中西部10个省（区）。　　家长担心本地招生规模缩小　　这些消息引发一部分高考考生及家长对于省内招生计划减少、高考录取率下降的担心。　　“中西部很容易就能上湖北的重点大学，本省原本能上985的只能上211，211的只能上普本”。“放假进补习班，在校从早学到晚，不就是为考上好大学，离家近点。”一些家长称，他们拥护向西部倾斜的教育政策，但希望有关部门能平衡好两者之间的关系，保障高考考生的平等受教育权利。尽管江苏和湖北的教育部门此前曾明确表示，支援中西部省份的招生计划并不会影响本地招生计划，但这似乎并不能缓解家长和考生们对本地“减招”的担忧。　　江苏、湖北教育部门回应　　江苏　　对此，江苏、湖北教育厅昨日（13日）及今日先后进行了回应。江苏教育厅官方微博@江苏教育发布以“公告”的形式进行了回应，公告称经请示教育部，江苏在完成国家专项计划的同时，确保2016年普通高校本专科招生计划中招收江苏学生的总规模不低于去年，确保本科各批次招收江苏学生的计划规模均不低于去年。　　江苏省教育厅厅长沈健今天下午接受江苏省广播电视总台专访，就高考“减招””问题回应大众关切。　　一、高考是涉及每一个家庭切身利益的大事，充分理解广大考生和家长对高考招生计划调整的关心和担忧。　　二、针对部分高考学生家长的诉求，我省高度重视，各有关方面积极协调争取，得到教育部支持，高考不会出现“减招”问题。　　三、招生能够做到“三个不减少”：一是普通高校本专科招生计划中招收江苏学生的总规模不减少。二是本一本二等各批次招收江苏学生的计划规模均不 减少。三是重点高校招收江苏学生的总计划不减少。“三个确保”：一是确保江苏考生本科录取率进一步提高，二是确保江苏考生上重点高校的机会增加，三是确保 江苏考生权益得到有效保障。　　四、党委和政府真切关心每一位考生、请广大家长放心，请广大考生认真备考。　　湖北　　湖北省教育厅则以厅长刘传铁答记者问的形式予以了回应，回应强调，今年招生能够做到“四个不低于去年”：在鄂7所部属高校在湖北的招生计划总量不低于去年，本科录取率不低于去年，一本录取率绝对不低于去年，全省总录取率绝对不低于去年。　　记者：在鄂7所部属“985”“211”高校今年在湖北的招生计划是否会减少？　　刘传铁：目前，各高校正在编制分省招生计划，经我们充分沟通协调，在鄂7所部属高校2016年在湖北的招生计划比去年不减少。我们还将在招生录取期间，争取他们再追加招生计划。　　记者：由于要承担招收跨省生源计划任务，省属本科高校今年在湖北的招生计划是否会减少？　　刘传铁：不会减少。省属高校2016年在湖北的本科招生总计划不低于去年，其中，公办本科高校在湖北的招生计划也不低于去年。　　记者：你能不能对今年湖北招生形势作个总体判断？　　刘传铁：省委省政府一直高度重视高校招生工作，教育部非常支持我省招生工作。我们今年能够做到“四个不低于去年”：在鄂7所部属高校在湖北的招生计划总量不低于去年，本科录取率不低于去年，一本录取率绝对不低于去年，全省总录取率绝对不低于去年。　　记者：你作为教育厅长，对考生和家长有什么祝愿？　　刘传铁：我们都是过来人，我自己参加过高考，我的孩子也参加过高考，因此，我理解广大考生和家长的心情。党委和政府真切关心每个考生，亲朋和好友热切期盼每位考生。我真心希望每位考生：全心投入，认真备考；衷心祝愿每位考生：身体健康，考试顺利！";
		int i=0;
		String u=System.getProperty("webapp.root");
		String content_removedHTML = delHTMLTag(content);
		if (content_removedHTML.length()>500) {
			List<String> pieces = getStrList(content_removedHTML, 500);
			for (String piece : pieces) {
				generate(piece, u+"//Audios//TMP//"+id+"_"+i+".mp3");
				System.out.println((i++)+1+" of "+pieces.size()+" Generated");
			}
			//TODO: Merge!
			try {
				MergeAudio.mergeFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			generate(content_removedHTML, u+"//Audios//"+id+".mp3");
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
