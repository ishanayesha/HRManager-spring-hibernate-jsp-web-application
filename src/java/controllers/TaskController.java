/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import model.daos.RoleDAO;
import model.daos.TaskDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.pojos.Role;
import model.pojos.Task;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 * Maps to tasks.htm
 * @author Ishan Ayesha
 */
public class TaskController implements Controller {

    /**
     * Main Request Handler for this controller
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
                mv = get();
                mv.addObject("flag", false);

                break;

            case "POST":
                save(hsr);
                mv = get();
                mv.addObject("flag", true);
                mv.addObject("message", "Task Added Successfully!");
                break;

            case "PUT":
                update(hsr);

                mv = get();
                mv.addObject("flag", true);
                mv.addObject("message", "Task Edited Successfully!");
                break;

//            case "DELETE":
//                mv = get();
//                break;
        }
        mv.addObject("page", "task");
        return mv;
    }

    /**
     * Generate view for Task List
     * @return 
     */
    private ModelAndView get() {

        ModelAndView mv = new ModelAndView("tasks");

        try {
            List<Task> tasks = TaskDAO.getTaskList();
            mv.addObject("tasks", tasks);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    /**
     * Save Task through POST
     * @param hsr 
     */
    private void save(HttpServletRequest hsr) {
        Task task = new Task();
        task.setDescription(hsr.getParameter("desc"));
        TaskDAO.saveOrUpdateTask(task);
    }

    /**
     * Update Task through PUT
     * @param hsr 
     */
    private void update(HttpServletRequest hsr) {

        Task task = new Task();
        task.setDescription(hsr.getParameter("desc"));
        task.setId(Integer.parseInt(hsr.getParameter("id")));
        TaskDAO.saveOrUpdateTask(task);

    }
}
