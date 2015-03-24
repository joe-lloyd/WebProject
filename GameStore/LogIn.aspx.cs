using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GameStore.Models;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace GameStore
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null || Session["Admin"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Models.User newUser = new User();
            newUser.UserName = txtRegUserName.Text;
            newUser.Email = txtEmail.Text;
            newUser.usrPassword = PassEncrypt(txtRegPassword.Text);
            
            GameStoreContext cxt = new GameStoreContext();

            Response.Write("<script language=javascript>alert('Registration Complete. You may now log in.');</script>");
            User checkUser = (from x in cxt.Users
                              where x.Email == newUser.Email
                              select x).FirstOrDefault();

            if(checkUser != null)
            {
                Response.Write("<script language=javascript>alert('Registration Failed. Email already exists');</script>");
            }
            else
            {
                cxt.Users.Add(newUser);
                cxt.SaveChanges();

                Models.Cart newCart = new Cart();
                newCart.UserID = newUser.UserID;

                cxt.Carts.Add(newCart);
                cxt.SaveChanges();

                Response.Write("<script language=javascript>alert('Registration Complete. You may now log in.');</script>");
            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            bool isValid;
            Models.User user = new User();
            user.UserName = txtUsrName.Text;
            user.usrPassword = PassEncrypt(txtPassword.Text);

            isValid = ValidiateLogReg(user);
            Models.User LoggedIn = new User();
            if(isValid)
            {
                GameStoreContext cxt = new GameStoreContext();
                var loggedInUser = from x in cxt.Users
                                   where x.UserName == user.UserName
                                   //select new { x.IsAdmin } ;
                                   select x;
                
                foreach (var x in loggedInUser)
                {
                    Session["UserID"] = x.UserID;
                    LoggedIn.IsAdmin = x.IsAdmin;
                    if (LoggedIn.IsAdmin == true)
                    {
                        Session["Admin"] = true;
                        Response.Redirect("AdminPage.aspx");
                    }
                    else
                    {
                        Session["User"] = true;
                        Response.Redirect("Default.aspx");
                    }
                }
                
            }
            else
            {
                Response.Write("<script language=javascript>alert('Invalid Login');</script>");
            }

            
        }


        public string PassEncrypt(string passWord)
        {
            SHA1 sha = SHA1.Create();
            byte[] hashdata = sha.ComputeHash(Encoding.Default.GetBytes(passWord));
            StringBuilder encryptedPassword = new StringBuilder();

            for (int i = 0; i < hashdata.Length; i++)
            {
                encryptedPassword.Append(hashdata[i].ToString());
            }
            return encryptedPassword.ToString();
        }

        //Refactor Later//
        private bool ValidiateLogReg(Models.User user)
        {
            bool isValid;
            string cxnString = ConfigurationManager.ConnectionStrings["GMCGames"].ConnectionString;
            using (SqlConnection cxn = new SqlConnection(cxnString))
            {
                SqlCommand cmd = new SqlCommand("spValidateUser", cxn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter userNameParam = new SqlParameter("@UserName", SqlDbType.NVarChar, 50);
                userNameParam.Value = user.UserName;

                SqlParameter passwordParam = new SqlParameter("@usrPassword", SqlDbType.NVarChar, 50);
                passwordParam.Value = user.usrPassword;

                cmd.Parameters.Add(userNameParam);
                cmd.Parameters.Add(passwordParam);
                cxn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    isValid = true;
                }
                else
                {
                    isValid = false;
                }
                dr.Close();
                cxn.Close();
            }
            return isValid;
        }
    }
}