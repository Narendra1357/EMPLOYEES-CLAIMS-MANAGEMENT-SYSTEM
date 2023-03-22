using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MainProject1.Models
{
    public class AddDataModel
    {
        public int id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Role { get; set; }
        [Required]
        public string MobileNo { get; set; }
        [Required]
        public string DOB { get; set; }
        [Required]
        [EmailAddress] 
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        
        public DateTime DateofJoining { get; set; }
       
        public int Salary { get; set; }
        [Required]
        public string State { get; set; }
       
        public string City { get; set; }
       [Required]
        public string District { get; set; }
        public string Dist { get; set; }
        public string PinCode { get; set; }

    }
}
