using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MainProject1.Models
{
    public class StatusModel
    {
        [Required]
        public int Empid { get; set; }
        [Required]
        public string Role { get; set; }
        [Required]
        public string Name { get; set; }
       
    }
}
