//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BogCafeteria.Entity_Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Menu
    {
        public int Id { get; set; }
        public int Product { get; set; }
        public int Category { get; set; }
        public int Time { get; set; }
        public int Price { get; set; }
        public int Company { get; set; }
    
        public virtual Company Company1 { get; set; }
        public virtual ProductType ProductType { get; set; }
        public virtual Product Product1 { get; set; }
    }
}
