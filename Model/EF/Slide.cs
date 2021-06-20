namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Slide
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Tiêu đề")]
        public string Name { get; set; }

        [StringLength(50)]
        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Đường dẫn")]
        public string Link { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Hình ảnh")]
        public string Images { get; set; }

        [Display(Name = "Thứ tự")]
        public int Order { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }
    }
}
