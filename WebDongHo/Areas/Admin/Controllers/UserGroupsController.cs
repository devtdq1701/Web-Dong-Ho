using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;

namespace WebDongHo.Areas.Admin.Controllers
{
    public class UserGroupsController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/UserGroups
        public ActionResult Index()
        {
            return View(db.UserGroups.ToList());
        }

        // GET: Admin/UserGroups/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = db.UserGroups.Find(id);
            if (userGroup == null)
            {
                return HttpNotFound();
            }
            return View(userGroup);
        }

        // GET: Admin/UserGroups/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/UserGroups/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Description,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy,IsActived,IsDeleted")] UserGroup userGroup)
        {
            if (ModelState.IsValid)
            {
                DateTime now = DateTime.Now;
                userGroup.CreatedDate = now;
                userGroup.CreatedBy = Session["username"].ToString();
                db.UserGroups.Add(userGroup);
                db.SaveChanges();
                SetAlert("Sửa thành công", "success");
                return RedirectToAction("Index");
            }

            return View(userGroup);
        }

        // GET: Admin/UserGroups/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = db.UserGroups.Find(id);
            if (userGroup == null)
            {
                return HttpNotFound();
            }
            return View(userGroup);
        }

        // POST: Admin/UserGroups/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy,IsActived,IsDeleted")] UserGroup userGroup)
        {
            if (ModelState.IsValid)
            {
                DateTime now = DateTime.Now;
                userGroup.UpdatedDate = now;
                userGroup.UpdatedBy = Session["username"].ToString();
                db.Entry(userGroup).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Sửa thành công", "success");
                return RedirectToAction("Index");
            }
            return View(userGroup);
        }

        [HttpDelete]
        public ActionResult Delete(string id)
        {

            UserGroup userGroup = db.UserGroups.Find(id);
            db.UserGroups.Remove(userGroup);
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
