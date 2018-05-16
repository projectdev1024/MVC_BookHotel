using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QLPhongKhachSan.Models;

namespace QLPhongKhachSan.Areas.Admin.Controllers
{
    public class GiaPhongController : BaseController
    {
        // GET: Admin/GiaPhong
        public ActionResult Index()
        {
            return View(db.GiaPhongs.ToList());
        }

        public ActionResult Edit(int? id, int? IDPhong)
        {
            GiaPhong obj = id > 0 ? db.GiaPhongs.Find(id) : new GiaPhong() { IDPhong = IDPhong };
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        public ActionResult Edit(GiaPhong obj)
        {
            if (obj.IDGiaPhong > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.GiaPhongs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index", "Phong");
        }


        public JsonResult Delete(int id)
        {
            var obj = db.GiaPhongs.Find(id);
            db.GiaPhongs.Remove(obj);
            return Json(db.SaveChanges());
        }

        public virtual JsonResult Active(int id)
        {
            var obj = db.GiaPhongs.Find(id);
            obj.Active = !(obj.Active ?? true);
            return Json(db.SaveChanges() > 0);
        }
    }
}
