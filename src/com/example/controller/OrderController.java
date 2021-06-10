package com.example.controller;

import com.example.model.*;
import com.example.service.*;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private FoodService foodService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private DetailService detailService;

    @PostMapping("/showOrder")
    @ResponseBody
    public List<Order> showOrder() {
        List<Order> orders = orderService.showOrder();
        return orders;
    }

    @PostMapping("/showOrder2")
    @ResponseBody
    public List<Order> showOrder2(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        List<Order> orders = orderService.showOrder2(username);
        return orders;
    }

    @PostMapping("/deleteOrder")
    @ResponseBody
    public Word deleteOrder(@RequestBody Order order) {
        Word word = new Word();
        String condition = order.getCondition();
        System.out.println(condition);
        if (condition.equals("未付款")) {
            Integer integer = orderService.deleteByPrimaryKey(order.getOrderid());
            word.setInformation(integer);
        } else {
            word.setInformation(0);
        }
        return word;
    }

    @PostMapping("/searchBy")
    @ResponseBody
    public List<Order> searchBy(@ModelAttribute Order order) {

        System.out.println(order.getCondition());
        System.out.println(order.getMoney());
        System.out.println("userid=" + order.getUserid());
        List<Order> orders = orderService.searchBy(order);
        return orders;
    }

    @RequestMapping("/afford")
    public String afford(HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        //System.out.println(username);
        Word3 word3=(Word3)session.getAttribute("money");
        double RMB=word3.getInformation();
        //System.out.println(RMB);
        String money=String.valueOf(RMB);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=sdf.format(date);
        //System.out.println(time);
        String condition="未付款";
        System.out.println(condition);
        Order order=new Order();
        order.setUserid(username);
        order.setMoney(money);
        order.setTime(time);
        order.setCondition(condition);
        int a=orderService.insert(order);
       // System.out.println(order.getOrderid());
        List<Shop> shops = shopService.select(username);
        for (int i = 0; i < shops.size(); i++) {
            Food food = foodService.searchById(shops.get(i).getFoodid());
            String s1=food.getCount();
            int ss1=Integer.parseInt(s1);
            int  ss2=ss1-shops.get(i).getCount();
            if(ss2>0){
                food.setCount(String.valueOf(ss2));
                int f=foodService.jkc(food);
            }else {

                return "fail2";
            }

            Detail detail=new Detail();
            detail.setOrderid(order.getOrderid());
            detail.setFoodid(food.getId());
            detail.setCount(String.valueOf(shops.get(i).getCount()));
            detail.setPrice(food.getDiscount());
            int c=detailService.insert(detail);

        }
        model.addAttribute("orderid",order.getOrderid());
        int c=shopService.deleteAll(username);
        return "zhifu";
    }

    @RequestMapping("/queren")
    public String queren(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        Word3 word3=new Word3();
        double money=0;
        List<Shop> shops = shopService.select(username);
        List<Shoper> shopers = new ArrayList<>();
        for (int i = 0; i < shops.size(); i++) {
            Food food = foodService.searchById(shops.get(i).getFoodid());
            Shoper shoper = new Shoper();
            shoper.setFoodid(shops.get(i).getFoodid());
            shoper.setName(food.getName());
            shoper.setUrl(food.getUrl());
            double discount=Double.parseDouble(food.getDiscount());
            double price=shops.get(i).getCount()*discount;
            money=money+price;
            shoper.setDiscount(String.valueOf(price));
            shoper.setCount(shops.get(i).getCount());
            shopers.add(shoper);
        }
        word3.setInformation(money);
        session.setAttribute("money",word3);

        model.addAttribute("shopers", shopers);
        model.addAttribute("zj",word3);
        return "queren";
    }

    @RequestMapping("zhifu")
    public String zhifu(int orderid){
       int a=orderService.zhifu(orderid);
       if(a>0){
           return "success";
       }else {
           return "fail";
       }
    }

    @RequestMapping("zhifu2")
    public String zhifu2(String orderid,Model model){
       model.addAttribute("orderid",orderid);
       return "zhifu";
    }
}
