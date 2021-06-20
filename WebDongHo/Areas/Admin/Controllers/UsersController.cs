using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using WebDongHo.Common;

namespace WebDongHo.Areas.Admin.Controllers
{
    public class UsersController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        public int CheckUserName(string userName)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result != null)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.UserGroup);
            return View(users.ToList());
        }

        // GET: Admin/Users/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/Users/Create
        public ActionResult Create()
        {
            ViewBag.GroupID = new SelectList(db.UserGroups.Where(x => x.IsActived == true && x.IsDeleted == false), "ID", "Name");
            return View();
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserName,Password,Email,Mobile,Name,Address,Sex,UpdatedDate,UpdatedBy,LastLoginDate,LastChangePassword,GroupID")] User user)
        {
            if (ModelState.IsValid)
            {
                var result = CheckUserName(user.UserName);
                if (result == 1)
                {

                    ModelState.AddModelError("", "User Name đã tồn tại");
                }
                else
                {
                    DateTime now = DateTime.Now;
                    user.Password = Encryptor.MD5Hash(user.Password);
                    db.Users.Add(user);
                    db.SaveChanges();
                    SetAlert("Thêm user thành công", "alert-success");
                    return RedirectToAction("Index");
                }
            }

            ViewBag.GroupID = new SelectList(db.UserGroups.Where(x=>x.IsActived==true&&x.IsDeleted==false), "ID", "Name", user.GroupID);
            return View(user);
        }

        // GET: Admin/Users/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.GroupID = new SelectList(db.UserGroups.Where(x => x.IsActived == true && x.IsDeleted == false), "ID", "Name", user.GroupID);
            return View(user);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserName,Password,Email,Mobile,Name,Address,Sex,UpdatedDate,UpdatedBy,LastLoginDate,LastChangePassword,GroupID")] User user)
        {
            if (ModelState.IsValid)
            {
                DateTime now = DateTime.Now;
                user.UpdatedDate = now;
                user.Password = Encryptor.MD5Hash(user.Password);
                user.UpdatedBy = Session["username"].ToString();
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Sửa user thành công", "success");
                return RedirectToAction("Index");
            }
            ViewBag.GroupID = new SelectList(db.UserGroups.Where(x => x.IsActived == true && x.IsDeleted == false), "ID", "Name", user.GroupID);
            return View(user);
        }

        [HttpDelete]
        public ActionResult Delete(string id)
        {

            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            SetAlert("Xoá user thành công", "success");
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
    }
}
