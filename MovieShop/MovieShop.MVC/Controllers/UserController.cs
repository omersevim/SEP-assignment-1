using ApplicationCore.ServiceInterfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MovieShop.MVC.Controllers
{
    public class UserController : Controller
    {
        private readonly ICurrentUserService _currentUserService;
        public UserController(ICurrentUserService currentUserService)
        {
            _currentUserService = currentUserService;
        }
        [Authorize]
        [HttpGet]
        public async Task<IActionResult> GetUserPurchasedMovies()
        {
            
            //make a request to the database to get the info from purchase table.
            //select * from Purchase where userId = @getfromcookie
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> PurchaseMovie()
        {
            //get usere id from current user and create a row in purchase tqable.
            return View();
        }
    }
}
