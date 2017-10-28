/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.daos.RoleDAO;
import model.pojos.Role;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 * Maps to roles.htm
 * @author Ishan Ayesha
 */
public class RoleController implements Controller {

    /**
     * Handles Controller Requests
     * @param hsr
     * @param hsr1
     * @return
     * @throws Exception 
     */
    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = null;
        String method = hsr.getMethod();
        if (method == "POST") {
            method = hsr.getParameter("_method");
        }
        switch (method) {
            case "GET":
                mv = getRoleList();
                mv.addObject("flag", false);

                break;

            case "POST":
                saveRole(hsr);
                mv = getRoleList();
                mv.addObject("flag", true);
                mv.addObject("message", "Role Added Successfully!");
                break;

            case "PUT":
                updateRole(hsr);

                mv = getRoleList();
                mv.addObject("flag", true);
                mv.addObject("message", "Role Edited Successfully!");
                break;

//            case "DELETE":
//                mv = getRoleList();
//                break;
        }
        mv.addObject("page", "role");
        return mv;
    }

    /**
     * Returns Role List View
     * @return 
     */
    private ModelAndView getRoleList() {

        ModelAndView mv = new ModelAndView("roles");

        try {
            List<Role> roles = RoleDAO.get();

            mv.addObject("roles", roles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    /**
     * Saves a Role through POST
     * @param hsr 
     */
    private void saveRole(HttpServletRequest hsr) {
        Role role = new Role();
        role.setTitle(hsr.getParameter("title"));
        RoleDAO.saveOrUpdateRole(role);

    }

    /**
     * Updates a Role through PUT
     * @param hsr 
     */
    private void updateRole(HttpServletRequest hsr) {

        Role role = new Role();
        role.setTitle(hsr.getParameter("title"));
        role.setId(Integer.parseInt(hsr.getParameter("id")));
        RoleDAO.saveOrUpdateRole(role);

    }
}
