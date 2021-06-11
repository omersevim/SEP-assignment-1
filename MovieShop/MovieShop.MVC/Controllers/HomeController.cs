using System.Diagnostics;
using System.Threading.Tasks;
using ApplicationCore.Models.Response;
using ApplicationCore.ServiceInterfaces;
using Infrastructure.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MovieShop.MVC.Models;


namespace MovieShop.MVC.Controllers
{

    public class HomeController : Controller
    {
        private readonly IMovieService _movieService;

        // Constructor Injection
        public HomeController(IMovieService movieService)
        {
            // __movieService should have an instance of a class that implements IMovieService
            _movieService = movieService;
        }

        // localhost/Home/Index
        public async Task<IActionResult> Index()
        {
            var movies = await _movieService.GetTopRevenueMovies();
            ViewBag.MoviesCount = movies.Count;
            return View(movies);
        }

        // localhost/Home/Privacy
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
