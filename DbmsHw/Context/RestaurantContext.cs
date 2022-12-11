using System;
using System.Collections.Generic;
using DbmsHw.Entities;
using Microsoft.EntityFrameworkCore;

namespace DbmsHw.Context;

public partial class RestaurantContext : DbContext
{
    public RestaurantContext()
    {
    }

    public RestaurantContext(DbContextOptions<RestaurantContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Beverage> Beverages { get; set; }

    public virtual DbSet<Cashier> Cashiers { get; set; }

    public virtual DbSet<Checkout> Checkouts { get; set; }

    public virtual DbSet<Courier> Couriers { get; set; }

    public virtual DbSet<Food> Foods { get; set; }

    public virtual DbSet<Kitchen> Kitchens { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Restaurant> Restaurants { get; set; }

    public virtual DbSet<Section> Sections { get; set; }

    public virtual DbSet<Staff> Staff { get; set; }

    public virtual DbSet<Table> Tables { get; set; }

    public virtual DbSet<Waiter> Waiters { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("User ID=postgres;Password=burak;Host=localhost;Port=5432;Database=Restaurant;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Beverage>(entity =>
        {
            entity.HasKey(e => e.Beverageid).HasName("beveragespk");

            entity.ToTable("beverages");

            entity.Property(e => e.Beverageid).HasColumnName("beverageid");
            entity.Property(e => e.Beveragename)
                .HasMaxLength(100)
                .HasColumnName("beveragename");

            entity.HasMany(d => d.Orders).WithMany(p => p.Beverages)
                .UsingEntity<Dictionary<string, object>>(
                    "Beverageorder",
                    r => r.HasOne<Order>().WithMany()
                        .HasForeignKey("Orderid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("beverageorderfk2"),
                    l => l.HasOne<Beverage>().WithMany()
                        .HasForeignKey("Beverageid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("beverageorderfk"),
                    j =>
                    {
                        j.HasKey("Beverageid", "Orderid").HasName("beverageorderpk");
                        j.ToTable("beverageorder");
                    });
        });

        modelBuilder.Entity<Cashier>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("cashierpk");

            entity.ToTable("cashier");

            entity.Property(e => e.Staffid)
                .ValueGeneratedNever()
                .HasColumnName("staffid");
            entity.Property(e => e.Cashiername)
                .HasMaxLength(100)
                .HasColumnName("cashiername");
            entity.Property(e => e.Cashierphoneno)
                .HasMaxLength(20)
                .HasColumnName("cashierphoneno");

            entity.HasOne(d => d.Staff).WithOne(p => p.Cashier)
                .HasForeignKey<Cashier>(d => d.Staffid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cashierfk");
        });

        modelBuilder.Entity<Checkout>(entity =>
        {
            entity.HasKey(e => e.Sectionid).HasName("checkoutpk");

            entity.ToTable("checkout");

            entity.Property(e => e.Sectionid)
                .ValueGeneratedNever()
                .HasColumnName("sectionid");
            entity.Property(e => e.Cashierid).HasColumnName("cashierid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");

            entity.HasOne(d => d.Cashier).WithMany(p => p.Checkouts)
                .HasForeignKey(d => d.Cashierid)
                .HasConstraintName("checkoutfk2");

            entity.HasOne(d => d.Order).WithMany(p => p.Checkouts)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("checkoutfk3");

            entity.HasOne(d => d.Section).WithOne(p => p.Checkout)
                .HasForeignKey<Checkout>(d => d.Sectionid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("checkoutfk");
        });

        modelBuilder.Entity<Courier>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("courierpk");

            entity.ToTable("courier");

            entity.Property(e => e.Staffid)
                .ValueGeneratedNever()
                .HasColumnName("staffid");
            entity.Property(e => e.Couriername)
                .HasMaxLength(100)
                .HasColumnName("couriername");
            entity.Property(e => e.Courierphoneno)
                .HasMaxLength(20)
                .HasColumnName("courierphoneno");

            entity.HasOne(d => d.Staff).WithOne(p => p.Courier)
                .HasForeignKey<Courier>(d => d.Staffid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("courierfk");
        });

        modelBuilder.Entity<Food>(entity =>
        {
            entity.HasKey(e => e.Foodid).HasName("foodspk");

            entity.ToTable("foods");

            entity.Property(e => e.Foodid).HasColumnName("foodid");
            entity.Property(e => e.Foodname)
                .HasMaxLength(100)
                .HasColumnName("foodname");

            entity.HasMany(d => d.Orders).WithMany(p => p.Foods)
                .UsingEntity<Dictionary<string, object>>(
                    "Foodorder",
                    r => r.HasOne<Order>().WithMany()
                        .HasForeignKey("Orderid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("foodorderfk2"),
                    l => l.HasOne<Food>().WithMany()
                        .HasForeignKey("Foodid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("foodorderfk"),
                    j =>
                    {
                        j.HasKey("Foodid", "Orderid").HasName("foodorderpk");
                        j.ToTable("foodorder");
                    });
        });

        modelBuilder.Entity<Kitchen>(entity =>
        {
            entity.HasKey(e => e.Sectionid).HasName("kitchenpk");

            entity.ToTable("kitchen");

            entity.Property(e => e.Sectionid)
                .ValueGeneratedNever()
                .HasColumnName("sectionid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");

            entity.HasOne(d => d.Order).WithMany(p => p.Kitchens)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("kitchenfk2");

            entity.HasOne(d => d.Section).WithOne(p => p.Kitchen)
                .HasForeignKey<Kitchen>(d => d.Sectionid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("kitchenfk");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Orderid).HasName("orderpk");

            entity.ToTable("order");

            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.Orderaddress)
                .HasMaxLength(300)
                .HasColumnName("orderaddress");
            entity.Property(e => e.Staffid).HasColumnName("staffid");
            entity.Property(e => e.Totalprice).HasColumnName("totalprice");

            entity.HasOne(d => d.Staff).WithMany(p => p.Orders)
                .HasForeignKey(d => d.Staffid)
                .HasConstraintName("orderfk");
        });

        modelBuilder.Entity<Restaurant>(entity =>
        {
            entity.HasKey(e => e.Restaurantid).HasName("restaurantpk");

            entity.ToTable("restaurant");

            entity.Property(e => e.Restaurantid).HasColumnName("restaurantid");
            entity.Property(e => e.Restaurantaddress)
                .HasMaxLength(300)
                .HasColumnName("restaurantaddress");
            entity.Property(e => e.Restaurantname)
                .HasMaxLength(100)
                .HasColumnName("restaurantname");
            entity.Property(e => e.Sectionid).HasColumnName("sectionid");
            entity.Property(e => e.Staffid).HasColumnName("staffid");

            entity.HasOne(d => d.Section).WithMany(p => p.Restaurants)
                .HasForeignKey(d => d.Sectionid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("sectionfk");

            entity.HasOne(d => d.Staff).WithMany(p => p.Restaurants)
                .HasForeignKey(d => d.Staffid)
                .HasConstraintName("stafffk");
        });

        modelBuilder.Entity<Section>(entity =>
        {
            entity.HasKey(e => e.Sectionid).HasName("sectionpk");

            entity.ToTable("section");

            entity.Property(e => e.Sectionid).HasColumnName("sectionid");
            entity.Property(e => e.Sectiontype)
                .HasMaxLength(50)
                .HasColumnName("sectiontype");
        });

        modelBuilder.Entity<Staff>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("staffpk");

            entity.ToTable("staff");

            entity.Property(e => e.Staffid).HasColumnName("staffid");
            entity.Property(e => e.Stafftype)
                .HasMaxLength(50)
                .HasColumnName("stafftype");
        });

        modelBuilder.Entity<Table>(entity =>
        {
            entity.HasKey(e => e.Sectionid).HasName("tablepk");

            entity.ToTable("tables");

            entity.Property(e => e.Sectionid)
                .ValueGeneratedNever()
                .HasColumnName("sectionid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.Waiterid).HasColumnName("waiterid");

            entity.HasOne(d => d.Order).WithMany(p => p.Tables)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("tablefk2");

            entity.HasOne(d => d.Section).WithOne(p => p.Table)
                .HasForeignKey<Table>(d => d.Sectionid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tablefk3");

            entity.HasOne(d => d.Waiter).WithMany(p => p.Tables)
                .HasForeignKey(d => d.Waiterid)
                .HasConstraintName("tablefk");
        });

        modelBuilder.Entity<Waiter>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("waiterpk");

            entity.ToTable("waiter");

            entity.Property(e => e.Staffid)
                .ValueGeneratedNever()
                .HasColumnName("staffid");
            entity.Property(e => e.Waitername)
                .HasMaxLength(100)
                .HasColumnName("waitername");
            entity.Property(e => e.Waiterphoneno)
                .HasMaxLength(20)
                .HasColumnName("waiterphoneno");

            entity.HasOne(d => d.Staff).WithOne(p => p.Waiter)
                .HasForeignKey<Waiter>(d => d.Staffid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("waiterfk");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
