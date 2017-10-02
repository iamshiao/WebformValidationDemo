using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ValidationDemo
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AuthAccount(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;

            if (Text_account.Text == "admin" && Text_password.Text == "123")
            {
                args.IsValid = true;
            }
        }

        protected void ValidNotRobot(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;

            int num = -1;
            if (int.TryParse(Text_robotVerification.Text, out num))
            {
                if (num == 2)
                {
                    args.IsValid = true;
                }
            }
        }

        protected void Button_SubmitWithoutValidation_Click(object sender, EventArgs e)
        {
            Response.Write("送出不驗證");
        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (IsValid)
            {
                Response.Write("Succeed!");
            }
        }
    }
}