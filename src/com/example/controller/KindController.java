package com.example.controller;

import com.example.model.*;
import com.example.service.DetailService;
import com.example.service.FoodService;
import com.example.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class KindController {
    @Autowired
   private KindService kindService;
    @Autowired
    private FoodService foodService;
    @Autowired
    private DetailService detailService;
    @PostMapping("/AddKind")
    public String AddKind(String kind){
        Kinds kinds=new Kinds();
        kinds.setKind(kind);
       int a=kindService.insert(kinds);
        return "kind";
    }
    @PostMapping("/showKinds")
    @ResponseBody
    public List<Kinds> showKinds(){

        List<Kinds> kinds=kindService.showKinds();

        return kinds;
    }
    @PostMapping("/deleteKind")
    @ResponseBody
    public  Word deleteKind(@RequestBody Kinds kinds){
        Word word=new Word();
        word.setInformation(kindService.deleteByPrimaryKey(kinds));
        /*Integer integer=null;
        Word word=new Word();
        Integer id=kinds.getId();
        String kind=kinds.getKind();
         integer=foodService.searchByKind(kinds.getKind());
        if(integer==0){
            int a=kindService.deleteByPrimaryKey(kinds.getId());
            System.out.println("a="+a);
            if(a>0)word.setInformation(1);
        }else {
            word.setInformation(0);
        }
        System.out.println(word.getInformation());
        return word;*/
        return word;
    }
    @PostMapping("/searchByKind")
    @ResponseBody
    public List<Kinds> search(String kind){
        System.out.println(kind);
        System.out.println(111);
        List<Kinds> kinds=kindService.searchByKind(kind);

        return kinds;
    }

    @RequestMapping("/bb2")
    @ResponseBody
    public BB bb2(){
        List<Kinds> kinds=kindService.showKinds();
        String[] strings=new String[kinds.size()];
        int[] a=new int[kinds.size()];
        BB bb=new BB();
        for (int i=0;i<kinds.size();i++){
            List<Food> foods=foodService.selectByKind(kinds.get(i).getKind());
            int b=0;
            for (int j=0;j<foods.size();j++){
                List<Detail> details=detailService.bb(foods.get(j).getId());
                for (int x=0;x<details.size();x++){
                    b=b+Integer.parseInt(details.get(x).getCount());
                }
            }
            strings[i]=kinds.get(i).getKind();
            a[i]=b;
        }
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/kc2")
    @ResponseBody
    public BB kc2(){
       List<Kinds> kinds=kindService.showKinds();
        String[] strings=new String[kinds.size()];
        int[] a=new int[kinds.size()];
        BB bb=new BB();
       for (int i=0;i<kinds.size();i++){
           int b=0;
           List<Food> foods=foodService.selectByKind(kinds.get(i).getKind());
           for (int j=0;j<foods.size();j++){
                b=b+Integer.parseInt(foods.get(j).getCount());
           }
           strings[i]=kinds.get(i).getKind();
           a[i]=b;
       }
       bb.setName(strings);
       bb.setCount(a);
       return bb;
    }
}
