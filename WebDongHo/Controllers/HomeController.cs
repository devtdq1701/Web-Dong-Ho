using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDongHo.Common;
using WebDongHo.Models;

namespace WebDongHo.Controllers
{
    public class HomeController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult ProductCategory()
        {
            return PartialView(db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.Order).ToList());
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult Banner()
        {
            return PartialView(db.Slides.Where(x => x.Status == true).OrderBy(x => x.Order).ToList());
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult Brand()
        {
            return PartialView(db.Brands.Where(x => x.Status == true).OrderBy(x => x.Order).ToList());
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult GarminCategory()
        {
            ViewBag.ProductList = db.Products.Where(x => x.CategoryID == 6 && x.Special == true).ToList();
            return PartialView(db.ProductCategories.Find(6));
        }
        public ActionResult CardHeader()
        {
            var cart = Session[SessionMember.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return PartialView(list);
        }
    }
}