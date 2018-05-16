using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Controllers
{
    public class DichVuController : Controller
    {
        // GET: DichVu
        public ActionResult Index()
        {
            return View(new Models.QLPhongKSEntities().DichVus.Where(q => q.Active != false));
        }
    }
}