using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1MVC.Models;

namespace WebApplication1MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly PracticeDbContext _context;
        public HomeController(ILogger<HomeController> logger, PracticeDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var students = _context.Students
                .Include(s => s.Group)
                    .ThenInclude(g => g.Institute) 
                .ToList();

            return View(students);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        //public IActionResult LandingPage()
        //{
        //    return View();
        //}
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

    }
}
