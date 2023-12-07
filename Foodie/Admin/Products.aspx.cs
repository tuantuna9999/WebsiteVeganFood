﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Foodie.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               Session["breadCrum"] = "Product";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    getProduct();
                }
           }
            //lblMsg.Visible = false;
        }
        private void getProduct()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProduct.DataSource = dt;
            rProduct.DataBind();

            //DataTable dt = new DataTable();

            //using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            //{
            //    string query = "SELECT * FROM Products";
            //    using (SqlCommand cmd = new SqlCommand(query, con))
            //    {
            //        con.Open();
            //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //        sda.Fill(dt);
            //    }
            //}

            //rProduct.DataSource = dt;
            //rProduct.DataBind();
        }
        private void clear()
        {
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtPrice.Text = string.Empty;
            ddlCategories.ClearSelection();
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
            imgProduct.ImageUrl = String.Empty;
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {

            //string connectionString = Connection.GetConnectionString();

            //string productName = txtName.Text.Trim();
            //string des = txtDescription.Text.Trim();
            //string price = txtPrice.Text.Trim();
            //string quantity = txtQuantity.Text.Trim();

            //bool isActive = cbIsActive.Checked;

            //using (SqlConnection con = new SqlConnection(connectionString))

            //{
            //    string imagePath = string.Empty, fileExtension = string.Empty;
            //    //bool isValidToExcute = false;
            //    string sqlQuery = "INSERT INTO Products ( Name,Description, Price, Quantity, ImageUrl, CategoryId,IsActive,CreateDate) " +
            //        "VALUES ( @Name,@Description, @Price,@Quantity, @ImageUrl, @CategoryId, @IsActive,@CreateDate)";
            //    DateTime createDate = DateTime.Now;
            //    using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
            //    {

            //        cmd.Parameters.AddWithValue("@Name", productName);
            //        cmd.Parameters.AddWithValue("@Description", des);
            //        cmd.Parameters.AddWithValue("@Price", price);
            //        cmd.Parameters.AddWithValue("@Quantity", quantity);
            //        cmd.Parameters.AddWithValue("@CategoryId", ddlCategories.SelectedValue);
            //        cmd.Parameters.AddWithValue("@IsActive", isActive);
            //        cmd.Parameters.AddWithValue("@CreateDate", createDate);
            //        if (fuProductImage.HasFile)
            //        {
            //            if (Utils.IsValidExtension(fuProductImage.FileName))
            //            {
            //                Guid obj = Guid.NewGuid();
            //                fileExtension = Path.GetExtension(fuProductImage.FileName);
            //                imagePath = "Images/Product/" + obj.ToString() + fileExtension;
            //                fuProductImage.PostedFile.SaveAs(Server.MapPath("~/Images/Product/") + obj.ToString() + fileExtension);
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

            //            getProduct();
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
            string actionName = txtName.Text, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExcute = false;
            int productId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", productId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@Price", txtPrice.Text.Trim());
            cmd.Parameters.AddWithValue("@Quantity",txtQuantity.Text.Trim());
            cmd.Parameters.AddWithValue("@CategoryId", ddlCategories.SelectedValue);
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
            if (fuProductImage.HasFile)
            {
                if (Utils.IsValidExtension(fuProductImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuProductImage.FileName);
                    imagePath = "Images/Product/" + obj.ToString() + fileExtension;
                    fuProductImage.PostedFile.SaveAs(Server.MapPath("~/Images/Product/") + obj.ToString() + fileExtension);
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
                    actionName = productId == 0 ? "Thêm " : "Cập nhật ";
                    lblMsg.Visible = true;
                    lblMsg.Text = actionName + " thành công!";
                    lblMsg.CssClass = "alert alert-success";
                    getProduct();
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

       
        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            con = new SqlConnection(Connection.GetConnectionString());
            if (e.CommandName == "edit")
            {

                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
                txtPrice.Text = dt.Rows[0]["Price"].ToString();
                txtQuantity.Text = dt.Rows[0]["Quantity"].ToString();
                ddlCategories.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imgProduct.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ?
                    "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgProduct.Height = 200;
                imgProduct.Width = 200;
                hdnId.Value = dt.Rows[0]["ProductId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";
            }
            else if (e.CommandName == "delete")
            {
                //  con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Xóa món ăn thành công!";
                    lblMsg.CssClass = "alert alert-success";
                    getProduct();

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

        protected void rProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblIsActive = e.Item.FindControl("lblIsActive") as Label;
                Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;
                if (lblIsActive.Text == "True")
                {
                    lblIsActive.Text = "Active";
                    lblIsActive.CssClass = "badge badge-success";

                }
                else
                {
                    lblIsActive.Text = "In Active";
                    lblIsActive.CssClass = "badge badge-danger";
                }
                //if(Convert.ToInt32(lblQuantity.Text)<=5)
                //{
                //    lblQuantity.CssClass= "badge badge-danger";
                //    //lblQuantity.ToolTip=
                //}
            }

        }
    }
}