﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class Image
    {
        [Key]
        public int ImageID { get; set; }
        public int GameID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}