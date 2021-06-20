using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml.Linq;
using Model.EF;
using WebDongHo.Common;

namespace WebDongHo.Areas.Admin.Controllers
{
    public class ProductsController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Brand).Include(p => p.ProductCategory);
            return View(products.ToList());
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            var images = product.Images;
            XElement xImages = XElement.Parse(images);
            List<string> listImagesReturn = new List<string>();
            foreach(XElement element in xImages.Elements())
            {
                listImagesReturn.Add(element.Value);
            }
            ViewBag.Images = listImagesReturn;
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.BrandID = new SelectList(db.Brands, "ID", "Title");
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "ID", "Title");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID,Title,MetaTitle,Images,Thumb,Price,OldPrice,MetaKeywords,MetaDescription,Gift,Quantity,Detail,Guarantee,Specification,MoreDesc,CategoryID,BrandID,Special,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy")] Product product)
        {
            if (ModelState.IsValid)
            {
                DateTime now = DateTime.Now;
                product.CreatedDate = now;
                product.CreatedBy = Session["username"].ToString();
                product.MetaTitle = ConvertToSEO.Convert(product.Title);
                db.Products.Add(product);
                db.SaveChanges();
                SetAlert("Thêm product thành công", "success");
                return RedirectToAction("Index");
            }

            ViewBag.BrandID = new SelectList(db.Brands, "ID", "Title", product.BrandID);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "ID", "Title", product.CategoryID);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.BrandID = new SelectList(db.Brands, "ID", "Title", product.BrandID);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "ID", "Title", product.CategoryID);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID,Title,MetaTitle,Images,Thumb,Price,OldPrice,MetaKeywords,MetaDescription,Gift,Quantity,Detail,Guarantee,Specification,MoreDesc,CategoryID,BrandID,Special,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                DateTime now = DateTime.Now;
                product.UpdatedDate = now;
                product.UpdatedBy = Session["username"].ToString();
                product.MetaTitle = ConvertToSEO.Convert(product.Title);
                db.SaveChanges();
                SetAlert("Sửa product thành công", "success");
                return RedirectToAction("Index");
            }
            ViewBag.BrandID = new SelectList(db.Brands, "ID", "Title", product.BrandID);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "ID", "Title", product.CategoryID);
            return View(product);
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {

            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            SetAlert("Xoá product thành công", "success");
            return Json(new { Success = true });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public void UpdateImages(long id, string images)
        {
            var product = db.Products.Find(id);
            product.Images = images;
            db.SaveChanges();
        }
        public JsonResult SaveImages(long id, string images)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var listImages = serializer.Deserialize<List<string>>(images);
            XElement xElement = new XElement("Images");
            foreach (var item in listImages)
            {
                xElement.Add(new XElement("Images", item));
            }
            UpdateImages(id, xElement.ToString());
            return Json(new
            {
                status = true
            });
        }
        public JsonResult LoadImages(long id)
        {

            Product product = db.Products.Find(id);
            var images = product.Images;
            XElement xImages;
            List<string> listImagesReturn = new List<string>();
            if (images == null)
            {
                listImagesReturn = null;
            }
            else
            {
                xImages = XElement.Parse(images);
                foreach (XElement element in xImages.Elements())
                {
                    listImagesReturn.Add(element.Value);
                }
            }
            
            return Json(new
            {
                status = true,
                data = listImagesReturn
            },JsonRequestBehavior.AllowGet);
           
        }
    }
}

