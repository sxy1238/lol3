package com.example.controller;

import com.example.model.Food;
import com.example.model.Kinds;
import com.example.model.Notice;
import com.example.model.Word;
import com.example.service.FoodService;
import com.example.service.KindService;
import com.example.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class NoticeController {
    @Autowired
   private NoticeService noticeService;
    @PostMapping("/showNotice")
    @ResponseBody
    public List<Notice> showNotice(){

      List<Notice> notices=noticeService.showNotice();

        return notices;
    }
    @PostMapping("/deleteNotice")
    @ResponseBody
    public Word deleteNotice(Integer id){
          Word word=new Word();
          Integer integer=noticeService.deleteByPrimaryKey(id);
          if(integer<=0){
              word.setInformation(0);
          }
        return word;
    }
    @PostMapping("/delete3")
    @ResponseBody
    public Integer delete(String id){
        System.out.println("id值为"+id);
        String[] b=id.split(",");
        int a=0;
        for(int  c=0;c<b.length;c++) {
            System.out.println(b[c]);
            Integer integer=Integer.valueOf(b[c]);
            a=noticeService.deleteByPrimaryKey(integer);
        }
        return a;
    }
    @RequestMapping("/AddNotice")
    public String AddFood(Notice notice){
        String title=notice.getTitle();
        String content=notice.getContent();
        System.out.println(title);
        System.out.println(content);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String time=sdf.format(date);
        System.out.println(time);
        notice.setTime(time);
        int a=noticeService.insert(notice);
        return "notice";
    }
}
