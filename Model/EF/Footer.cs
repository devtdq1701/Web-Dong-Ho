namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Footer
    {
        [StringLength(50)]
        public string ID { get; set; }

        [Display(Name = "Tiêu đề")]
        [StringLength(250)]
        [Required]
        public string Title { get; set; }

        [Display(Name = "Nội dung HTML")]
        [Column(TypeName = "ntext")]
        public string ContentHtml { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
    }
}
