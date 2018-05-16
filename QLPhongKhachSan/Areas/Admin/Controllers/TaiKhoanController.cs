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
    public class TaiKhoanController : BaseController
    {
        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(string oldpass, string newpass, string repass)
        {
            if (newpass != repass)
            {
                ModelState.AddModelError("", "Xác nhận mật khẩu không chính xác.");
            }
            if (newpass.Length < 8)
            {
                ModelState.AddModelError("", "Nhập mật khẩu có ít nhất 08 tí tự.");
            }
            if (oldpass.Length < 0)
            {
                ModelState.AddModelError("", "Vui lòng nhập mật khẩu cũ.");
            }
            if (ModelState.ContainsKey("") == false)
            {
                var acc = db.TaiKhoans.FirstOrDefault(q => q.IDTaiKhoan == Account.IDTaiKhoan);
                if (acc.Password == oldpass)
                {
                    acc.Password = repass;
                    db.SaveChanges();
                    return RedirectToAction("Logout", "Login", new { area = "" });
                }
                ModelState.AddModelError("", "Mật khẩu cũ không chính xác");
            }
            return View();
        }
        // GET: TaiKhoan
        public ActionResult Index()
        {
            return View(db.TaiKhoans.Where(q => q.Active != false).ToList());
        }

        public ActionResult Edit(int? id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                taiKhoan = new TaiKhoan();
            }
            return View(taiKhoan);
        }

        // POST: TaiKhoan/Edit/5
        [HttpPost]
        public ActionResult Edit(TaiKhoan taiKhoan)
        {
            if (ModelState.IsValid)
            {
                taiKhoan.SaveFor(q => q.Avatar);
                if (taiKhoan.IDTaiKhoan > 0)
                {
                    db.Entry(taiKhoan).State = EntityState.Modified;
                }
                else
                {
                    db.TaiKhoans.Add(taiKhoan);
                }
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taiKhoan);
        }

        public JsonResult Delete(int id)
        {
            db.TaiKhoans.Find(id).Active = false;
            return Json(db.SaveChanges());
        }

        public virtual JsonResult Active(int id)
        {
            var obj = db.TaiKhoans.Find(id);
            obj.Active = !(obj.Active ?? true);
            return Json(db.SaveChanges() > 0);
        }
    }
}
