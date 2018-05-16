using QLPhongKhachSan.Models;
using Simplify.Mail;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Controllers
{
    public class ReservationController : Controller
    {
        Models.QLPhongKSEntities db = new QLPhongKSEntities();
        // GET: Reservation
        public ActionResult Index()
        {
            return View(new DatPhong());
        }

        [HttpPost]
        public ActionResult Index(DatPhong obj)
        {
            return View(obj);
        }

        [HttpPost]
        public ActionResult Step2(DatPhong obj)
        {
            obj.Phong = db.Phongs.Find(obj.IDPhong);
            obj.SoNgay = (obj.DenNgay - obj.TuNgay)?.Days ?? 0;
            return View(obj);
        }

        [HttpPost]
        public ActionResult GoFinish(DatPhong obj, string firstName, string lastName)
        {
            obj.Phong = db.Phongs.Find(obj.IDPhong);
            obj.HoTen = firstName + " " + lastName;
            db.DatPhongs.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Finish", new { id = obj.IDDatPhong });
        }

        public ActionResult Finish(int id)
        {
            var obj = db.DatPhongs.Find(id);
            if (string.IsNullOrWhiteSpace(obj.TrangThai))
            {
                obj.Vetify = new Random().Next(11111, 99999).ToString();
                obj.HSD = DateTime.Now.AddHours(1);
                MailSender.Default.Send("datphong.khachsan.skyline@gmail.com", obj.Email, "XÁC MINH ĐẶT PHÒNG!", $"<p>Cảm ơn bạn đã đặt phòng tại SkyLine Hotel</p>Mã xác minh là: {obj.Vetify}, Hạn sử dụng: {obj.HSD}");
                obj.NgayTao = DateTime.Now;
                db.SaveChanges();
            }

            obj.Vetify = "";

            string message = " ";
            switch (obj.TrangThai)
            {
                case "Vetified":
                    message = "Đơn đặt phòng đã xác minh thành công trước đó.";
                    break;
                case "TimeOut":
                    message = "Đơn đặt phòng đã hết thời gian kiệu lực";
                    break;
                case "Success":
                    message = "Đã được xử lí";
                    break;
                default:
                    break;
            }
            ModelState.AddModelError("", message);
            return View(obj);
        }

        [HttpPost]
        public ActionResult Finish(DatPhong datPhong)
        {
            var obj = db.DatPhongs.Find(datPhong.IDDatPhong);
            string message = "Lỗi";
            switch (obj.TrangThai)
            {
                case "Vetified":
                    message = "Đơn đặt phòng đã xác minh thành công trước đó.";
                    break;
                case "TimeOut":
                    message = "Đơn đặt phòng đã hết thời gian kiệu lực";
                    break;
                case "Success":
                    message = "Đã được xử lí";
                    break;
                default:
                    if (obj.HSD < DateTime.Now)
                    {
                        obj.TrangThai = "TimeOut";
                        message = "Đơn đặt phòng đã hết thời gian kiệu lực";
                    }
                    else if (obj.Vetify == datPhong.Vetify)
                    {
                        obj.TrangThai = "Vetified";
                        message = "Đơn đặt phòng xác minh thành công.";
                    }
                    else
                    {
                        message = "Mã xác minh không chính xác";
                    }
                    db.SaveChanges();
                    break;
            }
            ModelState.AddModelError("", message);

            datPhong.Phong = obj.Phong;
            datPhong.TrangThai = obj.TrangThai;
            datPhong.NgayTao = DateTime.Now;
            return View(datPhong);
        }
    }
}