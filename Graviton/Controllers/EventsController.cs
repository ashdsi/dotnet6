using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Graviton.Controllers
{
    [Route("events")]
    public class EventsController : Controller
    {

        // GET: EventsController
        [HttpGet]
        public ActionResult Index()
        {
            var systeminfo = new sysinfo
            {
                OSDescription = System.Runtime.InteropServices.RuntimeInformation.OSDescription,
                OSArchitecture = System.Runtime.InteropServices.RuntimeInformation.OSArchitecture.ToString(),
                FrameworkDescription = System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription,
                ProcessArchitecture = System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture.ToString(),
                RuntimeIdentifier = System.Runtime.InteropServices.RuntimeInformation.RuntimeIdentifier, 
                Feature = "X"
            };
            return Ok(systeminfo);

        }
    }
}
