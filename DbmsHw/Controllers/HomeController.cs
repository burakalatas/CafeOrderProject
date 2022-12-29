using DbmsHw.Context;
using DbmsHw.Entities;
using DbmsHw.Models;
using DbmsHw.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace DbmsHw.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        RestaurantContext c = new RestaurantContext();

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            var tableInfos = c.Tables.Select(m => new TableInfo
            {
                TableId = m.Tableid
            });
            

            return View(tableInfos);
        }
        
        [HttpGet]
        public IActionResult addOrder(int? id)
        {
            FoodAndBeverage fb = new FoodAndBeverage();
            fb.Foodlists = c.Foodlists.ToList();
            fb.Beveragelist = c.Beveragelists.ToList();
            fb.staffLists = c.Staff.ToList();
            fb.tables = c.Tables.ToList();
            ViewBag.TableNo = id;
            //FoodName fn = new FoodName
            //{
            //    foodName = values.Foodname,
            //    foodPrice = values.Foodprice,
            //};
            return View(fb);
        }
        [HttpPost]
        public IActionResult AddOrder(FoodName fn)
        {
            float foodPrice = c.Foodlists.Where(m => m.Foodname == fn.foodname).Select(m => m.Foodprice).FirstOrDefault();
            float beveragePrice = c.Beveragelists.Where(m => m.Beveragename == fn.beveragename).Select(m => m.Beverageprice).FirstOrDefault();

            if (fn.TableId !=0)
            {
                fn.orderaddress = null;
            }

            c.Orders.Add(new Order
            {
                Orderaddress = fn.orderaddress,
                Staffid = fn.staffID,
                Totalprice = foodPrice + beveragePrice,
                Tableid = fn.TableId
            });
            if (fn.beveragename != null || fn.foodname != null)
            {
                c.SaveChanges();
            }
            if (fn.foodname !=null)
            {
                c.Foods.Add(new Food
                {
                    Orderid = c.Orders.Max(m => m.Orderid),
                    Foodname = fn.foodname,
                    Foodprice = foodPrice
                });
            }
            if (fn.beveragename != null)
            {
                c.Beverages.Add(new Beverage
                {
                    Orderid = c.Orders.Max(m => m.Orderid),
                    Beveragename = fn.beveragename,
                    Beverageprice = beveragePrice
                });
            }
            if (fn.beveragename != null || fn.foodname !=null)
            {
                c.SaveChanges();
            }
 

            return RedirectToAction("AddOrder");
        }
        public IActionResult Order()
        {
            var order = c.Orders.Select(m => new OrderInfo
            {
                OrderId = m.Orderid,
                OrderAddress = m.Orderaddress,
                StaffId = m.Staffid,
                TotalPrice = m.Totalprice,
                TableId = m.Tableid,
                StaffName = m.Staff.Staffname
                
            }).OrderBy(m=>m.OrderId);
            return View(order);
        }
        public IActionResult DeleteOrder(int id)
        {
            var order = c.Orders.Where(m => m.Orderid == id).FirstOrDefault();
            c.Orders.Remove(order);
            c.SaveChanges();
            return RedirectToAction("Order");
        }
        public IActionResult OrderDetails(int[] id)
        {
            //Order? order = c.Orders.Where(x => x.Orderid == id).Include(x => x.Foods).FirstOrDefault();
            //var foodname = c.Foods.Where(x => x.Orderid == id).FirstOrDefault();

            OrderDetailsInfo orderDetailsInfo = new OrderDetailsInfo();

            var foodDet = c.Foods.Where(x => x.Orderid == id[0]).Select(m => new FoodDetails
            {
                FoodName = m.Foodname,
                FoodPrice = m.Foodprice   
            });
            var bevDet = c.Beverages.Where(x => x.Orderid == id[0]).Select(m => new BeverageDetails
            {
                BeverageName = m.Beveragename,
                BeveragePrice = m.Beverageprice
            });

            orderDetailsInfo.beverageDetails = bevDet.ToList();
            orderDetailsInfo.foodDetails = foodDet.ToList();


            //var foodname = c.Orders.Where(a => a.Orderid == id).Include(b => b.)


            return View(orderDetailsInfo);
        }

        public IActionResult SeeTableOrder(int id)
        {
            var numberOfSameTable = c.Orders.Where(m => m.Tableid == id).Count();

            float? total = 0;
            var list = c.Orders.Where(m => m.Tableid == id).Select(a => a.Totalprice).ToList();
            for (int i = 0; i < numberOfSameTable; i++)
            {
                total += list[i];
            }
            ViewBag.LastTotalPrice = total;

            var TableOrder = c.Orders.Where(m => m.Tableid == id).Select(m => new SeeTablesOrders
            {
                TableId =m.Tableid,
                TotalPrice = m.Totalprice,
                OrderId = m.Orderid     
            });

            

            return View(TableOrder);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}