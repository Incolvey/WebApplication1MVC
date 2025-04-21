using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebApplication1MVC.Models;

public partial class PracticeDbContext : DbContext
{
    public PracticeDbContext()
    {
    }

    public PracticeDbContext(DbContextOptions<PracticeDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Group> Groups { get; set; }

    public virtual DbSet<Institute> Institutes { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=Practice2024_Emelyanov;Username=postgres;Password=446130");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Group>(entity =>
        {
            entity.HasKey(e => e.GroupId).HasName("groups_pkey");

            entity.ToTable("groups");

            entity.Property(e => e.GroupId)
                .HasDefaultValueSql("nextval('\"groups_Группа_код_seq\"'::regclass)")
                .HasColumnName("Group_id");
            entity.Property(e => e.GroupNumber)
                .HasMaxLength(15)
                .HasColumnName("Group_number");
            entity.Property(e => e.InstituteId).HasColumnName("Institute_id");

            entity.HasOne(d => d.Institute).WithMany(p => p.Groups)
                .HasForeignKey(d => d.InstituteId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("groups_Институт_код_fkey");
        });

        modelBuilder.Entity<Institute>(entity =>
        {
            entity.HasKey(e => e.InstituteId).HasName("institutes_pkey");

            entity.ToTable("institutes");

            entity.Property(e => e.InstituteId)
                .HasDefaultValueSql("nextval('\"institutes_Институт_код_seq\"'::regclass)")
                .HasColumnName("Institute_id");
            entity.Property(e => e.DecanName)
                .HasMaxLength(100)
                .HasColumnName("Decan_name");
            entity.Property(e => e.DecanTitle)
                .HasMaxLength(100)
                .HasColumnName("Decan_title");
            entity.Property(e => e.InstituteName)
                .HasMaxLength(100)
                .HasColumnName("Institute_name");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.StudentId).HasName("students_pkey");

            entity.ToTable("students");

            entity.Property(e => e.StudentId)
                .HasDefaultValueSql("nextval('\"students_Студент_код_seq\"'::regclass)")
                .HasColumnName("Student_id");
            entity.Property(e => e.AdmissionDate).HasColumnName("Admission_date");
            entity.Property(e => e.GroupId).HasColumnName("Group_id");
            entity.Property(e => e.StudentName)
                .HasMaxLength(100)
                .HasColumnName("Student_name");

            entity.HasOne(d => d.Group).WithMany(p => p.Students)
                .HasForeignKey(d => d.GroupId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("students_Группа_код_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
