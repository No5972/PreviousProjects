package io.github.no5972.audiocms.tool;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.SequenceInputStream;
import java.util.Enumeration;
import java.util.Vector;

public class MergeAudio {

    //合并
    public static void mergeFile() throws IOException{
        //找到目标文件
    	String u=System.getProperty("webapp.root");
        File dir = new File(u+"\\Audios\\TMP");
        //通过目标文件夹找到所有的MP3文件，然后把所有的MP3文件添加到vector中。
        Vector<FileInputStream> vector = new Vector<FileInputStream>();
        File[] files = dir.listFiles();
        for(File file : files){
            if(file.getName().endsWith(".mp3")){
                vector.add(new FileInputStream(file));
            }
        }
        //通过Vector获取迭代器
        Enumeration<FileInputStream> e = vector.elements();
        //创建序列流
        SequenceInputStream inputStream = new SequenceInputStream(e);
        //建立文件的输出通道
        FileOutputStream fileOutputStream = new FileOutputStream(u+"\\Audios\\"+System.getProperty("currentNewsId")+".mp3");
        //建立缓冲数组读取文件
        byte[] buf = new byte[1024];
        int length = 0 ; 
        while((length =  inputStream.read(buf))!=-1){
            fileOutputStream.write(buf,0,length);
        }
        //关闭资源
        fileOutputStream.close();
        inputStream.close();
        DeleteAllFiles.delAllFile(u+"\\Audios\\TMP");
    }


}