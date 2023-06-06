using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerfectPaginationWithRepeater
{
    public partial class Default : System.Web.UI.Page
    {
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 10;
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            BindDataIntoRepeater();
        }

        // Get data from database/repository
        static DataTable GetDataFromDb()
        {
            var con = new SqlConnection(ConfigurationManager.ConnectionStrings["stringConnection"].ToString());
            con.Open();
            var da = new SqlDataAdapter("Select Id, Name, Address, CreatedDate From tblPerson Order By Id desc", con);
            var dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        // Bind PagedDataSource into Repeater
        private void BindDataIntoRepeater()
        {
            var dt = GetDataFromDb();
            _pgsource.DataSource = dt.DefaultView;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;


            // Update the count check and show "No Person found!" message
            if (dt.Rows.Count == 0)
            {
                rptResult.Visible = false;
                lblNoRecords.Visible = true;
            }
            else
            {
                rptResult.Visible = true;
                lblNoRecords.Visible = false;
                rptResult.DataSource = _pgsource;
                rptResult.DataBind();
            }


            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
            lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            // Enable First, Last, Previous, Next buttons
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;

            // Bind data into repeater
            rptResult.DataSource = _pgsource;
            rptResult.DataBind();

            // Call the function to do paging
            HandlePaging();
        }

        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        // Add button:
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string name = txtName.Value;
            string address = txtAddress.Value;

            // Perform validation or any other necessary checks on the input data
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address))
            {
                // Display an error message or handle the invalid input
                return;
            }

            // Add your logic to save the person's data to the database
            // For example, you can use the SqlConnection and SqlCommand objects to execute an INSERT statement

            // Establish a connection to the database
            string connectionString = ConfigurationManager.ConnectionStrings["stringConnection"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create the INSERT command
                string insertQuery = "INSERT INTO tblPerson (Name, Address, CreatedDate) VALUES (@Name, @Address, GETDATE())";
                SqlCommand command = new SqlCommand(insertQuery, connection);

                // Set the parameter values
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@Address", address);

                // Execute the command
                command.ExecuteNonQuery();
            }

            // After saving the data, rebind the repeater to update the displayed records
            BindDataIntoRepeater();
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                int recordId = Convert.ToInt32(e.CommandArgument);

                // Add your logic to delete the record from the database
                // For example, you can use the SqlConnection and SqlCommand objects to execute a DELETE statement

                // Establish a connection to the database
                string connectionString = ConfigurationManager.ConnectionStrings["stringConnection"].ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Create the DELETE command
                    string deleteQuery = "DELETE FROM tblPerson WHERE Id = @Id";
                    SqlCommand command = new SqlCommand(deleteQuery, connection);

                    // Set the parameter value
                    command.Parameters.AddWithValue("@Id", recordId);

                    // Execute the command
                    command.ExecuteNonQuery();
                }

                // After deleting the record, rebind the repeater to update the displayed records
                BindDataIntoRepeater();
            }
        }


        protected void lbFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindDataIntoRepeater();
        }
        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            BindDataIntoRepeater();
        }
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataIntoRepeater();
        }
        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = Color.FromName("#00FF00");
        }
    }
}