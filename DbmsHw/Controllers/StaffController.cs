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
        
        public IActionResult Index()
        {
            return View();
        }
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
        public IActionResult Food()
        {
            var foodList = c.Foodlists.Select(m => new FoodDetails
            {
                FoodId = m.Foodid,
                FoodName = m.Foodname,
                FoodPrice = m.Foodprice
            }).OrderBy(m => m.FoodId);
            return View(foodList);
        }
        public IActionResult FoodPriceChanges()
        {
            var foodPriceChanges = c.Foodlistpricechanges.Select(m => new foodListPriceChanges
            {
                FoodId = m.Foodid,
                OldFoodPrice = m.Oldfoodprice,
                NewFoodPrice = m.Newfoodprice,
                UpdateDate = m.Updatedate
            });
            return View(foodPriceChanges);

        }
        [HttpGet]
        public IActionResult UpdateFood(int id)
        {
            FoodDetails foodDetails = new FoodDetails
            {
                FoodId = id,
                FoodName = c.Foodlists.Where(m => m.Foodid == id).Select(m => m.Foodname).FirstOrDefault(),
                FoodPrice = c.Foodlists.Where(m => m.Foodid == id).Select(m => m.Foodprice).FirstOrDefault()
            };


            return View(foodDetails);
        }
        [HttpPost]
        public IActionResult UpdateFood(FoodDetails foodDetails)
        {
            var values = c.Foodlists.Where(m => m.Foodid == foodDetails.FoodId).FirstOrDefault();
            values.Foodname = foodDetails.FoodName;
            values.Foodprice = foodDetails.FoodPrice;

            c.Foodlists.Update(values);
            c.SaveChanges();

            return RedirectToAction("Food");
        }

        public IActionResult Beverage()
        {
            var bevList = c.Beveragelists.Select(m => new BeverageDetails
            {
                BeverageId = m.Beverageid,
                BeverageName = m.Beveragename,
                BeveragePrice = m.Beverageprice
            }).OrderBy(m => m.BeverageId);
            return View(bevList);
        }
        public IActionResult BeveragePriceChanges()
        {
            var beverageListPriceChange = c.Beveragelistpricechanges.Select(m => new bevListPriceChanges
            {
                BeverageId = m.Beverageid,
                OldBeveragePrice = m.Oldbeverageprice,
                NewBeveragePrice = m.Newbeverageprice,
                UpdateDate = m.Updatedate

            });

            return View(beverageListPriceChange);
        }
        [HttpGet]
        public IActionResult UpdateBeverage(int id)
        {
            BeverageDetails beverageDetails = new BeverageDetails
            {
                BeverageId = id,
                BeverageName = c.Beveragelists.Where(m => m.Beverageid == id).Select(m => m.Beveragename).FirstOrDefault(),
                BeveragePrice = c.Beveragelists.Where(m => m.Beverageid == id).Select(m => m.Beverageprice).FirstOrDefault()
            };
            return View(beverageDetails);
        }
        [HttpPost]
        public IActionResult UpdateBeverage(BeverageDetails beverageDetails)
        {
            var values = c.Beveragelists.Where(m => m.Beverageid == beverageDetails.BeverageId).FirstOrDefault();
            values.Beveragename = beverageDetails.BeverageName;
            values.Beverageprice = beverageDetails.BeveragePrice;

            c.Beveragelists.Update(values);
            c.SaveChanges();

            return RedirectToAction("Beverage");
        }
        public IActionResult DeletedOrders()
        {
            var deletedOrder = c.DeletedOrders.Select(m => new DeletedOrderInfo
            {
                OrderId = m.OrderId,
                OrderAddress = m.OrderAddress,
                StaffId = m.StaffId,
                TableId = m.TableId,
                OrderDeletedTime = m.DeletedDate
            }).OrderBy(m => m.OrderId);
            return View(deletedOrder);
        }
    }
}
