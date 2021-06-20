using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebDongHo.Startup))]
namespace WebDongHo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            
        }
    }
}
