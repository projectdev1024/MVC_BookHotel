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
    public class PhongController : BaseController
    {
        // GET: Admin/Phong
        public ActionResult Index()
        {
            return View(db.Phongs.Where(q => q.Delete != true).ToList());
        }

        public ActionResult Edit(int? id)
        {
            Phong obj = id > 0 ? db.Phongs.Find(id) : new Phong();
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        public ActionResult Edit(Phong obj)
        {
            obj.SaveFor(q => q.Anh);
            if (obj.IDPhong > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.Phongs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index", "Phong");
        }

        public JsonResult Delete(int id)
        {
            Phong obj = db.Phongs.Find(id);
            db.Phongs.Remove(obj);
            return Json(db.SaveChanges());
        }


        public virtual JsonResult Active(int id)
        {
            var obj = db.Phongs.Find(id);
            obj.Active = !(obj.Active ?? true);
            return Json(db.SaveChanges() > 0);
        }
    }
}
