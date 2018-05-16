using QLPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string username, string password)
        {
            var acc = new QLPhongKSEntities().TaiKhoans.FirstOrDefault(q => q.Username == username && q.Password == password && q.Active != false);
            if (acc == null)
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                return View();
            }
            Session["user"] = acc;
            return RedirectToAction("Index", "DatPhong");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "DatPhong");
        }
    }
}