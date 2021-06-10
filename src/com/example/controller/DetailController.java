package com.example.controller;

import com.example.model.*;
import com.example.service.DetailService;
import com.example.service.FoodService;
import com.example.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DetailController {
    @Autowired
   private DetailService detailService;
    @Autowired
    private FoodService  foodService;
    @PostMapping("/ReadOrder")
    @ResponseBody
    public List<Detail> ReadOrder(String id, String orderid){
        List<Detail> details=detailService.ReadOrder(Integer.parseInt(orderid));
        return  details;
    }

    @RequestMapping("/ReadOrder2")
    public String ReadOrder2(String orderid, Model model){
        System.out.println(orderid);
        List<Detail> details=detailService.ReadOrder(Integer.parseInt(orderid));
        List<Shoper> shopers=new ArrayList<>();
        System.out.println(details.size());
          for (int i=0;i<details.size();i++){
              Food food=foodService.searchById(details.get(i).getFoodid());
              Shoper shoper=new Shoper();
              shoper.setFoodid(details.get(i).getFoodid());
              shoper.setName(food.getName());
              shoper.setUrl(food.getUrl());
              shoper.setDiscount(details.get(i).getPrice());
              shoper.setCount(Integer.parseInt(details.get(i).getCount()));
              shopers.add(shoper);
          }
          System.out.println(shopers.size());
          model.addAttribute("shopers",shopers);
        return  "detail";
    }

   /* @RequestMapping("/tuijian")
    public List<Food> tuijian(HttpServletRequest request){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        String username=user.getUsername();
        int[] a=detailService.tuijian(username);
        System.out.println(a.length);

    }*/

}
