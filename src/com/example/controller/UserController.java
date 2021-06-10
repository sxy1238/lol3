package com.example.controller;


import com.example.CreateImageCode;
import com.example.model.Order;
import com.example.model.User;
import com.example.model.Word;
import com.example.model.Word2;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ShopService shopService;
    @RequestMapping("/dl")
    public String dl(String username, String password,String yzm, Model model, HttpServletRequest request){
        User user=userService.dl(username,password);
        String quanxian=user.getQuanxian();
        if(quanxian.equals("管理员")){
           // model.addAttribute("user",user);
            HttpSession session=request.getSession();
            session.setAttribute("user",user);
            return "gl";
        }else{
            return "first";
        }
    }
    @PostMapping("/gl")
    @ResponseBody
    public List<User> gl(){
        System.out.println("111");
        List<User> lys=userService.gl();
        return lys;
    }
    @RequestMapping("/fire")
    @ResponseBody
    public Word fire(@RequestBody User user){
        String name=user.getName();
        String username=user.getUsername();
        String password=user.getPassword();
        String quanxian=user.getQuanxian();
        Order order=new Order();
        Word word=new Word();
        order.setUserid(name);
        List<Order> orders=orderService.searchBy(order);
        System.out.println(orders.size());
        if(orders.size()>0){
            word.setInformation(0);
        }else {
            Integer integer=userService.fire(name,username,password,quanxian);
            int a=shopService.deleteAll(username);
            word.setInformation(1);
        }
        return word;
    }
   @RequestMapping("Register")
    public String Register(String name,String username,String password,String yzm,HttpServletRequest request,Model model){
       HttpSession session=request.getSession();
       String code=(String)session.getAttribute("code");
       if(yzm.equals(code)){
           int b=userService.search(username);
           if(b==0){
               int a=userService.AddUser(name,password,"普通",username);
               return "login";
           }else {
               model.addAttribute("fail","该用户名已注册");
               return "register";
           }
       }else {
          model.addAttribute("fail","验证码错误请重试");
          return "register";
       }
   }
   @RequestMapping("YZM")
   @ResponseBody
    public Word2 YZM(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Word2 word2=new Word2();
       CreateImageCode image = new CreateImageCode();
       System.out.println(image.getCode());
       HttpSession session=request.getSession();
       session.setAttribute("code",image.getCode());
       image.write(response.getOutputStream());
     return word2;
   }
   @RequestMapping("lg")
    public String lg(String username,String password,String yzm,HttpServletRequest request){
        HttpSession session=request.getSession();
        String code=(String)session.getAttribute("code");
        if(yzm.equals(code)){
            User user=userService.dl(username, password);
           // System.out.println(user.getUsername());
            session.setAttribute("user",user);
        }
        return "first";
   }
    @RequestMapping("tuichu")
    public String tuichu(HttpServletRequest request){
       HttpSession session=request.getSession();
       session.removeAttribute("user");
       return "login";
    }

}


