using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sneaker.Models;
using PagedList;
using PagedList.Mvc;
using System.Data.SqlClient;

namespace Sneaker.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        DataYikesDataContext db = new DataYikesDataContext();
        public ActionResult Index(string sortOrder, string searchString, int? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);

            var products = from p in db.SanPhams
                           select p;

            // Áp dụng sắp xếp dựa trên lựa chọn của người dùng
            switch (sortOrder)
            {
                case "price_asc":
                    products = products.OrderBy(p => p.GiaBan);
                    break;
                case "price_desc":
                    products = products.OrderByDescending(p => p.GiaBan);
                    break;
                case "name_asc":
                    products = products.OrderBy(p => p.TenSP);
                    break;
                case "name_desc":
                    products = products.OrderByDescending(p => p.TenSP);
                    break;
                default:
                    break;
            }

            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(p => p.TenSP.Contains(searchString));
            }


            return View(products.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Brand()
        {
            var thuonghieus = from c in db.ThuongHieus select c;
            return PartialView(thuonghieus);
        }
        public ActionResult ListByBrand(string searchString, int id)
        {
            var sanphams = from p in db.SanPhams where p.MaThuongHieu == id select p;

            if (!String.IsNullOrEmpty(searchString))
            {
                sanphams = sanphams.Where(p => p.TenSP.Contains(searchString));
            }

            return View(sanphams);
        }
        public ActionResult Detail(int id)
        {
            var sanphams = from p in db.SanPhams where p.MaSP == id select p;
            return View(sanphams.Single());
        }

    }
}