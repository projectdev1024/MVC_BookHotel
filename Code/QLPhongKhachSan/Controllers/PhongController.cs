using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Controllers
{
    public class PhongController : Controller
    {
        QLPhongKhachSan.Models.QLPhongKSEntities db = new Models.QLPhongKSEntities();

        // GET: Phong
        public ActionResult Index()
        {
            return View(db.Phongs.Where(q => q.Active != false && q.Delete != true));
        }

        public ActionResult Detail(int IDPhong)
        {
            return View(db.Phongs.Find(IDPhong));
        }

        public ActionResult Top(int top = 4)
        {
            return View(db.Phongs.Where(q => q.Active != false && q.Delete != true).Take(top));
        }

        public ActionResult BookRoom()
        {
            return View(db.Phongs.Where(q => q.Active != false && q.Delete != true));
        }
    }
}