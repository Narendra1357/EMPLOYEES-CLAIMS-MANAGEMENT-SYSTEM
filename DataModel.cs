using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MainProject1.Models
{
    public class DataModel
    {
        [Required]
        public int Empid { get; set; }
        [Required]
        public string Role { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Destination { get; set; }
        [Required]
        public DateTime DateofApply { get; set; }
        [Required]
        public string Days { get; set; }
        [Required]
        public string Reason { get; set; }
        [Required]
        public string Transport { get; set; }
        [Required]
        public Nullable<decimal> CostSpend { get; set; }
      
        public Nullable<System.DateTime>Dateofdone { get; set; }
         
        public string MStatus { get; set; }
         
        public string feedback { get; set; }
   
        public string AcSStatus { get; set; }
        
        public string paymentStatus { get; set; }
    }
}
