using MainProject1.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace MainProject1.Controllers
{

    public class ManagerController : Controller
    {
        HttpClient clint = new HttpClient();
       
        public IActionResult EmployeeDet()
        {
            var data = clint.GetAsync("http://localhost:52217/Api/GetDataWithRole" + "?Role=" + "Employee").Result;
            var readData = data.Content.ReadAsStringAsync().Result;
            var res = JsonConvert.DeserializeObject<List<DataModel>>(readData);

            return View(res);
        }

        public IActionResult Approv(int Empid)
        {

            var adddata = JsonConvert.SerializeObject(Empid);

            //step 2- Send data json f, UTF-8,which type of data

            StringContent postData = new StringContent(adddata, System.Text.Encoding.UTF8, "application/json");
            //Post data to api
            var result = clint.PostAsync("http://localhost:52217/Api/MngApproved" + "?Id=" + Empid, postData).Result;

            TempData["Message"] = "Data Saved SuccsessFully..";

            return RedirectToAction("EmployeeDet");

        }
      
        public IActionResult Sendback(int Empid)
        {
            var adddata = JsonConvert.SerializeObject(Empid);
            StringContent postData = new StringContent(adddata, System.Text.Encoding.UTF8, "application/json");
            var result = clint.PostAsync("http://localhost:52217/Api/MngSandBack?Id=" + Empid, postData).Result;
            return RedirectToAction("EmployeeDet");
        }
       
        public IActionResult Reject(int Empid)
        {
            var adddata = JsonConvert.SerializeObject(Empid);
            StringContent postData = new StringContent(adddata, System.Text.Encoding.UTF8, "application/json");
            var result = clint.PostAsync("http://localhost:52217/Api/MngReject" + "?Id=" + Empid, postData).Result;
            TempData["Message"] = "Data Saved SuccsessFully..";
            return RedirectToAction("EmployeeDet");
        }
        public IActionResult LogOut()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Clear();
            return RedirectToAction("Login", "Home");
        }

    }
}
