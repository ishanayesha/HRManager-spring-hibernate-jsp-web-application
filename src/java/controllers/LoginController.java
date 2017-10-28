/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Ishan Ayesha
 */
public class LoginController implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("login");
//        String method = hsr.getMethod();
//        if (method == "POST") {
//            method = hsr.getParameter("_method");
//        }
////        switch (method) {
//            case "GET":
//                mv = getRoleList();
//                mv.addObject("flag", false);
//
//                break;
//
//            case "POST":
//                saveRole(hsr);
//                mv = getRoleList();
//                mv.addObject("flag", true);
//                mv.addObject("message", "Role Added Successfully!");
//                break;
//
//            case "PUT":
//                updateRole(hsr);
//
//                mv = getRoleList();
//                mv.addObject("flag", true);
//                mv.addObject("message", "Role Edited Successfully!");
//                break;
//
//            case "DELETE":
//                mv = getRoleList();
//                break;
//        }
      //  mv.addObject("page", "role");
        return mv;
    }
    
}
