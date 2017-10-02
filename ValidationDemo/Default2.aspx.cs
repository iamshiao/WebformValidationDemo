using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ValidationDemo;

namespace ValidationDemo
{
    public partial class Default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<Test> tests = new List<Test>()
                {
                    new Test()
                    {
                        Question="1 + 1 = ?",
                        Options = new List<string>() {"2", "3" ,"5"}
                    },
                    new Test(){
                        Question="1 + 2 = ?",
                        Options = new List<string>() {"2", "3" ,"5"}
                    },
                    new Test(){
                        Question="2 + 3 = ?",
                        Options = new List<string>() {"2", "3" ,"5"}
                    }
                };
                ListView_tests.DataSource = tests;
                ListView_tests.DataBind();
            }
        }

        protected void ValidRadioSelected(object source, ServerValidateEventArgs args)
        {
            var validator = source as CustomValidator;
            var container = validator.NamingContainer as ListViewDataItem;
            var repeater = container.FindControl("Repeater_options") as Repeater;
            var options = FindSpecTypeCtrls<RadioButton>(repeater, new List<RadioButton>());
            if (!options.Any(opt => opt.Checked))
            {
                args.IsValid = false;
            }
        }

        private List<T> FindSpecTypeCtrls<T>(Control container, List<T> ctrls)
            where T : Control
        {
            if (container.Controls.OfType<Control>().Any())
            {
                foreach (Control item in container.Controls.OfType<Control>())
                {
                    if (item is T)
                    {
                        T obj = (T)item;
                        ctrls.Add(obj);
                    }
                    else
                    {
                        FindSpecTypeCtrls<T>(item, ctrls);
                    }
                }
            }

            return ctrls;
        }

        protected void ListView_tests_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var repeater = e.Item.FindControl("Repeater_options") as Repeater;
                var test = e.Item.DataItem as Test;
                repeater.DataSource = test.Options;
                repeater.DataBind();
            }
        }
    }

    internal class Test
    {
        public string Question { get; set; }
        public List<string> Options { get; set; }
    }
}