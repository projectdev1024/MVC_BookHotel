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
    public class GioiThieuController : BaseController
    {
        // GET: Admin/GioiThieu
        public ActionResult Index()
        {
            return View(db.GioiThieux.ToList());
        }

        public ActionResult Edit(int? id)
        {
            GioiThieu gioiThieu = new GioiThieu();
            if (id.HasValue)
            {
                gioiThieu = db.GioiThieux.Find(id);
            }
            if (gioiThieu == null)
            {
                return HttpNotFound();
            }
            return View(gioiThieu);
        }

        // POST: Admin/GioiThieu/Edit/5
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(GioiThieu gioiThieu)
        {
            gioiThieu.SaveFor(q => q.HinhAnh);
            gioiThieu.SaveFor(q => q.HinhAnh2);
            gioiThieu.SaveFor(q => q.HinhAnh3);
            if (gioiThieu.IDGioiThieu > 0)
            {
                db.Entry(gioiThieu).State = EntityState.Modified;
            }
            else
            {
                db.GioiThieux.Add(gioiThieu);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/GioiThieu/Delete/5
        public JsonResult Delete(int id)
        {
            GioiThieu gioiThieu = db.GioiThieux.Find(id);
            db.GioiThieux.Remove(gioiThieu);
            return Json(db.SaveChanges());
        }
    }
}
