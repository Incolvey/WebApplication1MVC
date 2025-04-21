using System;
using System.Collections.Generic;

namespace WebApplication1MVC.Models;

public partial class Student
{
    public int StudentId { get; set; }

    public string StudentName { get; set; } = null!;

    public DateOnly AdmissionDate { get; set; }

    public DateOnly Birthday { get; set; }

    public int GroupId { get; set; }

    public Group Group { get; set; } = null!;
}
