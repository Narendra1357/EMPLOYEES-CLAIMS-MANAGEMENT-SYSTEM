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
  [Authorize]
    public class ACCTController : Controller
    {

        HttpClient clint = new HttpClient();
        public IActionResult AllData()

        {
            var data = clint.GetAsync("http://localhost:52217/Api/GetAllData").Result;
            //2nd step for read data
            var readData = data.Content.ReadAsStringAsync().Result;

            //3rd step convert json to CLASS OBJECT (razor syntax for view)

            var res = JsonConvert.DeserializeObject<List<DataModel>>(readData);

            return View(res);
        }

        public IActionResult ManagerDe()
        {
            var data = clint.GetAsync("http://localhost:52217/Api/GetDataWithRole" + "?Role=" + "Manager").Result;
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
            var result = clint.PostAsync("http://localhost:52217/Api/AccSApproved" + "?Id=" + Empid, postData).Result;

            TempData["Message"] = "Data Saved SuccsessFully..";

            return RedirectToAction("AllData");

        }

        public IActionResult Sendback(int Empid)
        {
            var adddata = JsonConvert.SerializeObject(Empid);
            StringContent postData = new StringContent(adddata, System.Text.Encoding.UTF8, "application/json");
            var result = clint.PostAsync("http://localhost:52217/Api/AccSSandBack?Id=" + Empid, postData).Result;
            return RedirectToAction("AllData");
        }

        public IActionResult Reject(int Empid)
        {
            var adddata = JsonConvert.SerializeObject(Empid);
            StringContent postData = new StringContent(adddata, System.Text.Encoding.UTF8, "application/json");
            var result = clint.PostAsync("http://localhost:52217/Api/AccSReject" + "?Id=" + Empid, postData).Result;
            TempData["Message"] = "Data Saved SuccsessFully..";
            return RedirectToAction("AllData");
        }

        public IActionResult LogOut()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Clear();
            return RedirectToAction("Login","Home");
        }

    }
}
