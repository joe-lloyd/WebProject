using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class ImageModel
    {
        [Key]
        public int ImageID { get; set; }
        public int GameID { get; set; }
        public string OriginalName { get; set; }
        public string NewName { get; set; }
        public string Description { get; set; }
    }
}