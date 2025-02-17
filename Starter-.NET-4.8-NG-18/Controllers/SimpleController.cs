using Starter_.NET_4._8_NG_18.App_Data;
using Starter_.NET_4._8_NG_18.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Starter_.NET_4._8_NG_18.Controllers
{
    public class ExampleItemController : SimpleController<ExampleItem> { }

    public abstract class SimpleController<T> : ApiController
    {
        private string table;
        public SimpleController()
        {
            table = typeof(T).Name;
        }

        // GET api/<controller>
        public IEnumerable<T> Get()
        {
            return DAL.select<T>("select * from " + table);
        }

        // GET api/<controller>/5
        public T Get(int id)
        {
            return DAL.select<T>($"select * from {table} where {table}ID = {id}").FirstOrDefault();
        }

        // POST api/<controller>
        public int Post([FromBody] T item)
        {
            return DAL.insert(item); 
        }

        // PUT api/<controller>/5
        public void Put([FromBody] T item)
        {
            DAL.update(item);
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
            DAL.Delete(table, id);
        }
    }
}