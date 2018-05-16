using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace QLPhongKhachSan
{
    public static class Helper
    {
        public static MvcHtmlString Required(this MvcHtmlString control)
        {
            return MvcHtmlString.Create(control.ToHtmlString().Replace("/>", " required />"));
        }

        public static MvcHtmlString Type(this MvcHtmlString control, htmlType type)
        {
            return MvcHtmlString.Create(control.ToHtmlString().Replace("type=\"text\"", $"type=\"{type.ToString().Replace("_", "-")}\""));
        }

        public static MvcForm BeginFormMultipart(this HtmlHelper helper)
        {
            string controllerName = helper.ViewContext.RouteData.Values["controller"].ToString();
            string actionName = helper.ViewContext.RouteData.Values["action"].ToString();
            return helper.BeginForm(actionName: actionName, controllerName: controllerName, method: FormMethod.Post, htmlAttributes: new { enctype = "multipart/form-data" });
        }

    }

    public enum htmlType
    {
        date, number, radio, checkbox, color, email, file, range, reset, text, password, datetime_local
    }

    public static class ObjectExtentions
    {
        public static string GetPropertyName<T, Y>(this Expression<Func<T, Y>> expression)
        {
            if (expression.Body is MemberExpression member)
                return member.Member.Name;
            return ((expression.Body as UnaryExpression).Operand as MemberExpression).Member.Name;
        }
    }

    public static class UploadFile
    {
        public static string Save(this HttpPostedFile file, string folder = "/Content/Upload")
        {
            try
            {
                if (file == null || file.ContentLength <= 0) return null;

                string mfolder = HttpContext.Current.Server.MapPath(folder);
                if (Directory.Exists(mfolder) == false) Directory.CreateDirectory(mfolder);

                string filename = $"{DateTime.Now.ToString("ddMMyyyyhhmmss")}_{Path.GetFileName(file.FileName)}";

                file.SaveAs(Path.Combine(mfolder, filename));

                return $"{folder}/{filename}";
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static void SaveFor<T, Y>(this T obj, Expression<Func<T, Y>> expression, string folder = "/Content/Upload")
        {
            string name = expression.GetPropertyName();
            HttpPostedFile fileBase = HttpContext.Current.Request.Files[name];
            var s = fileBase.Save();
            if (s != null)
            {
                obj.GetType().GetProperties().FirstOrDefault(q => q.Name == name)?.SetValue(obj, s);
            }
        }
    }
}