using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["breadCrum"] = "Category";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    getCategories();
                }
            }
            lblMsg.Visible = false;
            //if (!IsPostBack)
            //{
            //    LayDuLieuVaoGridView();
            //}

        }

       

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string connectionString = Connection.GetConnectionString();

            string categoryName = txtName.Text.Trim();
            bool isActive = cbIsActive.Checked;

            //using (SqlConnection con = new SqlConnection(connectionString))

           // {
                //    string imagePath = string.Empty, fileExtension = string.Empty;
                //    //bool isValidToExcute = false;
                //    string sqlQuery = "INSERT INTO Categories ( Name,ImageUrl, IsActive,CreateDate) VALUES ( @Name, @ImageUrl, @IsActive,@CreateDate)";
                //    DateTime createDate = DateTime.Now;
                //    using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                //    {

                //        cmd.Parameters.AddWithValue("@Name", categoryName);
                //        cmd.Parameters.AddWithValue("@IsActive", isActive);
                //        cmd.Parameters.AddWithValue("@CreateDate", createDate);
                //        if (fuCategoryImage.HasFile)
                //        {
                //            if (Utils.IsValidExtension(fuCategoryImage.FileName))
                //            {
                //                Guid obj = Guid.NewGuid();
                //                fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                //                imagePath = "Images/Category/" + obj.ToString() + fileExtension;
                //                fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
                //                cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                //                //    isValidToExcute = true;
                //            }
                //            else
                //            {
                //                lblMsg.Visible = true;
                //                lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                //                lblMsg.CssClass = "alert alert-danger";
                //                //   isValidToExcute = false;
                //            }
                //        }
                //        try
                //        {
                //            con.Open();
                //            cmd.ExecuteNonQuery();

                //            lblMsg.Visible = true;
                //            lblMsg.Text = "Thêm món ăn thành công!";
                //            lblMsg.CssClass = "alert alert-success";

                //            getCategories();
                //            clear();
                //        }
                //        catch (Exception ex)
                //        {
                //            lblMsg.Visible = true;
                //            lblMsg.Text = "Lỗi! Vui lòng thử lại - " + ex.Message;
                //            lblMsg.CssClass = "alert alert-danger";
                //        }
                //        finally
                //        {
                //            con.Close();
                //        }
                //    }
                //}
                string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
                bool isValidToExcute = false;
                int categoryId = Convert.ToInt32(hdnId.Value);
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE");
                cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
                if (fuCategoryImage.HasFile)
                {
                    if (Utils.IsValidExtension(fuCategoryImage.FileName))
                    {
                        Guid obj = Guid.NewGuid();
                        fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                        imagePath = "Images/Category/" + obj.ToString() + fileExtension;
                        fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
                        cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                        isValidToExcute = true;
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Vui long chon .jpg, .png, .jpeg";
                        lblMsg.CssClass = "alert alert-danger";
                        isValidToExcute = false;
                    }
                }
                else
                {
                    isValidToExcute = true;
                }
                if (isValidToExcute)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        actionName = categoryId == 0 ? "Thêm " : "Cập nhật ";
                        lblMsg.Visible = true;
                        lblMsg.Text = actionName + " thành công!";
                        lblMsg.CssClass = "alert alert-success";
                        getCategories();
                        clear();
                    }
                    catch (Exception ex)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Lỗi-Vui lòng thử lại!" + ex.Message;
                        lblMsg.CssClass = "alert alertdanger";
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            


        }

        private void clear()
        {
            txtName.Text = string.Empty;
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
           imgCategory.ImageUrl = String.Empty;
        }


        private void getCategories()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            con = new SqlConnection(Connection.GetConnectionString());
            if (e.CommandName == "edit")
            {
                
                        cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtName.Text = dt.Rows[0]["Name"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imgCategory.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? 
                    "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgCategory.Height = 200;
                imgCategory.Width = 200;
                hdnId.Value = dt.Rows[0]["CategoryId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";
            }
            else if (e.CommandName == "delete")
            {
             //  con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                                     lblMsg.Visible = true;
                    lblMsg.Text = "Xóa món ăn thành công!";
                    lblMsg.CssClass = "alert alert-success";
                      getCategories();

                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Lỗi! Vui lòng thử lại - " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();

               }
          }
       }

        protected void rCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = e.Item.FindControl("lblIsActive") as Label;
                if (lbl.Text == "True")
                {
                    lbl.Text = "Active";
                    lbl.CssClass = "badge badge-success";

                }
                else
                {
                    lbl.Text = "In Active";
                    lbl.CssClass = "badge badge-danger";
                }
            }
        }
    }

   
    }
    