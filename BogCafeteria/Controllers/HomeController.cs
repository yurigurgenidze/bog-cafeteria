﻿using BogCafeteria.Entity_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace BogCafeteria.Controllers
{
    public class HomeController : Controller {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Get food for a good price!";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Our contact page.";

            return View();
        }

        public ActionResult Buy()
        {
            return View();
        }
        public ActionResult Adding()
        {
            return View();
        }
    }
}