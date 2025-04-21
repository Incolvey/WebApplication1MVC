using System;
using System.Collections.Generic;

namespace WebApplication1MVC.Models;

public partial class Institute
{
    public int InstituteId { get; set; }

    public string InstituteName { get; set; } = null!;

    public string DecanName { get; set; } = null!;

    public string DecanTitle { get; set; } = null!;

    public ICollection<Group> Groups { get; set; } = new List<Group>();
}
