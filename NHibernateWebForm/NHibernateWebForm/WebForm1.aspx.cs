using NHibernate;
using NHibernate.Transform;
using NHibernateWebForm.Models;
using System;
using System.Web.UI.WebControls;

namespace NHibernateWebForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insert_Click(object sender, EventArgs e)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    var student = new StudentDetails
                    {
                        StudentName = sname.Text,
                        FatherName = fname.Text,
                        Address = address.Text,
                        Mobile= mobile.Text
                        
                    };
                    var q = session.CreateSQLQuery("insert into StudentDetails (StudentName,FatherName,Address,Mobile) values('" + student.StudentName + "','" + student.FatherName + "','" + student.Address + "','" + student.Mobile + "')");
                    q.List<StudentDetails>();                 
                    transaction.Commit();
                    Response.Write("Data Saved Sucessfully ");
                }
            }
        }

        protected void Read_Click(object sender, EventArgs e)
        {
            
                using (ISession session = NHibernateHelper.OpenSession())
                {
                    using (ITransaction transaction = session.BeginTransaction())
                    {
                        
                        var students = session.CreateSQLQuery("select * from StudentDetails").SetResultTransformer(Transformers.AliasToBean<StudentDetails>()).List<StudentDetails>();
                        if (students.Count > 0)
                        {
                            studentBook.DataSource = students;
                            studentBook.DataBind();
                        }
                        else
                        {
                            Response.Write("Data Not Found in the Database ");
                        }

                    }
                }
            
        }

        protected void studentBook_RowEditing(object sender, GridViewEditEventArgs e)
        {
            studentBook.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        private void PopulateGridview()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    var students = session.CreateSQLQuery("select * from StudentDetails").SetResultTransformer(Transformers.AliasToBean<StudentDetails>()).List<StudentDetails>();
                    if (students.Count > 0)
                    {
                        studentBook.DataSource = students;
                        studentBook.DataBind();
                    }
                    else
                    {
                        Response.Write("Data Not Found in the Database ");
                    }

                }
            }
        }

        protected void studentBook_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            studentBook.EditIndex = -1;
            PopulateGridview();
        }

        protected void studentBook_RowUpdating(object sender, GridViewUpdateEventArgs e)
        { 
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    Label Id = studentBook.Rows[e.RowIndex].FindControl("Label6") as Label;
                    TextBox StudentName = studentBook.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
                    TextBox FatherName = studentBook.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
                    TextBox Address = studentBook.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
                    TextBox Mobile = studentBook.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;

                    var q = session.CreateSQLQuery("Update StudentDetails set StudentName='"+StudentName.Text+ "',FatherName='" + FatherName.Text + "',Address='" + Address.Text + "',Mobile='" + Mobile.Text + "' where Id= " + Id.Text +"");
                    var ans = q.ExecuteUpdate();
                    transaction.Commit();
                    studentBook.EditIndex = -1;
                    PopulateGridview();
                }
            }
        }

        protected void studentBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    Label Id = studentBook.Rows[e.RowIndex].FindControl("Label1") as Label;
              
                    var q = session.CreateSQLQuery("Delete from StudentDetails where Id=" + Id.Text +"");
                    var  ans=q.ExecuteUpdate();
                   
                    transaction.Commit();
                    studentBook.EditIndex = -1;
                    PopulateGridview();
                }
            }
        }
    }
}