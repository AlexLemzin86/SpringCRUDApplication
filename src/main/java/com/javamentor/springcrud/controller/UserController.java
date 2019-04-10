package com.javamentor.springcrud.controller;

import com.javamentor.springcrud.model.Role;
import com.javamentor.springcrud.model.User;
import com.javamentor.springcrud.service.RoleService;
import com.javamentor.springcrud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class UserController {
    private UserService userService;

    private RoleService roleService;

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @Autowired
    @Qualifier("userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/", "/welcome**"}, method = RequestMethod.GET)
    public ModelAndView getIndexPage(ModelAndView modelAndView) {
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
        }
        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public ModelAndView getUserPage(ModelAndView modelAndView) {
        modelAndView.setViewName("userpage");
        modelAndView.addObject("role", roleService.getRoleName("ROLE_ADMIN"));
        return modelAndView;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView getAdminPage(ModelAndView modelAndView) {
        List<User> users = userService.getAllUsers();
        modelAndView.addObject("users", users);
        modelAndView.setViewName("adminpage");
        return modelAndView;
    }

    @ModelAttribute("user")
    public User createUser() {
        return new User();
    }

    /*@RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public ModelAndView getAddPage(@ModelAttribute("user") User user,
                                   ModelAndView modelAndView) {
        modelAndView.setViewName("adduser");
        return modelAndView;
    }*/

    @RequestMapping(value = "/admin/add", method = RequestMethod.POST)
    public String addNewUser(@ModelAttribute("user") User user,
                             @RequestParam(value = "isAdmin", required = false) String isAdmin,
                             @RequestParam(value = "isUser", required = false) String isUser) {

        getRoles(user, isAdmin, isUser);
        userService.addUser(user);
        return "redirect:/admin";
    }

   /* @RequestMapping(value = "/admin/update/{id}", method = RequestMethod.GET)
    public ModelAndView getUpdatePage(@PathVariable(value = "id") int id, ModelAndView modelAndView) {
        User user = userService.getUserById(id);
        modelAndView.addObject("user", user);
        modelAndView.setViewName("update");
        return modelAndView;
    }*/

    @RequestMapping(value = "/admin/update", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("user") User user,
                             @RequestParam(value = "isAdmin", required = false) String isAdmin,
                             @RequestParam(value = "isUser", required = false) String isUser) {
        getRoles(user, isAdmin, isUser);
        userService.updateUser(user);

        return "redirect:/admin";
    }

    private void getRoles(User user, String isAdmin, String isUser) {
        Set<Role> roles = new HashSet<>();
        if (isAdmin != null) {
            Role admin = roleService.getRoleName("ROLE_ADMIN");
            roles.add(admin);
        }
        if (isUser != null) {
            Role userRole = roleService.getRoleName("ROLE_USER");
            roles.add(userRole);
        }
        user.setRoles(roles);
    }

    @RequestMapping(value = "/admin/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable(value = "id") int id, ModelAndView modelAndView) {
        userService.deleteUser(new User(id));
        modelAndView.addObject("id", id);
        modelAndView.setViewName("redirect:/admin");
        return modelAndView;
    }

    private String getErrorMessage(HttpServletRequest request, String key) {
        Exception exception = (Exception) request.getSession().getAttribute(key);
        String error;
        if (exception instanceof BadCredentialsException) {
            error = "Invalid username and password!";
        } else if (exception instanceof LockedException) {
            error = exception.getMessage();
        } else {
            error = "Invalid username and password!";
        }
        return error;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied(ModelAndView modelAndView) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            modelAndView.addObject("username", userDetail.getUsername());

        }
        modelAndView.setViewName("403");
        return modelAndView;

    }

}
