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
    public class ImagePhongController : BaseController
    {
        // GET: Admin/ImagePhong
        public ActionResult Index()
        {
            return View(db.ImagePhongs.ToList());
        }

        public ActionResult Edit(int? id, int? IDPhong)
        {
            ImagePhong obj = id > 0 ? db.ImagePhongs.Find(id) : new ImagePhong() { IDPhong = IDPhong };
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        public ActionResult Edit(ImagePhong obj)
        {
            obj.SaveFor(q => q.Link);
            if (obj.IDImageHome > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.ImagePhongs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index", "Phong");
        }

        public JsonResult Delete(int id)
        {
            ImagePhong obj = db.ImagePhongs.Find(id);
            db.ImagePhongs.Remove(obj);
            return Json(db.SaveChanges());
        }


        public virtual JsonResult Active(int id)
        {
            var obj = db.ImagePhongs.Find(id);
            obj.Active = !(obj.Active ?? true);
            return Json(db.SaveChanges() > 0);
        }
    }
}
