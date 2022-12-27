using DbmsHw.Context;
using DbmsHw.Entities;
using DbmsHw.Models;
using DbmsHw.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace DbmsHw.Controllers
{
    public class StaffController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        RestaurantContext c = new RestaurantContext();
        public IActionResult Courier()
        {
            var courierName = c.Couriers.Select(m => new CourierInfo
            {
                id = m.Staffid,
                name = m.Staff.Staffname,
                phoneNo = m.Staff.Staffphoneno
            });

            return View(courierName);
        }

        public IActionResult Waiter()
        {
            var waiterName = c.Waiters.Select(m => new WaiterInfo
            {
                id = m.Staffid,
                name = m.Staff.Staffname,
                phoneNo = m.Staff.Staffphoneno
            });

            return View(waiterName);
        }

        public IActionResult Cashier()
        {

            var cashierName = c.Cashiers.Select(m => new CashierInfo
            {
                id = m.Staffid,
                name = m.Staff.Staffname,
                phoneNo = m.Staff.Staffphoneno
            });

            return View(cashierName);
        }
    }
}
