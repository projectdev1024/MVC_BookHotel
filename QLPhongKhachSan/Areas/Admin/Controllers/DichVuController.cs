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
    public class DichVuController : BaseController
    {
        // GET: Admin/DichVu
        public ActionResult Index()
        {
            return View(db.DichVus.Where(q => q.Delete != true).ToList());
        }

        public ActionResult Edit(int? id)
        {
            DichVu obj = id > 0 ? db.DichVus.Find(id) : new DichVu();
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        public ActionResult Edit(DichVu obj)
        {
            if (obj.IDDichVu > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.DichVus.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            DichVu obj = db.DichVus.Find(id);
            obj.Delete = true;
            return Json(db.SaveChanges());
        }


        public virtual JsonResult Active(int id)
        {
            var obj = db.DichVus.Find(id);
            obj.Active = !(obj.Active ?? true);
            return Json(db.SaveChanges() > 0);
        }
    }
}
