using System;
using System.Collections.Generic;

namespace WebApplication1MVC.Models;

public partial class Group
{
    public int GroupId { get; set; }

    public string GroupNumber { get; set; } = null!;

    public int InstituteId { get; set; }

    public virtual Institute Institute { get; set; } = null!;

    public ICollection<Student> Students { get; set; } = new List<Student>();
}
