using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Areas.Admin.Controllers
{
    public class DatPhongController : BaseController
    {
        // GET: Admin/DatPhong
        public ActionResult Index()
        {
            return View(db.DatPhongs.Where(q => q.TrangThai == "Vetified" || q.TrangThai == "0" || q.TrangThai == "1").OrderByDescending(q => q.NgayTao).ThenBy(q => q.TuNgay));
        }

        public JsonResult Success(int id, bool status)
        {
            var obj = db.DatPhongs.Find(id);
            obj.TrangThai = status ? "1" : "0";
            obj.XuLiLuc = DateTime.Now;
            obj.NguoiXuLi = Account.IDTaiKhoan;
            return Json(db.SaveChanges() > 0);
        }
    }
}