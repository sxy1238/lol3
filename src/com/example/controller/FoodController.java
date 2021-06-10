package com.example.controller;
import com.example.DateUtil;
import com.example.mapper.FoodDao;
import com.example.model.*;
import com.example.service.DetailService;
import com.example.service.FoodService;
import com.example.service.OrderService;
import com.example.service.ShopService;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class FoodController {
    @Autowired
   private FoodService foodService;
    @Autowired
    private DetailService detailService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private OrderService orderService;
    @PostMapping("/select")
    @ResponseBody
    public List<Food> select(){
        List<Food> foods=foodService.SelectFood();
        return foods;
    }

    @RequestMapping("/upload")
    public String upload(@RequestParam("file") List<MultipartFile> file, HttpServletRequest request){
        if(!file.isEmpty()&&file.size()>0){
            for(MultipartFile file1 :file){
                String oldFilename=file1.getOriginalFilename();
                String dirPath=request.getServletContext().getRealPath("/image/");
                System.out.println(dirPath);
                File filePath= new File(dirPath);
                if(!filePath.exists()){
                    filePath.mkdirs();
                }
                try {
                    file1.transferTo(new File(dirPath+oldFilename));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "index";
    }

    @RequestMapping("/AddFood")
    public String AddFood(@RequestParam("name") String name,@RequestParam("price") String price,@RequestParam("discount") String discount,
                          @RequestParam("count") String count,@RequestParam("kind") String kind,
                          @RequestParam("url") List<MultipartFile> file, HttpServletRequest request){
        String dirPath="",oldFilename="";
        if(!file.isEmpty()&&file.size()>0){
            for(MultipartFile file1 :file){
                 oldFilename=file1.getOriginalFilename();
                 dirPath=request.getServletContext().getRealPath("/image/");
                System.out.println(dirPath);
                File filePath= new File(dirPath);
                if(!filePath.exists()){
                    filePath.mkdirs();
                }
                try {
                    file1.transferTo(new File(dirPath+oldFilename));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        Food food=new Food();
        String old="http://localhost:8080/lol_war_exploded/image/";
        System.out.println(name+kind);
        System.out.println(old+oldFilename);
        food.setUrl(old+oldFilename);
        food.setName(name);
        food.setPrice(price);
        food.setDiscount(discount);
        food.setCount(count);
        food.setKind(kind);
        int a=foodService.insert(food);
        return "index";
    }

    @PostMapping("/delete")
    @ResponseBody
    public Integer delete(String id){
        System.out.println("id值为"+id);
     String[] b=id.split(",");
     int a=0;
        for(int  c=0;c<b.length;c++) {
            System.out.println(b[c]);
         a=foodService.deleteById(b[c]);
        }
        return a;
    }

    @PostMapping("/delete2")
    @ResponseBody
    public Word2 delete2(String id,String name){
        Word2 word2=new Word2();int c=0;
        //System.out.println(id + name);
        int d=shopService.selectCount(Integer.parseInt(id));
        if(d>0){
            word2.setInformation("该商品已在购物车内，不允许删除");
            return word2;
        }else {
            c=foodService.deleteById(id);
            if (c>0){
                word2.setInformation("1");
            }else {
                word2.setInformation("删除失败");
            }
            return word2;
        }
    }
    @PostMapping("updateById")
    @ResponseBody
    public Word updateById(@RequestBody Food food){
        Word word=new Word();
        Integer integer=foodService.updateById(food);
        word.setInformation(integer);
        return word;
    }
    @PostMapping("/searchByName")
    @ResponseBody
    public List<Food> search(@ModelAttribute Food food){
        System.out.println(food.getName());
        System.out.println(food.getKind());
        if (food.getName()!=null){
            List<Food> foods=foodService.search(food.getName());
            System.out.println(foods.size());
            return foods;
        }else {
            List<Food> foods=foodService.selectByKind(food.getKind());
            System.out.println(foods.size());
            return foods;
        }


    }

   @RequestMapping("/bb")
    @ResponseBody
    public BB bb(){
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            List<Detail> details=detailService.bb(foods.get(i).getId());
            int b=0;
            for (int j=0;j<details.size();j++){
                b=b+Integer.parseInt(details.get(j).getCount());
            }
            a[i]=b;
        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
      return bb;
   }

   @RequestMapping("/kc")
    @ResponseBody
    public BB kc(){
        List<Food> foods=foodService.SelectFood();
        BB bb=new BB();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            a[i]=Integer.parseInt(foods.get(i).getCount());
        }
        bb.setName(strings);
        bb.setCount(a);
        return bb;
   }

    @RequestMapping("/bb3")
    @ResponseBody
    public BB bb3() throws ParseException {
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        List<Order> orders=orderService.showOrder();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=DateUtil.getTimesmorning();
        Date date2=DateUtil.getTimesnight();
        List<Detail> details3=new ArrayList<>();
         for (int x=0;x<orders.size();x++){
               Date date3=sdf.parse(orders.get(x).getTime());
               if(date3.compareTo(date1)>0&&date2.compareTo(date3)>0){
                   List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                   details3.addAll(details2);
               }
         }
        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=0;
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;
                }
            }else {
                a[i]=b;
            }

        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/bb4")
    @ResponseBody
    public BB bb4() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        BB bb=new BB();
        List<Order> orders=orderService.showOrder();
        Date date1=DateUtil.getTimesWeekmorning();
        Date date2=DateUtil.getTimesWeeknight();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0&&date2.compareTo(date3)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }
        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=0;
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;
                }
            }else {
                a[i]=b;
            }

        }
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/bb5")
    @ResponseBody
    public BB bb5() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        BB bb=new BB();
        List<Order> orders=orderService.showOrder();
        Date date1=DateUtil.getTimesMonthmorning();
        Date date2=DateUtil.getTimesMonthnight();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0&&date2.compareTo(date3)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }
        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=0;
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;
                }
            }else {
                a[i]=b;
            }

        }
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/bb6")
    @ResponseBody
    public BB bb6() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        BB bb=new BB();
        List<Order> orders=orderService.showOrder();
        Date date1=DateUtil.getCurrentQuarterStartTime();

        Date date2=DateUtil.getCurrentQuarterEndTime();

        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());

            if(date3.compareTo(date1)>0&&date2.compareTo(date3)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }
        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=0;
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;
                }
            }else {
                a[i]=b;
            }

        }
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/bb7")
    @ResponseBody
    public BB bb7() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        BB bb=new BB();
        List<Order> orders=orderService.showOrder();
        Date date9=DateUtil.getCurrentYearStartTime();
        Date date2=DateUtil.getCurrentYearEndTime();
        Date date4=DateUtil.getCurrentQuarterStartTime();
       System.out.println(date9.toLocaleString());
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
             System.out.println(date3.compareTo(date9));

            if(date3.compareTo(date9)>0&&date2.compareTo(date3)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());

                details3.addAll(details2);
            }
        }

        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=0;
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;
                }
            }else {
                a[i]=b;
            }

        }
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/kc3")
    @ResponseBody
    public BB kc3() throws ParseException {
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        List<Order> orders=orderService.showOrder();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=DateUtil.getTimesmorning();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                //System.out.println(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }

        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=Integer.parseInt(foods.get(i).getCount());
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        System.out.println(details3.get(j).getId());
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;

                }
            }else {
                a[i]=b;
            }

        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/kc4")
    @ResponseBody
    public BB kc4() throws ParseException {
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        List<Order> orders=orderService.showOrder();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=DateUtil.getTimesWeekmorning();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                //System.out.println(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }

        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=Integer.parseInt(foods.get(i).getCount());
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        System.out.println(details3.get(j).getId());
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;

                }
            }else {
                a[i]=b;
            }

        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/kc5")
    @ResponseBody
    public BB kc5() throws ParseException {
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        List<Order> orders=orderService.showOrder();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=DateUtil.getTimesMonthmorning();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                //System.out.println(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }

        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=Integer.parseInt(foods.get(i).getCount());
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        System.out.println(details3.get(j).getId());
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;

                }
            }else {
                a[i]=b;
            }

        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/kc6")
    @ResponseBody
    public BB kc6() throws ParseException {
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        List<Order> orders=orderService.showOrder();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=DateUtil.getCurrentQuarterStartTime();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                //System.out.println(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }

        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=Integer.parseInt(foods.get(i).getCount());
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        System.out.println(details3.get(j).getId());
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;

                }
            }else {
                a[i]=b;
            }

        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }

    @RequestMapping("/kc7")
    @ResponseBody
    public BB kc7() throws ParseException {
        List<Food> foods = foodService.SelectFood();
        String[] strings=new String[foods.size()];
        int[] a=new int[foods.size()];
        List<Order> orders=orderService.showOrder();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=DateUtil.getCurrentYearStartTime();
        List<Detail> details3=new ArrayList<>();
        for (int x=0;x<orders.size();x++){
            Date date3=sdf.parse(orders.get(x).getTime());
            if(date3.compareTo(date1)>0){
                List<Detail> details2=detailService.ReadOrder(orders.get(x).getOrderid());
                //System.out.println(orders.get(x).getOrderid());
                details3.addAll(details2);
            }
        }

        for (int i=0;i<foods.size();i++){
            strings[i]=foods.get(i).getName();
            int b=Integer.parseInt(foods.get(i).getCount());
            if(details3.size()>0){
                for (int j=0;j<details3.size();j++){
                    if(details3.get(j).getFoodid()==foods.get(i).getId()){
                        System.out.println(details3.get(j).getId());
                        b=b+Integer.parseInt(details3.get(j).getCount());
                    }
                    a[i]=b;

                }
            }else {
                a[i]=b;
            }

        }
        BB bb = new BB();
        bb.setName(strings);
        bb.setCount(a);
        return bb;
    }
}
