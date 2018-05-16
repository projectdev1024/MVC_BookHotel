using QLPhongKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLPhongKhachSan.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        public string DELETE { get; set; } = "Delete";

        public TaiKhoan Account { get; set; }

        public QLPhongKSEntities db = new QLPhongKSEntities();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            Account = Session["user"] as TaiKhoan;
            if (Account == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new
                {
                    Action = "Index",
                    Controller = "Login",
                }));
            }
            base.OnActionExecuting(filterContext);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}