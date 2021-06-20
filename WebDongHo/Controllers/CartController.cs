using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebDongHo.Models;

namespace WebDongHo.Controllers
{
    public class CartController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        private const string CartSession = "CartSession";
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
                return View(list);
            }
            return RedirectToAction("Index", "Home");
        }
        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.ID == id);
            Session[CartSession] = sessionCart;
            var Qty = sessionCart.Sum(x => x.Quantity);
            var ToTalPrice = sessionCart.Sum(x => x.Quantity * x.Product.Price).Value.ToString("N0") + " đ";
            var info = new { Qty, ToTalPrice };
            return Json(info, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true

            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ID == item.Product.ID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            var List = new List<CartItem>();
            List = (List<CartItem>)Session[CartSession];
            var Qty = List.Sum(x => x.Quantity);
            var Total = List.Sum(x => x.Product.Price * x.Quantity).Value.ToString("N0") + " đ";
            var info = new { Qty, Total };
            return Json(info, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(int quantity, long id)
        {
            var product = db.Products.Find(id);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.ID == id))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.ID == id)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                Session[CartSession] = list;
            }
            else
            {
                //tạo mới cart item
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                //gán vào session
                Session[CartSession] = list;

            }
            var List = new List<CartItem>();
            List = (List<CartItem>)Session[CartSession];
            var Qty = List.Sum(x => x.Quantity);
            var info = new { Qty };
            return Json(info, JsonRequestBehavior.AllowGet);
        }
        //public ActionResult AddItem(long id, int quantity)
        //{
        //    var product= db.Products.Find(id);
        //    var cart = Session[CartSession];
        //    if (cart != null)
        //    {
        //        var list = (List<CartItem>)cart;
        //        if (list.Exists(x => x.Product.ID == id))
        //        {
        //            foreach(var item in list)
        //            {
        //                if (item.Product.ID == id)
        //                {
        //                    item.Quantity += quantity;
        //                }
        //            }
        //        }
        //        else
        //        {
        //            var item = new CartItem();
        //            item.Product = product;
        //            item.Quantity = quantity;
        //            list.Add(item);
        //        }
        //        Session[CartSession] = list;
        //    }
        //    else
        //    {
        //        //tạo mới cart item
        //        var item = new CartItem();
        //        item.Product = product;
        //        item.Quantity = quantity;
        //        var list = new List<CartItem>();
        //        list.Add(item);
        //        //gán vào session
        //        Session[CartSession] = list;

        //    }
        //    return RedirectToAction("Index");
        //}
        public ActionResult Success()
        {
            return View();
        }
    }
}