using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class User
{
    public int Userid { get; set; }

    public string Username { get; set; } = null!;

    public string Userpassword { get; set; } = null!;
}
