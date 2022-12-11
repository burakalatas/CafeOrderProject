using DbmsHw.Context;
using DbmsHw.Entities;
using DbmsHw.Models;
using DbmsHw.ViewModels;
using Microsoft.AspNetCore.Mvc;
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
            return View();
        }
        [HttpPost]
        public IActionResult AddOrder(Order order) {
            RestaurantContext c = new RestaurantContext();
            c.Orders.Add(order);
            c.SaveChanges();
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}