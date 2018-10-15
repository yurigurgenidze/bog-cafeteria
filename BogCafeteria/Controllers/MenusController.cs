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
    public class MenusController : Controller
    {
        private ygurDBEntities1 db = new ygurDBEntities1();

        // GET: Menus
        public ActionResult Index(int? id)
        {
            var menus = db.Menus.Include(m => m.Company1).Include(m => m.ProductType).Include(m => m.Product1);
            if (id != null)
            {
                menus = db.Menus.Include(m => m.Company1).Include(m => m.ProductType).Include(m => m.Product1).Where(m => m.Company1.Id == id);
            }
           
            return View(menus.ToList());
        }

        public ActionResult Sales()
        {
            
            return View();
        }
        public ActionResult Buy()
        {
            Sale sale = new Sale();
            sale.Company = (int)Session["company"];
            sale.Price = (int)Session["checkOutPrice"];
            if(sale.Price > 24.04)
            {
                return View("NoMoney");
            }
            sale.User = "20";
            sale.Rating = 5;
            sale.Date = DateTime.Now;
            db.Sales.Add(sale);
            db.SaveChanges();
            return View();
        }

        // GET: Menus/Details/5
        public ActionResult Add(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var products = (List<Menu>)Session["Menu"];
            Menu menu = db.Menus.Find(id);
            products.Add(menu);
            Session["Menu"] = products;
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // GET: Menus/Create
        public ActionResult Create()
        {
            ViewBag.Company = new SelectList(db.Companies, "Id", "Name");
            ViewBag.Category = new SelectList(db.ProductTypes, "Id", "Name");
            ViewBag.Product = new SelectList(db.Products, "Id", "Name");
            return View();
        }

        // POST: Menus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Product,Price,Category,Time,Company")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Company = new SelectList(db.Companies, "Id", "Name", menu.Company);
            ViewBag.Category = new SelectList(db.ProductTypes, "Id", "Name", menu.Category);
            ViewBag.Product = new SelectList(db.Products, "Id", "Name", menu.Product);
            return View(menu);
        }

        // GET: Menus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            ViewBag.Company = new SelectList(db.Companies, "Id", "Name", menu.Company);
            ViewBag.Category = new SelectList(db.ProductTypes, "Id", "Name", menu.Category);
            ViewBag.Product = new SelectList(db.Products, "Id", "Name", menu.Product);
            return View(menu);
        }

        // POST: Menus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Product,Price,Category,Time,Company")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Company = new SelectList(db.Companies, "Id", "Name", menu.Company);
            ViewBag.Category = new SelectList(db.ProductTypes, "Id", "Name", menu.Category);
            ViewBag.Product = new SelectList(db.Products, "Id", "Name", menu.Product);
            return View(menu);
        }

        // GET: Menus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // POST: Menus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Menu menu = db.Menus.Find(id);
            db.Menus.Remove(menu);
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
