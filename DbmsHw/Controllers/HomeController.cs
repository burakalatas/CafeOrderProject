using DbmsHw.Context;
using DbmsHw.Entities;
using DbmsHw.Models;
using DbmsHw.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace DbmsHw.Controllers
{
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



            var courierName = c.Couriers.Select(m => new CourierInfo
            {
                id = m.Staffid,
                name = m.Couriername,
                phoneNo = m.Courierphoneno
            });

            var waiterName = c.Waiters.Select(m => new WaiterInfo
            {
                id = m.Staffid,
                name = m.Waitername,
                phoneNo = m.Waiterphoneno
            });

            return View();
        }
        public IActionResult Cashier()
        {

            var cashierName = c.Cashiers.Select(m => new CashierInfo
            {
                id = m.Staffid,
                name = m.Cashiername,
                phoneNo = m.Cashierphoneno
            });

            return View(cashierName);
        }
        public IActionResult Courier()
        {
            var courierName = c.Couriers.Select(m => new CourierInfo
            {
                id = m.Staffid,
                name = m.Couriername,
                phoneNo = m.Courierphoneno
            });

            return View(courierName);
        }
        public IActionResult Waiter()
        {
            var waiterName = c.Waiters.Select(m => new WaiterInfo
            {
                id = m.Staffid,
                name = m.Waitername,
                phoneNo = m.Waiterphoneno
            });

            return View(waiterName);
        }
        [HttpGet]
        public IActionResult addOrder()
        {
            FoodAndBeverage fb = new FoodAndBeverage();
            fb.Foodlists = c.Foodlists.ToList();
            fb.Beveragelist = c.Beveragelists.ToList();
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

            c.Orders.Add(new Order
            {
                Orderaddress = fn.orderaddress,
                Staffid = fn.staffID,
                Totalprice = foodPrice + beveragePrice
            });
            c.SaveChanges();
            c.Foods.Add(new Food
            {
                Orderid = c.Orders.Max(m => m.Orderid),
                Foodname = fn.foodname,
                Foodprice = foodPrice
            });
            c.Beverages.Add(new Beverage
            {
                Orderid = c.Orders.Max(m => m.Orderid),
                Beveragename = fn.beveragename,
                Beverageprice = beveragePrice
            });
            c.SaveChanges();

            return RedirectToAction("AddOrder");
        }
        public IActionResult Order()
        {
            var order = c.Orders.Select(m => new OrderInfo
            {
                OrderId = m.Orderid,
                OrderAddress = m.Orderaddress,
                StaffId = m.Staffid,
                TotalPrice = m.Totalprice
                
            });
            return View(order);
        }
        public IActionResult DeleteOrder(int id)
        {
            var order = c.Orders.Where(m => m.Orderid == id).FirstOrDefault();
            c.Orders.Remove(order);
            c.SaveChanges();
            return RedirectToAction("Order");
        }
        public IActionResult OrderDetails(int id)
        {
            //Order? order = c.Orders.Where(x => x.Orderid == id).Include(x => x.Foods).FirstOrDefault();
            //var foodname = c.Foods.Where(x => x.Orderid == id).FirstOrDefault();

            OrderDetailsInfo orderDetailsInfo = new OrderDetailsInfo();

            var foodDet = c.Foods.Where(x => x.Orderid == id).Select(m => new FoodDetails
            {
                FoodName = m.Foodname,
                FoodPrice = m.Foodprice   
            });
            var bevDet = c.Beverages.Where(x => x.Orderid == id).Select(m => new BeverageDetails
            {
                BeverageName = m.Beveragename,
                BeveragePrice = m.Beverageprice
            });

            orderDetailsInfo.beverageDetails = bevDet.ToList();
            orderDetailsInfo.foodDetails = foodDet.ToList();


            //var foodname = c.Orders.Where(a => a.Orderid == id).Include(b => b.)


            return View(orderDetailsInfo);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}