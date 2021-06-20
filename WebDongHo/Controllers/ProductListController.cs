using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebDongHo.Controllers
{
    public class ProductListController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public ActionResult Index(string metatitle, long id, int? page = 1)
        {
            var products = from s in db.Products
                           select s;
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            products = db.Products.Where(x => x.CategoryID == id).OrderBy(x=>x.CreatedDate);
            ViewBag.totalRecord = products.Count();
            

            ProductCategory productCategory = db.ProductCategories.Find(id);
            ViewBag.CategoryName = productCategory.Title;
            ViewBag.CategoryMeta = productCategory.MetaTitle;
            ViewBag.CategoryID = productCategory.ID;
            if (productCategory.MetaTitle == metatitle)
            {
                return View(products.ToPagedList(pageNumber, pageSize));
            }
            return RedirectToAction("Index", "Home");
        }
    }
}