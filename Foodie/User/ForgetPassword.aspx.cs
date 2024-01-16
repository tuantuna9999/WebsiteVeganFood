using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtPasswordConfirm.Text.Trim();

            // Kiểm tra nếu mật khẩu và mật khẩu xác nhận khớp
            if (password == confirmPassword)
            {
                // Kết nối đến cơ sở dữ liệu
                using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
                {
                    // Cập nhật mật khẩu mới cho người dùng
                    string updateQuery = "UPDATE Users SET Password = @Password WHERE Username = @Username";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblmsg.Visible = true;
                            lblmsg.Text = "Mật khẩu đã được cập nhật thành công.";
                            lblmsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblmsg.Visible = true;
                            lblmsg.Text = "Không tìm thấy người dùng có tên đăng nhập này.";
                            lblmsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Lỗi: " + ex.Message;
                        lblmsg.CssClass = "alert alert-danger";
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Mật khẩu và mật khẩu xác nhận không khớp.";
                lblmsg.CssClass = "alert alert-danger";
            }

        }
    }
}