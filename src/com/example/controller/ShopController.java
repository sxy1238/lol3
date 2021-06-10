package com.example.controller;


import com.example.model.*;
import com.example.service.FoodService;
import com.example.service.OrderService;
import com.example.service.ShopService;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ShopController {
    @Autowired
    private ShopService shopService;
    @Autowired
    private FoodService foodService;

    @RequestMapping("Shop")
    @ResponseBody
    public List<Shoper> Shop(HttpServletRequest request){
       HttpSession session=request.getSession();
       User user=(User)session.getAttribute("user");
       String username=user.getUsername();
       List<Shop> shops=shopService.select(username);
       List<Shoper> shopers=new ArrayList<>();
       for (int i=0;i<shops.size();i++){
          Food food=foodService.searchById(shops.get(i).getFoodid());
          Shoper shoper=new Shoper();
          shoper.setFoodid(shops.get(i).getFoodid());
          shoper.setName(food.getName());
          shoper.setUrl(food.getUrl());
          shoper.setDiscount(food.getDiscount());
          shoper.setCount(shops.get(i).getCount());
          shopers.add(shoper);
       }

       return shopers;
    }

    @RequestMapping("deleteShop")
    @ResponseBody
    public Word2 delete(String foodid,HttpServletRequest request){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        String username=user.getUsername();
        int id=Integer.parseInt(foodid);
        //System.out.println(username);
       // System.out.println(id);
        Shop shop=new Shop();
        shop.setFoodid(id);
        shop.setUsername(username);
        int a=shopService.delete(shop);
        Word2 word2=new Word2();
        word2.setInformation(foodid);
        return word2;
    }

    @RequestMapping("DeleteAll")
    @ResponseBody
    public Word DeleteAll(HttpServletRequest request){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        String username=user.getUsername();
        int a=shopService.deleteAll(username);
        Word word=new Word();
        word.setInformation(a);
        return word;
    }

    @RequestMapping("Addshop")
    @ResponseBody
    public Word Add(String id,String sum,HttpServletRequest request){
        //System.out.println(id+"    "+sum);
        Shop p1=null;  Word word=new Word();
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");

        String username=user.getUsername();
       // System.out.println("用户名是"+username);
        int foodid=Integer.parseInt(id);
        int count=Integer.parseInt(sum);
        Shop shop=new Shop();
        shop.setUsername(username);
        shop.setFoodid(foodid);
        shop.setCount(count);
        p1=shopService.search(shop);
       // System.out.println(p1.getUsername());
       // System.out.println(p1.getFoodid());
        if(p1 != null){
            System.out.println("1");
            int newsum=count+p1.getCount();
            p1.setCount(newsum);
            int num=shopService.update(p1);
            word.setInformation(num);
            return word;
        }else {
            System.out.println("0");
            int a=shopService.insert(shop);
            word.setInformation(a);
            return word;
        }

    }
}
