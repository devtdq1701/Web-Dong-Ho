using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace WebDongHo.Controllers
{
    public class ProductController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public ActionResult Index(string metatitle,long id)
        {
            var product = db.Products.Find(id);
            var images = product.Images;
            XElement xImages = XElement.Parse(images);
            List<string> listImagesReturn = new List<string>();
            foreach (XElement element in xImages.Elements())
            {
                listImagesReturn.Add(element.Value);
            }
            ViewBag.CategoryName = db.ProductCategories.Find(product.CategoryID).Title;
            ViewBag.CategoryID = db.ProductCategories.Find(product.CategoryID).ID;
            ViewBag.Images = listImagesReturn;
            if (product.MetaTitle == metatitle)
            {
                return View(product);
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Search(string keyword, int? page = 1)
        {
            var products = from s in db.Products
                           select s;
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            products = db.Products.Where(x => x.Title.Contains(keyword)).OrderBy(x => x.CreatedDate);
            if (String.IsNullOrEmpty(keyword))
            {
                ViewBag.totalRecord = 0;

            }
            else
            {
                ViewBag.totalRecord = products.Count();
            }
            ViewBag.keyword = keyword;
            return View(products.ToPagedList(pageNumber, pageSize));
        }
    }
}