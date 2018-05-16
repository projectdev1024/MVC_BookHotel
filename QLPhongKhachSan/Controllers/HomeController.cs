using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Controllers
{
    public class HomeController : Controller
    {
        Models.QLPhongKSEntities db = new Models.QLPhongKSEntities();

        public ActionResult Index()
        {
            var data = db.Phongs.Where(q => q.Active != false && q.Delete != true);
            return View(data);
        }

        public ActionResult About()
        {
            return View(db.GioiThieux);
        }

        public ActionResult PartialAbout()
        {
            return View(db.GioiThieux.FirstOrDefault());
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult ConmmingSoon()
        {
            return View(db.SuKiens.FirstOrDefault(q => q.Active != false));
        }
    }
}