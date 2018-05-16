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
    public class SuKienController : BaseController
    {
        // GET: Admin/SuKien
        public ActionResult Index()
        {
            return View(db.SuKiens.ToList());
        }

        public ActionResult Edit(int? id)
        {
            SuKien obj = id > 0 ? db.SuKiens.Find(id) : new SuKien();
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        public ActionResult Edit(SuKien obj)
        {
            obj.SaveFor(q => q.AnhNen);
            if (obj.IDSuKien > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.SuKiens.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        
        public JsonResult Delete(int id)
        {
            SuKien obj = db.SuKiens.Find(id);
            db.SuKiens.Remove(obj);
            return Json(db.SaveChanges());
        }


        public virtual JsonResult Active(int id)
        {
            var obj = db.SuKiens.Find(id);
            obj.Active = !(obj.Active ?? true);
            return Json(db.SaveChanges() > 0);
        }
    }
}
