using MainProject1.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MainProject1.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult YourStatus()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Status()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Status(StatusModel obj)
        {
            HttpClient clint = new HttpClient();

            var editdata = clint.GetAsync("http://localhost:52217/Api/GetStatus"+"?Empid="+obj.Empid+"&Role="+obj.Role+"&Name="+obj.Name).Result;

            var readData = editdata.Content.ReadAsStringAsync().Result;
             
            var result = JsonConvert.DeserializeObject<DataModel>(readData);
            return View("YourStatus", result);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        [HttpGet]
        public IActionResult Claims()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Claims(DataModel obj)
        {
            HttpClient clint = new HttpClient();
            var adddata = JsonConvert.SerializeObject(obj);

            //step 2- Send data json f, UTF-8,which type of data

            StringContent postData = new StringContent(adddata, System.Text.Encoding.UTF8, "application/json");
            //Post data to api
            var result = clint.PostAsync("http://localhost:52217/Api/InsertClaim", postData).Result;

            TempData["Message"] = "Claims Saved SuccsessFully..";

            return View();
            //if (obj.Role == "Manager")
            //{
            //    return RedirectToAction("ManagerDe","Manager");
            //}
            //else
            //{
            //    return RedirectToAction("EmpStatus","Employee");
            //}
        }
        [AllowAnonymous]
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Login(UserLogin obj)
        {
            HttpClient clint = new HttpClient();

            var editdata = clint.GetAsync("http://localhost:52217/api/UserLogin"+"?Email=" + obj.Email + "&Password=" + obj.Password).Result;

            var readData = editdata.Content.ReadAsStringAsync().Result;

            //3rd step convert json to CLASS OBJECT (razor syntax for view)

            var empres = JsonConvert.DeserializeObject<UserLogin>(readData);

            if (empres == null)
            {
                TempData["InvalidEmail"] = "Invalid Email..Please enter correct Email..";

            }
            else
            {
                if (empres.Email == obj.Email && empres.Password == obj.Password  )
                {
                    HttpContext.Session.SetString("Name1", empres.Name);
                    HttpContext.Session.SetString("Role", empres.Role);
                    //strep 1---

                    var claims = new[] { new Claim(ClaimTypes.Name,  empres.Name),
                    new Claim(ClaimTypes.Email, empres.Email)};

                    //step 2-- identity
                    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    //strep 3---
                    var authProperties = new AuthenticationProperties
                    {
                        IsPersistent = true
                    };
                    //strep 4--- take above values
                    HttpContext.SignInAsync(
                        CookieAuthenticationDefaults.AuthenticationScheme,
                        new ClaimsPrincipal(identity),authProperties);
                    if (empres.Role == obj.Role)
                    {
                        
                        if (empres.Role == "Admin")
                        {
                            return RedirectToAction("Index", "Admin");
                        }
                        else if (empres.Role == "Manager")
                        {
                            return RedirectToAction("EmployeeDet", "Manager");
                        }
                        else if (empres.Role == "Accountent")
                        {
                            return RedirectToAction("AllData", "ACCT");
                        }
                        else if (empres.Role == "Employee")
                        {
                            return RedirectToAction("EmpStatus", "Employee");
                        }
                        TempData["Message"] = "You Login SuccsessFully..";
                    }
                    else
                    {
                        TempData["Role"] = "Please select Correct Role..";
                        return View();
                    }
                }
                else
                {
                    TempData["InvalidPass"] = "Invalid Password..Please enter correct password..";
                }
            }

 
            return View();
        }
        public IActionResult LogOut()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

    }
}
