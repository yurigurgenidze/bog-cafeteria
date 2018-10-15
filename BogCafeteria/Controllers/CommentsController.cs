using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BogCafeteria.Entity_Data;

namespace BogCafeteria.Controllers
{
    public class CommentsController : Controller
    {
        private ygurDBEntities1 db = new ygurDBEntities1();

        // GET: Comments
        public ActionResult Index(int? Id)
        {
            var comments = db.Comments.Include(c => c.Company1).Include(c => c.CommentType);
            if (Id != null)
            {
                comments = db.Comments.Include(c => c.Company1).Include(c => c.CommentType).Where(c => c.Company1.Id == Id);
            }
            
            return View(comments.ToList());
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            ViewBag.Company = new SelectList(db.Companies, "Id", "Name");
            ViewBag.Type = new SelectList(db.CommentTypes, "Id", "Name");
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Company,Type,Comment1")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                comment.Company = (int)Session["company"];
                var commentsList = db.Comments.ToList();
                var Id = commentsList[commentsList.Count - 1].Id;
                Id = Id + 1;
                comment.Id = Id;
                db.Comments.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Company = new SelectList(db.Companies, "Id", "Name", comment.Company);
            ViewBag.Type = new SelectList(db.CommentTypes, "Id", "Name", comment.Type);
            return View(comment);
        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.Company = new SelectList(db.Companies, "Id", "Name", comment.Company);
            ViewBag.Type = new SelectList(db.CommentTypes, "Id", "Name", comment.Type);
            return View(comment);
        }

        // POST: Comments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Company,Type,Comment1")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Company = new SelectList(db.Companies, "Id", "Name", comment.Company);
            ViewBag.Type = new SelectList(db.CommentTypes, "Id", "Name", comment.Type);
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comments.Find(id);
            db.Comments.Remove(comment);
            db.SaveChanges();
            return RedirectToAction("Index");
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
