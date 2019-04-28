﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectEWS.Entity;
using ProjectEWS.Interface;

namespace ProjectEWS.Controllers
{
    
    public class AdminController : Controller
    {
        private IMasterService _masterService;

        public AdminController(IMasterService masterService)
        {
            _masterService = masterService;
        }
        // GET: Admin
        public ActionResult Login(string ReturnUrl,string Message)
        {
            if (ReturnUrl != null&&Message!=null)
            {
                ViewBag.ReturnUrl = ReturnUrl;
                ViewBag.Message = Message;
            }
            return View();
        }
        public ActionResult Index()
        {
            
            return View();
        }
        [HttpPost]
        public ActionResult Login(string Username,string Password,string ReturnUrl)
        {
            var model = _masterService.Custom().AsNoTracking().SingleOrDefault(a => a.UserName == Username);
            if (model != null)
            {
                if ((model.MasterRoles.SingleOrDefault(a => a.Role.Name == "Admin")) != null)
                {
                    Session["Admin"] = model;
                }
                if ((model.MasterRoles.SingleOrDefault(a => a.Role.Name == "Manager")) != null)
                {
                    Session["User"] = model;
                }
                
               
                if (ReturnUrl !="")
                {
                    return Redirect(ReturnUrl);
                }
                
            }
            return View();
        }
        public ActionResult LogoutAdmin()
        {
            HttpContext.Session.Remove("Admin");
            return RedirectToAction("Login");
        }
        public ActionResult LogoutUser()
        {
            HttpContext.Session.Remove("User");
            return RedirectToAction("Login");
        }
    }
}